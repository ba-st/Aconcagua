"
An AccountDimension represents the fundamental, nominal property of a distinct entity that is being tracked, enumerated,
or balanced within a system (such as currencies, stocks, bonds, or physical inventory like apples).
"
Class {
	#name : 'AccountDimension',
	#superclass : 'BaseDimension',
	#instVars : [
		'reference',
		'symbol'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
AccountDimension class >> on: aReference symbol: dimensionSymbol [

  ^ self new initializeOn: aReference symbol: dimensionSymbol
]

{ #category : 'comparing' }
AccountDimension >> = anObject [

  ^ self equalityChecker
      compare: #reference;
      checkAgainst: anObject
]

{ #category : 'comparing' }
AccountDimension >> hash [

  ^ reference hash
]

{ #category : 'initialization' }
AccountDimension >> initializeOn: aReference symbol: dimensionSymbol [

  reference := aReference.
  symbol := dimensionSymbol
]

{ #category : 'printing' }
AccountDimension >> printOn: stream [

  stream nextPutAll: symbol
]

{ #category : 'accessing' }
AccountDimension >> reference [

  ^ reference
]

{ #category : 'accessing' }
AccountDimension >> symbol [

  ^ symbol
]
