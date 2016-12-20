activation
publisher

	| publisher |
	
	publisher := CIComposedPublisher new.
	publisher add: CICommandLinePublisher asCIPublisher.
	(self hasOption: 'html') ifTrue: [
		| html |
		html := CIHTMLPublisherForSingleStep asCIPublisher.
		self optionAt: 'reportFile' ifPresent: [ :reportFileName |
			html fileName: reportFileName].
		self optionAt: 'html-resources' ifPresent: [ :url |
			html htmlResourcesUrl: url ].
		publisher add: html.
		].

	^ publisher	
