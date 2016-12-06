command string parsing
argsFromCommand: aString
	"Answer a collection of strings from a whitespace delimited string. Single quote characters
	protect substrings from expansion to tokens. Single quote characters may be escaped by
	the backslash character to prevent this interpretation."

	^ (self stringTokensFrom: aString) first
