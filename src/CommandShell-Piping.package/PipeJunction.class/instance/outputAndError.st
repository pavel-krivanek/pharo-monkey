command pipelines
outputAndError
	"Answer an array with output and error contents. If standard error has been
	redirected to a file, answer a null string as the error message."

	"((PipeableOSProcess command: 'ps') | 'NoSuchCommand; grep squeak' | 'cut -c16-100') outputAndError"

	| out err |
	out := self output.
	(self errorHasBeenRedirected)
		ifTrue: [err := '']
		ifFalse: [err := errorPipelineStream contents].
	^ Array with: out with: err