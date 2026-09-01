"
An AccountDimensionTest is a test class for testing the behavior of AccountDimension
"
Class {
	#name : 'AccountDimensionTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'tests' }
AccountDimensionTest >> testComparison [

  | dimension |
  dimension := AccountDimension on: 'USD' symbol: '$'.
  self
    assert: dimension equals: ( AccountDimension on: 'USD' symbol: '$' );
    assert: dimension hash equals: ( AccountDimension on: 'USD' symbol: '$' ) hash;
    deny: dimension equals: ( AccountDimension on: 'ARS' symbol: '$' )
]

{ #category : 'tests' }
AccountDimensionTest >> testComparisonOfDerivedDimensions [

  | usd btc rate equalRate |
  usd := AccountDimension on: 'USD' symbol: '$'.
  btc := AccountDimension on: 'BTC' symbol: '₿'.
  rate := usd / btc.
  equalRate := ( AccountDimension on: 'USD' symbol: '$' )
    / ( AccountDimension on: 'BTC' symbol: '₿' ).

  self
    assert: rate equals: equalRate;
    assert: rate hash equals: equalRate hash;
    assert: ( equalRate occurrencesOf: usd ) equals: 1;
    assert: ( equalRate occurrencesOf: btc ) equals: -1
]

{ #category : 'tests' }
AccountDimensionTest >> testProductWithEqualDimension [

  | usd btc |
  usd := AccountDimension on: 'USD' symbol: '$'.
  btc := AccountDimension on: 'BTC' symbol: '₿'.

  self
    assert: ( usd / btc * ( AccountDimension on: 'USD' symbol: '$' ) ) printString
    equals: '$²₿⁻¹';
    assert: usd / btc * ( AccountDimension on: 'USD' symbol: '$' )
    equals: usd * usd / btc
]

{ #category : 'tests' }
AccountDimensionTest >> testPrintString [

  self assert: ( AccountDimension on: 'USD' symbol: '$' ) printString equals: '$'
]
