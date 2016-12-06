instance creation
fileNamed: pathName
	"Answer a Controller or Morph as view on an instance of myself."

	"CrLfFileEditor fileNamed: '/etc/hosts'"
	"CrLfFileEditor fileNamed: '/NO/SUCH/FILE'"
	"CrLfFileEditor fileNamed: '/etc/NOSUCHFILE'"

	^ self fileNamed: pathName withLabel: pathName
