"
I'm a sequence product or finite product, the multiplication of a finite sequence of numbers, called factors; the result is their product.

Besides numbers, other types of values can be multiplied as well: functions, vectors, matrices, polynomials and, in general,
elements of any type of mathematical objects on which an operation denoted ""×"" is defined.
"
Class {
	#name : 'SequenceProduct',
	#superclass : 'ArithmeticFormula',
	#instVars : [
		'factors'
	],
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic'
}

{ #category : 'instance creation' }
SequenceProduct class >> of: block from: start to: end [

  ^ self ofAll: ( start to: end ) applying: block
]

{ #category : 'instance creation' }
SequenceProduct class >> ofAll: factors [

  ^ self new initializeOfAll: factors
]

{ #category : 'instance creation' }
SequenceProduct class >> ofAll: collection applying: block [

  ^ self ofAll: ( collection collect: block )
]

{ #category : 'initialization' }
SequenceProduct >> initializeOfAll: theFactors [

  factors := theFactors
]

{ #category : 'evaluating' }
SequenceProduct >> valueIn: arithmeticContext [

  ^ factors
      inject: arithmeticContext multiplicationIdentity
      into: [ :product :factor | product * factor ]
]
