private
waitForForkedImage
	| delay |
	forkedImageProcess := OSProcess command: self forkedImageCommand.
	delay := 50 milliSeconds asDelay.
	[ forkedImageProcess update: #runState.
	forkedImageProcess isComplete ] whileFalse: [ delay wait ].
	forkedImageProcess succeeded
		ifFalse: [ self
				handleForkedImageResultWithExitStatus: forkedImageProcess exitStatus ]