*CI-Obsolete
processFiletree

	<argument>

	^ ((self argumentAt: 1) = 'filetree')
		ifTrue: [ 
			self setUpFileTree.
			self dispatchSubFileTreeCommand ]
		ifFalse: [ nil ].	

	