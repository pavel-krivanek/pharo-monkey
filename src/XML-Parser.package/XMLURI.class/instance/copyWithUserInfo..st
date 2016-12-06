copying
copyWithUserInfo: aString
	^ self copy rawUserInfo: (self percentEncoded: aString)