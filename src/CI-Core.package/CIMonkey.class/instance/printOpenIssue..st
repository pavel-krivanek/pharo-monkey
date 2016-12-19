printing
printOpenIssue: aCIChange

	self publisher progressMessage: (String streamContents: [:s |
		s 
			print: aCIChange id; tab;
			nextPutAll: aCIChange publicUrl; tab;
			nextPutAll: aCIChange name.
		]).

