instance creation
openOn: aString withLabel: aLabelString inDirectory: aDirectory defaultFileName: nameString lineEndConvention: convention

	"CrLfFileEditor openOn: 'this is the string to edit' withLabel: 'this is the window label' inDirectory: FileDirectory default defaultFileName: 'buffer.txt' lineEndConvention: #lf"

	| model |
	model := self new contents: aString.
	model directory: aDirectory.
	model fileName: nameString.
	model lineEndConvention: convention.
	^ model openLabel: aLabelString
