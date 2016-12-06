accessing
nonBlockingMode

	^ nonBlockingMode ifNil: [nonBlockingMode := false]
