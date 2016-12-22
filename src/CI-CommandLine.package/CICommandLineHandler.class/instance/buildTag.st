activation
buildTag

	^ Smalltalk os environment at: 'BUILD_TAG' ifAbsent: [''] 