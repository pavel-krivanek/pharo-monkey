tests
testProcessBuildDirectory

	self assert: process buildDirectory equals: (process baseDirectory / 'build')