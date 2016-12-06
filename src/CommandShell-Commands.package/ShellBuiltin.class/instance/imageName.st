private
imageName 
	"After Squeak version 3.6, #imageName was moved to SmalltalkImage "

	^ ((Smalltalk classNamed: 'SmalltalkImage')
		ifNil: [^ Smalltalk imageName]) current imageName