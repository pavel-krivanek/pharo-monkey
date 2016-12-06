globbing
glob: aString inDirectory: directoryPath
	"Apply Unix shell globbing rules to aString, and answer an array of matching
	file names."

	"ShellSyntax new glob: 'ReadMe.txt' inDirectory: FileDirectory default pathName"
	"ShellSyntax new glob: 'SqueakDebug.log' inDirectory: FileDirectory default pathName"
	"ShellSyntax new glob: '?queak*.[0-9].log' inDirectory: FileDirectory default pathName"
	"ShellSyntax new glob: '*image*' inDirectory: FileDirectory default pathName"
	"ShellSyntax new glob: 'noSuchFileName' inDirectory: FileDirectory default pathName"
	"ShellSyntax new glob: 'b?n' inDirectory: '/usr'"

	[^ self glob: aString names: (CommandShell directoryEntryNames: directoryPath)]
		on: Error
		do: [:ex | ^ #()]

