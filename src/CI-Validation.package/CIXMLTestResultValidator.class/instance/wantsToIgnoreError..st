instance creation
wantsToIgnoreError: anAssociation

	"anAssociation contains class name as key and a selector as value"
	
	^ {
		#FileLocatorTest->#testMoveTo. 
		#FFICallbackTests->#testCqsort. 
		#FFICallbackTests->#testCqsortWithByteArray.
		#FFICallbackTests->#testEnumerationReturnValue.
		#FFICalloutAPITests->#testDoubleCall. 
		#FFICalloutAPITests->#testFloatCall. 
		#ZnFileUrlTests->#testRetrieveContents. 
		#ZnFileUrlTests->#testWindowsDriveNamesInFileUrl. 
		#MBConfigurationInfoTest->#testInitialization. 
	} includes: anAssociation
