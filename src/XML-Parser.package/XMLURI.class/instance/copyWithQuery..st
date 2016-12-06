copying
copyWithQuery: aDictionary
	| newRawQuery |

	newRawQuery := self rawQuery copyEmpty.
	aDictionary keysAndValuesDo: [:key :value |
		newRawQuery
			at: (self percentAndPlusEncoded: key)
			put: (self percentAndPlusEncoded: value)].
	^ self copy rawQuery: newRawQuery.