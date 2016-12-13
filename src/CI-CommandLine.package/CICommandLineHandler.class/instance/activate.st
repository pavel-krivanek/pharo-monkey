activation
activate

	| methods |

	"Hack to prevent delays to be triggered immediatly"
	1 milliSecond wait.
		
	methods := (Pragma allNamed: #argument in: self class) collect: [ :each | each method selector ].
	methods do: [ :each | (self perform: each) ifTrue: [ ^ self ] ].

	self exitFailure: 'Invalid subcommand: ', (self argumentAt: 1) .