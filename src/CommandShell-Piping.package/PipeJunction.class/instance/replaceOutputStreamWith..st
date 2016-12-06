command pipelines
replaceOutputStreamWith: anotherStream
	"Sender is not happy with the kind of output stream we are using. Replace
	pipeFromOutput with anotherStream, and copy the current contents of pipeFromOutput
	to the new stream."

	| oldOutputStream |
	oldOutputStream := self pipeFromOutput.
	oldOutputStream removeDependent: self. "Break old dependency"
	self pipeFromOutput: anotherStream. "Restores the dependency automatically"
	oldOutputStream ifNotNil:
		[anotherStream ifNotNil:
			[anotherStream nextPutAll: oldOutputStream contents].
		oldOutputStream close]
