monkey := CIMonkey withTranscriptPublisher.
monkey perform: [ 
	monkey 
		user: 'pavel.krivanek@gmail.com' 
		password: 'Lander.1999'
		issue: '19466'.

	monkey lockIssue.

]