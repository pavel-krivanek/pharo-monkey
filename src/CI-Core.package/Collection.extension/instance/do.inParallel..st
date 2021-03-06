*CI-Core
do: aBlock inParallel: threadCount
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection."

	| addSyncronization finishSync threadBlock  |
	
	finishSync := Semaphore forMutualExclusion.
	threadBlock := Semaphore new.
	(threadCount max: 1) timesRepeat: [ threadBlock signal ].

	self do: [:each |
				threadBlock wait.
				[ 	aBlock value: each.
					finishSync signal.
					threadBlock signal] fork].
		"consume all signals"
	self size timesRepeat: [ finishSync wait ].
	^ self