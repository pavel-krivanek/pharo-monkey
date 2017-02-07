helpers
toTerminalString: aString
	
	^ aString copyReplaceAll: String cr with: self newLineString