menus
saveAs

	| oldFilePath newFilePath controller |
	oldFilePath := self currentFilePathName.
	newFilePath := (Smalltalk at: #FillInTheBlank)
					request: 'Enter a new file name'
					initialAnswer: oldFilePath.
	newFilePath isEmpty
		ifFalse:
			[self updateFilePathWith: newFilePath.
			controller := self controllerForAccept.
			controller ifNotNil:
				[self forceDirtyBuffer.
				controller accept]]

