"
I'm a summation, the addition of a finite sequence of numbers, called addends or summands; the result is their sum or total.

Besides numbers, other types of values can be summed as well: functions, vectors, matrices, polynomials and, in general,
elements of any type of mathematical objects on which an operation denoted ""+"" is defined.
"
Class {
	#name : 'Summation',
	#superclass : 'ArithmeticFormula',
	#instVars : [
		'addends'
	],
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic'
}

{ #category : 'instance creation' }
Summation class >> of: block from: start to: end [

  ^ self ofAll: ( start to: end ) applying: block
]

{ #category : 'instance creation' }
Summation class >> ofAll: addends [

  ^ self new initializeOfAll: addends
]

{ #category : 'instance creation' }
Summation class >> ofAll: collection applying: block [

  ^ self ofAll: ( collection collect: block )
]

{ #category : 'initialization' }
Summation >> initializeOfAll: theAddends [

  addends := theAddends
]

{ #category : 'evaluating' }
Summation >> valueIn: arithmeticContext [

  ^ addends inject: arithmeticContext additionIdentity into: [ :sum :addend | sum + addend ]
]
