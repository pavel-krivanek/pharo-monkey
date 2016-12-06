tests
testQueryPercentOrPlusEncodedCharacters
	| encodedURIString uri |

	encodedURIString :=
		'?', self percentEncodedASCIICharacters,
		'=', self percentEncodedASCIICharacters.
	uri := encodedURIString asXMLURI.
	self assert:
		uri query =
			(OrderPreservingStringDictionary with:
				self asciiCharacters -> self asciiCharacters).
	self assert:
		uri rawQuery =
			(OrderPreservingStringDictionary with:
				self percentEncodedASCIICharacters -> self percentEncodedASCIICharacters).

	uri uriString: nil.
	self assert: uri printString = encodedURIString.

	uri := '?+=+' asXMLURI.
	self
		assert: uri query = (OrderPreservingStringDictionary with: ' ' -> ' ');
		assert: uri rawQuery = (OrderPreservingStringDictionary with: '+' -> '+').