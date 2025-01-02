"
A DimensionTest is a test class for testing the behavior of Dimension
"
Class {
	#name : 'DimensionTest',
	#superclass : 'TestCase',
	#instVars : [
		'length',
		'time'
	],
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'running' }
DimensionTest >> setUp [

  super setUp.
  length := BaseDimension named: 'Length' symbol: 'L'.
  time := BaseDimension named: 'Time' symbol: 'T'
]

{ #category : 'tests' }
DimensionTest >> testBaseDimensions [

  self
    assert: ( Dimension length * Dimension time * Dimension mass * Dimension electricCurrent
        * Dimension thermodynamicTemperature * Dimension luminousIntensity
        * Dimension amountOfSubstance ) printString
    equals: 'IJLMNTΘ'
]

{ #category : 'tests' }
DimensionTest >> testCreation [

  self
    assert: length name equals: 'Length';
    assert: length symbol equals: 'L';
    deny: length isDimensionless
]

{ #category : 'tests' }
DimensionTest >> testDimensionlessAfterDivision [

  | squaredLength |
  squaredLength := length * length.
  self
    assert: ( squaredLength / squaredLength ) isDimensionless;
    assert: ( squaredLength / squaredLength ) printString equals: '';
    assert: ( length / length ) isDimensionless;
    assert: ( length / length ) printString equals: '';
    assert: ( (length * time) / (length * time) ) isDimensionless;
    assert: ( (length * time) / (length * time) ) printString equals: ''
]

{ #category : 'tests' }
DimensionTest >> testDivisionOfDifferentDimensions [

  | squaredLength |
  squaredLength := length * length.

  self
    assert: ( length / time ) printString equals: 'LT⁻¹';
    assert: ( squaredLength / time ) printString equals: 'L²T⁻¹';
    assert: squaredLength / time equals: time inverse * squaredLength;
    assert: ( squaredLength / time ) hash equals: ( time inverse * squaredLength ) hash
]

{ #category : 'tests' }
DimensionTest >> testDivisionOfTheSameDimension [

  | squaredLength |
  squaredLength := length * length.

  self
    assert: squaredLength / length equals: length;
    assert: ( squaredLength / length ) hash equals: length hash;
    assert: ( squaredLength / length ) printString equals: 'L'.

  self
    assert: length / squaredLength equals: length inverse;
    assert: ( length / squaredLength ) hash equals: length inverse hash;
    assert: ( length / squaredLength ) printString equals: 'L⁻¹'.

  self
    assert: squaredLength / ( squaredLength * squaredLength ) equals: squaredLength inverse;
    assert: ( squaredLength / ( squaredLength * squaredLength ) ) hash
    equals: squaredLength inverse hash;
    assert: ( squaredLength / ( squaredLength * squaredLength ) ) printString equals: 'L⁻²'
]

{ #category : 'tests' }
DimensionTest >> testInverse [

  self
    assert: length inverse printString equals: 'L⁻¹';
    assert: ( length * length ) inverse printString equals: 'L⁻²'
]

{ #category : 'tests' }
DimensionTest >> testMultiplicationOfDifferentDimensions [

  | squaredLength |
  squaredLength := length * length.

  self
    assert: ( length * time ) printString equals: 'LT';
    assert: ( squaredLength * time ) printString equals: 'L²T';
    assert: squaredLength * time equals: time * squaredLength;
    assert: ( squaredLength * time ) hash equals: ( time * squaredLength ) hash
]

{ #category : 'tests' }
DimensionTest >> testMultiplicationOfTheSameDimension [

  | squaredLength |
  squaredLength := length * length.

  self
    deny: squaredLength isDimensionless;
    assert: squaredLength printString equals: 'L²';
    assert: squaredLength equals: length * length;
    assert: length * length equals: squaredLength;
    assert: squaredLength hash equals: ( length * length ) hash.

  self
    assert: ( squaredLength * length ) printString equals: 'L³';
    assert: ( length * squaredLength ) printString equals: 'L³';
    assert: length * squaredLength equals: squaredLength * length;
    assert: ( squaredLength * squaredLength ) printString equals: 'L⁴'.

  self
    deny: squaredLength equals: squaredLength * length;
    deny: squaredLength equals: length
]

{ #category : 'tests' }
DimensionTest >> testOccurencesOf [

  self
    assert: ( Dimension length * Dimension time occurrencesOf: Dimension mass ) equals: 0;
    assert: ( Dimension length * Dimension time occurrencesOf: Dimension length ) equals: 1
]

{ #category : 'tests' }
DimensionTest >> testPrintString [

  self
    assert: length printString equals: 'L';
    assert: ( length * length ) printString equals: 'L²';
    assert: ( length * length * time * time ) printString equals: 'L²T²'
]

{ #category : 'tests' }
DimensionTest >> testQuantityComparison [

  self
    assert: length equals: length;
    assert: length hash equals: length hash;
    deny: length equals: time
]
