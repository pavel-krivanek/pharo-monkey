error handling
notify: aString at: aPosition in: aStream

	| s |
	s := aStream contents.
	self errorPipelineStream
		nextPutAll: (s copyFrom: 1 to: (aPosition - 1));
		nextPutAll: aString;
		nextPutAll: (s copyFrom: aPosition to: s size);
		cr

