instance creation
on: aString withLabel: aLabelString inDirectory: aDirectory defaultFileName: nameString

	"(CrLfFileEditor on: 'this is the string to edit' withLabel: 'this is the window label' inDirectory: FileDirectory default defaultFileName: 'buffer.txt') openInWorld"

	^ self on: aString withLabel: aLabelString inDirectory: aDirectory defaultFileName: nameString lineEndConvention: self defaultLineEndConvention
