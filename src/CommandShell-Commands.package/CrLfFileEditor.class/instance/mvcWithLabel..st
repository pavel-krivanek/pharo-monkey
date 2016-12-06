initialize-release
mvcWithLabel: aLabelString
	| topView controllerClass fileContentsView |
	CommandShell isMorphic
		ifTrue: [ ^ self error: 'this method should be used only for MVC' ].
	topView := (Smalltalk at: #StandardSystemView) new.
	controllerClass := Smalltalk
		at: #DeferredActionStandardSystemController
		ifAbsent: [ Smalltalk at: #StandardSystemController ].
	topView
		model: self;
		controller: controllerClass new;
		label: aLabelString;
		minimumSize: 200 @ 200.
	topView borderWidth: 1.
	fileContentsView := (Smalltalk at: #PluggableTextView)
		on: self
		text: #contents
		accept: #put:
		readSelection: #contentsSelection
		menu: #fileContentsMenu:shifted:.
	fileContentsView window: (0 @ 0 extent: 200 @ 140).
	topView addSubView: fileContentsView.
	^ topView controller