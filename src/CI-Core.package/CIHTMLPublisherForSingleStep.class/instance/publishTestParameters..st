publishing
publishTestParameters: aValidationResult
	self additionalParameters 
		at: 'Jenkins Job' 
		put: (String streamContents: [ :s |
				s 
					<< '<a href="'; << self buildURL; <<'">';
					<< '<span class="label label-primary">'; 
					<< self buildTag; 
					<< '</span></a>']).
	^ super publishTestParameters: aValidationResult