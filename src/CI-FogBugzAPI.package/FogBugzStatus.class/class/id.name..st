instance creation
id: anId name: aName 
	^ self basicNew 
		initializeId: anId name: aName;
		yourself