testing
isHangingOnMonkeyCheck
	
	^self status = 'Resolved (Monkey is checking)' and: [ 
		DateAndTime now - self lastModification > 2 hours]