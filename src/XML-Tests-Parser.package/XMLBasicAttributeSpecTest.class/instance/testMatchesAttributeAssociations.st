tests
testMatchesAttributeAssociations
	| attributeSpec |

	attributeSpec := #() asXMLAttributeSpec.
	self assert: (attributeSpec matchesAttributeAssociations: #()).
	self assert:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name' -> 'value')).

	attributeSpec := (Array with: 'name' -> 'value') asXMLAttributeSpec.
	self deny: (attributeSpec matchesAttributeAssociations: #()).
	self deny:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name' -> 'value2')).
	self deny:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name2' -> 'value')).
	self assert:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name' -> 'value')).

	attributeSpec := (Array with: 'name' -> 'value' with: 'name2') asXMLAttributeSpec.
	self deny: (attributeSpec matchesAttributeAssociations: #()).
	self deny:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name' -> 'value2')).
	self deny:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name2' -> 'value')).
	self deny:
		(attributeSpec matchesAttributeAssociations:
			(Array
				with: 'name' -> 'value2'
				with: 'name2' -> 'value')).
	self assert:
		(attributeSpec matchesAttributeAssociations:
			(Array
				with: 'name' -> 'value'
				with: 'name2' -> 'value2')).
	self assert:
		(attributeSpec matchesAttributeAssociations:
			(Array
				with: 'name' -> 'value'
				with: 'name2' -> 'value2'
				with: 'name3' -> 'value3')).

	attributeSpec := (Array with: 'name3' -> [:value | value endsWith: '3']) asXMLAttributeSpec.
	self deny: (attributeSpec matchesAttributeAssociations: #()).
	self deny:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name3' -> 'value2')).
	self assert:
		(attributeSpec matchesAttributeAssociations:
			(Array with: 'name3' -> 'value3')).