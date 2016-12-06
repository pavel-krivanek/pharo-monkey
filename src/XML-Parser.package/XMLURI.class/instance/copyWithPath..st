copying
copyWithPath: aString
	| newRawPathSegments |

	newRawPathSegments := self rawPathSegments copyEmpty.
	$/
		xmlSplit: aString
		do: [:each | newRawPathSegments addLast: (self percentEncoded: each)].
	^ self copy rawPathSegments: newRawPathSegments.