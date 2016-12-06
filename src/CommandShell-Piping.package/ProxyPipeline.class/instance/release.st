initialize - release
release

	self do: [:proxy | proxy release].
	^ super release