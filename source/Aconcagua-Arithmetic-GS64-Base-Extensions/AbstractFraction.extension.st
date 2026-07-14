Extension { #name : 'AbstractFraction' }

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
AbstractFraction >> = aNumber [

	"Returns true if the receiver is equal to aNumber; returns false otherwise."

	(aNumber _isNumber or: [ aNumber isNumber ]) ifFalse: [ ^ false ].
	(aNumber isKindOf: AbstractFraction) ifTrue: [ | otherNum num |
		(otherNum := aNumber numerator) ifNil: [ ^ false ].
		(num := self numerator) ifNil: [ ^ false ].
		otherNum == 0 ifTrue: [
			^ num == 0
		].
		^ otherNum = num and: [ aNumber denominator = self denominator ]
	].
	^ self _retry: #= coercing: aNumber
]
