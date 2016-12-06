tests
testPathPercentEncodedCharacters
	| uri encodedURIString |

	encodedURIString := self percentEncodedASCIICharacters.
	uri := encodedURIString asXMLURI.
	self
		assert: uri path = self asciiCharacters;
		assert: uri pathSegments = (OrderedCollection with: self asciiCharacters);
		assert: uri rawPathSegments = (OrderedCollection with: self percentEncodedASCIICharacters).

	uri uriString: nil.
	self assert: uri printString = encodedURIString.

	uri := '+' asXMLURI.
	self
		assert: uri path = '+';
		assert: uri pathSegments = (OrderedCollection with: '+');
		assert: uri rawPathSegments = (OrderedCollection with: '+').