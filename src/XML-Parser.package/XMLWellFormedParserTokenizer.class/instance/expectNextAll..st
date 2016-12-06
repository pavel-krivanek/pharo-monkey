tokenizing - expecting
expectNextAll: aString
	"uses to:do: and not implemented in terms of expectNextAll:startingAt:
	for speed"
	1 to: aString size do: [:i | | nextChar |
		(nextChar := streamReader next) = (aString at: i)
			ifFalse: [
				self
					errorExpectedLiteral: aString
					butGot: nextChar
					at: i]].
	^ aString.