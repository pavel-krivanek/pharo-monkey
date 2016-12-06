utility
canAccessOSProcess
	"True if OSProcess is in the image and if the OSProcess plugin is functioning properly"

	"self canAccessOSProcess"

	| osp |
	^ (osp := Smalltalk at: #OSProcess ifAbsent: []) notNil and: [osp accessor canAccessSystem]
