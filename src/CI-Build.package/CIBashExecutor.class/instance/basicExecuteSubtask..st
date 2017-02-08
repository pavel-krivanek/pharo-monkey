bash-file-management
basicExecuteSubtask: aCITask
	
	self pushTask: aCITask.
	isTravis
		ifTrue: [ 
			self echo: 'travis_fold:start:', aCITask trimmedName ].
	aCITask executeWith: self.
	isTravis
		ifTrue: [ 
			self echo: 'travis_fold:end:', aCITask trimmedName ].
	self pop.