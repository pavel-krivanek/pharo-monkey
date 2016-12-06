private
dirEntryString: aDirectoryEntry
	"Original code lifted from Lex Spoon's FileList>>fileNameFormattedFrom:sizePad:"

	"self new dirEntryString: FileDirectory default entries first"

	| folderString nameStr dateStr sizeStr date time |
	folderString := ' [...]'.
	CommandShell useFileSystem
		ifTrue: [nameStr := aDirectoryEntry isDirectory
				ifTrue: [(aDirectoryEntry perform: #basename), folderString]
				ifFalse: [aDirectoryEntry perform: #basename].
				date := aDirectoryEntry modificationTime asDate.
				time := aDirectoryEntry modificationTime asTime.
				sizeStr := aDirectoryEntry size asStringWithCommas]
		ifFalse: [nameStr := aDirectoryEntry isDirectory
				ifTrue: [aDirectoryEntry name , folderString]
				ifFalse: [aDirectoryEntry name].
				date := Date fromSeconds: aDirectoryEntry modificationTime.
				time := Time fromSeconds: aDirectoryEntry modificationTime \\ 86400.
				sizeStr := aDirectoryEntry fileSize asStringWithCommas].
	dateStr := (date printFormat: #(3 2 1 $. 1 1 2)) , ' ' ,
					(String streamContents: [:s | time print24: true on: s]).
	^ nameStr , '    (' , dateStr , ' ' , sizeStr , ')'
