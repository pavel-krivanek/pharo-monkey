instance creation
editFileNamed: pathName

	"CrLfFileEditor editFileNamed: '/etc/hosts'"
	"CrLfFileEditor editFileNamed: '/NO/SUCH/FILE'"
	"CrLfFileEditor editFileNamed: '/etc/NOSUCHFILE)'"

	^ Cursor read showWhile: [self openForFileNamed: pathName].
