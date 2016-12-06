testing
inputHasBeenRedirected
	"Answer true if the input stream has been redirected to an external file."

	^ self pipeToInput notNil and: [pipeToInput isPipe not]
