"
A derived unit is a unit of measurement that is derived from the fundamental (or base) units
of a particular system. Derived units are formed by combining base units through multiplication,
 division, or other mathematical operations to measure more complex quantities.
"
Class {
	#name : 'DerivedUnit',
	#superclass : 'Unit',
	#instVars : [
		'exponentsByUnit',
		'namesOptional'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'private' }
DerivedUnit class >> composedOfAll: exponentsByUnit [

  ^ self composedOfAll: exponentsByUnit nameOptional: Optional unused
]

{ #category : 'private' }
DerivedUnit class >> composedOfAll: exponentsByUnit nameOptional: aNamesOptional [

  | nonZeroExponentsByUnit |
  nonZeroExponentsByUnit := self dictionaryClass new.
  exponentsByUnit keysAndValuesDo: [ :unit :exponent |
      [ nonZeroExponentsByUnit at: unit put: exponent ] unless: exponent isZero ].
  nonZeroExponentsByUnit size = 1 then: [
      | baseUnit |
      baseUnit := nonZeroExponentsByUnit keys anyOne.
      ( nonZeroExponentsByUnit at: baseUnit ) = 1 then: [ ^ baseUnit ]
    ].
  ^ self new initializeComposedOfAll: nonZeroExponentsByUnit nameOptional: aNamesOptional
]

{ #category : 'private' }
DerivedUnit class >> dictionaryClass [

  ^ OrderedDictionary
]

{ #category : 'instance creation' }
DerivedUnit class >> from: baseUnit and: anotherBaseUnit [

  ^ self composedOfAll: ( self dictionaryClass new
          at: baseUnit put: 1;
          at: anotherBaseUnit put: 1;
          yourself )
]

{ #category : 'instance creation' }
DerivedUnit class >> from: baseUnit raisedTo: exponent [

  ^ self composedOfAll: ( self dictionaryClass new
          at: baseUnit put: exponent;
          yourself )
]

{ #category : 'comparing' }
DerivedUnit >> = object [

  ^ self equalityChecker
      compareWith: [ :base :target |
          | baseUnits targetUnits |
          baseUnits := base units.
          targetUnits := target units.
          baseUnits size = targetUnits size and: [
                ( baseUnits includesAll: targetUnits ) and: [ targetUnits includesAll: baseUnits ] ]
        ];
      compareWith: [ :base :target |
          base units allSatisfy: [ :unit |
                ( base occurrencesOf: unit ) = ( target occurrencesOf: unit ) ] ];
      checkAgainst: object
]

{ #category : 'converting' }
DerivedUnit >> aliasedBy: singularName plural: pluralName symbol: symbol [

  ^ self class
      composedOfAll: exponentsByUnit
      nameOptional:
      ( Optional containing: ( UnitNames singular: singularName plural: pluralName symbol: symbol ) )
]

{ #category : 'converting' }
DerivedUnit >> asCanonicalUnit [

  | exponentsByCanonicalUnit |
  exponentsByCanonicalUnit := self class dictionaryClass new.
  self withUnitsAndExponentsDo: [ :simpleUnit :unitExponent |
      | canonicalUnit |
      canonicalUnit := simpleUnit asCanonicalUnit.
      exponentsByCanonicalUnit
        at: canonicalUnit
        ifPresent: [ :exponent |
          exponentsByCanonicalUnit at: canonicalUnit put: exponent + unitExponent ]
        ifAbsent: [ exponentsByCanonicalUnit at: canonicalUnit put: unitExponent ]
    ].
  ^ self class composedOfAll: exponentsByCanonicalUnit
]

{ #category : 'accessing' }
DerivedUnit >> dimension [

  | dimension |
  dimension := DerivedDimension empty.
  self
    withUnitsAndPositiveExponentsDo: [ :simpleUnit :exponent |
      exponent timesRepeat: [ dimension := dimension * simpleUnit dimension ] ]
    withNegativeExponentsDo: [ :simpleUnit :exponent |
      exponent timesRepeat: [ dimension := dimension / simpleUnit dimension ] ].
  ^ dimension
]

{ #category : 'comparing' }
DerivedUnit >> hash [

  ^ self equalityHashCombinator combineHashesOfAll: self units
]

{ #category : 'initialization' }
DerivedUnit >> initializeComposedOfAll: aDictionary nameOptional: aNameTupleOptional [

  exponentsByUnit := aDictionary.
  namesOptional := aNameTupleOptional
]

{ #category : 'arithmetic' }
DerivedUnit >> inverse [

  | product |
  product := self class dictionaryClass new.
  self withUnitsAndExponentsDo: [ :simpleUnit :exponent | product at: simpleUnit put: exponent negated ].
  ^ self class composedOfAll: product
]

{ #category : 'testing' }
DerivedUnit >> isCommensurableWith: unit [

  ^ self dimension = unit dimension
]

{ #category : 'testing' }
DerivedUnit >> isDimensionless [

  ^ self dimension isDimensionless
]

{ #category : 'accessing' }
DerivedUnit >> occurrencesOf: unit [

  ^ exponentsByUnit at: unit ifAbsent: [ 0 ]
]

{ #category : 'accessing' }
DerivedUnit >> pluralName [

  ^ namesOptional
      withContentDo: [ :names | names plural ]
      ifUnused: [ DerivedUnitFormatter forPluralName format: self ]
]

{ #category : 'private' }
DerivedUnit >> producWithSimpleUnit: simpleUnit [

  | product |
  product := exponentsByUnit copy.
  exponentsByUnit
    at: simpleUnit
    ifPresent: [ :exponent | product at: simpleUnit put: exponent + 1 ]
    ifAbsent: [ product at: simpleUnit put: 1 ].

  ^ self class composedOfAll: product
]

{ #category : 'private' }
DerivedUnit >> productWithDerivedUnit: derivedUnit [

  | product |
  product := exponentsByUnit copy.
  derivedUnit withUnitsAndExponentsDo: [ :simpleUnit :exponentInFactor |
      exponentsByUnit
        at: simpleUnit
        ifPresent: [ :exponent | product at: simpleUnit put: exponent + exponentInFactor ]
        ifAbsent: [ product at: simpleUnit put: exponentInFactor ]
    ].
  ^ self class composedOfAll: product
]

{ #category : 'private' }
DerivedUnit >> productWithUnit: unit [

  ^ unit productWithDerivedUnit: self
]

{ #category : 'arithmetic' }
DerivedUnit >> raisedToInteger: exponent [

  | product |
  product := self class dictionaryClass new.
  self withUnitsAndExponentsDo: [ :unit :currentExponent |
      product at: unit put: currentExponent * exponent ].
  ^ self class composedOfAll: product
]

{ #category : 'accessing' }
DerivedUnit >> singularName [

  ^ namesOptional
      withContentDo: [ :names | names singular ]
      ifUnused: [ DerivedUnitFormatter forSingularName format: self ]
]

{ #category : 'accessing' }
DerivedUnit >> symbol [

  ^ namesOptional
      withContentDo: [ :names | names symbol ]
      ifUnused: [ DerivedUnitFormatter forSymbol format: self ]
]

{ #category : 'private' }
DerivedUnit >> units [

  ^ exponentsByUnit keys
]

{ #category : 'evaluating' }
DerivedUnit >> valueFromCanonicalUnit: number [

  | valueFromCanonicalUnit |
  valueFromCanonicalUnit := number.
  self
    withUnitsAndPositiveExponentsDo: [ :unit :exponent |
        exponent timesRepeat: [
            valueFromCanonicalUnit := unit valueFromCanonicalUnit: valueFromCanonicalUnit ]
      ]
    withNegativeExponentsDo: [ :unit :exponent |
        exponent timesRepeat: [
            valueFromCanonicalUnit := valueFromCanonicalUnit / ( unit valueFromCanonicalUnit: 1 ) ]
      ].
  ^ valueFromCanonicalUnit
]

{ #category : 'evaluating' }
DerivedUnit >> valueInCanonicalUnit: number [

  | valueInCanonicalUnit |
  valueInCanonicalUnit := number.
  self
    withUnitsAndPositiveExponentsDo: [ :unit :exponent |
        exponent timesRepeat: [
            valueInCanonicalUnit := unit valueInCanonicalUnit: valueInCanonicalUnit ] ]
    withNegativeExponentsDo: [ :unit :exponent |
        exponent timesRepeat: [
            valueInCanonicalUnit := valueInCanonicalUnit / ( unit valueInCanonicalUnit: 1 ) ]
      ].
  ^ valueInCanonicalUnit
]

{ #category : 'private' }
DerivedUnit >> withPositiveExponentsByUnitDo: positiveBlock andWithNegativeDo: negativeBlock [

  | positiveExponentsByUnit negativeExponentsByUnit |
  positiveExponentsByUnit := self class dictionaryClass new.
  negativeExponentsByUnit := self class dictionaryClass new.
  self withUnitsAndExponentsDo: [ :unit :exponent |
      exponent strictlyPositive then: [ positiveExponentsByUnit at: unit put: exponent ].
      exponent negative then: [ negativeExponentsByUnit at: unit put: exponent abs ]
    ].
  positiveBlock value: positiveExponentsByUnit.
  negativeBlock value: negativeExponentsByUnit
]

{ #category : 'private' }
DerivedUnit >> withUnitsAndExponentsDo: block [

  exponentsByUnit keysAndValuesDo: block
]

{ #category : 'private' }
DerivedUnit >> withUnitsAndPositiveExponentsDo: positiveBlock withNegativeExponentsDo: negativeBlock [

  self
    withPositiveExponentsByUnitDo: [ :dictionary | dictionary keysAndValuesDo: positiveBlock ]
    andWithNegativeDo: [ :dictionary | dictionary keysAndValuesDo: negativeBlock ]
]
