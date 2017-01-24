building
build
	
	self prepare.
	self beExecuting.
	[
	self stepsDo: [ :step | step setUp ].
	self stepsDo: [ :step | 
		step state isSuccess ifFalse: [ step executeIn: self ] ].
	self beSuccess ]
		on: CIError do: [ :error | self beError: error ]