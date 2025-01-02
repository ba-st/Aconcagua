Class {
	#name : 'BaseUnit',
	#superclass : 'Object',
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'testing' }
BaseUnit class >> isDeprecated [
  "Use UnitOfAccount or BaseUnitOfMeasure"

  ^ true
]
