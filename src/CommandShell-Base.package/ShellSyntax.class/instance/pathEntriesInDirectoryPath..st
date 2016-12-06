platform dependent
pathEntriesInDirectoryPath: basePath
	"Answer a possibly empty collection of path entries from a colon-delimited path
	string provided by the operating system. Relative path names are interpreted relative
	to basePath"

	"ShellSyntax new pathEntriesInDirectoryPath: CommandShell defaultPathString"

	^ (Smalltalk at: #OSProcess ifPresent:
		[:osp |
		(osp thisOSProcess path findTokens: ':')
			collect:
				[:e | self newPathFor: e fromDefault: basePath]])
		ifNil: [Array new].
