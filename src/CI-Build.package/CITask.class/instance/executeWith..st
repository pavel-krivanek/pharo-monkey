executing
executeWith: anExecutor

	[anExecutor setUp.	
	
	anExecutor checkPreviousStatus isSuccess
		ifTrue: [ 
			anExecutor log: ('[{1}] Skipping Task' format: {name}).
			^ true ].

	self subtasks do: [ :each |
		anExecutor executeSubtask: each ].
	
	anExecutor log: ('[{1}] Starting Task' format: {name}).
	
	self imports do: [ :each |
		anExecutor log: ('[{1}] Importing output of {2} into {3}' format: { name . each . self buildDirectory fullName}).
		anExecutor copy: (self parent taskNamed: each) outputDirectory / '.' to: self buildDirectory ].

		
	self steps do: [ :each |
		each executeWith: anExecutor ].	
	
	self output do: [ :each |
		anExecutor log: ('[{1}] Copying output into {2}' format: { name . self outputDirectory fullName}).
		anExecutor copy: each asFileReference to: self outputDirectory ].
	
	anExecutor log: ('[{1}] Finished: SUCCESS' format: {name}).
	anExecutor informSuccess ] ensure: [
		anExecutor tearDown ]