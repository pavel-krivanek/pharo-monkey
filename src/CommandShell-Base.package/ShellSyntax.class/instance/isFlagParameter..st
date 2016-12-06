command string parsing
isFlagParameter: aString
	"Answer true if aString begins with $- (the convention for command flags for Unix)"

	^ (aString size > 0) and: [(aString at: 1) == $-]