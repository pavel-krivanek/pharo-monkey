closing
close
	"must use respondsTo: to support streams only implementing the basic protocol"
	(stream respondsTo: #close)
		ifTrue: [stream close]