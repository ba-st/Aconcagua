Class {
	#name : 'UnitNames',
	#superclass : 'Object',
	#instVars : [
		'singular',
		'plural',
		'symbol'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
UnitNames class >> singular: aSingularName plural: aPluralName symbol: aSymbol [

  ^ self new initializeSingular: aSingularName plural: aPluralName symbol: aSymbol
]

{ #category : 'initialization' }
UnitNames >> initializeSingular: aSingularName plural: aPluralName symbol: aSymbol [

  singular := aSingularName.
  plural := aPluralName.
  symbol := aSymbol
]

{ #category : 'accessing' }
UnitNames >> plural [

  ^ plural localized
]

{ #category : 'accessing' }
UnitNames >> singular [

  ^ singular localized
]

{ #category : 'accessing' }
UnitNames >> symbol [

  ^ symbol
]
