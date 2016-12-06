evaluation
resetSafeToExitFlag
	"When all foreground and background proxies are complete, the safeToExit
	flag may be set to true. The flag is set false when a snaphot command is
	evaluated, and is checked by any command which would cause Squeak to
	exit. This prevents Squeak from automatically exiting when restarting the
	image."

	[[self foregroundProxies isEmpty not or: [self backgroundProxies isEmpty not]]
		whileTrue: [(Delay forMilliseconds: self pollingDelayTime * 2) wait].
	self safeToExit: true] forkAt: Processor userBackgroundPriority
