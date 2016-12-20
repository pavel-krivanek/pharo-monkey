instance creation
wantsToIgnoreError: aCIXMLTestResultException

	^ false
	"^ {
		#FileLocatorTest->#testMoveTo. 
		#FFICallbackTests->#testCqsort. 
		#FFICallbackTests->#testCqsortWithByteArray.
		#FFICallbackTests->#testEnumerationReturnValue.
		#FFICalloutAPITests->#testDoubleCall. 
		#FFICalloutAPITests->#testFloatCall. 
		#ZnFileUrlTests->#testRetrieveContents. 
		#ZnFileUrlTests->#testWindowsDriveNamesInFileUrl. 
		#MBConfigurationInfoTest->#testInitialization. 
	} includes: (aCIXMLTestResultException testcase -> aCIXMLTestResultException selector)
"