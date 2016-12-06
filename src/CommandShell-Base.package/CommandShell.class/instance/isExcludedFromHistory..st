testing
isExcludedFromHistory: commandString
	"Answer true if commandString should not be remembered in the history list. The 'fc'
	and 'history' commands should be excluded."

	^ ('fc*' match: commandString)
		or: ['history*' match: commandString]