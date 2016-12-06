model access
put: aText 

	| str newFileName fs |
	viewStyle == #hex
		ifTrue: [self inform: 'cannot save file in hex mode'.
				^ false].
	str := aText asString.
	self contents: str.
	(CommandShell fileExists: fileName inDirectory: directory)
		ifTrue: [newFileName := self
					getFileName: (CommandShell pathNameForDirectory: directory),
						CommandShell pathSeparator , fileName.]
		ifFalse: [newFileName := (CommandShell pathNameForDirectory: directory),
						CommandShell pathSeparator , fileName].
	newFileName ifNil: [^ false].
	fs := (Smalltalk at: #CrLfFileStream) fileNamed: newFileName.
	[fs isNil] whileTrue:
		[self inform: 'cannot write file'.
		newFileName := self getAnotherFileName: newFileName.
		newFileName isNil
			ifTrue:
				[self inform: 'file not written'.
				^ false]
			ifFalse:
				[fs := (Smalltalk at: #CrLfFileStream )fileNamed: newFileName]].
	(str size < fs size)
		ifTrue:
			[(fs respondsTo: #truncate)
				ifTrue:
					[[fs truncate]
						on: Error
						do: [:ex | fs := self bogusTruncate: fs]]
				ifFalse: [fs := self bogusTruncate: fs]].
	fs nextPutAll: str.
	fs close.
	self updateFilePathWith: newFileName.
	^ true