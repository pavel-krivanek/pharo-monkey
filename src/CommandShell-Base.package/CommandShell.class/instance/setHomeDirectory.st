initialize-release
setHomeDirectory

	self environment.
	^ environment at: #HOME put: CommandShell defaultPathString
