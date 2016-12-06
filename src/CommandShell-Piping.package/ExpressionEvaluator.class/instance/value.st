evaluating
value
	"Evaluate my evaluationBlock. If the block evaluates to anything other
	than self, then print the result on pipeFromOutput as output. Otherwise,
	assume that the block was smart enough to have written its own output.
	For a block which does not write its own output, add a trailing line
	terminator after the evaluation if needed. Answer self as the result of
	the evaluation."

	| result resultString |
	self success. "Hope for the best, send #fail if something goes wrong"
	self isNotYetRunning ifTrue:
		[self ensurePipeFromOutput.
		self running.
		self evaluationBlock notNil
			ifTrue:
				[result := [self blockValue]
					on: Error
					do: [:e |
						self errorPipelineStream nextPutAll: e description; nextPut: Character lf.
						self fail].
				(result == self)
					ifFalse:
						[resultString := result asString.
						pipeFromOutput nextPutAll: resultString.
						(resultString isEmpty not and:
							[(resultString last ~= Character cr) and:
								[resultString last ~= Character lf]])
							ifTrue: [pipeFromOutput nextPut: Character lf]]]
			ifFalse:
				[self fail].
		self complete]
