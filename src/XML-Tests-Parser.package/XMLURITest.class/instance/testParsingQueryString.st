tests
testParsingQueryString
	#('' '?' '?&' '?&&') do: [:each |
		self assert:
			each asXMLURI query =
				OrderPreservingStringDictionary new].

	#('?a=b' '?&a=b&' '?&&a=b&&') do: [:each |
		self assert:
			each asXMLURI query =
				(OrderPreservingStringDictionary with: 'a' -> 'b')].

	#('?=&a=b' '?&=&a=b' '?&&=&&a=b' '?a=b&=' '?a=b&=&' '?a=b&&=&&') do: [:each |
		self assert:
			each asXMLURI query =
				(OrderPreservingStringDictionary with: '' -> '' with: 'a' -> 'b')].

	#('?c=&a=b' '?&c=&a=b' '?&&c=&&a=b' '?a=b&c=' '?a=b&c=&' '?a=b&&c=&&') do: [:each |
		self assert:
			each asXMLURI query =
				(OrderPreservingStringDictionary with: 'c' -> '' with: 'a' -> 'b')].