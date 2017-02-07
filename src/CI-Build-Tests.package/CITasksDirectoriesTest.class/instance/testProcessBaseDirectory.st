tests
testProcessBaseDirectory

	self assert: process baseDirectory equals: (CIUtils pwd / 'build')