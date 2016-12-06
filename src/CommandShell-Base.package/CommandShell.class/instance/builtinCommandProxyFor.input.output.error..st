process proxy creation
builtinCommandProxyFor: aCommandString input: in output: out error: err
	"Answer a PipeableEvaluator on a built in command, or nil."

	"CommandShell new initialize builtinCommandProxyFor: 'help' input: nil output: nil error: nil"

	| args command commandAndArgs |
	^ (self isBuiltInCommand: aCommandString)
		ifTrue:
			[commandAndArgs := self shellSyntax
									programNameAndArgumentsFrom: aCommandString
									inDirectoryPath: nil
									findExecutable: false.
			command := self builtinCommands at: commandAndArgs first.
			args := commandAndArgs last.
			^ ShellBuiltinEvaluator
				command: command
				withArguments: args
				shell: self
				pipeFrom: in
				pipeTo: out
				errorPipelineStream: err]
		ifFalse: [nil]
