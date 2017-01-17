'From Pharo6.0 of 13 May 2016 [Latest update: #60317] on 20 December 2016 at 2:47:55.680179 pm'!

!CIXMLTestResultValidator methodsFor: 'instance creation' stamp: 'PavelKrivanek 12/19/2016 16:17'!
wantsToIgnoreError: aCIXMLTestResultException

	^ {
		#DADependencyCheckerTest -> #testShouldGetDirectDependencies.
		#DADependencyCheckerTest -> #testShouldGetUnresolvedDependencies.
		#DAMessageSendAnalyzerTest -> #testShouldFindDependencyWhenUnimplementedCalls.
		#DAMessageSendAnalyzerTest -> #testShouldGetPotentialMatchForUnimplementedCalls.
		#UpdateStreamerTest -> #testDefaultPath.
		#SmalllintManifestCheckerTest -> #testCriticsOf.
		#SmalllintManifestCheckerTest -> #testIsFalsePositive.
		#SmalllintManifestCheckerTest -> #testIsToDo.
		#SmalllintManifestCheckerTest -> #testToDoOf.
		#ScriptLoaderTest -> #testAllCurrentPackagesContainScriptLoader.
		#ScriptLoaderTest -> #testAllCurrentVersionsContainsScriptLoader.
		#ScriptLoaderTest -> #testMarkPackageBeforeLoad.
		#MBConfigurationInfoTest -> #testInitialization.
		#ZnFileUrlTests -> #testRetrieveContents.
		#ZnFileUrlTests -> #testWindowsDriveNamesInFileUrl.
		#FileLocatorTest -> #testMoveTo.

		#ReleaseTest -> #testUndeclared. 
		#WeakAnnouncerTest -> #testNoDeadWeakSubscriptions.
		#SystemAnnouncerLiveTest -> #testNoDeadSubscriptions.
		
		"#ZnHTTPSTests -> #testTransfersSingleClient. "
	} includes: (aCIXMLTestResultException testcase  ->  aCIXMLTestResultException selector)
! !

'From Pharo6.0 of 13 May 2016 [Latest update: #60317] on 20 December 2016 at 2:47:58.493076 pm'!

!CIXMLTestResultValidator methodsFor: 'instance creation' stamp: 'PavelKrivanek 12/19/2016 16:17'!
wantsToIgnoreFailure: aCIXMLTestResultException

	
	^ {
		#ReleaseTest -> #testAllClassPoolBindingAreClassVariables.
		#ReleaseTest -> #testThatAllMethodsArePackaged.
		#ReleaseTest -> #testUnpackagedClasses.
		#MCStWriterTest -> #testMethodDefinitionWithBangs.
		#CompiledMethodTest -> #testMethodsOfTheClassShouldNotBeRepeatedInItsSuperclasses.
		#UDPSocketEchoTest -> #testEcho.
		#FileHandleTest -> #testTruncate.
		#SourceFileArrayTest -> #testProtocol.
		#SourceFileArrayTest -> #testTimeStamp.

		#ReleaseTest -> #testUndeclared. 
		#WeakAnnouncerTest -> #testNoDeadWeakSubscriptions.
		#SystemAnnouncerLiveTest -> #testNoDeadSubscriptions.
	} includes: (aCIXMLTestResultException testcase  ->  aCIXMLTestResultException selector)
! !
