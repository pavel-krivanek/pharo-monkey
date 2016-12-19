publishing
error: anError
	
	VTermOutputDriver stderr 
		color256: Color red; 
		<< anError asString; 
		flush; clear; lf.
