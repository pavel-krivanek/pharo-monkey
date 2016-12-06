*CI-Integration
fullConfiguration
	self hasConfiguration ifFalse: [ ^ '' ].
	
	^ String streamContents: [ :stream |
		stream  
			<< self configurationName
			<< ' (' << self configurationVersionOrDefault << ')' ]