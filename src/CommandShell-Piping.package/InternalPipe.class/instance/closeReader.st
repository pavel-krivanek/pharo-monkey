finalization
closeReader
	"Protocol compatibility with OSPipe. No further reads are possible after
	closing the reader, therefore any dependents and events may be released.
	Nothing actually is done, except to release dependents and events."

	self release
