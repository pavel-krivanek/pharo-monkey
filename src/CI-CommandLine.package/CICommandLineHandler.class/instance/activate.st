activation
activate

	| result |

	"Hack to prevent delays to be triggered immediatly"
	1 milliSecond wait.
	
	monkey := CIMonkey withPublisher: self publisher.
	result := monkey execute: [
		self setUpMonkey.
		self processArguments. 
		].
	self optionAt: 'stepName' ifPresent: [:aString | result stepName: aString ].
	
	monkey publisher publishValidationResult: result.
	
	(self hasOption: 'update-issue') ifTrue: [
		self updateIssueWith: result].
	 
	result isSuccess ifFalse: [ 
		Smalltalk exit: 1 ].
	
	Smalltalk snapshot: (self hasOption: 'save') andQuit: true.