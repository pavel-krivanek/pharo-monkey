validation
processRule: aRule

	^ aRule newImageDo: [ aRule remoteValidate ]