publishing
updateIssueWith: result

	| buildURL fileName  |

	buildURL := (Smalltalk os environment at: 'BUILD_URL' ifAbsent: ['']).

	fileName := (self publisher respondsTo: #fileName) 
		ifTrue: [ self publisher ]
		ifFalse: [ 'report.html' ].

	self monkey publishSuccess: result isSuccess buildURL: buildURL reportFile: fileName.