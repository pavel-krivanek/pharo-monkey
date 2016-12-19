publishing
publishList: collection title: titleString 
	
	Transcript show: titleString;  cr.
	
	"Shortcut form if there is only one message"
	collection size = 1
		ifTrue: [ ^ Transcript space; << collection first asString; cr; flush ].
	
	Transcript cr.
	collection do: [ :aMessage |
		Transcript 
			<< '    - '; << aMessage asString; cr; flush ]