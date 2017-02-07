initialization
initialize

	super initialize.
	tasks := OrderedCollection new.
	steps := OrderedCollection new.
	
	output := #( '*' ).
	import := #()