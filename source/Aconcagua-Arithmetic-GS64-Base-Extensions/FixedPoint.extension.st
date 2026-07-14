Extension { #name : 'FixedPoint' }

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
FixedPoint >> = aFixedPoint [

	self == aFixedPoint ifTrue: [ ^ true ].
	aFixedPoint _isNumber ifFalse: [ ^ false ].
	aFixedPoint isNumber ifFalse: [ ^ false ].
	(aFixedPoint class == FixedPoint) ifTrue: [
		(aFixedPoint numerator = 0)
			ifTrue: [ ^ numerator = 0 ]
			ifFalse: [ ^ aFixedPoint numerator = numerator
				and: [ aFixedPoint denominator = denominator ] ]
	].
	^ self _retry: #= coercing: aFixedPoint
]
