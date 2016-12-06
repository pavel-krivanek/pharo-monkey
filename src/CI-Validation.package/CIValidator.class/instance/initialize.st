initialize-release
initialize
	super initialize.
	rule := CIListRule new.
	rule validator: self.