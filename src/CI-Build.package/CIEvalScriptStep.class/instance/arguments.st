accessing
arguments

	| localArguments |
	localArguments := OrderedCollection new.
	localArguments add: 'eval'.
	shouldSave ifTrue: [ localArguments add: '--save' ].
	localArguments add: expression.
	^ super arguments , localArguments.