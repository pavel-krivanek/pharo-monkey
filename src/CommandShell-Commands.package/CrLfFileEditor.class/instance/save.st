menus
save

	| controller |
	self forceDirtyBuffer.
	controller := self controllerForAccept.
	controller ifNotNil: [controller accept]
