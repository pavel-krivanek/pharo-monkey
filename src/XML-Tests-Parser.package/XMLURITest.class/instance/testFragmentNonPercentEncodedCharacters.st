tests
testFragmentNonPercentEncodedCharacters
	| fragment uriString uri |

	fragment := self nonPercentEncodedPathCharacters , '/?'.
	uriString := '#', fragment.
	uri := uriString asXMLURI.
	self assert: uri fragment = fragment.
	
	uri uriString: nil.
	self assert: uri printString = uriString.