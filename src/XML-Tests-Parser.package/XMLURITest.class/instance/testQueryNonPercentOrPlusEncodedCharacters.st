tests
testQueryNonPercentOrPlusEncodedCharacters
	| queryKey queryValue uriString uri |

	queryKey := (self nonPercentEncodedPathCharacters copyWithoutAll: '=&+'), '/?'.
	queryValue :=  (self nonPercentEncodedPathCharacters copyWithoutAll: '&+'), '/?'.
	uriString := '?', queryKey, '=', queryValue.
	uri := uriString asXMLURI.
	self assert:
		uri query =
			(OrderPreservingStringDictionary with: queryKey -> queryValue).

	uri uriString: nil.
	self assert: uri printString = uriString.