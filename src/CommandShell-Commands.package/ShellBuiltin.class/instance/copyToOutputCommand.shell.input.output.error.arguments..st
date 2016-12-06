implementations
copyToOutputCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Copy the contents of (argArray at: 1) or stdin onto stdout. This
	command exists only for purposes of testing stdin and pipelines
	for PipeableEvaluator proxies."

	| fs |
	(argArray isNil or: [argArray size == 0])
		ifTrue:
			[stdin ifNotNil: [self copyUntilDoneFrom: stdin to: stdout]]
		ifFalse:
			[argArray do:
				[:file |
				(CommandShell fileExists: file)
					ifTrue:
						[fs := FileStream readOnlyFileNamed: file.
						fs ifNotNil:
							[self copyUntilDoneFrom: fs to: stdout.
							fs close]]]]
