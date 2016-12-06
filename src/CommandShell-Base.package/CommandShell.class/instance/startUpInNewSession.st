initialize-release
startUpInNewSession
	"Do this if the image has been restarted, in which case all external process
	references are invalid."

	self clearSemaphore.
	self terminateCommandLineProcesses.
	foregroundProxies := backgroundProxies := backgroundPipelines := nil.
	self keyboardConnector: nil
