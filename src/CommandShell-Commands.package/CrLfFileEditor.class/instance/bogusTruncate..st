private
bogusTruncate: fileStream
	"Truncate the file by brute force if FileStream>>truncate is not supported on
	this system. Note that this does not preserve file permissions."

	| name |
	name := fileStream name.
	fileStream close.
	CommandShell deleteFileNamed: name inDirectory: directory.
	^ (Smalltalk at: #CrLfFileStream) fileNamed: name
