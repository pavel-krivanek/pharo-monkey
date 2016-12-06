command scripting
scriptDoAll: aScriptString
	"A script is a String containing a list of commands separated by Character cr.
	Evaluate each command in aScriptString. Ignore failures and force evaluation of
	all commands in the script. Answer the last pipeline collection to have been
	evaluated."

	"CommandShell new open; 
		scriptDoAll: 'who
				help
				ls -l NOSUCHFILE
				help'"

	| commandStream lastPipelineCollection |
	commandStream := ReadStream on:
						(aScriptString
							copyReplaceAll: Character lf asString
							with: Character cr asString).
	[commandStream atEnd]
		whileFalse:
			[lastPipelineCollection := self command: commandStream nextLine].
	^ lastPipelineCollection

