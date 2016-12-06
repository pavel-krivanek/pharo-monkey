initialize-release
openAsMorphLabel: aLabelString

	| window textMorph |
	textMorph := PluggableTextMorph
		on: self
		text: #contents
		accept: #put:
		readSelection: #contentsSelection menu: #fileContentsMenu:shifted:.
	textMorph font: self defaultFont.
	window := (SystemWindow labelled: aLabelString) model: self.
	window
		addMorph: textMorph
		frame: (0@0 corner: 1@1).
	^ window