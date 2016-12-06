private
writeStuffOnThenClose: aPipe

	^ [(1 to: 10) do:
		[:i |
		aPipe nextPutAll: 'this is line ', i printString; cr.
		(Delay forMilliseconds: 100) wait].
	(aPipe respondsTo: #writer)
		ifTrue: [aPipe writer close]
		ifFalse: [aPipe close]] forkAt: Processor userInterruptPriority