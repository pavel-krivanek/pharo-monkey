evaluating
value
	"Start a remote task and read the result object. The child Squeak sends one
	result object back to its parent Squeak before exiting."

	"(RemoteTask new task: [2 + 2]) value"

	self start.
	^self result
