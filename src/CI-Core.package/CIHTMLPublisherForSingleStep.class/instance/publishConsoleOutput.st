publishing
publishConsoleOutput
	
	self stream 
		<< '<h4>Console Output</h4>';
		<< '<div class="well">'; lf;
		<< '<iframe src="'; << self buildURL; << '/consoleText" style="width:100%; min-height:300px; border:none;"></iframe>'; lf;
		<< '</div>'.