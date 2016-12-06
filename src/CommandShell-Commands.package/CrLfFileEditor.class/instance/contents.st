model access
contents

	^ viewStyle == #hex
		ifTrue: [self hexFormat: contents]
		ifFalse: [contents]
