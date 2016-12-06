accessing
errorStream
	"Answer the value of errorStream"

	^ errorStream ifNil: [errorStream := WriteStream on: String new]