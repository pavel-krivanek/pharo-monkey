accessing
promptString
	"The primary command prompt string, equivalent to $PS1 in a Unix shell"

	^ promptString ifNil: [promptString := self defaultPromptString]
