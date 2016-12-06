querying
availableStates
	| rawStatuses |
	
	rawStatuses := self sendRequestWithArguments: {'cmd' -> 'listStatuses'} asDictionary.
	^ (FogBugzStatus buildStatusesFrom: rawStatuses) select: #isActive