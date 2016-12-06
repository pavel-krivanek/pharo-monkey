private - pipeline creation
threeInternalProxies

	^ ProxyPipeline fromString: 'help | copyToOutput | copyToOutput' shell: CommandShell new