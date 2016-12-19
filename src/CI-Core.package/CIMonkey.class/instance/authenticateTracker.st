authentification
authenticateTracker

	| tracker |

	self user 
		ifNil: [ ^ self publisher error: 'no valid user provided for authentification' ].
	self password 
		ifNil: [ ^ self publisher error: 'no valid password provided for authentification' ].

	tracker := self manager 
		logOnWithEmail: self user
		password: self password.

	self manager isAuthenticated
		ifTrue: [ self publisher progressMessage: 'issue tracker authentification succeded' ]
		ifFalse: [ self publisher error: 'issue tracker authentification failed' ].

	
	^ tracker