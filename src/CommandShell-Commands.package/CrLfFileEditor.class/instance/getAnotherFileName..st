private
getAnotherFileName: initialFileName

	| choice newFileName |
	choice := ((Smalltalk at: #PopUpMenu)
		labels: 'choose another name\cancel' withCRs)
		startUpWithCaption: initialFileName.
	choice = 1
		ifTrue: [newFileName := (Smalltalk at: #FillInTheBlank)
									request: 'Enter a new file name'
									initialAnswer: initialFileName.
				newFileName := (CommandShell fileExists: newFileName inDirectory: directory)
					ifTrue: [self getFileName: newFileName]
					ifFalse: [newFileName].
				^ newFileName].
	^ nil