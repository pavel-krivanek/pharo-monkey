initialize-release
terminateCommandLineProcesses

	(self commandLineProcesses reject: [:e | e == Processor activeProcess])
		do: [:p | p terminate].
	commandLineProcesses := nil
