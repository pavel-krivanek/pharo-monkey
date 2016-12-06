instance creation
fileNamed: pathName inDirectoryPath: dirPath
	"Answer a Controller or Morph as view on an instance of myself."

	"CrLfFileEditor fileNamed: '/etc/hosts' inDirectoryPath: '/usr/bin'"
	"CrLfFileEditor fileNamed: 'bin/vi' inDirectoryPath: '/usr'"
	"CrLfFileEditor fileNamed: 'hosts' inDirectoryPath: '/etc'"
	"CrLfFileEditor fileNamed: 'hosts' inDirectoryPath: '/usr/bin'"
	"CrLfFileEditor fileNamed: '/NO/SUCH/FILE' inDirectoryPath: '/etc'"
	"CrLfFileEditor fileNamed: '/etc/NOSUCHFILE' inDirectoryPath: '/etc'"

	| dir fs convention editText |
	dir := CommandShell directoryForPath: dirPath.
	(dir fileExists: pathName)
		ifTrue:
			[[fs := (Smalltalk
						at: #MultiByteFileStream
						ifAbsent: [Smalltalk at: #CrLfFileStream])
							readOnlyFileNamed: dirPath, CommandShell pathSeparator, pathName.
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
		withLabel: pathName
		inDirectory: dir
		defaultFileName: pathName
		lineEndConvention: convention
