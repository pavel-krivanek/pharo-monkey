tests
testHostPercentEncodedCharacters
	| prefix encodedURIString uri |

	prefix := 'http://'.
	encodedURIString := prefix, self percentEncodedASCIICharacters.
	uri := encodedURIString asXMLURI.
	self
		assert: uri host = self asciiCharacters asLowercase;
		assert: uri rawHost = self percentEncodedASCIICharacters.

	uri uriString: nil.
	self assert: uri printString = encodedURIString.

	uri := (prefix, '+') asXMLURI.
	self
		assert: uri host = '+';
		assert: uri rawHost = '+'.