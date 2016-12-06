working directory
workingDirectory

	^ self shellSyntax workingDirectory
		ifNil:
			[shellSyntax workingDirectory: CommandShell defaultPathString; workingDirectory]