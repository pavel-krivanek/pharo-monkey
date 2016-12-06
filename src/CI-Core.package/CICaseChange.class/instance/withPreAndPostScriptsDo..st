applying
withPreAndPostScriptsDo: aBlock
	"Do preload if any"
	self case hasPreload 
		ifTrue: [ 
			self stdout yellow: 'Processing PRELOAD'; cr.
			Smalltalk compiler evaluate: self case preload ].
	"Process load"
	aBlock value.
	"Do postload if any"
	self case hasPostload 
		ifTrue: [ 
			self stdout yellow: 'Processing POSTLOAD'; cr.
			Smalltalk compiler evaluate: self case postload ].	