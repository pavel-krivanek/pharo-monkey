command string parsing
isComment: aString
	"Answer true if aString is empty or if its first non-space character is commentChar"

	^ (aString size == 0)
		or:
			[aString do: [:e | (e isSeparator not)
							ifTrue: [^ e == self commentChar]].
			false]