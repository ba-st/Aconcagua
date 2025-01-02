"
An IntegerAsSuperscriptFormatterTest is a test class for testing the behavior of IntegerAsSuperscriptFormatter
"
Class {
	#name : 'IntegerAsSuperscriptFormatterTest',
	#superclass : 'TestCase',
	#instVars : [
		'formatter'
	],
	#category : 'Aconcagua-Arithmetic-Tests',
	#package : 'Aconcagua-Arithmetic-Tests'
}

{ #category : 'running' }
IntegerAsSuperscriptFormatterTest >> setUp [

  super setUp.
  formatter := IntegerAsSuperscriptFormatter new
]

{ #category : 'tests' }
IntegerAsSuperscriptFormatterTest >> testCantFormatInvalidObject [

  self
    should: [ formatter format: 1.5 ]
    raise: ObjectNotFound
    withMessageText: 'Cannot format an unexpected character: "."'
]

{ #category : 'tests' }
IntegerAsSuperscriptFormatterTest >> testFormatIntegerWithSeveralDigits [

  self assert: ( formatter format: 1234567890 ) equals: '¹²³⁴⁵⁶⁷⁸⁹⁰'
]

{ #category : 'tests' }
IntegerAsSuperscriptFormatterTest >> testFormatMinusOne [

  self assert: ( formatter format: -1 ) equals: '⁻¹'
]

{ #category : 'tests' }
IntegerAsSuperscriptFormatterTest >> testFormatNegativeInteger [

  self assert: ( formatter format: -10 ) equals: '⁻¹⁰'
]

{ #category : 'tests' }
IntegerAsSuperscriptFormatterTest >> testFormatOne [

  self assert: ( formatter format: 1 ) equals: ''
]

{ #category : 'tests' }
IntegerAsSuperscriptFormatterTest >> testFormatZero [

  self assert: ( formatter format: 0 ) equals: '⁰'
]
