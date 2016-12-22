activation
buildURL

	^ Smalltalk os environment at: 'BUILD_URL' ifAbsent: [''] 