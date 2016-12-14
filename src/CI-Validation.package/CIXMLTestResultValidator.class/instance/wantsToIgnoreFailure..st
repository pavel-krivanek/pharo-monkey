instance creation
wantsToIgnoreFailure: anAssociation

	"anAssociation contains class name as key and a selector as value"
	
	^ {
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
	} includes: anAssociation
		