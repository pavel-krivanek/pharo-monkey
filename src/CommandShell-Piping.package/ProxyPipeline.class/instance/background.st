accessing
background
	"Answer true if this pipeline should be evaluated in the background."

	^ background ifNil: [background := false]