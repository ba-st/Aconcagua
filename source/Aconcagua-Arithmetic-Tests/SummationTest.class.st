"
A SummationTest is a test class for testing the behavior of Summation
"
Class {
	#name : 'SummationTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Arithmetic-Tests',
	#package : 'Aconcagua-Arithmetic-Tests'
}

{ #category : 'tests - arithmetic' }
SummationTest >> testAddition [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: sum + sum equals: 6;
    assert: sum + 1 equals: 4;
    assert: 1 + sum equals: 4.

  self
    assert: sum + ( 3 / 4 ) equals: 15 / 4;
    assert: 3 / 4 + sum equals: 15 / 4.

  self
    assert: sum + 0.1s2 equals: 3.1s2;
    assert: 0.1s2 + sum equals: 3.1s2
]

{ #category : 'tests - magnitude' }
SummationTest >> testBetweenAnd [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: ( sum between: 1 and: sum );
    assert: ( sum between: sum and: sum );
    assert: ( sum between: sum and: 4 );
    assert: ( sum between: 1 and: 4 ).

  self
    deny: ( sum between: 1 and: 2 );
    deny: ( sum between: 4 and: 5 )
]

{ #category : 'tests - arithmetic' }
SummationTest >> testDivision [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: sum / sum equals: 1;
    assert: sum / 2 equals: 3/2;
    assert: 2 / sum equals: 2/3.

  self
    assert: sum / ( 3 / 4 ) equals: 4;
    assert: ( 3 / 4 ) / sum equals: 1 / 4.

  self
    assert: sum / 0.1s2 equals: 30.0s2;
    assert: 0.1s2 / sum equals: (1 / 30 asScaledDecimal: 2)
]

{ #category : 'tests - arithmetic' }
SummationTest >> testExponentiation [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self assert: ( sum raisedTo: 2 ) equals: 9.

  self assert: ( sum raisedTo: 3 / 4 ) equals: ( 3 raisedTo: 3 / 4 ).

  self assert: ( sum raisedTo: 0.1s2 ) equals: ( 3 raisedTo: 0.1s2 )
]

{ #category : 'tests - magnitude' }
SummationTest >> testGreaterThan [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    deny: sum > sum;
    assert: sum > 1;
    deny: 1 > sum.

  self
    assert: sum > ( 3 / 4 );
    deny: ( 3 / 4 ) > sum.

  self
    assert: sum > 0.1s2;
    deny: 0.1s2 > sum
]

{ #category : 'tests - magnitude' }
SummationTest >> testGreaterThanEquals [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: sum >= sum;
    assert: sum >= 1;
    deny: 1 >= sum.

  self
    assert: sum >= ( 3 / 4 );
    deny: ( 3 / 4 ) >= sum.

  self
    assert: sum >= 0.1s2;
    deny: 0.1s2 >= sum
]

{ #category : 'tests - magnitude' }
SummationTest >> testLessThan [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    deny: sum < sum;
    deny: sum < 1;
    assert: 1 < sum.

  self
    deny: sum < ( 3 / 4 );
    assert: ( 3 / 4 ) < sum.

  self
    deny: sum < 0.1s2;
    assert: 0.1s2 < sum
]

{ #category : 'tests - magnitude' }
SummationTest >> testLessThanEquals [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: sum <= sum;
    deny: sum <= 1;
    assert: 1 <= sum.

  self
    deny: sum <= ( 3 / 4 );
    assert: ( 3 / 4 ) <= sum.

  self
    deny: sum <= 0.1s2;
    assert: 0.1s2 <= sum
]

{ #category : 'tests - magnitude' }
SummationTest >> testMax [

  | maxSum minSum |
  maxSum := Summation ofAll: #( 1 2 ).
  minSum := Summation ofAll: #( 1 0 ).

  self
    assert: ( maxSum max: minSum ) equals: 3;
    assert: ( maxSum max: 1 ) equals: 3;
    assert: ( maxSum max: 4 ) equals: 4
]

{ #category : 'tests - magnitude' }
SummationTest >> testMin [

  | maxSum minSum |
  maxSum := Summation ofAll: #( 1 2 ).
  minSum := Summation ofAll: #( 1 0 ).

  self
    assert: ( maxSum min: minSum ) equals: 1;
    assert: ( maxSum min: 1 ) equals: 1;
    assert: ( maxSum min: 4 ) equals: 3
]

{ #category : 'tests - arithmetic' }
SummationTest >> testMultiplication [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: sum * sum equals: 9;
    assert: sum * 2 equals: 6;
    assert: 2 * sum equals: 6.

  self
    assert: sum * ( 3 / 4 ) equals: 9 / 4;
    assert: 3 / 4 * sum equals: 9 / 4.

  self
    assert: sum * 0.1s2 equals: 0.3s2;
    assert: 0.1s2 * sum equals: 0.3s2
]

{ #category : 'tests - printing' }
SummationTest >> testPrintString [

  self
    assert: ( Summation ofAll: #(  ) ) printString equals: '0';
    assert: ( Summation ofAll: { 1.01s2 . 2.01s2 } ) printString equals: 3.02s2 printString
]

{ #category : 'tests - arithmetic' }
SummationTest >> testSquared [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self assert: sum squared equals: 9
]

{ #category : 'tests - arithmetic' }
SummationTest >> testSubtraction [

  | sum |
  sum := Summation ofAll: #( 1 2 ).

  self
    assert: ( sum - sum ) isZero;
    assert: sum - 1 equals: 2;
    assert: 1 - sum equals: -2.

  self
    assert: sum - ( 3 / 4 ) equals: 9 / 4;
    assert: 3 / 4 - sum equals: -9 / 4.

  self
    assert: sum - 0.1s2 equals: 2.9s2;
    assert: 0.1s2 - sum equals: -2.9s2
]

{ #category : 'tests - instance creation' }
SummationTest >> testSummationOfEmptySequence [

  | sum |
  sum := Summation ofAll: #(  ).

  self
    assert: sum isZero;
    assert: sum equals: 0;
    assert: sum hash equals: 0 hash
]

{ #category : 'tests - instance creation' }
SummationTest >> testSummationOfFractions [

  | sum |
  sum := Summation ofAll: { 1 / 4 . 1 / 2 }.

  self
    assert: sum equals: 3 / 4;
    assert: sum hash equals: ( 3 / 4 ) hash
]

{ #category : 'tests - instance creation' }
SummationTest >> testSummationOfIntegers [

  | sum |
  sum := Summation ofAll: #( 1 2 3 4 5 6 ).

  self
    assert: sum equals: 21;
    assert: sum hash equals: 21 hash
]

{ #category : 'tests - instance creation' }
SummationTest >> testSummationOfScaledDecimals [

  | sum |
  sum := Summation ofAll: #( 0.25s2 0.5s2 ).

  self
    assert: sum equals: 0.75s2;
    assert: sum hash equals: 0.75s2 hash
]

{ #category : 'tests - instance creation' }
SummationTest >> testSummationOfSquares [

  | sum |
  sum := Summation of: [ :i | i squared ] from: 3 to: 6.

  self assert: sum equals: 86
]
