execution
executeIn: aCIProcess 
	
	self beExecuting.
	[
	self operations do: [ :op | op executeIn: self ].
	self isLastStep ifFalse: [ self copyOutputOperation executeIn: self ].
	self beSuccess ]
		on: CIError do: [ :error | 
			self beError: error.
			error pass ]