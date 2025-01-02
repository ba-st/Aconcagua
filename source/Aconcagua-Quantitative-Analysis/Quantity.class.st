"
A quantity is a property that can exist as a multitude or magnitude, which illustrate discontinuity and continuity.

Quantities can be compared in terms of ""more"", ""less"", or ""equal"", or by assigning a numerical value multiple of a unit of measurement. Mass, time, distance, heat, and angle are among the familiar examples of quantitative properties.
"
Class {
	#name : 'Quantity',
	#superclass : 'ArithmeticObject',
	#instVars : [
		'numericalValue',
		'unit'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'private' }
Quantity class >> cannotAddIncommensurableQuantities [

  ^ ArithmeticError signal: 'Cannot add incommensurable quantities' localized
]

{ #category : 'private' }
Quantity class >> cannotSubtractIncommensurableQuantities [

  ^ ArithmeticError signal: 'Cannot subtract incommensurable quantities' localized
]

{ #category : 'instance creation' }
Quantity class >> with: arithmeticObject basedOn: unit [

  AssertionChecker
    enforce: [ arithmeticObject isDimensionless ]
    because: 'Quantity numerical values must be numbers' localized
    raising: InstanceCreationFailed.

  ^ self new initializeWith: arithmeticObject basedOn: unit
]

{ #category : 'arithmetic' }
Quantity >> * multiplicand [

  ^ multiplicand productWithQuantity: self
]

{ #category : 'arithmetic' }
Quantity >> + addend [

  ^ addend additionWithQuantity: self
]

{ #category : 'arithmetic' }
Quantity >> - subtrahend [

  ^ subtrahend subtractionFromQuantity: self
]

{ #category : 'arithmetic' }
Quantity >> / divisor [

  ^ divisor divisionFromQuantity: self
]

{ #category : 'comparing' }
Quantity >> < aQuantity [

  AssertionChecker
    enforce: [ self unit isCommensurableWith: aQuantity unit ]
    because: 'Incommensurable units are not comparable' localized
    raising: ArithmeticError.

  ^ self numericalValueInCanonicalUnit < aQuantity numericalValueInCanonicalUnit
]

{ #category : 'comparing' }
Quantity >> = arithmeticObject [

  ^ self equalityChecker
      compareWith: [ :base :target | base unit isCommensurableWith: target unit ];
      compareWith: [ :base :target |
          base numericalValueInCanonicalUnit = target numericalValueInCanonicalUnit ];
      checkAgainst: arithmeticObject
]

{ #category : 'private' }
Quantity >> additionWithQuantity: augend [

  ^ self
      when: augend
      hasSameUnitDo: [ augend unit * ( self numericalValue + augend numericalValue ) ]
      orIfCommensurableDo: [
        augend unit asCanonicalUnit * ( self numericalValueInCanonicalUnit + augend numericalValueInCanonicalUnit ) ]
      else: [ self class cannotAddIncommensurableQuantities ]
]

{ #category : 'converting' }
Quantity >> convertTo: targetUnit [

  unit = targetUnit then: [ ^ self ].
  AssertionChecker
    enforce: [ unit isCommensurableWith: targetUnit ]
    because: [ 'Cannot convert incommensurable units' localized ]
    raising: ArithmeticError.
  ^ self class
      with: ( targetUnit valueFromCanonicalUnit: self numericalValueInCanonicalUnit )
      basedOn: targetUnit
]

{ #category : 'private' }
Quantity >> divisionFromQuantity: dividend [

  | dividedUnit |
  dividedUnit := dividend unit * unit inverse.

  ^ dividedUnit isDimensionless
      then: [ dividend numericalValue / numericalValue ]
      otherwise: [ self class with: dividend numericalValue / numericalValue basedOn: dividedUnit ]
]

{ #category : 'comparing' }
Quantity >> hash [

  ^ self equalityHashCombinator combineHashOf: self unit with: self numericalValueInCanonicalUnit
]

{ #category : 'initialization' }
Quantity >> initializeWith: arithmeticObject basedOn: aUnit [

  numericalValue := arithmeticObject value.
  unit := aUnit
]

{ #category : 'testing' }
Quantity >> isComparableTo: aQuantity [

  ^ unit isCommensurableWith: aQuantity unit
]

{ #category : 'testing' }
Quantity >> isDimensionless [

  ^ self unit isDimensionless
]

{ #category : 'testing' }
Quantity >> isZero [

  ^ self numericalValueInCanonicalUnit isZero
]

{ #category : 'arithmetic' }
Quantity >> negated [

  ^ self class with: numericalValue negated basedOn: unit
]

{ #category : 'accessing' }
Quantity >> numericalValue [

  ^ numericalValue
]

{ #category : 'private' }
Quantity >> numericalValueInCanonicalUnit [

  ^ unit valueInCanonicalUnit: numericalValue
]

{ #category : 'printing' }
Quantity >> printOn: stream [

  numericalValue printOn: stream.
  stream space.
  unit printOn: stream
]

{ #category : 'private' }
Quantity >> productWithQuantity: multiplier [

  ^ self class with: numericalValue * multiplier numericalValue basedOn: multiplier unit * unit
]

{ #category : 'private' }
Quantity >> productWithUnit: aUnit [

  ^ self * aUnit
]

{ #category : 'arithmetic' }
Quantity >> raisedToInteger: exponent [

  ^ self class
      with: ( numericalValue raisedToInteger: exponent )
      basedOn: ( unit raisedToInteger: exponent )
]

{ #category : 'arithmetic' }
Quantity >> reciprocal [

  ^ 1 / self
]

{ #category : 'private' }
Quantity >> subtractionFromQuantity: minuend [

  ^ self
      when: minuend
      hasSameUnitDo: [ minuend unit * ( minuend numericalValue - self numericalValue ) ]
      orIfCommensurableDo: [
        minuend unit asCanonicalUnit
        * ( minuend numericalValueInCanonicalUnit - self numericalValueInCanonicalUnit ) ]
      else: [ self class cannotSubtractIncommensurableQuantities ]
]

{ #category : 'interval creation' }
Quantity >> to: aQuantity [

  ^ self to: aQuantity by: 1 * self unit
]

{ #category : 'interval creation' }
Quantity >> to: end by: step [

  ^ DiscreteInterval from: self to: end by: step
]

{ #category : 'accessing' }
Quantity >> unit [

  ^ unit
]

{ #category : 'evaluating' }
Quantity >> value [

  ^ self
]

{ #category : 'private' }
Quantity >> when: quantity hasSameUnitDo: sameUnitBlock orIfCommensurableDo: commensurableBlock else: anotherBlock [

  quantity unit = self unit then: [ ^ sameUnitBlock value ].
  ( quantity unit isCommensurableWith: self unit ) then: [ ^ commensurableBlock value ].
  ^ anotherBlock value
]
