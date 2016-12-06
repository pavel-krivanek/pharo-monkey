private
procDir
	"Assuming that we have a /proc file system as on Linux (otherwise answer nil)"

	| path |
	^ procDir ifNil:
		[path := '/proc/' , OSProcess thisOSProcess pid printString, '/fd'.
		(CommandShell directoryExists: path) ifTrue: [procDir := path]]
