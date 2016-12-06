instance creation
block: aBlock

	"(self block: [#'This block answers a symbol as String']) value upToEnd"

	^ self basicNew block: aBlock
