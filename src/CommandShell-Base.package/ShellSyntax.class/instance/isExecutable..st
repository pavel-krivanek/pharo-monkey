platform dependent
isExecutable: aPath 
	"Answer true if aPath points to an executable file. This could be 
	enhanced to support setting UID and GID for a CommandShell session. 
	For now, just take the default for the current Squeak process."

	^ aPath notNil
		and: [(Smalltalk
				at: #OSProcess
				ifPresent: [:osp | osp accessor isExecutable: aPath])
				ifNil: [false]]