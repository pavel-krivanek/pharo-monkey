evaluation
registerBackgroundPipeline: aPipeline
	"Register aPipeline and answer an index number identifier."

	| index |
	aPipeline background
		ifTrue:
			["Find available slot in registry, expanding if needed"
			index := self backgroundPipelines identityIndexOf: nil.
			(index > 0)
				ifTrue:
					[self backgroundPipelines at: index put: aPipeline.
					^ index]
				ifFalse:
					[self backgroundPipelines addLast: aPipeline.
					^ backgroundPipelines size]]
		ifFalse:
			[self error: 'expected a background pipeline']
