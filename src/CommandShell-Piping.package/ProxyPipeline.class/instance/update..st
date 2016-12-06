updating
update: aParameter

	aParameter == self pipeFromOutput
		ifTrue: [^ self triggerEvent: #outputDataReady].
	aParameter == self errorPipelineStream
		ifTrue: [^ self triggerEvent: #errorDataReady].
	aParameter == #runState
		ifTrue: [^ self handleRunstateChange].
	self error: 'unexpected parameter'

