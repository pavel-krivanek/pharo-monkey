initialize - release
unregisterEvents

	self isEmpty ifFalse: [self last removeDependent: self]
