export
reportIssue: anIssue

	self
		optionAt: 'reportFile'
		ifPresent: [ :reportFile | 
			reportFile asFileReference writeStreamDo: [ :stream |
				| writer |
				writer := STON writer
					on: stream;
					prettyPrint: true;
					yourself.
				writer nextPut: (Dictionary newFrom: { 
					#id -> issue id.
					#name -> issue name  })]].


	