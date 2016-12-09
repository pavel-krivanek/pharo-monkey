instance creation
methodReferenceFrom: anElement type: aType

	| classNameAtrribute className selector |
	classNameAtrribute := anElement attributeAt: #classname ifAbsent: [
		self error: 'a testcase element without a class name'].
	className := self classNameFrom: classNameAtrribute.
	selector := anElement attributeAt: #name ifAbsent: [
		self error: 'a testcase element without a name'].
	
	^ CIXMLTestResultException new 
		testcase: className;
		selector: selector;
		stack: anElement contentString lines;
		type: aType;
		yourself.
		
