tokenizing - expecting
expectNextAll: aString startingAt: aPosition
	"to:do: for speed"
	aPosition to: aString size do: [:i | | nextChar |
		(nextChar := streamReader next) = (aString at: i)
			ifFalse: [
				self
					errorExpectedLiteral: aString
					butGot: nextChar
					at: i]].
	^ aString.