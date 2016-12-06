evaluating
do: aBlock
	"Start a remote task and read the result object. The image will be blocked
	on read until completion of the remote task."

	"RemoteTask do: [2 + 2]"

	^(self new task: aBlock) value