Class {
	#name : 'BaseUnit',
	#superclass : 'Object',
	#instVars : [
		'nameForOne',
		'nameForMany',
		'sign'
	],
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'testing' }
BaseUnit class >> isDeprecated [
  "Use UnitOfAccount or BaseUnitOfMeasure"

  ^ true
]

{ #category : 'accessing' }
BaseUnit >> nameForMany [

  ^ nameForMany
]

{ #category : 'accessing' }
BaseUnit >> nameForMany: anObject [

  nameForMany := anObject
]

{ #category : 'accessing' }
BaseUnit >> nameForOne [

  ^ nameForOne
]

{ #category : 'accessing' }
BaseUnit >> nameForOne: anObject [

  nameForOne := anObject
]

{ #category : 'accessing' }
BaseUnit >> sign [

  ^ sign
]

{ #category : 'accessing' }
BaseUnit >> sign: anObject [

  sign := anObject
]
