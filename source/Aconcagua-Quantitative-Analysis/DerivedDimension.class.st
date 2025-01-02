"
A derived dimension is a  composite dimensions formed by combining fundamental dimensions, 
using multiplication or division.
"
Class {
	#name : 'DerivedDimension',
	#superclass : 'Dimension',
	#instVars : [
		'exponentsByDimension'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'private' }
DerivedDimension class >> composedOfAll: exponentsByDimension [

  | nonZeroExponentsByDimension |
  nonZeroExponentsByDimension := exponentsByDimension reject: [ :exponent | exponent isZero ].
  nonZeroExponentsByDimension size = 1 then: [
      | baseDimension |
      baseDimension := nonZeroExponentsByDimension keys anyOne.
      ( nonZeroExponentsByDimension at: baseDimension ) = 1 then: [ ^ baseDimension ]
    ].
  ^ self new initializeComposedOfAll: nonZeroExponentsByDimension
]

{ #category : 'private' }
DerivedDimension class >> dictionaryClass [

  ^ IdentityDictionary
]

{ #category : 'instance creation' }
DerivedDimension class >> empty [

  ^ self composedOfAll: self dictionaryClass new
]

{ #category : 'instance creation' }
DerivedDimension class >> from: baseDimension and: anotherBaseDimension [

  ^ self composedOfAll: ( self dictionaryClass new
          at: baseDimension put: 1;
          at: anotherBaseDimension put: 1;
          yourself )
]

{ #category : 'instance creation' }
DerivedDimension class >> from: baseDimension raisedTo: exponent [

  ^ self composedOfAll: ( self dictionaryClass new
          at: baseDimension put: exponent;
          yourself )
]

{ #category : 'arithmetic' }
DerivedDimension >> * aDimension [

  ^ aDimension productWithDerivedDimension: self
]

{ #category : 'comparing' }
DerivedDimension >> = object [

  ^ self equalityChecker
      compareWith: [ :base :target |
          SequenceableCollectionEqualityChecker new
            check: base dimensions
            against: target dimensions ];
      compareWith: [ :base :target |
          base dimensions allSatisfy: [ :dimension |
                ( base occurrencesOf: dimension ) = ( target occurrencesOf: dimension ) ]
        ];
      checkAgainst: object
]

{ #category : 'accessing' }
DerivedDimension >> dimensions [

  ^ exponentsByDimension keys sorted: #symbol ascending
]

{ #category : 'comparing' }
DerivedDimension >> hash [

  ^ self equalityHashCombinator combineHashesOfAll: self dimensions
]

{ #category : 'initialization' }
DerivedDimension >> initializeComposedOfAll: aDictionary [

  exponentsByDimension := aDictionary
]

{ #category : 'arithmetic' }
DerivedDimension >> inverse [

  | inverse |
  inverse := self class dictionaryClass new.
  exponentsByDimension keysAndValuesDo: [ :dimension :exponent |
      inverse at: dimension put: exponent negated ].
  ^ self class composedOfAll: inverse
]

{ #category : 'testing' }
DerivedDimension >> isDimensionless [

  ^ exponentsByDimension isEmpty
]

{ #category : 'accessing' }
DerivedDimension >> occurrencesOf: dimension [

  ^ exponentsByDimension at: dimension ifAbsent: [ 0 ]
]

{ #category : 'printing' }
DerivedDimension >> printOn: stream [

  self dimensions do: [ :dimension |
      dimension printOn: stream.
      IntegerAsSuperscriptFormatter new format: ( self occurrencesOf: dimension ) on: stream
    ]
]

{ #category : 'private' }
DerivedDimension >> productWithBaseDimension: baseDimension [

  | product |
  product := exponentsByDimension copy.
  exponentsByDimension
    at: baseDimension
    ifPresent: [ :exponent | product at: baseDimension put: exponent + 1 ]
    ifAbsent: [ product at: baseDimension put: 1 ].

  ^ self class composedOfAll: product
]

{ #category : 'private' }
DerivedDimension >> productWithDerivedDimension: derivedDimension [

  | product |
  product := exponentsByDimension copy.
  derivedDimension dimensions do: [ :baseDimension |
      exponentsByDimension
        at: baseDimension
        ifPresent: [ :exponent |
            product
              at: baseDimension
              put: exponent + ( derivedDimension occurrencesOf: baseDimension ) ]
        ifAbsent: [
          product at: baseDimension put: ( derivedDimension occurrencesOf: baseDimension ) ]
    ].
  ^ self class composedOfAll: product
]
