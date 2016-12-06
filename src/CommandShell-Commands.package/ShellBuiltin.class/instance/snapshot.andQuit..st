private
snapshot: save andQuit: quit
	"After Squeak version 3.6, #snapshot:andQuit: was moved to SmalltalkImage "

	^ ((Smalltalk classNamed: 'SmalltalkImage')
		ifNil: [^ Smalltalk snapshot: save andQuit: quit]) current snapshot: save andQuit: quit