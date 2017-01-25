high-level
exit: anErrorCode

	self writeCommand: 'exit {1}' format: { anErrorCode }