instance creation
wantsToIgnoreFailure: aCIXMLTestResultException

	^ false.
	
	"^ {
		#RGTraitDefinitionTest->#testAddingMethods.
		#CompiledMethodTest->#testMethodsOfTheClassShouldNotBeRepeatedInItsSuperclasses. 
		#ReleaseTest->#testInstalledMethodsWithIncorrectTrailerKind. 
		#ReleaseTest->#testThatAllMethodsArePackaged. 
		#ReleaseTest->#testUndeclared. 
		#ReleaseTest->#testUnpackagedClasses. 
		#MCStWriterTest->#testMethodDefinitionWithBangs. 
		#STONWriterTests->#testDictionaryWithComplexKeys. 
		#FileHandleTest->#testTruncate. 
		#SourceFileArrayTest->#testProtocol. 
		#SourceFileArrayTest->#testTimeStamp. 	
	} includes: (aCIXMLTestResultException testcase -> aCIXMLTestResultException selector)
		"