'From Pharo6.0 of 13 May 2016 [Latest update: #60317] on 20 December 2016 at 2:47:55.680179 pm'!

!CIXMLTestResultValidator methodsFor: 'instance creation' stamp: 'PavelKrivanek 12/19/2016 16:17'!
wantsToIgnoreError: aCIXMLTestResultException

	^ false
! !

'From Pharo6.0 of 13 May 2016 [Latest update: #60317] on 20 December 2016 at 2:47:58.493076 pm'!

!CIXMLTestResultValidator methodsFor: 'instance creation' stamp: 'PavelKrivanek 12/19/2016 16:17'!
wantsToIgnoreFailure: aCIXMLTestResultException

	
	^ {
		#WeakAnnouncerTest->#testNoDeadWeakSubscriptions.
		#SystemAnnouncerLiveTest->#testNoDeadSubscriptions.
		
		#FileSystemHandleTest->#testTruncate.
		
		#ZnHTTPSTests->#testWikimedia.
		#ZnResponseTests->#testSlashdotGzipChunke.
		#ZnClientTests->#testGetGeoIP.
		#ZdcSecureSocketStreamTests->#testPlain.
		#ZnHTTPSTests->#testRequestResponse.
		#ZnHTTPSTests->#testTransfers.
		#ZnClientTests->#testGetSmallHTMLStreaming.
		#ZnEasyTests->#testHeadSmallHTMLDocument.
		#ZnResponseTests->#testSlashdotGzipChunked.
		#ZnHTTPSTests->#testGForceInria. 
		
		"#ZnHTTPSTests->#testTransfersSingleClient. "
	} includes: (aCIXMLTestResultException testcase -> aCIXMLTestResultException selector)
! !
