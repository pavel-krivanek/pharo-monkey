evaluating
start
	"Fork a headless child Squeak to evaluate my task."

	| childBlock result |

	self registerForFinalization.

	"Create block to be evaluated in a Squeak child process."
	childBlock := ["First set standard input to blocking. This avoids a delay to wait for
		data to be available, but note that it is dangerous to do this unless you
		are certain that you know in advance that the correct number of characters
		will be available on the input. If this is not the case, then the VM will block
		on the read and lock up the child squeak process."
		result := [self task value]
					on: Exception
					do: [:e |
						HeadlessChild ifFalse: [ e halt; resume ].
						result := 'remote task execution failed: ', e printString].
		OSProcess thisOSProcess stdIn setBlocking.
		self put: result.
		OSProcess thisOSProcess stdOut flush; close].
	"Fork a child Squeak that will evaluate the childBlock then exit"
	childProxy := PipeableOSProcess
					forkSqueakAndDoThenQuit: childBlock
					errorPipelineStream: InternalPipe nonBlockingPipe
					headless: HeadlessChild
					bufferedOutput: false
					outputNotifier: aioHandler
