Extension { #name : 'Integer' }

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
Integer >> = aNumber [

	"Returns true if the receiver is equal to aNumber; returns false otherwise."

	<primitive: 24>
	aNumber _isFloat ifTrue: [ ^ self asFloat = aNumber ].
	aNumber _isNumber ifTrue: [ ^ self _retry: #= coercing: aNumber ].
	aNumber isNumber ifTrue: [ ^ self _retry: #= coercing: aNumber ].
	^ false
]

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
Integer >> ~= aNumber [

	"Returns true if the receiver is not equal to aNumber; returns false
	 otherwise."

	<primitive: 25>
	aNumber _isFloat ifTrue: [ ^ self asFloat ~= aNumber ].
	aNumber _isNumber ifTrue: [ ^ self _retry: #~= coercing: aNumber ].
	aNumber isNumber ifTrue: [ ^ self _retry: #~= coercing: aNumber ].
	^ true
]
