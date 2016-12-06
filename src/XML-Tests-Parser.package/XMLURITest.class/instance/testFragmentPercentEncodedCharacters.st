tests
testFragmentPercentEncodedCharacters
	| encodedURIString uri |

	encodedURIString := '#', self percentEncodedASCIICharacters.
	uri := encodedURIString asXMLURI.
	self
		assert: uri fragment = self asciiCharacters;
		assert: uri rawFragment = self percentEncodedASCIICharacters.

	uri uriString: nil.
	self assert: uri printString = encodedURIString.

	uri := '#+' asXMLURI.
	self
		assert: uri fragment = '+';
		assert: uri rawFragment = '+'.