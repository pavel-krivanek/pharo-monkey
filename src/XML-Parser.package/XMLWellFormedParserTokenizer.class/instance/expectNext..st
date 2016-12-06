tokenizing - expecting
expectNext: aCharacter
	| nextChar |

	(nextChar := streamReader next) = aCharacter
		ifFalse: [
			self
				errorExpectedLiteral: aCharacter
				butGot: nextChar].
	^ nextChar.