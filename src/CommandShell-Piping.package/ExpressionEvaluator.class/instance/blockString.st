evaluating
blockString
	"Answer source code for a block to execute my expression. Attempt to give it the correct
	number of parameters based on scanning expression for use of #args, #stderr, #stdout,
	and #stdin tokens."

	"PipeableEvaluator new expression: 'stdout nextPutAll: (args at: 4)'; blockString"
	"PipeableEvaluator new expression: 'stderr nextPutAll: stdin contents'; blockString"
	"PipeableEvaluator new expression: 'stdout nextPutAll: stdin contents'; blockString"
	"PipeableEvaluator new expression: 'stdin contents'; blockString"
	"PipeableEvaluator new expression: '#HelloWorld'; blockString"

	| tokens prefix |
	self expression isNil
		ifTrue:
			[^ '[]']
		ifFalse:
			[tokens := self addTreeLeaves: (Scanner new scanTokens: expression) to: OrderedCollection new.
			(tokens includes: #args)
				ifTrue:
					[prefix := '[:stdin :stdout :stderr :args | ']
				ifFalse:
					[(tokens includes: #stderr)
						ifTrue:
							[prefix := '[:stdin :stdout :stderr | ']
						ifFalse:
							[(tokens includes: #stdout)
								ifTrue:
									[prefix := '[:stdin :stdout | ']
								ifFalse:
									[(tokens includes: #stdin)
										ifTrue:
											[prefix := '[:stdin | ']
										ifFalse:
											[prefix := '[']]]].
			^ prefix, self expression, ']']
