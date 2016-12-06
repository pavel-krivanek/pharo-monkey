*CI-ForkedValidation
newImageDo: aBlock
	^ self newImageDo: aBlock onTimeout: [ :e | e pass ]