updating
update: aParameter
	"Clean up after processProxy exits. Remove myself as a dependent of processProxy,
	and close pipes."

	| err |
	(aParameter == pipeFromError)
		ifTrue:
			[accessProtect critical: [self addToErrorPipeline: pipeFromError upToEnd].
			^ self changed: self errorPipelineStream].

	(aParameter == #runState)
		ifTrue:
			[processProxy isComplete
				ifTrue:
					[(err := self pipeFromError)
						ifNotNil: [self addToErrorPipeline: err upToEnd].
					self complete.
					self changed: aParameter]
				ifFalse:
					[^ self]].

	^ super update: aParameter
