private
changeClassFor: aTrackerCase
	^ self allSubclasses 
		detect: [ :each | each isSuitableFor: aTrackerCase ]