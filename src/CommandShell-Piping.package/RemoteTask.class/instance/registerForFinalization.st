finalization
registerForFinalization
	
	self toFinalizeSend: #finalize:
		to: self class
		with: self copy
