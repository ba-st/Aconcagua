"
A DerivedUnitTest is a test class for testing the behavior of DerivedUnit
"
Class {
	#name : 'DerivedUnitTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'second',
		'kelvin'
	],
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'running' }
DerivedUnitTest >> setUp [

  super setUp.
  meter := InternationalSystemOfUnits units >> #meter.
  second := InternationalSystemOfUnits units >> #second.
  kelvin := InternationalSystemOfUnits units >> #kelvin
]

{ #category : 'tests' }
DerivedUnitTest >> testAliases [

  | squaredMeter |
  squaredMeter := meter * meter aliasedBy: 'squared meter' plural: 'squared meters' symbol: 'sqm'.
  self
    assert: ( 15 * squaredMeter ) printString equals: '15 sqm';
    assert: squaredMeter singularName equals: 'squared meter';
    assert: squaredMeter pluralName equals: 'squared meters'
]

{ #category : 'tests' }
DerivedUnitTest >> testOccurrencesOf [

  self
    assert: ( meter * meter * second occurrencesOf: meter ) equals: 2;
    assert: ( meter * meter * second occurrencesOf: second ) equals: 1;
    assert: ( meter * second occurrencesOf: kelvin ) equals: 0
]

{ #category : 'tests' }
DerivedUnitTest >> testPluralName [

  self assert: ( meter * second ) pluralName equals: 'meters·seconds'
]

{ #category : 'tests' }
DerivedUnitTest >> testSingularName [

  self assert: ( meter * second ) singularName equals: 'meter·second'
]
