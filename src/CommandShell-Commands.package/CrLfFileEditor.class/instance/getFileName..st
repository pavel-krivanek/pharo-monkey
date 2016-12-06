private
getFileName: initialFileName

	| choice newFileName |
	choice := ((Smalltalk at: #PopUpMenu)
		labels: 'overwrite that file\choose another name\cancel' withCRs)
		startUpWithCaption: initialFileName, ' already exists.'.
	choice = 1
		ifTrue: [^ initialFileName].
	choice = 2
		ifTrue: [newFileName := (Smalltalk at: #FillInTheBlank)
									request: 'Enter a new file name'
									initialAnswer: initialFileName.
				newFileName := (CommandShell fileExists: newFileName inDirectory: directory)
					ifTrue: [self getFileName: newFileName]
					ifFalse: [newFileName].
				^ newFileName].
	^ nil