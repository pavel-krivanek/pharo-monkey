menus
browseChanges
	"Browse in fileIn format."

	| fs |
	fs :=  CommandShell fileNamed: fileName inDirectory: directory.
	ChangeList browseStream: fs.
	fs close
