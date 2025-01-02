"
A unit is a standardized and abstract quantity used to measure or express a specific property,
whether physical, economic, or conceptual. It is a reference point that allows for the consistent
comparison, communication, and quantification of different phenomena, ranging from tangible physical
properties like length and mass to more abstract concepts like value or worth in economics.

In this broader sense, a unit is not only a concrete, measurable quantity but can also be a conceptual
or abstract reference point used to express relationships, values, or abstract measures within a given system.
"
Class {
	#name : 'Unit',
	#superclass : 'Object',
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'testing' }
Unit class >> isAbstract [

  <ignoreForCoverage>
  ^ self = Unit
]

{ #category : 'arithmetic' }
Unit >> * arithmeticObjectOrUnit [

  ^ arithmeticObjectOrUnit productWithUnit: self
]

{ #category : 'arithmetic' }
Unit >> / arithmeticObjectOrUnit [

  ^ arithmeticObjectOrUnit divisionFromUnit: self
]

{ #category : 'converting' }
Unit >> asCanonicalUnit [

  self subclassResponsibility
]

{ #category : 'accessing' }
Unit >> dimension [

  ^ self subclassResponsibility
]

{ #category : 'private' }
Unit >> divisionFromQuantity: dividend [

  ^ dividend * self inverse
]

{ #category : 'private' }
Unit >> divisionFromUnit: unit [

  ^ unit * self inverse
]

{ #category : 'arithmetic' }
Unit >> inverse [

  ^ DerivedUnit from: self raisedTo: -1
]

{ #category : 'testing' }
Unit >> isCommensurableWith: unit [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
Unit >> isDimensionless [

  ^ self subclassResponsibility
]

{ #category : 'printing' }
Unit >> printOn: stream [

  stream nextPutAll: self symbol
]

{ #category : 'private' }
Unit >> producWithSimpleUnit: simpleUnit [

  ^ self = simpleUnit
      then: [ DerivedUnit from: self raisedTo: 2 ]
      otherwise: [ DerivedUnit from: self and: simpleUnit ]
]

{ #category : 'private' }
Unit >> productWithDerivedUnit: derivedUnit [

  ^ derivedUnit * self
]

{ #category : 'private' }
Unit >> productWithQuantity: multiplier [ 

	^multiplier * (1 * self)
]

{ #category : 'private' }
Unit >> productWithUnit: unit [

  ^ unit producWithSimpleUnit: self
]

{ #category : 'arithmetic' }
Unit >> raisedToInteger: exponent [

  ^ exponent = 1 then: [ self ] otherwise: [ DerivedUnit from: self raisedTo: exponent ]
]

{ #category : 'arithmetic' }
Unit >> squared [

  ^ self raisedToInteger: 2
]

{ #category : 'accessing' }
Unit >> symbol [

  ^ self subclassResponsibility
]

{ #category : 'evaluating' }
Unit >> valueFromCanonicalUnit: number [

  ^ self subclassResponsibility
]

{ #category : 'evaluating' }
Unit >> valueInCanonicalUnit: number [

  ^ self subclassResponsibility
]
