subtasks
withAllSubstasksDo: aBlock

	aBlock value: self.
	self subtasks do: [ :each |
		each withAllSubstasksDo: aBlock ]