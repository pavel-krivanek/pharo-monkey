examples
parallelPerformance
	"Compare performance of three tasks run in parallel versus the equivalent serial
	processing. Results will vary depending on availability of CPU cores. On a quad core
	machine, the parallel processing should complete in well under half the time of the
	equivalent serial job."

	"RemoteTask parallelPerformance"

	| parallelExecutionTime results sema task1 task2 task3 serialExecutionTime p1 p2 p3 |
	parallelExecutionTime := Time millisecondsToRun: [
		results := Array new: 3.
		sema := Semaphore new.
		task1 := [(100000000000000000000000000000 to: 100000000000000000000000019999)
					select: [:f | f isPrime] thenCollect: [:s | s asString]].
		task2 := [(100000000000000000000000020000 to: 100000000000000000000000039999)
					select: [:f | f isPrime] thenCollect: [:s | s asString]].
		task3 := [(100000000000000000000000040000 to: 100000000000000000000000059999)
					select: [:f | f isPrime] thenCollect: [:s | s asString]].
		"n.b. assign to variables to prevent RemoteTask from being finalized"
		p1 := RemoteTask do: task1 whenComplete: [:result |  results at: 1 put: result. sema signal].
		p2 := RemoteTask do: task2 whenComplete: [:result | results at: 2 put: result. sema signal].
		p3 := RemoteTask do: task3 whenComplete: [:result |  results at: 3 put: result. sema signal].
		sema wait; wait; wait.
		results].

	serialExecutionTime :=  Time millisecondsToRun: [
		(100000000000000000000000000000 to: 100000000000000000000000019999)
					select: [:f | f isPrime] thenCollect: [:s | s asString].
		(100000000000000000000000020000 to: 100000000000000000000000039999)
					select: [:f | f isPrime] thenCollect: [:s | s asString].
		(100000000000000000000000040000 to: 100000000000000000000000059999)
					select: [:f | f isPrime] thenCollect: [:s | s asString]].

	^ { #parallelExecutionTime -> parallelExecutionTime . #serialExecutionTime -> serialExecutionTime }
