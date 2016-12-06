private - cleanup
cleanUp
	(forkedImageProcess isNotNil and: [ forkedImageProcess isComplete not ])
		ifTrue: [  forkedImageProcess terminate ].
	
	self baseFile parent exists ifTrue: [
		self baseFile parent deleteAll ].