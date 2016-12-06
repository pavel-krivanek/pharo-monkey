private
listConfigurations
	| finalList |
	finalList := OrderedCollection new.
	self packageNames do:[:each | 
		finalList addIfNotPresent: (((each substrings: '-') at:1) ).
	].
	^ finalList.