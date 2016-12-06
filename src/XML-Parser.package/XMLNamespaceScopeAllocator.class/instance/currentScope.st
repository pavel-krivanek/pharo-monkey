accessing
currentScope
	^ self scopes xmlLastOrNil ifNil: [self emptyScope]