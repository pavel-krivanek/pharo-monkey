system startup
startUp: resuming
	"A CommandShell may be running external processes in background, and waiting
	for those processes to complete. If the Squeak image is stopped and restarted, the
	background processes are no longer children of the Squeak process, and there is
	no way to receive notification when the processes exit. This would result in leftover
	Smalltalk processes associated with the CommandShell waiting forever for the
	external processes to exit. The simplest way to prevent this is to terminate all
	the Smalltalk processes unconditionally after an image restart."

	resuming ifTrue: [self allSubInstances do: [:e | e startUpInNewSession]]
