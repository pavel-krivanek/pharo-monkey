testing
errorHasBeenRedirected
	"Answer true if the error output has been redirected to an external file
	and is not available to be read as error output of a pipeline."

	^ self errorPipelineStream isPipe not
