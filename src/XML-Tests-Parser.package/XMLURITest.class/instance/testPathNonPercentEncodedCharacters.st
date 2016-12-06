tests
testPathNonPercentEncodedCharacters
	| firstSegment secondSegment uriString uri |

	firstSegment := self nonPercentEncodedPathCharacters copyWithout: $:.
	secondSegment := self nonPercentEncodedPathCharacters.
	uriString := firstSegment, '/', secondSegment.
	uri := uriString asXMLURI.
	self assert:
		uri pathSegments =
			(OrderedCollection with: firstSegment with: secondSegment).

	uri uriString: nil.
	self assert: uri printString = uriString.