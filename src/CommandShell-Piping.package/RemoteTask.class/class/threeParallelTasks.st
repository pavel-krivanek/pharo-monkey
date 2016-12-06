examples
threeParallelTasks
	"Find all primes in a range of large integers. Divide the problem into
	three tasks running the three child images, and return the results to
	the supervisory image. Answer a tasks array and a results array, where
	the results array will be populated on completion of the tasks."

	"RemoteTask threeParallelTasks"

	| p1 p2 p3 results task1 task2 task3 |
	results := Array new: 3.
	task1 := [(100000000000000000000000000000
					to: 100000000000000000000000019999)
				select: [:f | f isPrime] thenCollect: [:s | s asString]].
	task2 := [(100000000000000000000000020000
					to: 100000000000000000000000039999)
				select: [:f | f isPrime] thenCollect: [:s | s asString]].
	task3 := [(100000000000000000000000040000
					to: 100000000000000000000000059999)
				select: [:f | f isPrime] thenCollect: [:s | s asString]].
	"n.b. Assign task to a variable to prevent RemoteTask from being finalized"
	p1 := RemoteTask do: task1 whenComplete: [:result | results at: 1 put: result].
	p2 := RemoteTask do: task2 whenComplete: [:result | results at: 2 put: result].
	p3 := RemoteTask do: task3 whenComplete: [:result | results at: 3 put: result].
	^ { #tasks -> { p1 . p2 . p3 } . #results -> results }