model access
contents: aString
	viewStyle == #hex
		ifTrue: [ self inform: 'cannot update in hex mode' ]
		ifFalse: [ contents := aString	"asString" ]