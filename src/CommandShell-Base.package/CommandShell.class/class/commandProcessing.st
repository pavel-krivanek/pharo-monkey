documentation
commandProcessing
	"Explanation of the command parsing and evaluation."

	"CommandShell new pipeline: 'CommandShell commandProcessing! | edit'"

	^
'CommandShell behaves similarly to a Unix command shell. One or more Morphic or MVC views can be opened on an instance of CommandShell. Command lines are accepted in the view, passed to the CommandShell instance (the model), and the results are displayed in the view(s). The overall behavior can be thought of as a Transcript acting like an xterm window, and the CommandShell acting like a /bin/sh shell.

A command line is first evaluated as a Smalltalk expression if possible. If this evaluation fails, either as a result of a sytax error or a runtime error, it is assumed to be a command string with syntax similar to that of a Unix command shell.

The command line is parsed by CommandShell to break command lines into elements of a command pipeline. All further parsing, such as file name expansion, is performed by an instance of ShellSyntax.

Three types of commands may be executed from a CommandShell:
1) Internal "builtin" commands are implemented in Smalltalk, and behave similarly to the shell builtin commands of a typical Unix command shell. See protocol category "shell builtins" for the implementation of these builtin shell commands.
2) Internal "doIt" commands are simple Smalltalk expression strings, terminated by a $! character, which are evaluated as Smalltalk expressions, and which recognize the tokens "stdin", "stdout", and "stderr" as temporary variables in the doIt expression. An internal doIt command is evaluated such that it may be incorporated into a command pipeline with access to the stdin/stdout/stderr streams used in the command pipeline. In the current implementation, a doIt command may not include a $| character, which has meaning both for Smalltalk syntax and for Unix command line processor syntax.
3) External commands. Any command expression not recognized as a shell builtin or as a doIt expression is passed to an external process proxy for execution by the external operating system, with stdin/stdout/stderr incorporated into the command pipeline.

Internal and external commands can be freely mixed in a command pipeline, with results which should be familiar to users of Unix command shells. Pipes are implemented as instances of OSPipe or InternalPipe, and are capable of passing streams of characters from one process proxy to the next. All commands (internal or external) evaluate to strings, such that their results can either be passed through a pipe to the next command proxy in a pipeline, or displayed in the terminal window view if the proxy represents the last command in a command pipeline. Error messages (also strings) are written to an errorPipelineStream which is shared by all proxies in a command pipeline, such that any error messages are accumulated for the entire command pipeline.'