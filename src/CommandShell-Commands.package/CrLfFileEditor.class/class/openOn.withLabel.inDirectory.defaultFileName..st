instance creation
openOn: aString withLabel: aLabelString inDirectory: aDirectory defaultFileName: nameString

	"CrLfFileEditor openOn: 'this is the string to edit' withLabel: 'this is the window label' inDirectory: FileDirectory default defaultFileName: 'buffer.txt'"

	^ self openOn: aString withLabel: aLabelString inDirectory: aDirectory defaultFileName: nameString lineEndConvention: self defaultLineEndConvention
