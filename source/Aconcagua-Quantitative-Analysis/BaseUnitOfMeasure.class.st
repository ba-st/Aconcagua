"
A base unit is one of the fundamental units of measurement in a measurement system,
from which all other units are derived. Base units measure the most basic physical
quantities, and they serve as the foundation for expressing and comparing all other
measurements in the system.
"
Class {
	#name : 'BaseUnitOfMeasure',
	#superclass : 'UnitOfMeasure',
	#instVars : [
		'dimension',
		'names'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
BaseUnitOfMeasure class >> basedOn: dimension singularNamed: singularName pluralNamed: pluralName symbol: symbol [

  ^ self new
      initializeBasedOn: dimension
      named: ( UnitNames singular: singularName plural: pluralName symbol: symbol )
]

{ #category : 'converting' }
BaseUnitOfMeasure >> asCanonicalUnit [

  ^ self
]

{ #category : 'accessing' }
BaseUnitOfMeasure >> dimension [

  ^ dimension
]

{ #category : 'initialization' }
BaseUnitOfMeasure >> initializeBasedOn: aDimension named: theUnitNames [

  dimension := aDimension.
  names := theUnitNames
]

{ #category : 'accessing' }
BaseUnitOfMeasure >> pluralName [

  ^ names plural
]

{ #category : 'accessing' }
BaseUnitOfMeasure >> singularName [

  ^ names singular
]

{ #category : 'accessing' }
BaseUnitOfMeasure >> symbol [

  ^ names symbol
]

{ #category : 'evaluating' }
BaseUnitOfMeasure >> valueFromCanonicalUnit: number [

  ^ number
]

{ #category : 'evaluating' }
BaseUnitOfMeasure >> valueInCanonicalUnit: number [

  ^ number
]
