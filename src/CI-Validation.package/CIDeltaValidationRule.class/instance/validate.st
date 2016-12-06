protocol
validate
	| result |
	self assertHasChange.
	"Validate this rule in a separate image"
	result := (self validator processRule: self).
	^ self addValidationResult: result
	