exporting
export
	
	self stop.
	self shellFiles do: [ :each | each export ]