Extension { #name : 'ScaledDecimal' }

{ #category : '*Aconcagua-Arithmetic-GS64-Base-Extensions' }
ScaledDecimal >> = aNumber [

	| osc om m |
	(aNumber _isNumber or: [ aNumber isNumber ]) ifFalse: [ ^ false ].
	(m := self mantissa) ifNil: [ ^ false "self is a NaN" ].
	self == aNumber ifTrue: [ ^ true ].
	aNumber _isScaledDecimal ifTrue: [
		osc := aNumber scale.
		om := aNumber mantissa.
		om ifNil: [ ^ false ]
	] ifFalse: [
		aNumber _isInteger ifTrue: [
			osc := 0.
			om := aNumber
		]
	].
	om ifNotNil: [ | sc |
		sc := self scale.
		sc == osc ifFalse: [
			sc > osc
				ifTrue: [ om := om * (10 raisedTo: sc - osc) ]
				ifFalse: [ m := m * (10 raisedTo: osc - sc) ]
		].
		^ m = om
	].
	^ self _retry: #= coercing: aNumber
]
