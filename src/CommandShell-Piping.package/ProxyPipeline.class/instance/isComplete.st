testing
isComplete
	"True if all proxies are complete. The proxies may report their completion events
	out of sequence, so test all the proxies (not just the last one in the pipeline)."

	^ self noneSatisfy: [:proxy | proxy isComplete not]
