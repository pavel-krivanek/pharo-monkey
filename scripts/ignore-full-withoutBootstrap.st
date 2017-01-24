'From Pharo6.0 of 13 May 2016 [Latest update: #60317] on 20 December 2016 at 2:47:55.680179 pm'!

!CIXMLTestResultValidator methodsFor: 'instance creation' stamp: 'PavelKrivanek 12/19/2016 16:17'!
wantsToIgnoreError: aCIXMLTestResultException

	^ {
		#MBConfigurationInfoTest -> #testInitialization.
		#ZnFileUrlTests -> #testRetrieveContents.
		#ZnFileUrlTests -> #testWindowsDriveNamesInFileUrl.
	} includes: (aCIXMLTestResultException testcase  ->  aCIXMLTestResultException selector)
! !

'From Pharo6.0 of 13 May 2016 [Latest update: #60317] on 20 December 2016 at 2:47:58.493076 pm'!

!CIXMLTestResultValidator methodsFor: 'instance creation' stamp: 'PavelKrivanek 12/19/2016 16:17'!
wantsToIgnoreFailure: aCIXMLTestResultException

	
	^ {
		#ReleaseTest -> #testAllClassPoolBindingAreClassVariables.
		#ReleaseTest -> #testThatAllMethodsArePackaged.
		#ReleaseTest -> #testUnpackagedClasses.
		#ReleaseTest -> #testUndeclared. 
		#MCStWriterTest -> #testMethodDefinitionWithBangs.
		#CompiledMethodTest -> #testMethodsOfTheClassShouldNotBeRepeatedInItsSuperclasses.
		#SourceFileArrayTest -> #testProtocol.
		#SourceFileArrayTest -> #testTimeStamp.
	} includes: (aCIXMLTestResultException testcase  ->  aCIXMLTestResultException selector)
! !
