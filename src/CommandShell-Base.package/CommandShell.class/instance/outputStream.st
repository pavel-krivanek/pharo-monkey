accessing
outputStream
	"Answer the value of outputStream"

	^ outputStream ifNil: [outputStream := WriteStream on: String new]