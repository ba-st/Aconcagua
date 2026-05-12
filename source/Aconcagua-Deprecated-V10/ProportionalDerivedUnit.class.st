Class {
	#name : 'ProportionalDerivedUnit',
	#superclass : 'Object',
	#instVars : [
		'nameForOne',
		'nameForMany',
		'sign',
		'baseUnit',
		'conversionFactor'
	],
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'testing' }
ProportionalDerivedUnit class >> isDeprecated [
  "Replaced by MultipleUnitOfMeasure"

  ^ true
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> baseUnit [

  ^ baseUnit
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> baseUnit: anObject [

  baseUnit := anObject
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> conversionFactor [

  ^ conversionFactor
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> conversionFactor: anObject [

  conversionFactor := anObject
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> nameForMany [

  ^ nameForMany
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> nameForMany: anObject [

  nameForMany := anObject
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> nameForOne [

  ^ nameForOne
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> nameForOne: anObject [

  nameForOne := anObject
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> sign [

  ^ sign
]

{ #category : 'accessing' }
ProportionalDerivedUnit >> sign: anObject [

  sign := anObject
]
