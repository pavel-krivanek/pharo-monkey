command history
editCommand: aString

	^ UIManager default
		request: 'edit command'
		initialAnswer: aString