bash-file-management
basicExecuteSubtask: aCITask
	
	self pushTask: aCITask.
	isTravis
		ifTrue: [ 
			self echo: 'travis_fold:start:Monkey Build Task ', aCITask name ].
	aCITask executeWith: self.
	isTravis
		ifTrue: [ 
			self echo: 'travis_fold:end:Monkey Build Task ', aCITask name ].
	self pop.