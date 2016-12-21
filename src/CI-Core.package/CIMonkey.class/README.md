monkey := CIMonkey withTranscriptPublisher.
monkey perform: [ 
	monkey 
		user: 'some@email.cz' 
		password: 'some password'
		issue: '19466'.

	monkey lockIssue.
]