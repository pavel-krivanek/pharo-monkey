documentation
htmlOverview
	"A general overview"

	^
'<html><head><title>Introduction to CommandShell</title></head>
<body>
<h3>CommandShell</h3>
 CommandShell is a Smalltalk implementation of a command processor shell and terminal
 window. It is intended to behave like to a simple terminal window (like xterm) running
 a Unix command shell (like /bin/sh). It lacks some elements of Unix shell syntax, and
 does not provide terminal emulation, but it adds some nice Smalltalk enhancements such
 as a text editor which works in a command pipeline, and the ability to evalute Smalltalk
 expressions in a command pipeline with Unix commands.

<h3>How to use CommandShell</h3>
  Evaluate "CommandShell open" or, if you have loaded the change set to put CommandShell
  in your world menu, just select "Squeak Shell" from the "open..." menu entry.
  To use the command shell window, enter commands on the command line (after
  the "$ " command prompt, followed by cr to accept the command. The "help" command
  gives some clues as to what can be done. In general, just try any command which
  you might otherwise enter into a Unix shell or xterm window. Then try some of
  the Smalltalk features such as mixing Smalltalk expressions with Unix commands, and
  piping commands into Smalltalk editors.

<h3>Basic Concepts</h3>
<ul><li><h4>  Commands</h4>
    Smalltalk uses objects and messages, with expressions arranged in a natural
    Noun-Verb-Predicate sentence structure, similar to that of some spoken languages.
    In contrast, many other computer systems use a style in which users issue
    a command to the system, in which the "command" (a verb) is followed by various
    (predicate) modifiers. In the case of a traditional command-line interface, such
    as a Unix shell, the command is usualy the name of a program, and the modifiers
    are parameters passed to the program to influence its behavior. CommandShell attempts
    to provide a command line interface for executing commands within Squeak, in
    a style and environment which is comforable for someone accustomed to the
    Smalltalk style of expression.
<p>
<li><h4>  Process Proxies</h4>
    A command line user interface, such as a Unix shell or a "DOS window" in
    Windows, revolves around the notion of executing programs from user commands.
    When Squeak is hosted in another operating system, it is useful to be able to
    execute an external program from a command line expression. A process proxy
    is an object which represents the evaluation of such an external command
    in a command line environment.
<p>
    From the point of view of Squeak, a process proxy might just as well represent
    the evaluation of a Smalltalk expression in the context of a command line
    environment. Thus a process proxy can be an object which represents the execution
    of an external program or an internal Smalltalk expression. It is created from a
    command line expression, and provides a representation of certain aspects of the
    external (or internal) process execution, such as process run state, exit status, and
    the input, output and error streams for the process.
<p>
    External process proxies are used to evaluate programs in the external operating
    system (this requires the OSProcess change set in addition to CommandShell). Internal
    process proxies are used to evaluate "built in" commands for a command shell,
    such as the "cd" command to change the working directory for the command shell.
    Internal proxies are also used for evaluating "doIt" expressions within a command
    pipeline. In this case, the variables "stdin", "stdout", and "stderr" are pre-defined
    such that the doIt expression can directly access the input, output and error
    pipes for the internal process proxy (in other words, the doIt expression
    "stdout nextPutAll: ''Hello world'' !" will write ''Hello world'' on the output pipe
    of the proxy).
<p>
<li><h4> Pipelines</h4>
    Powerful computing systems may be built upon simple design metaphors. In
    Smalltalk, the concept of objects communicating through messages is generalized
    and extended to produce the Squeak system. In Unix systems, the metaphor of a
    pipe with data flowing between two programs is generalized to produce a mechanism
    for connecting small programs to produce complex systems. The command line shells
    for Unix support this metaphor by providing syntax for connecting two or more
    commands together into more complex command pipelines.
<p>
    CommandShell provides a framework for connecting several process proxies into a
    command pipeline, using command syntax similar to that of a Unix shell. Since the
    process proxies are implemented in Smalltalk, the "programs" in a command pipeline
    may consist of process proxies representing external programs, or of proxies representing
    the evaluation of internal Smalltalk expressions. The objects which flow through
    the pipes in a command pipeline are assumed to be characters, such that the external
    commands can operate on the streams of characters in the usual way, and the internal
    Smalltalk commands read and write streams of characters.
<p>
    Just as programs (or internal expressions) are represented by process proxies, the
    pipes which interconnect two process proxies are represented by pipe objects. The
    pipe may be either an OSPipe (a proxy representing a Unix system FIFO pipe) or an
    InternalPipe (a Smalltalk object which behaves similarly to an OSPipe). The combination
    of process proxies and pipes is a command pipeline, which may be created and
    evaluated from a command line expression using conventional Unix shell syntax.
</ul>
<h3>Command Line Syntax</h4>
    A command or command pipeline may be created from a string expression, and
    evaluated using Unix shell syntax. CommandShell accepts command line strings and
    does some high level processing to set up process proxy execution. For most of the
    command parsing, it relies on a ShellSyntax object to do the syntax evaluation.
    In particular, a real Unix shell interprets command line parameters in the context of the
    Unix file system, expanding "wildcard" characters and searching for files in the context
    of a "current working directory" location in the file system tree. A CommandShell,
    collaborating with an instance of ShellSyntax, implements this syntax parsing
    and evaluation in Smalltalk.

<h3>Command Execution</h4>
    Beginning with a command line (which may represent a pipeline of several
    commands), a CommandShell first attempts to treat the entire command line as
    a Smalltalk expression. The command line string is used to create an instance of
    PipeableEvaluator (a kind of process process). If the expression is successfully
    compiled and evaluated in the PipeableEvaluator, the command line is executed
    just as if it were an external Unix command, with the result of the evaluation
    written as a string to the output stream of the process proxy.
<p>
    If the complete command line cannot be treated as a Smalltalk expression,
    CommandShell assumes that it must be a Unix style command pipeline. If the
    command line is a comment (starting with ''#'') it is discarded; otherwise it
    is broken down into a series of process proxies connected by pipes, with
    command line parameters and other aspects of the command line parsing handled
    by a ShellSyntax object.
<p>
    The process proxies in the command pipeline may represent internal or external
    commands. CommandShell parses the command line to create the proxies by breaking
    the command pipeline into segments (separated by the "|" pipe character), with
    different kinds of process proxy created according to the following priorities:
<ul><li>
      If the command segment is a simple Smalltalk expression terminated by "!", it
      is treated as a "doIt" expression, evaluated in a PipeableEvaluator proxy. This
      kind of simple doIt expression is limited to commands with characters which
      are unambiguous in a shell command. For example, "|" has special meaning in
      a command line, and cannot be used in a doIt expression (command line quoting
      and escape characters have not yet been implemented in the CommandShell syntax).
<li>
      If the command segment is not a doIt expression, CommandShell checks to see
      if it matches one of several "shell builtin" commands. These are special commands
      implemented in class ShellBuiltin and evaluated in a PipeableEvaluator proxy.
      They behave analogously to shell builtin commands in a conventional Unix shell.
      A number of commands such as "cd" and "pwd" are implemented as internal builtin
      commands, rather than relying on Unix external equivalents. In addition, other
      builtin commands such as "edit" do things which are useful in Squeak and have
      no real equivalent in Unix (the "edit" builtin opens an editor within Squeak, taking
      its input from files or directly from the output of a command pipeline such as
      "Smalltalk ! | edit" or "who | edit").
<li>
      If the command segment is not a shell builtin command, it is assumed to be an
      external command. It this case, the command line segment is fully parsed, then
      used to create an external OS process proxy to run the external command. The
      external process proxy responds to a #value message by running the external
      program, with output and error written to pipes connected to the command
      pipeline.
<li>
      Finally, if no external program can be found to execute the command, an error
      message is provided to the command window, and no command is evaluated.
</ul>
    Once the command proxy pipeline has been created, the individual process proxies
    are evaluated in such a way that they appear to execute in parallel, with each
    proxy reading its input from a pipe connected to its predecessor in the pipeline,
    and writing its output to a pipe connected to its successor in the pipeline. An
    additional error pipe is shared by all process proxies in the pipeline, such that
    any error output is accumulated in the shared error pipe stream.
<p>
    A command shell can obtain the output and error of a complex command pipeline
    simply by evaluating the last process proxy in the chain, and reading up to the
    end of its output and error pipes. Since a process proxy knows its run state, and
    a pipe is not "at end" until a process proxy closes one end of the pipe, the pipeline
    can be constructed in such a way that the command shell is assured that all process
    proxies have completed their evaluation when the output of the last proxy is read
    up to the end of the pipe.
<p>
    As the last process proxy in a command pipeline is evaluated, CommandShell reads
    its output and error pipes, and displays the text in the View or Morph which it uses
    as its terminal window. When complete, it issues a new prompt string, and waits for
    another command line to be entered by the user.
<p>
<h3>Exercise for the Reader:</h4>
Which one of the following five command lines will generate
an error, and why?
<ol><li>
  $ stdout nextPutAll: ''hello world''
<li>
  $ stdout nextPutAll: ''hello world''; cr
<li>
  $ stdout nextPutAll: ''hello world''!
<li>
  $ stdout nextPutAll: ''hello world''; cr!
<li>
  $ stdout nextPutAll: ''hello world''!; stdout cr!
</ol>
<h3>Answer:</h4>
The fourth command will generate an error.
<ul><li>
  Line one is evaluated as a complete Smalltalk expression, and succeeds.
<li>
  Line two is evaluated as a complete Smalltalk expression, and succeeds.
<li>
  Line three is evaluated as a pipeline after failing evaluation as a complete Smalltalk
  expression. It succeeds as a pipeline with one internal doIt proxy, and produces
  the same output as line one.
<li>
  Line four cannot be evaluated as a complete Smalltalk expression. The ";" token
  causes the command line to be evaluated as two pipelines. The expression for the
  first pipeline does not have a trailing "!" token, so it is assumed to be an external
  command, and fails. The second pipeline is evaluated as a doIt on the string ''cr!'',
  which fails as an invalid Smalltalk expression. The error messages for both failures
  are accumulated on the shared error pipe, and are displayed in the terminal window.
<li>
  Line five is evaluated successfully as two pipelines, each consisting of one doIt
  proxy. The output is the same as for line two.
</ul></body></html>
'