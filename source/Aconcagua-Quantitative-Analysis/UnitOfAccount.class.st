"
A unit of account is a standard numerical unit of measurement that provides a consistent
measure of value for goods, services, and assets. It is one of the three primary functions
of money, alongside being a medium of exchange and a store of value.
"
Class {
	#name : 'UnitOfAccount',
	#superclass : 'Unit',
	#instVars : [
		'symbol',
		'dimension',
		'reference'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
UnitOfAccount class >> on: aReference symbol: unitSymbol [

  ^ self new initializeOn: aReference symbol: unitSymbol
]

{ #category : 'comparing' }
UnitOfAccount >> = object [

  ^ self equalityChecker
      compare: #reference;
      checkAgainst: object
]

{ #category : 'converting' }
UnitOfAccount >> asCanonicalUnit [

  ^ self
]

{ #category : 'accessing' }
UnitOfAccount >> dimension [

  ^ dimension
]

{ #category : 'comparing' }
UnitOfAccount >> hash [

  ^ reference hash
]

{ #category : 'initialization' }
UnitOfAccount >> initializeOn: aReference symbol: aSymbol [

  reference := aReference.
  symbol := aSymbol.
  dimension := BaseDimension named: reference printString symbol: symbol
]

{ #category : 'testing' }
UnitOfAccount >> isCommensurableWith: unit [

  ^ self = unit
]

{ #category : 'testing' }
UnitOfAccount >> isDimensionless [

  ^ false
]

{ #category : 'accessing' }
UnitOfAccount >> reference [

  ^ reference
]

{ #category : 'accessing' }
UnitOfAccount >> symbol [

  ^ symbol
]

{ #category : 'evaluating' }
UnitOfAccount >> valueFromCanonicalUnit: number [

  ^ number
]

{ #category : 'evaluating' }
UnitOfAccount >> valueInCanonicalUnit: number [

  ^ number
]
