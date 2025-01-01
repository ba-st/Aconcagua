"
I'm an abstract class declaring the common behavior for arithmetic objects:
- Fundamental math operations: addition, subtraction, multiplication and division
- Exponentiation
"
Class {
	#name : 'ArithmeticObject',
	#superclass : 'Magnitude',
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'testing' }
ArithmeticObject class >> isAbstract [

  ^ self = ArithmeticObject
]

{ #category : 'arithmetic' }
ArithmeticObject >> * multiplicand [

  ^ self subclassResponsibility
]

{ #category : 'arithmetic' }
ArithmeticObject >> + addend [

  ^ self subclassResponsibility
]

{ #category : 'arithmetic' }
ArithmeticObject >> - subtrahend [

  ^ self subclassResponsibility
]

{ #category : 'arithmetic' }
ArithmeticObject >> / denominator [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
ArithmeticObject >> isDimensionless [

  ^ self value isDimensionless
]

{ #category : 'testing' }
ArithmeticObject >> isZero [

  ^ self subclassResponsibility
]

{ #category : 'arithmetic' }
ArithmeticObject >> raisedToInteger: exponent [

  ^ self subclassResponsibility
]

{ #category : 'arithmetic' }
ArithmeticObject >> squared [

  ^ self raisedToInteger: 2
]

{ #category : 'evaluating' }
ArithmeticObject >> value [

  ^ self subclassResponsibility
]
