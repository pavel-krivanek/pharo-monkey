globbing
glob: aString names: fileNameArray
	"Apply Unix shell globbing rules to aString with respect to the elements of fileNameArray,
	and answer an array of matching file names. The fileNameArray is expected to have been
	provided by a FileDirectory query."

	| tokens |
	tokens := self globTokensFrom: aString.
	^ fileNameArray
		select: [:n |
			self tokenStream: (ReadStream on: tokens)
				matches: (ReadStream on: n)]

