accessing
query
	"Returns a (temporary) order-preserving dictionary of percent and plus
	decoded query string key=value pairs"

	| query |

	query := self rawQuery copyEmpty.
	self queryKeysAndValuesDo: [:key :value |
		query
			at: key
			put: value].
	^ query.