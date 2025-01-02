"
A QuantityTest is a test class for testing the behavior of Quantity
"
Class {
	#name : 'QuantityTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'centimeter',
		'second',
		'hour',
		'kilometer'
	],
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'running' }
QuantityTest >> setUp [

  super setUp.
  meter := BaseUnitOfMeasure
             basedOn: Dimension length
             singularNamed: 'meter'
             pluralNamed: 'meters'
             symbol: 'm'.
  centimeter := MultipleUnitOfMeasure
                  basedOn: meter
                  prefixedBy: 'centi'
                  symbolPrefixedBy: 'c'
                  raisedTo: -2.
  kilometer := MultipleUnitOfMeasure
                 basedOn: meter
                 prefixedBy: 'kilo'
                 symbolPrefixedBy: 'k'
                 raisedTo: 3.
  second := BaseUnitOfMeasure
              basedOn: Dimension time
              singularNamed: 'second'
              pluralNamed: 'seconds'
              symbol: 's'.
  hour := MultipleUnitOfMeasure
            basedOn: second
            singularNamed: 'hour'
            pluralNamed: 'hours'
            symbol: 'h'
            factor: 3600
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testAddition [

  | oneMeter oneHundredCentimeters |
  oneMeter := meter * 1.
  oneHundredCentimeters := 100 * centimeter.

  self
    assert: oneMeter + oneMeter equals: 2 * meter;
    assert: oneMeter + oneHundredCentimeters + oneMeter equals: 3 * meter;
    assert: oneMeter + oneHundredCentimeters + oneMeter equals: 300 * centimeter;
    assert: oneHundredCentimeters + oneMeter equals: 2 * meter;
    assert: oneHundredCentimeters squared + oneMeter squared equals: 2 * meter squared
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testAdditionDontMakeUnnecessaryConversions [

  | fiveCentimeters oneHundredCentimeters snailSpeed |
  fiveCentimeters := 5 * centimeter.
  oneHundredCentimeters := 100 * centimeter.

  self
    assert: oneHundredCentimeters + fiveCentimeters equals: 105 * centimeter;
    assert: ( oneHundredCentimeters + fiveCentimeters ) unit equals: centimeter;
    assert: ( oneHundredCentimeters + fiveCentimeters ) numericalValue equals: 105;
    assert: ( oneHundredCentimeters + fiveCentimeters ) printString equals: '105 cm'.

  snailSpeed := 4680 * centimeter / hour.

  self
    assert: snailSpeed + snailSpeed equals: 9360 * centimeter / hour;
    assert: ( snailSpeed + snailSpeed ) unit equals: centimeter / hour;
    assert: ( snailSpeed + snailSpeed ) numericalValue equals: 9360;
    assert: ( snailSpeed + snailSpeed ) printString equals: '9360 cm/h'
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testAdditionWithArithmeticFormulas [

  | oneMeter oneHundredCentimeters sum product |
  sum := Summation ofAll: #( 1 -2 2 ).
  product := SequenceProduct ofAll: #( 10 10 ).
  oneMeter := meter * sum.
  oneHundredCentimeters := product * centimeter.

  self
    assert: oneMeter + oneMeter equals: 2 * meter;
    assert: oneMeter + oneHundredCentimeters + oneMeter equals: 3 * meter;
    assert: oneMeter + oneHundredCentimeters + oneMeter equals: 300 * centimeter
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testAdditionWithZero [

  | fiveMeters |
  fiveMeters := meter * 5.

  self
    assert: 0 + fiveMeters equals: fiveMeters;
    assert: fiveMeters + 0 equals: fiveMeters
]

{ #category : 'tests - magnitude' }
QuantityTest >> testBetweenAnd [

  | threeMeters |
  threeMeters := 3 * meter.

  self
    assert: ( threeMeters between: 1 * meter and: threeMeters );
    assert: ( threeMeters between: threeMeters and: threeMeters );
    assert: ( threeMeters between: threeMeters and: 4 * meter );
    assert: ( threeMeters between: 1 * meter and: 4 * meter ).

  self
    deny: ( threeMeters between: 1 * meter and: 2 * meter );
    deny: ( threeMeters between: 4 * meter and: 5 * meter )
]

{ #category : 'tests - converting' }
QuantityTest >> testCannotConvertIncommensurableQuantities [

  self
    should: [ 5 * meter convertTo: meter * meter ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ 5 * meter convertTo: second ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ 5 * meter convertTo: meter inverse ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units'
]

{ #category : 'tests - creation' }
QuantityTest >> testCannotCreateQuantityWithNonDimensionlessValue [

  self
    should: [ Quantity with: meter * 1 basedOn: second ]
    raise: InstanceCreationFailed
    withMessageText: 'Quantity numerical values must be numbers'
]

{ #category : 'tests - interval' }
QuantityTest >> testCannotCreteIntervalWithInvalidStep [

  self
    should: [ 1 * meter to: 5 * meter by: -1 * meter ]
    raise: InstanceCreationFailed
    withMessageText: 'Cannot create an interval with an invalid step';
    should: [ 5 * meter to: 1 * meter by: 1 * meter ]
    raise: InstanceCreationFailed
    withMessageText: 'Cannot create an interval with an invalid step'
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testCantAddIncommensurableQuantities [

  | threeMeters fourSeconds |
  threeMeters := 3 * meter.
  fourSeconds := 4 * second.

  self
    should: [ threeMeters + fourSeconds ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'.

  self
    should: [ 1 + fourSeconds ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'.

  self
    should: [ fourSeconds + 1 ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'
]

{ #category : 'tests - interval' }
QuantityTest >> testCantCreateIntervalWithIncommensurableQuantities [

  | oneMeter oneSecond |
  oneMeter := 1 * meter.
  oneSecond := 1 * second.

  self
    should: [ oneMeter to: oneSecond ] raise: ArithmeticError;
    should: [ oneMeter to: oneMeter by: oneSecond ]
    raise: ArithmeticError
    withMessageText: 'Cannot create an interval with incommensurable quantities'
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testCantSubtractIncommensurableQuantities [

  | threeMeters fourSeconds |
  threeMeters := 3 * meter.
  fourSeconds := 4 * second.

  self
    should: [ threeMeters - fourSeconds ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract incommensurable quantities'.

  self
    should: [ 1 - fourSeconds ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract incommensurable quantities'.

  self
    should: [ threeMeters - 1 ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract incommensurable quantities'
]

{ #category : 'tests - magnitude' }
QuantityTest >> testComparison [

  | oneMeter oneHundredCentimeters |
  oneMeter := meter * 1.
  oneHundredCentimeters := 100 * centimeter.

  self
    assert: oneMeter equals: oneMeter;
    assert: oneMeter equals: 1 * meter;
    assert: oneMeter hash equals: ( 1 * meter ) hash;
    assert: oneMeter equals: oneHundredCentimeters;
    assert: oneMeter hash equals: oneHundredCentimeters hash;
    deny: oneMeter equals: second * 5
]

{ #category : 'tests - magnitude' }
QuantityTest >> testComparisonOfComplexQuantities [

  | oneMeter oneHundredCentimeters |
  oneMeter := meter * 1.
  oneHundredCentimeters := 100 * centimeter.

  self
    assert: oneMeter / second equals: oneMeter / second;
    assert: ( oneMeter / second ) hash equals: ( 1 * meter / second ) hash;
    assert: oneMeter / second equals: oneHundredCentimeters / second;
    assert: ( oneMeter / second ) hash equals: ( oneHundredCentimeters / second ) hash;
    deny: oneMeter equals: oneMeter / second.

  self
    assert: 2 * kilometer * kilometer equals: 2000000 * meter * meter;
    assert: 2000000 * meter * meter equals: 2 * kilometer * kilometer.

  self
    assert: 1 * kilometer / second equals: 3600 * kilometer / hour;
    assert: 3600 * kilometer / hour equals: 1 * kilometer / second
]

{ #category : 'tests - interval' }
QuantityTest >> testComplexInterval [

  | oneMeterPerSecond twoHunderdCentimetersPerSecond interval |
  oneMeterPerSecond := 1 * meter / second.
  twoHunderdCentimetersPerSecond := 200 * centimeter / second.

  interval := oneMeterPerSecond to: twoHunderdCentimetersPerSecond.

  self assert: interval size equals: 2.
  self assert: interval asArray equals: { oneMeterPerSecond . twoHunderdCentimetersPerSecond }
]

{ #category : 'tests - converting' }
QuantityTest >> testConvertTo [

  | fiveMeters fiveHundredCentimeters twoKilometers fiveThousandMeters |
  fiveMeters := 5 * meter.
  twoKilometers := 2 * kilometer.
  fiveThousandMeters := 5000 * meter.

  fiveHundredCentimeters := fiveMeters convertTo: centimeter.

  self
    assert: fiveHundredCentimeters equals: fiveMeters;
    assert: fiveHundredCentimeters unit equals: centimeter;
    assert: fiveHundredCentimeters numericalValue equals: 500.

  self
    assert: ( twoKilometers convertTo: centimeter ) equals: twoKilometers;
    assert: ( twoKilometers convertTo: centimeter ) unit equals: centimeter;
    assert: ( twoKilometers convertTo: centimeter ) numericalValue equals: 200000.

  self
    assert: ( fiveThousandMeters convertTo: kilometer ) equals: fiveThousandMeters;
    assert: ( fiveThousandMeters convertTo: kilometer ) unit equals: kilometer;
    assert: ( fiveThousandMeters convertTo: kilometer ) numericalValue equals: 5.

  self assert: ( fiveMeters convertTo: meter ) equals: fiveMeters
]

{ #category : 'tests - converting' }
QuantityTest >> testConvertToWithDerivedUnits [

  | fiveMeters twoKilometers fiveThousandMeters |
  fiveMeters := 5 * meter.
  twoKilometers := 2 * kilometer.
  fiveThousandMeters := 5000 * meter.

  self
    assert: ( fiveMeters * fiveMeters convertTo: centimeter * centimeter )
    equals: 25 * meter * meter;
    assert: ( fiveMeters * fiveMeters convertTo: centimeter * centimeter ) unit
    equals: centimeter * centimeter;
    assert: ( fiveMeters * fiveMeters convertTo: centimeter * centimeter ) numericalValue
    equals: 250000.

  self
    assert: ( twoKilometers * twoKilometers convertTo: centimeter * centimeter )
    equals: 4 * kilometer * kilometer;
    assert: ( twoKilometers * twoKilometers convertTo: centimeter * centimeter ) unit
    equals: centimeter * centimeter;
    assert: ( twoKilometers * twoKilometers convertTo: centimeter * centimeter ) numericalValue
    equals: 40000000000.

  self
    assert: ( fiveThousandMeters * fiveThousandMeters convertTo: kilometer * kilometer )
    equals: 25000000 * meter * meter;
    assert: ( fiveThousandMeters * fiveThousandMeters convertTo: kilometer * kilometer ) unit
    equals: kilometer * kilometer;
    assert:
      ( fiveThousandMeters * fiveThousandMeters convertTo: kilometer * kilometer ) numericalValue
    equals: 25
]

{ #category : 'tests - converting' }
QuantityTest >> testConvertToWithDerivedUnitsOfDifferentDimensions [

  | oneKilometerPerSecond |
  oneKilometerPerSecond := 1 * kilometer / second.

  self
    assert: ( oneKilometerPerSecond convertTo: kilometer / hour ) equals: oneKilometerPerSecond;
    assert: ( oneKilometerPerSecond convertTo: kilometer / hour ) unit equals: kilometer / hour;
    assert: ( oneKilometerPerSecond convertTo: kilometer / hour ) numericalValue equals: 3600
]

{ #category : 'tests - creation' }
QuantityTest >> testCreation [

  | oneMeter |
  oneMeter := meter * 1.

  self
    assert: oneMeter unit equals: meter;
    assert: oneMeter numericalValue equals: 1;
    assert: oneMeter printString equals: '1 m'.

  self assert: oneMeter equals: 1 * meter
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testDivision [

  | fourMeters twoMeters |
  fourMeters := meter * 4.
  twoMeters := 2 * meter.

  self
    assert: fourMeters / twoMeters equals: 2;
    assert: fourMeters * fourMeters / twoMeters equals: 8 * meter;
    assert: fourMeters / second / ( twoMeters / second ) equals: 2
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testDivisionByScalars [

  | fourMeters |
  fourMeters := meter * 4.

  self
    assert: fourMeters / 2 equals: 2 * meter;
    assert: 4 / fourMeters equals: 1 * meter inverse
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testDivisionWithArithmeticFormulas [

  | fourMeters twoMeters sum product |
  sum := Summation ofAll: #( 1 3 ).
  product := SequenceProduct ofAll: #( 1 2 ).
  fourMeters := meter * sum.
  twoMeters := product * meter.

  self
    assert: fourMeters / twoMeters equals: 2;
    assert: fourMeters * fourMeters / twoMeters equals: 8 * meter;
    assert: fourMeters / second / ( twoMeters / second ) equals: 2
]

{ #category : 'tests - magnitude' }
QuantityTest >> testGreaterThan [

  | threeMeters |
  threeMeters := 3 * meter.

  self
    deny: threeMeters > threeMeters;
    assert: threeMeters > ( 1 * meter );
    deny: ( 1 * meter ) > threeMeters.

  self
    assert: threeMeters > ( 3 / 4 * meter );
    deny: ( 3 / 4 * meter ) > threeMeters.

  self
    assert: threeMeters > (0.1s2 * meter);
    deny: ( 0.1s2 * meter ) > threeMeters
]

{ #category : 'tests - magnitude' }
QuantityTest >> testGreaterThanEquals [

  | threeHundredCentimeters |
  threeHundredCentimeters := 300 * centimeter.

  self
    assert: threeHundredCentimeters >= threeHundredCentimeters;
    assert: threeHundredCentimeters >= ( 1 * meter );
    deny: ( 1 * meter ) >= threeHundredCentimeters.

  self
    assert: threeHundredCentimeters >= ( 3 / 4 * meter );
    deny: ( 3 / 4 * meter ) >= threeHundredCentimeters.

  self
    assert: threeHundredCentimeters >= ( 0.1s2 * meter );
    deny: ( 0.1s2 * meter ) >= threeHundredCentimeters
]

{ #category : 'tests - interval' }
QuantityTest >> testIntervalWithDefaultStep [

  | oneMeter interval |
  oneMeter := 1 * meter.

  interval := oneMeter to: 5 * meter.

  self assert: interval size equals: 5.
  interval doWithIndex: [ :each :index | self assert: each equals: index * meter ].

  interval := 100 * centimeter to: 110 * centimeter.

  self assert: interval size equals: 11.
  interval doWithIndex: [ :each :index | self assert: each equals: ( 100 + index - 1 ) * centimeter ]
]

{ #category : 'tests - interval' }
QuantityTest >> testIntervalWithNegativeStep [

  | oneMeter interval |
  oneMeter := 1 * meter.

  interval := 5 * meter to: oneMeter by: -2 * meter.

  self assert: interval size equals: 3.
  self assert: interval asArray equals: ( #( 5 3 1 ) collect: [ :value | value * meter ] )
]

{ #category : 'tests - interval' }
QuantityTest >> testIntervalWithStep [

  | oneMeter interval |
  oneMeter := 1 * meter.

  interval := oneMeter to: 5 * meter by: 2 * meter.

  self assert: interval size equals: 3.
  interval doWithIndex: [ :each :index | self assert: each equals: index * 2 - 1 * meter ].

  self assert: interval asArray equals: ( #( 1 3 5 ) collect: [ :value | value * meter ] ).

  interval := 100 * centimeter to: 200 * centimeter by: 10 * centimeter.

  self assert: interval size equals: 11.
  interval doWithIndex: [ :each :index |
      self assert: each equals: 100 + ( index - 1 * 10 ) * centimeter ].

  self
    assert: interval asArray
    equals:
    ( #( 100 110 120 130 140 150 160 170 180 190 200 ) collect: [ :value | value * centimeter ] )
]

{ #category : 'tests - magnitude' }
QuantityTest >> testLessThan [

  | threeMeters |
  threeMeters := 3 * meter.

  self
    deny: threeMeters < threeMeters;
    deny: threeMeters < ( 1 * meter );
    assert: ( 1 * meter ) < threeMeters.

  self
    deny: threeMeters < ( 3 / 4 * meter );
    assert: ( 3 / 4 * meter ) < threeMeters.

  self
    deny: threeMeters < ( 0.1s2 * meter );
    assert: ( 0.1s2 * meter ) < threeMeters
]

{ #category : 'tests - magnitude' }
QuantityTest >> testLessThanEquals [

  | threeMeters |
  threeMeters := 3 * meter.

  self
    assert: threeMeters <= threeMeters;
    deny: threeMeters <= ( 1 * meter );
    assert: ( 1 * meter ) <= threeMeters.

  self
    deny: threeMeters <= ( 3 / 4 * meter );
    assert: ( 3 / 4 * meter ) <= threeMeters.

  self
    deny: threeMeters <= ( 0.1s2 * meter );
    assert: ( 0.1s2 * meter ) <= threeMeters
]

{ #category : 'tests - magnitude' }
QuantityTest >> testMax [

  | max min |
  max := 3 * meter.
  min := 100 * centimeter.

  self
    assert: ( max max: min ) equals: 3 * meter;
    assert: ( max max: 1 * meter ) equals: 3 * meter;
    assert: ( max max: 4 * meter ) equals: 4 * meter
]

{ #category : 'tests - magnitude' }
QuantityTest >> testMin [

  | max min |
  max := 300 * centimeter.
  min := 1 * meter.

  self
    assert: ( max min: min ) equals: 1 * meter;
    assert: ( max min: 1 * meter ) equals: 1 * meter;
    assert: ( max min: 4 * meter ) equals: 3 * meter
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testMultiplication [

  | twoMeters |
  twoMeters := meter * 2.

  self
    assert: twoMeters * twoMeters equals: 4 * meter * meter;
    assert: ( twoMeters * twoMeters ) printString equals: '4 m²';
    assert: twoMeters * ( 3 * second ) equals: 6 * meter * second;
    assert: ( twoMeters * ( 3 * second ) ) printString equals: '6 m·s';
    assert: ( twoMeters * ( 3 * second inverse ) ) printString equals: '6 m/s'
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testMultiplicationByScalars [

  | twoMeters |
  twoMeters := meter * 2.

  self
    assert: 2 * twoMeters equals: 4 * meter;
    assert: twoMeters * 2 equals: 4 * meter;
    assert: 1 / 2 * twoMeters equals: 1 * meter
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testMultiplicationWithArithmeticFormulas [

  | twoMeters sum product |
  sum := Summation ofAll: #( 1 1 ).
  product := SequenceProduct ofAll: #( 1 3 ).
  twoMeters := meter * sum.

  self
    assert: twoMeters * twoMeters equals: 4 * meter * meter;
    assert: ( twoMeters * twoMeters ) printString equals: '4 m²';
    assert: twoMeters * ( product * second ) equals: 6 * meter * second;
    assert: ( twoMeters * ( product * second ) ) printString equals: '6 m·s';
    assert: ( twoMeters * ( product * second inverse ) ) printString equals: '6 m/s'
]

{ #category : 'tests - printing' }
QuantityTest >> testPrintString [

  self
    assert: ( 0 * meter ) printString equals: '0 m';
    assert: ( 50 * centimeter ) printString equals: '50 cm'
]

{ #category : 'tests - creation' }
QuantityTest >> testReciprocal [

  | twoMeters |
  twoMeters := meter * 2.

  self
    assert: twoMeters reciprocal unit equals: meter inverse;
    assert: twoMeters reciprocal numericalValue equals: 1 / 2;
    assert: twoMeters reciprocal equals: 1 / ( 2 * meter )
]

{ #category : 'tests - formulas' }
QuantityTest >> testSequenceProduct [

  | product |
  product := SequenceProduct ofAll: { 2 * meter . 300 * centimeter }.

  self assert: product equals: 6 * meter squared.

  product := SequenceProduct ofAll: { 2 * meter . 5 * second inverse }.

  self assert: product equals: 10 * meter / second
]

{ #category : 'tests - interval' }
QuantityTest >> testSimplestInterval [

  | oneMeter interval |
  oneMeter := 1 * meter.

  interval := oneMeter to: oneMeter.

  self assert: interval size equals: 1.
  interval do: [ :each | self assert: each equals: oneMeter ].

  self assert: interval asArray equals: { oneMeter }
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testSubtraction [

  | oneMeter oneHundredCentimeters |
  oneMeter := meter * 1.
  oneHundredCentimeters := 100 * centimeter.

  self
    assert: ( oneMeter - oneMeter ) isZero;
    assert: oneMeter - oneHundredCentimeters + oneMeter equals: oneMeter;
    assert: oneMeter + oneHundredCentimeters - oneMeter equals: oneMeter;
    assert: ( oneHundredCentimeters * 2 ) - oneMeter equals: oneMeter
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testSubtractionDontMakeUnnecessaryConversions [

  | fiveCentimeters oneHundredCentimeters snailSpeed |
  fiveCentimeters := 5 * centimeter.
  oneHundredCentimeters := 100 * centimeter.

  self
    assert: oneHundredCentimeters - fiveCentimeters equals: 95 * centimeter;
    assert: ( oneHundredCentimeters - fiveCentimeters ) unit equals: centimeter;
    assert: ( oneHundredCentimeters - fiveCentimeters ) numericalValue equals: 95;
    assert: ( oneHundredCentimeters - fiveCentimeters ) printString equals: '95 cm'.

  snailSpeed := 4680 * centimeter / hour.

  self
    assert: snailSpeed - ( 100 * centimeter / hour ) equals: 4580 * centimeter / hour;
    assert: ( snailSpeed - ( 100 * centimeter / hour ) ) unit equals: centimeter / hour;
    assert: ( snailSpeed - ( 100 * centimeter / hour ) ) numericalValue equals: 4580;
    assert: ( snailSpeed - ( 100 * centimeter / hour ) ) printString equals: '4580 cm/h'
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testSubtractionWithArithmeticFormulas [

  | oneMeter oneHundredCentimeters sum product |
  sum := Summation ofAll: #( 1 -2 2 ).
  product := SequenceProduct ofAll: #( 10 10 ).
  oneMeter := meter * sum.
  oneHundredCentimeters := product * centimeter.

  self
    assert: ( oneMeter - oneMeter ) isZero;
    assert: oneMeter - oneHundredCentimeters + oneMeter equals: oneMeter;
    assert: oneMeter + oneHundredCentimeters - oneMeter equals: oneMeter
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testSubtractionWithDerivedUnits [

  | oneMeterPerSecond oneHundredCentimetersPerSecond twoHundredCentimetersPerSecond |
  oneMeterPerSecond := meter * 1 / second.
  oneHundredCentimetersPerSecond := 100 * centimeter / second.
  twoHundredCentimetersPerSecond := 200 * centimeter / second.

  self
    assert: ( oneMeterPerSecond - oneMeterPerSecond ) isZero;
    assert: oneMeterPerSecond - oneHundredCentimetersPerSecond + oneMeterPerSecond
    equals: oneMeterPerSecond;
    assert: oneMeterPerSecond + oneHundredCentimetersPerSecond - oneMeterPerSecond
    equals: oneMeterPerSecond;
    assert: twoHundredCentimetersPerSecond - oneMeterPerSecond equals: oneMeterPerSecond;
    assert: oneMeterPerSecond - twoHundredCentimetersPerSecond equals: oneMeterPerSecond negated
]

{ #category : 'tests - arithmetic' }
QuantityTest >> testSubtractionWithZero [

  | oneMeter |
  oneMeter := meter * 1.

  self
    assert: oneMeter - 0 equals: oneMeter;
    assert: 0 - oneMeter equals: oneMeter negated
]

{ #category : 'tests - formulas' }
QuantityTest >> testSummation [

  | sum |
  sum := Summation ofAll: { 2 * meter . 300 * centimeter }.

  self assert: sum equals: 5 * meter.

  sum := Summation ofAll: { 2 * meter . -300 * centimeter }.

  self
    assert: sum equals: -1 * meter;
    deny: sum isDimensionless.

  self
    should: [ ( Summation ofAll: { 2 * meter . 5 * second } ) value ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'
]
