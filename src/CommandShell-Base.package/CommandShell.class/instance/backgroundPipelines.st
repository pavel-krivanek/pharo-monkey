accessing
backgroundPipelines
	"The pipelines which are currently being evaluated in background. This
	collection is used to keep track of the background command lines by giving
	each background pipeline an index number corresponding to its position in
	this collection. New pipelines are inserted at the first available nil position
	in the collection, and the collection is expanded as needed."

	^ backgroundPipelines ifNil: [backgroundPipelines := OrderedCollection new]

