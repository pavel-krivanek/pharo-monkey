initialize-release
openLabel: aString 
	"Open a window on this stream. This is copied from the corresponding method in
	TranscriptStream."

	| topView controllerClass codeView |
	CommandShell isMorphic ifTrue: [^ (self openAsMorphLabel: aString) openInWorld].

	aString ifNotNil: [self labelStringBlock: [aString]].
	topView := (Smalltalk at: #StandardSystemView) new.
	controllerClass := Smalltalk
		at: #DeferredActionStandardSystemController
		ifAbsent: [(Smalltalk at: #StandardSystemController)].	
	topView model: self;
			controller: controllerClass new;
			borderWidth: 1;
			label: aString;
			minimumSize: 100 @ 50.
	codeView := (Smalltalk at: #ShellWindowView)
					on: self
					text: nil
					accept: nil
					readSelection: nil
					menu: #codePaneMenu:shifted:.
	codeView window: (0@0 extent: 200@200).
	topView addSubView: codeView.
	topView controller addDeferredUIMessage:
		[self changed: #relabel.
		self prompt].
	topView controller open.
