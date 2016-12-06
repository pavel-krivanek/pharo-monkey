command history
saveInHistoryList: aCommandString

	((aCommandString size == 0) or: [self isExcludedFromHistory: aCommandString])
		ifFalse:
			[self commandHistory add: self historyIndex printString; add: aCommandString.
			historyIndex := historyIndex + 1]
