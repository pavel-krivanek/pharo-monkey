initialize - release
closeErrorPipeline

	self errorPipelineStream ifNotNil: [[errorPipelineStream close]
		on: Error
		do: ["may be called from multiple processes, so tolerate primitive failure"]]
