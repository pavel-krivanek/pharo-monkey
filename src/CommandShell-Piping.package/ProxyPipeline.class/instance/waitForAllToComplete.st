event handling
waitForAllToComplete
	"In some cases the last proxy in a pipeline may complete before some
	of the others. In particular, if one proxy has redirected its output to
	a file, the next proxy will see a nil input stream, and may quickly
	complete its processing before its predecessor proxies have finished
	writing to the file. Time out with an error if pipeline fails to complete
	after 10 seconds."

	(1 to: 100) do: [:e |
		self isComplete ifTrue: [^ self].
		(Delay forMilliseconds: 100) wait].
	self error: 'pipeline did not complete evaluation'

