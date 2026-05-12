Class {
	#name : 'Measure',
	#superclass : 'Object',
	#instVars : [
		'amount',
		'unit'
	],
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'instance creation' }
Measure class >> amount: aNumber unit: aUnit [

  self
    deprecated: 'Quantities are now easily created by multiplying a number and a unit'
    transformWith: 'Measure amount: `@number unit: `@unit' -> '`@number * `@unit'.
  ^ aNumber * aUnit
]

{ #category : 'testing' }
Measure class >> isDeprecated [
  "The equivalent class in the new version is Quantity"

  ^ true
]

{ #category : 'accessing' }
Measure >> amount [

  ^ amount
]

{ #category : 'accessing' }
Measure >> amount: anObject [

  amount := anObject
]

{ #category : 'accessing' }
Measure >> unit [

  ^ unit
]

{ #category : 'accessing' }
Measure >> unit: anObject [

  unit := anObject
]
