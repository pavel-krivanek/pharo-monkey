evaluating
blockValue
	"Evaluate my evaluationBlock. For a smart block, answer self. For a dumb
	block, answer the result of evaluating it. Heuristic: If the block receives
	two or more arguments, then assume that it was smart enough to write
	output to stdout. Otherwise, assume that it was a dumb block."

	| nArgs |
	self evaluationBlock ifNil: [^ nil].
	nArgs := evaluationBlock numArgs.
	(nArgs == 0)
		ifTrue: "dumb block"
			[^ evaluationBlock value]
		ifFalse:
			[(nArgs == 4)
				ifTrue: "smart block"
					[evaluationBlock
						value: self pipeToInput
						value: self pipeFromOutput
						value: self errorPipelineStream
						value: self argumentArray]
				ifFalse:
					[(nArgs == 3)
						ifTrue: "smart block"
							[evaluationBlock
								value: self pipeToInput
								value: self pipeFromOutput
								value: self errorPipelineStream]
						ifFalse:
							[(nArgs == 2)
								ifTrue: "smart block"
									[evaluationBlock
										value: self pipeToInput
										value: self pipeFromOutput]	
								ifFalse:
									[(nArgs == 1)
										ifTrue: "dumb block"
											[^ evaluationBlock value: self pipeToInput]
										ifFalse: "really stupid block"
											[self error: 'expected block with 4 or fewer arguments'.
											^ nil]]]]]
