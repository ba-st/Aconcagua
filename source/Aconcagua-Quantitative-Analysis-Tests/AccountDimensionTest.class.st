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
AccountDimensionTest >> testPrintString [

  self assert: ( AccountDimension on: 'USD' symbol: '$' ) printString equals: '$'
]
