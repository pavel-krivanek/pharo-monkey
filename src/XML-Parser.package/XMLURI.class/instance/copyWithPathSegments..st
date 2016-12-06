copying
copyWithPathSegments: aCollection
	| newRawPathSegments |

	newRawPathSegments := self rawPathSegments copyEmpty.
	aCollection do: [:each |
		newRawPathSegments addLast: (self percentEncoded: each)].
	^ self copy rawPathSegments: newRawPathSegments.