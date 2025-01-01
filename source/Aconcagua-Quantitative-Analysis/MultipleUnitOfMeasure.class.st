"
Multiple and submultiple units of measurement are used to express quantities that are larger
or smaller than the base unit in a more convenient or practical way. These units are derived
by applying a factor to the base unit, enabling easier representation of both very large and
very small quantities.

Multiple units are larger than the base unit and submultiple units are smaller than the base unit.
"
Class {
	#name : 'MultipleUnitOfMeasure',
	#superclass : 'UnitOfMeasure',
	#instVars : [
		'baseUnit',
		'factor',
		'names'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
MultipleUnitOfMeasure class >> basedOn: baseUnit prefixedBy: namePrefix symbolPrefixedBy: symbolPrefix factor: factor [

  ^ self
      basedOn: baseUnit
      singularNamed: namePrefix , baseUnit singularName
      pluralNamed: namePrefix , baseUnit pluralName
      symbol: symbolPrefix , baseUnit symbol
      factor: factor
]

{ #category : 'instance creation' }
MultipleUnitOfMeasure class >> basedOn: baseUnit prefixedBy: namePrefix symbolPrefixedBy: symbolPrefix raisedTo: exponent [

  ^ self
      basedOn: baseUnit
      prefixedBy: namePrefix
      symbolPrefixedBy: symbolPrefix
      factor: ( 10 raisedTo: exponent )
]

{ #category : 'instance creation' }
MultipleUnitOfMeasure class >> basedOn: baseUnit singularNamed: singularName pluralNamed: pluralName symbol: symbol factor: factor [

  ^ self new
      initializeBasedOn: baseUnit
      named: ( UnitNames singular: singularName plural: pluralName symbol: symbol )
      factor: factor
]

{ #category : 'instance creation' }
MultipleUnitOfMeasure class >> basedOn: baseUnit singularNamed: singularName pluralNamed: pluralName symbol: symbol raisedTo: exponent [

  ^ self
      basedOn: baseUnit
      singularNamed: singularName
      pluralNamed: pluralName
      symbol: symbol
      factor: ( 10 raisedTo: exponent )
]

{ #category : 'converting' }
MultipleUnitOfMeasure >> asCanonicalUnit [

  ^ baseUnit asCanonicalUnit
]

{ #category : 'accessing' }
MultipleUnitOfMeasure >> dimension [

  ^ baseUnit dimension
]

{ #category : 'comparing' }
MultipleUnitOfMeasure >> hash [

  ^ baseUnit hash
]

{ #category : 'initialization' }
MultipleUnitOfMeasure >> initializeBasedOn: theBaseUnit named: theUnitNames factor: theFactor [

  baseUnit := theBaseUnit.
  names := theUnitNames.
  factor := theFactor
]

{ #category : 'accessing' }
MultipleUnitOfMeasure >> pluralName [

  ^ names plural
]

{ #category : 'accessing' }
MultipleUnitOfMeasure >> singularName [

  ^ names singular
]

{ #category : 'accessing' }
MultipleUnitOfMeasure >> symbol [

  ^ names symbol
]

{ #category : 'evaluating' }
MultipleUnitOfMeasure >> valueFromCanonicalUnit: number [

  ^ ( baseUnit valueFromCanonicalUnit: number ) / factor
]

{ #category : 'evaluating' }
MultipleUnitOfMeasure >> valueInCanonicalUnit: number [

  ^ (baseUnit valueInCanonicalUnit: number) * factor
]
