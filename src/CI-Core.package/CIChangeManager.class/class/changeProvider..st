instance creation
changeProvider: aChangeProvider 
	
	^ self new
		changeProvider: aChangeProvider;
		publisher: aChangeProvider publisher;
		yourself