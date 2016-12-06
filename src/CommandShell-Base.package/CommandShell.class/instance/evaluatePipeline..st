evaluation
evaluatePipeline: aPipeline
	"Evaluate aPipeline with event handlers to process output and error data."

	"CommandShell new evaluatePipeline: 
			(CommandShell new
				pipelineCollectionFrom: 'ls NOSUCHFILE * | cat | dd | cat | wc; ps -aef | cat& pwd | cat') first"

	| index |
	self registerOutputEventsFor: aPipeline.
	self registerErrorEventsFor: aPipeline.
	aPipeline background
		ifTrue:
			[index := self registerBackgroundPipeline: aPipeline.
			self registerBackgroundCompletionEventsFor: aPipeline
				commandIndex: index.
			self backgroundProxies addAll: aPipeline.
			aPipeline value.
			"Print the index of the background process."
			self errorStream nextPutAll: '[', index asString, '] '.
			aPipeline last isExternalProcess ifTrue:
				[aPipeline last processProxy pid printOn: self errorStream].
			self errorStream cr; nextPut: Character lf]
		ifFalse:
			[self keyboardConnector: aPipeline pipeToInput.
			self registerForegroundCompletionEventsFor: aPipeline.
			self foregroundProxies addAll: aPipeline.
			aPipeline value].
	^ aPipeline
