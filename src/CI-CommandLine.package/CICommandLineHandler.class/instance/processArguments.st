activation
processArguments

	| methods |
	
	methods := (Pragma allNamed: #argument in: self class) collect: [ :each | each method selector ].
	methods do: [ :each | 
		(self perform: each) ifNotNil: [:result | 
			^ result ] ].

	self error: 'Invalid subcommand: ', (self argumentAt: 1) .
