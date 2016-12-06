command scripting
script: aScriptString
	"A script is a String containing a list of commands separated by Character cr.
	Evaluate each command string in the array until a failure is encountered.
	Answer the last collection of pipelines to have been evaluated."

	"CommandShell new open; 
		script: 'who
				help
				ls -l NOSUCHFILE
				help'"

	^ self script: aScriptString onFailureDo: [:p | p]

