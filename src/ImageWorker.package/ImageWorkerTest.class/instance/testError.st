tests
testError
	self 
		should: [ self do: [ 1/0 ]]
		raise: ZeroDivide