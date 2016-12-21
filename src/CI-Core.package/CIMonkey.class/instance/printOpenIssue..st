printing
printOpenIssue: aCIChange

	self publisher progressMessage: (String streamContents: [:stream |
		stream 
			print: aCIChange id; tab;
			nextPutAll: aCIChange publicUrl; tab;
			nextPutAll: aCIChange name.
		]).

