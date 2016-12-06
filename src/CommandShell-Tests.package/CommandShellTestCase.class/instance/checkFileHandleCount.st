accessing
checkFileHandleCount
	"If true, attempt to count the number of open file handles before and after
	tests. This uses the /proc file system on Linux, and may work on other systems
	which support a /proc file system."

	^ CheckFileHandleCount