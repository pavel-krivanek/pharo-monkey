as yet unclassified
pharoEval: anExpression save: aBoolean

	| eval |
	eval := CIPharoStep eval: anExpression.
	aBoolean ifTrue: [ eval doSave ].
	self addStep: eval.