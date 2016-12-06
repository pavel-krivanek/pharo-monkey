copying
copyWithFragment: aString
	^ self copy rawFragment: (self percentEncoded: aString)