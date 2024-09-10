Class {
	#name : 'Measure',
	#superclass : 'MeasureBehavior',
	#instVars : [
		'amount',
		'unit'
	],
	#category : 'Aconcagua-Core-MeasureModel',
	#package : 'Aconcagua-Core',
	#tag : 'MeasureModel'
}

{ #category : 'instance creation' }
Measure class >> amount: aNumber unit: aUnit [

	^self new initializeAmount: aNumber unit: aUnit
]

{ #category : 'arithmetic operations' }
Measure >> * aMeasure [

	^aMeasure multiplyMeasure: self
]

{ #category : 'arithmetic operations' }
Measure >> + aMeasure [

	^aMeasure addMeasure: self.
]

{ #category : 'arithmetic operations' }
Measure >> / aMeasure [

	^aMeasure divideMeasure: self

]

{ #category : 'arithmetic operations' }
Measure >> // aMeasure [

	^aMeasure moduloMeasure: self
]

{ #category : 'magnitude protocol' }
Measure >> < aMeasure [

	^aMeasure greaterThanMeasure: self
]

{ #category : 'magnitude protocol' }
Measure >> <= aMeasure [
	"This implemented thus so that the CanNotConvertMeasureException exception rises correctly"

	^(self < aMeasure) or: [ self = aMeasure ]
]

{ #category : 'comparing' }
Measure >> = anObject [

	^anObject equalsMeasure: self 
		
]

{ #category : 'magnitude protocol' }
Measure >> > aMeasure [

	^aMeasure lessThanMeasure: self
]

{ #category : 'magnitude protocol' }
Measure >> >= aMeasure [
	"This implemented thus so that the CanNotConvertMeasureException exception rises correctly"

	^(self > aMeasure) or: [ self = aMeasure ]
]

{ #category : 'arithmetic operations' }
Measure >> \\ aMeasure [

	^aMeasure remainderMeasure: self
]

{ #category : 'arithmetic operations' }
Measure >> abs [

	^self unit with: 	amount abs
]

{ #category : 'arithmetic operations - private' }
Measure >> addInfinity: anInfinity [

	^anInfinity
]

{ #category : 'arithmetic operations - private' }
Measure >> addMeasure: aMeasure [ 
	"I delegate the responsibility to MeasureBag since this it verifies if the measures are of the same domain.
	When causing that bag has this responsibility, the code that checks this this in a single place and is not created bag
	for measures of the same domain."

	^MeasureBag with: aMeasure with: self
]

{ #category : 'arithmetic operations - private' }
Measure >> addMeasureBag: aMeasureBag [

	^aMeasureBag addMeasure: self
]

{ #category : 'arithmetic operations - private' }
Measure >> addMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : 'arithmetic operations - private' }
Measure >> addSameDomainMeasure: aMeasure [

	^(self sameUnitAs: aMeasure) 
		ifTrue: [self class amount: amount + aMeasure amount unit: unit]
		ifFalse: 
			[self class 
				amount: self convertAmountToBaseUnit + aMeasure convertAmountToBaseUnit
				unit: self baseUnit]
]

{ #category : 'accessing' }
Measure >> amount [
	
	^amount
]

{ #category : 'accessing' }
Measure >> atBaseUnit: aBaseUnit ifNone: aBlock [

	^self baseUnit = aBaseUnit ifTrue: [self] ifFalse: aBlock
]

{ #category : 'accessing' }
Measure >> baseUnit [
	
	^self unit baseUnit
]

{ #category : 'magnitude protocol' }
Measure >> between: min and: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^(self >= min) and: [self <= max]
]

{ #category : 'magnitude protocol' }
Measure >> between: min andNotInclusive: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^self >= min and: [self < max]
]

{ #category : 'comparing' }
Measure >> closeTo: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	If no, if it is of the same domain it turns the amount and it compares.
	If no, it returns false."

	^unit = aMeasure unit 
		ifTrue: [amount closeTo: aMeasure amount]
		ifFalse: 
			[(self sameDomainAs: aMeasure) 
				ifTrue: [self convertAmountToBaseUnit closeTo: aMeasure convertAmountToBaseUnit]
				ifFalse: [self isNothing and: [aMeasure isNothing]]]
]

{ #category : 'magnitude protocol - private' }
Measure >> compareGreaterThan: aNumber [

	^aNumber = 0 
		ifTrue: [ self amount > aNumber ]
		ifFalse: [ CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aNumber unit ]
	
]

{ #category : #compounding }
Measure >> compoundingFormula [
	
	^ CompoundingFormula new
		presentValue: self;
		yourself
]

{ #category : #converting }
Measure >> convertAmountToBaseUnit [
	
	^self unit convertAmountToBaseUnit: self amount
]

{ #category : 'converting - private' }
Measure >> convertInSameDomainTo: aTargetUnit [

	^aTargetUnit convertFromBaseUnit: (unit convertToBaseUnit: self)
]

{ #category : 'converting' }
Measure >> convertTo: aTargetUnit [

	^(unit sameDomainAs: aTargetUnit) 
		ifTrue: [self convertInSameDomainTo: aTargetUnit]
		ifFalse: [CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aTargetUnit]
]

{ #category : 'converting' }
Measure >> convertToBaseUnit [

	^self convertTo: self baseUnit
]

{ #category : 'bag creation - private' }
Measure >> createBagWith: aMeasure [

	^self isNothing
		ifTrue: [aMeasure]
		ifFalse: [aMeasure createBagWithMeasure: self]
]

{ #category : 'bag creation - private' }
Measure >> createBagWithMeasure: aMeasure [

	^self isNothing
		ifTrue: [aMeasure]
		ifFalse: 
			[MeasureBag measures: (OrderedCollection with: self with: aMeasure)]
]

{ #category : 'bag creation - private' }
Measure >> createBagWithNumber: aNumber [

	^self isNothing
		ifTrue: [aNumber]
		ifFalse: [MeasureBag measures: (OrderedCollection with: self with: aNumber)]
]

{ #category : 'arithmetic operations - private' }
Measure >> divFrom: aNumber [

	^self divideMeasure: aNumber
]

{ #category : 'arithmetic operations - private' }
Measure >> divideInfinity: anInfinity [

	^0
]

{ #category : 'arithmetic operations - private' }
Measure >> divideMeasure: aMeasure [

	| numerator denominator |
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	^numerator unit / denominator unit 
		with: numerator amount / denominator amount
]

{ #category : 'arithmetic operations - private' }
Measure >> divideMeasureBag: aMeasureBag [

	^aMeasureBag divideByMeasure: self
]

{ #category : 'arithmetic operations - private' }
Measure >> divideMinusInfinity: aMinusInfinity [

	^0
]

{ #category : 'comparing' }
Measure >> equalsMeasure: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	If no, if it is of the same domain it turns the amount and it compares.
	If no, it returns false."

	^unit = aMeasure unit 
		ifTrue: [amount = aMeasure amount]
		ifFalse: 
			[(self sameDomainAs: aMeasure) 
				ifTrue: [self convertAmountToBaseUnit = aMeasure convertAmountToBaseUnit]
				ifFalse: [self isNothing and: [aMeasure isNothing]]]
]

{ #category : 'comparing' }
Measure >> equalsMeasureBag: aMeasureBag [

	^aMeasureBag equalsMeasure: self
]

{ #category : 'accessing' }
Measure >> floor [
	
	^unit with: amount floor
]

{ #category : 'magnitude protocol - private' }
Measure >> greaterThanMeasure: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	aMeasure converts to baseUnit so that if there is some error of conversion this jumps fast and generates
	CanNotConvertMeasureException correctly."
	
	^unit = aMeasure unit 
		ifTrue: [aMeasure amount < amount]
		ifFalse: 
			[(aMeasure convertTo: self baseUnit) amount 
				< self convertAmountToBaseUnit]
]

{ #category : 'accessing' }
Measure >> hash [

	^self convertAmountToBaseUnit hash
]

{ #category : 'initialization' }
Measure >> initializeAmount: aNumber unit: aUnit [ 

	amount := aNumber.
	unit := aUnit
]

{ #category : 'testing' }
Measure >> isFixed [

	^amount isFixed
]

{ #category : 'testing' }
Measure >> isMeasureBag [

	^false
]

{ #category : 'testing' }
Measure >> isNothing [

	^self convertToBaseUnit amount = self baseUnit nothingAmount
]

{ #category : 'magnitude protocol - private' }
Measure >> lessThanMeasure: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	aMeasure converts to baseUnit so that if there is some error of conversion this jumps fast and generates
	CanNotConvertMeasureException correctly."

	^unit = aMeasure unit 
		ifTrue: [aMeasure amount > amount]
		ifFalse: 
			[(aMeasure convertTo: self baseUnit) amount 
				> self convertAmountToBaseUnit]
]

{ #category : 'magnitude protocol' }
Measure >> max: aMeasure [

	 ^self < aMeasure
		ifTrue: [aMeasure]
		ifFalse: [ self ]
]

{ #category : 'accessing' }
Measure >> measures [

	^self isNothing
		ifTrue: [#()]
		ifFalse: [Array with: self]
]

{ #category : 'magnitude protocol' }
Measure >> min: aMeasure [

	 ^self < aMeasure
		ifTrue: [ self ]
		ifFalse: [ aMeasure ]
]

{ #category : 'arithmetic operations - private' }
Measure >> moduloInfinity: anInfinity [

	^0
]

{ #category : 'arithmetic operations - private' }
Measure >> moduloMeasure: aMeasure [

	| numerator denominator |
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	^numerator unit / denominator unit 
		with: numerator amount // denominator amount
]

{ #category : 'arithmetic operations - private' }
Measure >> moduloMeasureBag: aMeasureBag [

	^aMeasureBag moduloByMeasure: self
]

{ #category : 'arithmetic operations - private' }
Measure >> moduloMinusInfinity: aMinusInfinity [

	^0
]

{ #category : 'arithmetic operations - private' }
Measure >> multiplyInfinity: anInfinity [

	^anInfinity
]

{ #category : 'arithmetic operations - private' }
Measure >> multiplyMeasure: aMeasure [

	| leftFactor rightFactor |
	leftFactor := aMeasure convertToBaseUnit.
	rightFactor := self convertToBaseUnit.
	^leftFactor unit * rightFactor unit 
		with: leftFactor amount * rightFactor amount
]

{ #category : 'arithmetic operations - private' }
Measure >> multiplyMeasureBag: aMeasureBag [

	^aMeasureBag multiplyMeasure: self
]

{ #category : 'arithmetic operations - private' }
Measure >> multiplyMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : 'arithmetic operations' }
Measure >> negated [

	^self class amount: amount negated unit: unit
]

{ #category : 'testing' }
Measure >> negative [

	^amount negative
]

{ #category : 'magnitude protocol' }
Measure >> notInclusiveBetween: min and: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^self > min and: [self <= max]
]

{ #category : 'magnitude protocol' }
Measure >> notInclusiveBetween: min andNotInclusive: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^self > min and: [self < max]
]

{ #category : 'testing' }
Measure >> positive [

	^amount positive
]

{ #category : 'printing' }
Measure >> printOn: aStream [

	self unit printMeasure: self on: aStream
]

{ #category : 'arithmetic operations - private' }
Measure >> quoFrom: aNumber [

	^NullUnit new / unit with: (aNumber quo: amount)
]

{ #category : 'arithmetic operations - private' }
Measure >> remFrom: aNumber [

	^aNumber isNothing
		ifTrue: [ InvalidBinaryOperationException signalOperationName: 'rest' leftOperand: aNumber rightOperand: self ]
		ifFalse: [ (unit with: (amount rem: aNumber)) / self ]
]

{ #category : 'arithmetic operations - private' }
Measure >> remainderInfinity: anInfinity [

	^0
]

{ #category : 'arithmetic operations - private' }
Measure >> remainderMeasure: aMeasure [

	| numerator denominator |
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	^numerator baseUnit with: numerator amount \\ denominator amount
]

{ #category : 'arithmetic operations - private' }
Measure >> remainderMeasureBag: aMeasureBag [

	InvalidBinaryOperationException 
		signalOperationName: 'remainder'
		leftOperand: aMeasureBag
		rightOperand: self
]

{ #category : 'arithmetic operations - private' }
Measure >> remainderMinusInfinity: aMinusInfinity [

	^0
]

{ #category : 'arithmetic operations' }
Measure >> roundTo: aNumber [
	
	^self class amount: (amount roundTo: aNumber) unit: unit
]

{ #category : 'testing' }
Measure >> sameDomainAs: aMeasure [ 
	
	^self unit sameDomainAs: aMeasure unit
]

{ #category : 'testing' }
Measure >> sameUnitAs: aMeasure [ 
	
	^unit = aMeasure unit
]

{ #category : 'arithmetic operations - private' }
Measure >> subtractFrom: aNumber [

	^self negated addMeasure: aNumber
]

{ #category : 'arithmetic operations - private' }
Measure >> subtractInfinity: anInfinity [

	^anInfinity
]

{ #category : 'arithmetic operations - private' }
Measure >> subtractMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : 'interval protocol' }
Measure >> to: stop [

	 ^self to: stop by: (unit with: 1)
]

{ #category : 'interval protocol' }
Measure >> to: stop by: step [

	 ^ArithmeticObjectInterval from: self to: stop by: step
]

{ #category : 'arithmetic operations' }
Measure >> truncated [
	
	^self class amount: amount truncated unit: unit
]

{ #category : 'accessing' }
Measure >> unit [

	^unit
]

{ #category : 'accessing' }
Measure >> unitNameOf: aUnit [

	^self amount abs = 1 ifTrue: [aUnit nameForOne] ifFalse: [aUnit nameForMany]
]
