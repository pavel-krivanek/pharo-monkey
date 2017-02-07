bash-file-management
basicExecuteSubtask: aCITask
	
	self pushTask: aCITask.
	isTravis
		ifTrue: [ 
			self echo: 'travis_fold:start:SCRIPT folding starts' ].
	aCITask executeWith: self.
	isTravis
		ifTrue: [ 
			self echo: 'travis_fold:end:SCRIPT folding ends' ].
	self pop.