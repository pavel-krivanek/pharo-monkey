globbing
character: aCharacter matches: aToken
	"Test if aCharacter is included in the characters of aToken, or if aToken is a #matchAny"

	(aToken == #matchAny) ifTrue: [^ true].
	^ aToken includes: aCharacter