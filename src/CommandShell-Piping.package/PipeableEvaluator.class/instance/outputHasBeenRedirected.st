accessing
outputHasBeenRedirected
	"True if pipeFromOutput has been redirected to a FileStream"

	^ outputHasBeenRedirected ifNil: [outputHasBeenRedirected := false]