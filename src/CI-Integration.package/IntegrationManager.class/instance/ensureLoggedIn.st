private
ensureLoggedIn
	self tracker isLoggedIn 
		ifFalse: [  
			self tracker logOff. "Ensure logOff"
			self tracker 
				logOnWithEmail: self class userName
				password: self class password ].

	^ self tracker isLoggedIn