private
resolveAttributePrefix: aPrefix
	aPrefix size > 0
		ifTrue: [
			aPrefix = 'xml'
				ifTrue: [^ 'http://www.w3.org/XML/1998/namespace'].
			self activeMarkupWriterWithAncestorsDo: [:each |
				each isTagWriter
					and: [each hasXMLNSDeclarations
						and: [
							each xmlnsDeclarations
								at: aPrefix
								ifPresent: [:uri | ^ uri]]]]].
	^ ''.