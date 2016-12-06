private
numberOfOpenFiles
	"Answer the number of files currently open for this OS process. This works
	only on a system with a /proc filesystem and file descriptors located in a
	directory called /proc/<pid>/fd. On other systems, just answer 0."

	"CommandShellTestCase new numberOfOpenFiles"

	| d |
	self checkFileHandleCount ifFalse: [^ 0]. "Bypass the test"
	^ (d := self procDir) isNil
		ifTrue: [0]
		ifFalse: [(CommandShell directoryEntryNames: d) size]