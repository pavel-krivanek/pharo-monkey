evaluation
command: aCommandString echo: showCommand
	"Evaluate aCommandString. Answer a collection of evaluated pipelines,
	or nil if nothing was done. If showCommand is true, update dependent
	views in order to display the command."

	showCommand ifTrue: [self changed: aCommandString].
	^ self evaluatePipelines: (self evaluateOrMakePipelinesFrom: aCommandString)
