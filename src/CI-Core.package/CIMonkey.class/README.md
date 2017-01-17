monkey := CIMonkey withTranscriptPublisher.
monkey execute: [ 
	monkey 
		user: 'some@email.cz' 
		password: 'some password'
		issue: '19466'.

	monkey lockIssue.
]