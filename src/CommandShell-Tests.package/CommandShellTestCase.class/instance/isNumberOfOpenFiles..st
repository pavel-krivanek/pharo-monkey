private
isNumberOfOpenFiles: anInteger
	"Answer true if the number of open file handles is anInteger. Wait a little
	bit if necessary to clean up stale references, but give up after a few tries."

	| loops milliseconds |
	self checkFileHandleCount ifFalse: [^ true]. "Bypass the test"
	loops := 10.
	milliseconds := 50.
	(1 to: loops)
		detect:
			[:i | (self numberOfOpenFiles == anInteger)
				ifFalse:
					[(Delay forMilliseconds: milliseconds) wait].
			self numberOfOpenFiles == anInteger]
		ifNone:
			["This causes the failure to appear as an error rather than a
			failure in the test runner. This kind of problem can be appear
			intermittently, and is different from a functional failure of
			a method."
			self error:
				self numberOfOpenFiles printString,
				' files are open, expected ', anInteger printString].
	^ self numberOfOpenFiles == anInteger
