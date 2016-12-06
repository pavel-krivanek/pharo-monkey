globbing
glob: aString
	"Apply Unix shell globbing rules to aString, and answer an array of matching
	file names."

	"ShellSyntax new glob: 'ReadMe.txt'"
	"ShellSyntax new glob: 'rEADmE.TXT'"
	"ShellSyntax new glob: 'R*dM?.txt'"

	^ self glob: aString inDirectory: self workingDirectory
