tests
testUserInfoPercentEncodedCharacters
	| prefix suffix encodedURIString uri |

	prefix := 'mailto:'.
	suffix := '@', self host.
	encodedURIString := prefix, self percentEncodedASCIICharacters, suffix.
	uri := encodedURIString asXMLURI.
	self
		assert: uri userInfo = self asciiCharacters;
		assert: uri rawUserInfo = self percentEncodedASCIICharacters.

	uri uriString: nil.
	self assert: uri printString = encodedURIString.

	uri := (prefix, '+', suffix) asXMLURI.
	self
		assert: uri userInfo = '+';
		assert: uri rawUserInfo = '+'.