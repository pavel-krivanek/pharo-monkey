activation
activate

	self process exportUsing: CIBashExporter new.
	self exitSuccess.