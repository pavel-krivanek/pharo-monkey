accessing
promptStringTwo
	"The secondary command prompt string, equivalent to $PS2 in a Unix shell"

	^ promptStringTwo ifNil: [promptStringTwo := self defaultPromptStringTwo]
