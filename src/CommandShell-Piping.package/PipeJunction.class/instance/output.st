command pipelines
output
	"Wait for process completion, and answer all available output."

	"((PipeableOSProcess command: 'ps') | 'grep squeak' | 'cut -c16-100') output"

	^ (self isNotYetRunning not and: [self canProvideOutputPipe])
		ifTrue: [(self outputOn: (WriteStream on: String new)) contents]
		ifFalse: ['']
