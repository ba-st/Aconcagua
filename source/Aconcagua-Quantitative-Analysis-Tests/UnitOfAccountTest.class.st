"
An UnitOfAccountTest is a test class for testing the behavior of UnitOfAccount
"
Class {
	#name : 'UnitOfAccountTest',
	#superclass : 'TestCase',
	#instVars : [
		'usdt',
		'btc',
		'second',
		'centisecond'
	],
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'running' }
UnitOfAccountTest >> setUp [

  super setUp.
  usdt := UnitOfAccount on: 'USDT' symbol: '₮'.
  btc := UnitOfAccount on: 'BTC' symbol: '₿'.
  second := BaseUnitOfMeasure
             basedOn: Dimension length
             singularNamed: 'second'
             pluralNamed: 'seconds'
             symbol: 's'.
  centisecond := MultipleUnitOfMeasure
                  basedOn: second
                  prefixedBy: 'centi'
                  symbolPrefixedBy: 'c'
                  raisedTo: -2
]

{ #category : 'tests' }
UnitOfAccountTest >> testAccessing [

  self
    assert: usdt printString equals: '₮';
    assert: usdt symbol equals: '₮';
    assert: btc printString equals: '₿';
    assert: btc symbol equals: '₿'
]

{ #category : 'tests' }
UnitOfAccountTest >> testCannotConvertIncommensurableQuantities [

  self
    should: [ 5 * second convertTo: usdt ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ 500 * usdt convertTo: btc ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ 50 * btc convertTo: btc inverse ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ 50 * btc convertTo: second ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units'
]

{ #category : 'tests' }
UnitOfAccountTest >> testCantAddIncommensurableQuantities [

  | oneThousandUSDT oneBitcoin |
  oneThousandUSDT := 1000 * usdt.
  oneBitcoin := 1 * btc.

  self
    should: [ oneThousandUSDT + oneBitcoin ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'.

  self
    should: [ 1 + oneBitcoin ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'.

  self
    should: [ oneBitcoin + 1 ]
    raise: ArithmeticError
    withMessageText: 'Cannot add incommensurable quantities'
]

{ #category : 'tests' }
UnitOfAccountTest >> testCantSubtractIncommensurableQuantities [

  | oneThousandUSDT oneBitcoin |
  oneThousandUSDT := 1000 * usdt.
  oneBitcoin := 1 * btc.

  self
    should: [ oneThousandUSDT - oneBitcoin ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract incommensurable quantities'.

  self
    should: [ 1 - oneBitcoin ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract incommensurable quantities'.

  self
    should: [ oneBitcoin - 1 ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract incommensurable quantities'
]

{ #category : 'tests' }
UnitOfAccountTest >> testCommensurability [

  self
    assert: ( usdt isCommensurableWith: usdt );
    deny: ( usdt isCommensurableWith: btc );
    deny: ( usdt isCommensurableWith: second );
    deny: ( usdt isCommensurableWith: centisecond )
]

{ #category : 'tests' }
UnitOfAccountTest >> testComparison [

  self
    assert: usdt equals: usdt;
    assert: usdt hash equals: usdt hash;
    assert: usdt * usdt equals: usdt * usdt;
    assert: ( usdt * usdt ) hash equals: ( usdt * usdt ) hash;
    assert: usdt * btc equals: btc * usdt;
    assert: ( usdt * btc ) hash equals: ( btc * usdt ) hash;
    deny: usdt equals: btc
]

{ #category : 'tests' }
UnitOfAccountTest >> testConvertTo [

  | satoshi |
  satoshi := MultipleUnitOfMeasure
               basedOn: btc
               singularNamed: 'satoshi'
               pluralNamed: 'satoshis'
               symbol: 'st'
               raisedTo: -8.

  self
    assert: 100000000 * satoshi equals: 1 * btc;
    assert: ( 100000000 * satoshi convertTo: btc ) printString equals: '1 ₿';
    assert: ( 100000000 * satoshi ) + ( 1 * btc ) equals: 2 * btc
]

{ #category : 'tests' }
UnitOfAccountTest >> testDivision [

  self
    assert: ( usdt / usdt ) printString equals: '';
    assert: ( usdt / usdt ) isDimensionless;
    assert: ( usdt / centisecond ) printString equals: '₮/cs';
    assert: ( usdt * usdt / centisecond ) printString equals: '₮²/cs';
    assert: ( btc / usdt ) printString equals: '₿/₮'
]

{ #category : 'tests' }
UnitOfAccountTest >> testInverse [

  self
    assert: usdt inverse symbol equals: '1/₮';
    assert: usdt inverse printString equals: '1/₮'.

  self assert: ( usdt * usdt ) inverse symbol equals: '1/₮²'.

  self assert: ( usdt * btc * second ) inverse symbol equals: '1/₮·₿·s'.

  self assert: ( usdt * usdt * second inverse ) symbol equals: '₮²/s'.

  self assert: ( usdt inverse * second inverse ) symbol equals: '1/₮·s'.

  self
    assert: ( usdt * usdt inverse ) symbol equals: '';
    assert: ( usdt * usdt inverse ) isDimensionless.

  self assert: ( usdt * usdt * usdt inverse ) symbol equals: '₮'
]

{ #category : 'tests' }
UnitOfAccountTest >> testIsDimensionless [

  self deny: usdt isDimensionless
]

{ #category : 'tests' }
UnitOfAccountTest >> testMultiplication [

  self
    assert: ( usdt * usdt ) printString equals: '₮²';
    assert: ( btc * btc ) printString equals: '₿²';
    assert: ( usdt * usdt * btc ) printString equals: '₮²·₿';
    assert: usdt * ( 1 * usdt ) equals: 1 * (usdt * usdt)
]

{ #category : 'tests' }
UnitOfAccountTest >> testQuantityAddition [

  | oneThousandUSDT oneHundredUSDT |
  oneThousandUSDT := 1000 * usdt.
  oneHundredUSDT := 100 * usdt.

  self
    assert: oneThousandUSDT + oneHundredUSDT equals: 1100 * usdt;
    assert: ( oneThousandUSDT + oneHundredUSDT ) printString equals: '1100 ₮'
]

{ #category : 'tests' }
UnitOfAccountTest >> testQuantitySubtraction [

  | oneThousandUSDT oneHundredUSDT |
  oneThousandUSDT := 1000 * usdt.
  oneHundredUSDT := 100 * usdt.

  self
    assert: oneThousandUSDT - oneHundredUSDT equals: 900 * usdt;
    assert: ( oneThousandUSDT - oneHundredUSDT ) printString equals: '900 ₮'
]

{ #category : 'tests' }
UnitOfAccountTest >> testRaisedToInteger [

  self
    assert: ( usdt raisedToInteger: 2 ) equals: usdt * usdt;
    assert: ( usdt raisedToInteger: 3 ) equals: usdt * usdt * usdt;
    assert: ( usdt raisedToInteger: 1 ) equals: usdt;
    assert: ( usdt raisedToInteger: -1 ) equals: usdt inverse;
    assert: ( usdt * usdt raisedToInteger: 3 ) equals: usdt * usdt * usdt * usdt * usdt * usdt;
    assert: ( usdt * usdt raisedToInteger: -1 ) equals: ( usdt raisedToInteger: 2 ) inverse
]
