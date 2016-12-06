accessing
needsPrompt
	"True if the command should be followed by a prompt"

	^ needsPrompt ifNil: [needsPrompt := true]