initialize - release
initialize
	"Semaphore to protect against finalizing the output and error streams
	while they are being read."

	accessProtect := Semaphore forMutualExclusion.
	^ super initialize
