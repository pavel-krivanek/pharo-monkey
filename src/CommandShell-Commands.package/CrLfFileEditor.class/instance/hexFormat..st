private
hexFormat: aString

	"CrLfFileEditor new hexFormat: 'this is a test of the HEX string reformat method'"

	| s |
	s := WriteStream on: (String new: aString size*4).
	0 to: aString size-1 by: 16 do:
		[:loc | s nextPutAll: loc hex; space;
			nextPut: $(; print: loc; nextPut: $); space; tab.
		loc+1 to: (loc+16 min: aString size) do: [:i | s nextPutAll: (aString at: i) hex; space].
		s cr].
	^ s contents.
