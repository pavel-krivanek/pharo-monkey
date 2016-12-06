implementations
slsCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Simple directory contents lister"

	| filePatterns d entries names dirs files entry linesToPrint lineCount cacheStream |

	"A small value of linesToPrint will prevent an ExternalCommandShell from
	overdriving is stdout stream. Maybe. A larger value allows faster updates to
	an interactive CommandShell display."
	linesToPrint := 16.

	(argArray isNil or: [argArray size == 0])
		ifTrue:
			["Contents of current directory."
			filePatterns := Array with: '*']
		ifFalse:
			["List named files"
			filePatterns := argArray].
	CommandShell useFileSystem
		ifTrue: [d := commandShell workingDirectory perform: #asFileReference]
		ifFalse: [d := (Smalltalk at: #FileDirectory) on: commandShell workingDirectory].
	entries := d entries.
	names := Set new.
	filePatterns do: [:pat | names addAll: (commandShell shellSyntax glob: pat inDirectory: commandShell workingDirectory)].
	dirs := OrderedCollection new.
	files := OrderedCollection new.
	names asArray sort do:
		[:n |
		entry := entries detect: [:e | (CommandShell entryName: e) = n].
		entry isDirectory
			ifTrue: [dirs add: entry]
			ifFalse: [files add: entry]].

	linesToPrint := 5.
	lineCount := 1.
	cacheStream := WriteStream on: String new.
	dirs do:	[:dir |
		lineCount := lineCount + 1.
		cacheStream nextPutAll: (self dirEntryString: dir); nextPut: Character lf.
		(lineCount > linesToPrint) ifTrue:
			[stdout nextPutAll: cacheStream contents.
			cacheStream := WriteStream on: String new.
			lineCount := 1]].
	files do: [:file |
		lineCount := lineCount + 1.
		cacheStream nextPutAll: (self dirEntryString: file); nextPut: Character lf.
		(lineCount > linesToPrint) ifTrue:
			[stdout nextPutAll: cacheStream contents.
			cacheStream := WriteStream on: String new.
			lineCount := 1]].
	stdout nextPutAll: cacheStream contents.