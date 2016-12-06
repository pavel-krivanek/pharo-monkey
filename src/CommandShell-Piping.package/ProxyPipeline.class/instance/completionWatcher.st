accessing
completionWatcher
	"A process that waits for notification that the last proxy has completed,
	and performs any necessary cleanup. Completion notification is often
	triggered by the grimReaperProcess, so the separate pipeline cleanup
	prevents those activities from being processed in the context of the
	grimReaperProcess."

	^ completionWatcher