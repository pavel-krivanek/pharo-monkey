evaluating
do: taskBlock whenComplete: aOneArgumentBlock
	"Evaluate taskBlock in an image running in a separate OS process.
	Set the completion block, a block that takes result object as its single argument.
	Start remote processing with an AIO event notifier. Completion of the remote task
	will result in a changed notification from the event notifier, which will activate the
	completion block. The completion block is expected to do something useful with
	the result of the remote task."

	"n.b. Inspect the RemoteTask to prevent it being garbage collected and finalized
	before processing is complete"

	"(RemoteTask do: [2 + 2] whenComplete: [ :result | result inspect ]) inspect"
	"(RemoteTask do: [(Delay forSeconds: 3) wait. 2 + 2] whenComplete: [ :result | result inspect ]) inspect"

	^ self new task: taskBlock whenComplete: aOneArgumentBlock