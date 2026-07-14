Extension { #name : 'SmallInteger' }

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
SmallInteger >> = aNumber [

	"Returns true if the receiver is equal to
	 aNumber; returns false otherwise.

	 Should not be reimplemented.  The native code generator generates
	 in-line implementations of SmallInteger>>= . Reimplementations
	 with different semantics than primitive 7 will not take effect
	 unless native code is disabled."

	<primitive: 7>
	aNumber _isNumber ifTrue: [
		aNumber _isFloat ifTrue: [ ^ self asFloat = aNumber ].
		aNumber _isInteger ifTrue: [ ^ super = aNumber ].
		^ self _retry: #= coercing: aNumber
	].
	aNumber isNumber ifTrue: [ ^ self _retry: #= coercing: aNumber ].
	^ false
]

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
SmallInteger >> ~= aNumber [

	"Returns true if the receiver is not equal to aNumber;
	 returns false otherwise.

	 Should not be reimplemented.  The native code generator generates
	 in-line implementations of SmallInteger>>~= . Reimplementations
	 with different semantics than primitive 8 will not take effect
	 unless native code is disabled."

	<primitive: 8>
	aNumber _isNumber ifTrue: [
		aNumber _isFloat ifTrue: [ ^ self asFloat ~= aNumber ].
		aNumber _isInteger ifTrue: [ ^ super ~= aNumber ].
		^ self _retry: #~= coercing: aNumber
	].
	aNumber isNumber ifTrue: [ ^ self _retry: #~= coercing: aNumber ].
	^ true
]
