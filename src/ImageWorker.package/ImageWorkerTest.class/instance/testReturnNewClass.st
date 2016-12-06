tests
testReturnNewClass
	| newClass className |
	className := #'ImageWorkerTest_newclass'.
	newClass := self do: [ Object subclass: className ].
	self assert: newClass name equals: className.
	self deny: (Smalltalk includesKey: className)