"
A SequenceProductTest is a test class for testing the behavior of SequenceProduct
"
Class {
	#name : 'SequenceProductTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Arithmetic-Tests',
	#package : 'Aconcagua-Arithmetic-Tests'
}

{ #category : 'tests - arithmetic' }
SequenceProductTest >> testAddition [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self
    assert: product + product equals: 12;
    assert: product + 1 equals: 7;
    assert: 1 + product equals: 7.

  self
    assert: product + ( 3 / 4 ) equals: 27 / 4;
    assert: 3 / 4 + product equals: 27 / 4.

  self
    assert: product + 0.1s2 equals: 6.1s2;
    assert: 0.1s2 + product equals: 6.1s2
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testBetweenAnd [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self
    assert: ( product between: 1 and: product );
    assert: ( product between: product and: product );
    assert: ( product between: product and: 7 );
    assert: ( product between: 1 and: 6 ).

  self
    deny: ( product between: 1 and: 2 );
    deny: ( product between: 7 and: 8 )
]

{ #category : 'tests - arithmetic' }
SequenceProductTest >> testDivision [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self
    assert: product / product equals: 1;
    assert: product / 2 equals: 3;
    assert: 2 / product equals: 1 / 3.

  self
    assert: product / ( 3 / 4 ) equals: 8;
    assert: ( 3 / 4 ) / product equals: 1 / 8.

  self
    assert: product / 0.1s2 equals: 60.0s2;
    assert: 0.1s2 / product equals: ( 1 / 60 asScaledDecimal: 2 )
]

{ #category : 'tests - arithmetic' }
SequenceProductTest >> testExponentiation [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self assert: ( product raisedTo: 2 ) equals: 36.

  self assert: ( product raisedTo: 3 / 4 ) equals: ( 6 raisedTo: 3 / 4 ).

  self assert: ( product raisedTo: 0.1s2 ) equals: ( 6 raisedTo: 0.1s2 )
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testGreaterThan [

  | product |
  product := SequenceProduct ofAll: #( 1 3 ).

  self
    deny: product > product;
    assert: product > 1;
    deny: 1 > product.

  self
    assert: product > ( 3 / 4 );
    deny: ( 3 / 4 ) > product.

  self
    assert: product > 0.1s2;
    deny: 0.1s2 > product
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testGreaterThanEquals [

  | product |
  product := SequenceProduct ofAll: #( 1 3 ).

  self
    assert: product >= product;
    assert: product >= 1;
    deny: 1 >= product.

  self
    assert: product >= ( 3 / 4 );
    deny: ( 3 / 4 ) >= product.

  self
    assert: product >= 0.1s2;
    deny: 0.1s2 >= product
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testLessThan [

  | product |
  product := SequenceProduct ofAll: #( 1 3 ).

  self
    deny: product < product;
    deny: product < 1;
    assert: 1 < product.

  self
    deny: product < ( 3 / 4 );
    assert: ( 3 / 4 ) < product.

  self
    deny: product < 0.1s2;
    assert: 0.1s2 < product
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testLessThanEquals [

  | product |
  product := SequenceProduct ofAll: #( 1 3 ).

  self
    assert: product <= product;
    deny: product <= 1;
    assert: 1 <= product.

  self
    deny: product <= ( 3 / 4 );
    assert: ( 3 / 4 ) <= product.

  self
    deny: product <= 0.1s2;
    assert: 0.1s2 <= product
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testMax [

  | max min |
  max := SequenceProduct ofAll: #( 1 2 ).
  min := SequenceProduct ofAll: #( 1 0 ).

  self
    assert: ( max max: min ) equals: 2;
    assert: ( max max: 1 ) equals: 2;
    assert: ( max max: 4 ) equals: 4
]

{ #category : 'tests - magnitude' }
SequenceProductTest >> testMin [

  | max min |
  max := SequenceProduct ofAll: #( 1 2 ).
  min := SequenceProduct ofAll: #( 1 0 ).

  self
    assert: ( max min: min ) equals: 0;
    assert: ( max min: 1 ) equals: 1;
    assert: ( max min: 4 ) equals: 2
]

{ #category : 'tests - arithmetic' }
SequenceProductTest >> testMultiplication [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self
    assert: product * product equals: 36;
    assert: product * 2 equals: 12;
    assert: 2 * product equals: 12.

  self
    assert: product * ( 3 / 4 ) equals: 9 / 2;
    assert: ( 3 / 4 ) * product equals: 9 / 2.

  self
    assert: product * 0.1s2 equals: 0.6s2;
    assert: 0.1s2 * product equals: 0.6s2
]

{ #category : 'tests - printing' }
SequenceProductTest >> testPrintString [

  self
    assert: ( SequenceProduct ofAll: #(  ) ) printString equals: '1';
    assert: ( SequenceProduct ofAll: { 1 / 2 . 4 / 2 } ) printString equals: '1'
]

{ #category : 'tests - instance creation' }
SequenceProductTest >> testProductOfEmptySequence [

  | product |
  product := SequenceProduct ofAll: #(  ).

  self
    assert: product equals: 1;
    assert: product hash equals: 1 hash
]

{ #category : 'tests - instance creation' }
SequenceProductTest >> testProductOfFractions [

  | product |
  product := SequenceProduct ofAll: { 1 / 4 . 1 / 2 }.

  self
    assert: product equals: 1 / 8;
    assert: product hash equals: ( 1 / 8 ) hash
]

{ #category : 'tests - instance creation' }
SequenceProductTest >> testProductOfIntegers [

  | sum |
  sum := SequenceProduct ofAll: #( 1 2 3 4 5 6 ).

  self
    assert: sum equals: 720;
    assert: sum hash equals: 720 hash
]

{ #category : 'tests - instance creation' }
SequenceProductTest >> testProductOfScaledDecimals [

  | product |
  product := SequenceProduct ofAll: #( 0.2s2 0.5s2 ).

  self
    assert: product equals: 0.1s2;
    assert: product hash equals: 0.1s2 hash
]

{ #category : 'tests - instance creation' }
SequenceProductTest >> testProductOfSquares [

  | product |
  product := SequenceProduct of: [ :i | i squared ] from: 3 to: 6.

  self assert: product equals: 129600
]

{ #category : 'tests - arithmetic' }
SequenceProductTest >> testSquared [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self assert: product squared equals: 36
]

{ #category : 'tests - arithmetic' }
SequenceProductTest >> testSubtraction [

  | product |
  product := SequenceProduct ofAll: #( 3 2 ).

  self
    assert: ( product - product ) isZero;
    assert: product - 1 equals: 5;
    assert: 1 - product equals: -5.

  self
    assert: product - ( 3 / 4 ) equals: 21 / 4;
    assert: ( 3 / 4 ) - product equals: -21 / 4.

  self
    assert: product - 0.1s2 equals: 5.9s2;
    assert: 0.1s2 - product equals: -5.9s2
]
