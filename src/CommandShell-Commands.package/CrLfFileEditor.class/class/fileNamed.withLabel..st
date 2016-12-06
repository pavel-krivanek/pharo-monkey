instance creation
fileNamed: pathName withLabel: windowLabel
	"Answer a Controller or Morph as view on an instance of myself."

	"CrLfFileEditor fileNamed: '/etc/hosts' withLabel: 'an editor on /etc/hosts'"

	| dirPath dir fs convention editText localName |
	dirPath := CommandShell dirPathFor: pathName.
	dir := CommandShell directoryForPath: dirPath..
	localName := CommandShell localNameFor: pathName.
	(CommandShell fileExists: localName inDirectory: dir)
		ifTrue:
			[[fs := (Smalltalk
						at: #MultiByteFileStream
						ifAbsent: [Smalltalk at: #CrLfFileStream])
							readOnlyFileNamed: pathName.
			convention := fs detectLineEndConvention.
			editText := fs contentsOfEntireFile.
			fs close]
				on: Error
				do: [:ex |
					convention := #lf.	"Default for Unix text files"
					editText := '']]
		ifFalse:
			[convention := #lf.	"Default for Unix text files"
			editText := ''].
	^ self on: editText
		withLabel: windowLabel
		inDirectory: dir
		defaultFileName: localName
		lineEndConvention: convention
