documentation
raceConditions

	"CommandShell new pipeline: 'CommandShell raceConditions! | edit'"

	^
'It may be possible to hang the Squeak VM in an IO race condition when doing certain command pipelines. These conditions have been largely eliminated for Unix platforms through the use of nonblocking pipes in conjunction with asynchronous IO or polling processes on the Smalltalk side of the pipes. However, these notes are provided to describe possible deadlock scenarios.

Note that nonblocking OS pipes are not yet available on Windows. Command pipelines with external OS processes on Windows are not supported. Blocking on read or write to an OSPipe in Windows will definitely lock the VM.

Two kinds of deadlock are possible. In both cases, deadlock occurs when the single-threaded Squeak VM is blocked on a read or write to an OS pipe, and the blocked condition can only be cleared by another process running in the blocked VM.

1) Block on write. The Squeak VM can block on a write to an OS pipe if the external process at the other end of the pipe does not keep up with reading it. One internal process proxy writes on an pipe to an external process proxy, and fills the pipe up to some capacity limit, after which the write blocks. The external proxy is writing its output to another internal process proxy in the command pipeline, which never executes because the VM is still blocked trying to write to the full pipe.

2) Block on read. The Squeak VM can block on a read from an OS pipe if the external process writing to the pipe never closes the pipe. The internal proxy will post a read on the output pipe from the external command. If the external command has exited, the read will return with a (possibly empty) string. However, if the external command either does not exit, or exits without Squeak being notified, the read on the output pipe will block indefinitely.

2a) In the case where the external command exits while the Squeak VM is blocked on a read, Squeak is unable to respond to the notification of the external process exiting. The process stays in a zombie state, the pipes therefore never get closed, and the VM stays in a blocked condition.

Here are things to try if a deadlock occurs:

Squeak will be blocked and will not respond to the mouse or keyboard. Open a command shell outside of Squeak (perhaps an xterm, or log in to another virtual terminal on Linux or FreeBSD). Using the "ps" command, find the Squeak VM process and its subprocesses. Kill the subprocess. In many cases this will free up the deadlock, and Squeak will come back to life. If this does not work, then you will probably find that one of the processes which you just killed is now in a "zombie" state, which means that the Squeak VM is deadlocked in such a way that it cannot recognize that its child process exited (and therefore cannot properly close the associated file handles). In this case, if your operating system supports a /proc file system, you may be able to break things free by emptying the pipes. On Linux, go to /proc/<pidOfTheSqueakVMProcess>/fd/ and do "cat" commands on all the pipe files in this directory. If none of this works, you are just plain stuck, and you will need to kill your Squeak session and recover anything valuable from the changes log.'