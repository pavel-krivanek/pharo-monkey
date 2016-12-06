private
name: aString help: helpSelector procedure: procedureSelector needsPrompt: trueOrFalse
	"Command definition methods use this method to create instances representing
	shell builtin commands. The commands are installed in a CommandShell, and
	later evaluated in the context of a PipeableEvaluator."

	^ self new
		name: aString;
		helpSelector: helpSelector;
		procedureSelector: procedureSelector;
		needsPrompt: trueOrFalse
