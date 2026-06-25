Extension { #name : 'DiscreteInterval' }

{ #category : '*Aconcagua-Arithmetic-GS64-Extensions' }
DiscreteInterval >> includes: anObject [
	"Answer whether anObject is one of the receiver's elements."

	^ (self indexOf: anObject) ~= 0
]

{ #category : '*Aconcagua-Arithmetic-GS64-Extensions' }
DiscreteInterval >> indexOf: anObject startingAt: startingIndex [

  ^ self indexOf: anObject startingAt: startingIndex ifAbsent: [ 0 ]
]
