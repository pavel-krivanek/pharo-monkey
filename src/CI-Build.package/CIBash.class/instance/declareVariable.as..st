writing
declareVariable: variableName as: value
	
	self addStatement: ('{1}={2}' format: {variableName. value})