signalling
formatSignal: aString with: aFirstValue with: aSecondValue with: aThirdValue with: aFourthValue
	^ self
		formatSignal: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue
				with: aThirdValue
				with: aFourthValue)