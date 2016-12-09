tests
exampleExport
	| collection arguments  |
	collection := OrderedCollection new.
	collection add: 'ci'.
	collection add: 'slice'.	
	collection add: 'export'.
	collection add: '--issue=19448'.
	collection add: '--directory="./dir"'.
	collection add: '--reportFile="issue.ston"'.
	
	arguments := CommandLineArguments withArguments: collection.
	CICommandLineHandler activateWith: arguments.