version testing
isMorphic
	"Squeak traditionally used #isMorphic to distinguish between Morphic
	and MVC user interfaces. In newer Squeak images, the current project
	knows its active user interface, so requests are vectored through the
	current project. Pharo images pretend to be unaware of the fact that
	they are running Morphic, refusing to respond to #isMorphic. This 
	implementation does reasonable things in any of the above scenarios."

	^(Smalltalk respondsTo: #isMorphic) not or: [Smalltalk isMorphic]