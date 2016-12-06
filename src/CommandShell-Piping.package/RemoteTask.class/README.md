RemoteTask do: [2 + 2]

A RemoteTask represents a block to be evaluated in a headless Squeak child process. The results of evaluating the block are returned to the sender through a reference stream on an OS pipe. Asynchronous event notification may be used to signal completion of remote processing.

The block is evaluated in a remote headless image beginning with a clone of the sender image at the time of the message send. All side effects of evaluating the task block are localized to the remote image, and have no effect on the sending image. The result object may be an object of any complexity, such as a dictionary or array of result values.

On a unix system, the creation of child Squeak images is a relatively light weight operation, so tasks of varying degrees of complexity can be assigned to remote tasks with only moderate overhead.

