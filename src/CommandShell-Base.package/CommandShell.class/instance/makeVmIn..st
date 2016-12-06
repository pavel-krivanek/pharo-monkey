VM building
makeVmIn: buildDirectoryPathName
	"Rebuild the virtual machine and plugins in the buildDirectoryPathName
	directory. If the build is successful, save the image and restart using the
	new VM. This assumes that the currently executing VM is either located in,
	or linked to, the buildDirectoryPathName directory."

	"CommandShell makeVmIn: CommandShell defaultPathString, CommandShell pathSeparator, 'build'"

	self canAccessOSProcess
		ifFalse:
			[^ self notify: 'OSProcess not available or OSProcess plugin not functioning'].
	self if: 'cd ', buildDirectoryPathName
		then:
			[self if: 'make'
				then:
					[self script: 'echo make completed successfully, restarting VM; OSProcess quitAndRestart !']
				else:
					[self script: 'echo make failed']]
		else:
			[self script: 'echo cannot change directory to ', buildDirectoryPathName]
