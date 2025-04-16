Class {
	#name : 'UnitNomenclature',
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
UnitNomenclature class >> singular: aSingularName plural: aPluralName symbol: aSymbol [

  ^ self new initializeSingular: aSingularName plural: aPluralName symbol: aSymbol
]

{ #category : 'initialization' }
UnitNomenclature >> initializeSingular: aSingularName plural: aPluralName symbol: aSymbol [

  singular := aSingularName.
  plural := aPluralName.
  symbol := aSymbol
]

{ #category : 'accessing' }
UnitNomenclature >> plural [

  ^ plural localized
]

{ #category : 'accessing' }
UnitNomenclature >> singular [

  ^ singular localized
]

{ #category : 'accessing' }
UnitNomenclature >> symbol [

  ^ symbol
]
