publishing
publishResultList: list title: aString 
	| filteredList |
	
	filteredList := list.
	
	list first class logCr.
	
	self stream 
		<< '<h3>'; << aString; << '</h3>';
		<< '<ul class="list-group">'; lf.
	
	self flag: 'add double dispatch'.
	filteredList := self 
		publishList: filteredList 
		kind: MCMergeResolutionRequest 
		do: [ :each | self publishMergeConflict: each ].
	filteredList := self 
		publishList: filteredList 
		kind: ChangeNotFound 
		do: [ :each | self publishChangeNotFound: each ].
	filteredList := self 
		publishList: filteredList
		kind: Error
		do: [ :each | self publishError: each ].
	filteredList := self 
		publishList: filteredList
		kind: CIXMLTestResultException
		do: [ :each | self publishError: each ].
	filteredList := self 
		publishList: filteredList
		kind: RBLintRule
		do: [ :each | self publishLintRule: each ].
	
	"For the left-over items we just print the strings in a list"
	filteredList do: [ :each | 
		self stream 
			<< '<li class="list-group-item">';
			<< '<h5 class="list-group-item-heading">';
			<< each asString; 
			<< '</h5>';
			<< '</li>'; lf ].
	
	self stream << '</ul>'; lf.