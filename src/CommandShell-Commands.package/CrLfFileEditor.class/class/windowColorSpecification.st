window color
windowColorSpecification
	"Answer a WindowColorSpec object that declares my preference"

	| windowColorSpec |
	windowColorSpec := Smalltalk
				at: #WindowColorSpec
				ifAbsent: [^self error: 'this image does not support WindowColorSpec'].
	^ windowColorSpec
		classSymbol: self name
		wording: 'Squeak Shell File Editor'
		brightColor: Color lightOrange
		pastelColor: Color lightOrange paler paler
		helpMessage: 'CrLfFileEditor window for CommandShell ''edit'' comand'
