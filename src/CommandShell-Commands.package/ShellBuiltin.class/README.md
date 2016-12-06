A shell builtin command, intended to be invoked by a CommandShell.

A builtin command consists of:
 name - a String identifier, used by the CommandShell to identify and invoke the commmand.
 helpString - a String to describe the function of the command.
 procedure - a BlockContext with parameters to be passed by the CommandShell.

Commands are implemented in instance methods. To create a new command, write a
new command implementation method and a new help method for the command. Write
a new class side instance creation method patterned after one of the existing commands
and install the instance creation method in an instance of CommandShell with
CommandShell>>installCommand:.

A command implementation is a method which receives six paramaters. The parameters are
to be interpreted as follows:
	- First parameter: The EvaluatorProxy which is evaluating the command. If a command fails,
	  send #fail to this object.
	- Second parameter: The CommandShell from which the command was evaluated. Use this
	  for any additional parsing which may be required in the command implementation.
	- Third parameter: The input stream for the command.
	- Forth parameter: The output stream for the command.
	- Fifth parameter: The error stream for the command.
	- Sixth parameter: An array of optional command arguments.
