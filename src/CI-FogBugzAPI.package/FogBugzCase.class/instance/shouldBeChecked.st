testing
shouldBeChecked
	"Check if all subcases have been closed and that the issue has not yet been checked in this pharo version."
	| currentUpdateTag |
	
	currentUpdateTag := 'Validated in ', SystemVersion current highestUpdate asString.
	(self tags includes: currentUpdateTag)
		ifTrue: [ ^ false ].
	
	^ self subcases allSatisfy: [ :case | case hasBeenClosed ]