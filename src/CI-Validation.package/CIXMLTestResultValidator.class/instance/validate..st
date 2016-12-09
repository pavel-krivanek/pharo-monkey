instance creation
validate: aReadStream

	| xml suiteErrors suiteFailures | 

	xml := XMLDOMParser parse: aReadStream.
	
	self assert: (xml root name = #testsuite).
	
	suiteErrors := (xml allElementsNamed: 'testcase') 
		select: [ :each | (each allElementsNamed: #error) notEmpty ] 
		thenCollect: [:anElement | self methodReferenceFrom: anElement type: #error].
		
	suiteErrors := suiteErrors reject: [ :each | self wantsToIgnoreError: each ].
		
	suiteFailures := (xml allElementsNamed: 'testcase') 
		select: [ :each | (each allElementsNamed: #failure) notEmpty ] 
		thenCollect: [:anElement | self methodReferenceFrom: anElement type: #failure ].
		
	suiteFailures := suiteFailures reject: [ :each | self wantsToIgnoreFailure: each ].

	errors addAll: suiteErrors.
	failures addAll: suiteFailures.
				
	
	