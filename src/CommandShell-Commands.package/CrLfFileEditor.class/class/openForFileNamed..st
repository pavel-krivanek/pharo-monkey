private
openForFileNamed: pathName

	"CrLfFileEditor openForFileNamed: '/etc/hosts'"
	"CrLfFileEditor openForFileNamed: '/NO/SUCH/FILE'"
	"CrLfFileEditor openForFileNamed: '/etc/NOSUCHFILE'"

	^ CommandShell isMorphic
		ifTrue: [(self fileNamed: pathName) openInWorld]
		ifFalse: [(self fileNamed: pathName) open]
