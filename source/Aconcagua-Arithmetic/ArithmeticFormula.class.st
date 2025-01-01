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

  ^ self = ArithmeticFormula
]

{ #category : 'arithmetic' }
ArithmeticFormula >> * multiplicand [

  ^ self value * multiplicand value
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

  ^ self value / denominator value
]

{ #category : 'comparing' }
ArithmeticFormula >> < arithmeticObject [

  ^ self value < arithmeticObject value
]

{ #category : 'comparing' }
ArithmeticFormula >> = arithmeticObject [

  ^ self value = arithmeticObject value
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
ArithmeticFormula >> isZero [

  ^ self value isZero
]

{ #category : 'printing' }
ArithmeticFormula >> printOn: stream [

  self value printOn: stream
]

{ #category : 'arithmetic' }
ArithmeticFormula >> raisedTo: exponent [

  ^ self value raisedTo: exponent value
]

{ #category : 'arithmetic' }
ArithmeticFormula >> raisedToInteger: exponent [

  ^ self value raisedToInteger: exponent
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
