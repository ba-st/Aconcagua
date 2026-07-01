"
An arithmetic formula is a mathematical expression that involves arithmetic operations like addition,
subtraction, multiplication, and division.

It typically describes a relationship between numbers, variables, or both, and is used to perform calculations.
"
Class {
	#name : 'ArithmeticFormula',
	#superclass : 'ArithmeticObject',
	#instVars : [
		'value'
	],
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic'
}

{ #category : 'testing' }
ArithmeticFormula class >> isAbstract [

  <ignoreForCoverage>
  ^ self = ArithmeticFormula
]

{ #category : 'arithmetic' }
ArithmeticFormula >> * multiplicand [

  ^ self value * multiplicand
]

{ #category : 'arithmetic' }
ArithmeticFormula >> + addend [

  ^ self value + addend value
]

{ #category : 'arithmetic' }
ArithmeticFormula >> - subtrahend [

  ^ self value - subtrahend value
]

{ #category : 'arithmetic' }
ArithmeticFormula >> / denominator [

  ^ self value / denominator
]

{ #category : 'comparing' }
ArithmeticFormula >> < arithmeticObject [

  ^ self value < arithmeticObject value
]

{ #category : 'comparing' }
ArithmeticFormula >> = arithmeticObject [

  ^ self value = arithmeticObject value
]

{ #category : 'arithmetic' }
ArithmeticFormula >> abs [

  ^ self value abs
]

{ #category : 'private' }
ArithmeticFormula >> defaultArithmeticContext [

  ^ ArithmeticContext default
]

{ #category : 'comparing' }
ArithmeticFormula >> hash [

  ^ self value hash
]

{ #category : 'testing' }
ArithmeticFormula >> isA: aClass [

  ^ ( super isA: aClass ) or: [ self value isA: aClass ]
]

{ #category : 'testing' }
ArithmeticFormula >> isNumber [

  ^ self value isNumber
]

{ #category : 'testing' }
ArithmeticFormula >> isZero [

  ^ self value isZero
]

{ #category : 'testing' }
ArithmeticFormula >> negative [

  ^ self value negative
]

{ #category : 'testing' }
ArithmeticFormula >> positive [

  ^ self value positive
]

{ #category : 'printing' }
ArithmeticFormula >> printOn: stream [

  self value printOn: stream
]

{ #category : 'private' }
ArithmeticFormula >> productWithPartsPerFractionRatio: number [

  ^ self value * number
]

{ #category : 'arithmetic' }
ArithmeticFormula >> raisedTo: exponent [

  ^ self value raisedTo: exponent value
]

{ #category : 'arithmetic' }
ArithmeticFormula >> raisedToInteger: exponent [

  ^ self value raisedToInteger: exponent
]

{ #category : 'arithmetic' }
ArithmeticFormula >> reciprocal [

  ^ self value reciprocal
]

{ #category : 'truncation and round off' }
ArithmeticFormula >> truncated [

	^self value truncated
]

{ #category : 'evaluating' }
ArithmeticFormula >> value [

  value ifNil: [ value := self valueIn: self defaultArithmeticContext ].
  ^ value
]

{ #category : 'evaluating' }
ArithmeticFormula >> valueIn: arithmeticContext [

  ^ self subclassResponsibility
]
