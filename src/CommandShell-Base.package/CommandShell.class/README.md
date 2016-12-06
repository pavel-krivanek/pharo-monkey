I am a command shell, similar to /bin/sh, with a simple command line user interface. I collaborate with process proxies to provide command execution, and I provide a limited set of built in commands similar to those in /bin/sh. My built in commands are implemented in Smalltalk, and any other commands are passed to process proxies to be executed either internally as Smalltalk "doIt" expressions, or externally as commands passed to the external operating system. I am similar to a TranscriptStream (some methods are copied directly from TranscriptStream), but I also know how to accept lines of command input, parse them, and hand them off to process proxies for execution.

Three types of commands may be executed from a CommandShell: internal "builtin" commands implemented in Smalltalk; internal Smalltalk "doIt" commands; and external commands. Internal commands (builtin commands or doIt commands) may be freely mixed with external operating system commands in a command pipeline. See CommandShell class>>commandProcessing for more information.

Each command line is first evaluated as a Smalltalk expression, and is subject to further parsing only if the Smalltalk evaluation fails. In practice, this permits complete Smalltalk expressions to be evaluated easily without conflicting with shell syntax, and allows Smalltalk and unix shell commands to be freely mixed.

Simple command scripting is supported (method category 'command scripting'). Any mix of internal and external commands may be included in a script. Conditional branching is supported based on command exit status.

Open a new shell window with "CommandShell open". Type 'help' followed by <return> or <enter> for help on builtin commands.

Things that work reasonably well:
- Simple command execution for running command line programs or starting
  X programs.
- Command pipelines. Built in commands can be mixed with external
  commands, as in "help sqsh | wc -l".
- Command IO redirection with '<',  '>', '>>', '2>', and '2>>'.
- Command history and command history recall.
- Background command execution, as in "xterm&".
- <ctl-C> to interrupt a running external command.
- <ctl-D> to indicate end of file in terminal input.

Limitations include:
- Dumb tty only. Do not try to run vi.
- Standard Unix shell syntax is not completely implemented.

Race conditions are possible for certain command pipelines. See CommandShell class>>raceConditions for more information.
