activation
setUpScript

	manager := CIChangeManager new
		changeProvider: CIScriptChangeProvider new;
		validator: CIValidator forCurrentVersion;
		publisher: CICommandLinePublisher new;
		yourself.
		
	issue := manager changeWithId: (self argumentAt: 2)