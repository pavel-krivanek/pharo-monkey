handling - content
endElement: aQualifiedName prefix: aPrefix uri: aURI
	self messageRecorder
		recordMessageReceiver: self
		selector: #endElement:prefix:uri:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				addLast: aPrefix;
				addLast: aURI;
				yourself)