Class {
	#name : 'ArithmeticObjectToQuantityCoercion',
	#superclass : 'Object',
	#instVars : [
		'arithmeticObject'
	],
	#category : 'Aconcagua-Quantitative-Analysis-GS64-Extensions',
	#package : 'Aconcagua-Quantitative-Analysis-GS64-Extensions'
}

{ #category : 'instance creation' }
ArithmeticObjectToQuantityCoercion class >> for: anArithmeticObject [

  ^ self new initializeFor: anArithmeticObject
]

{ #category : 'arithmetic' }
ArithmeticObjectToQuantityCoercion >> * quantity [

  ^ quantity class with: arithmeticObject * quantity numericalValue basedOn: quantity unit
]

{ #category : 'arithmetic' }
ArithmeticObjectToQuantityCoercion >> + quantity [

  ^ arithmeticObject isZero
      then: [ quantity ]
      otherwise: [ quantity class cannotAddIncommensurableQuantities ]
]

{ #category : 'arithmetic' }
ArithmeticObjectToQuantityCoercion >> - quantity [

  ^ arithmeticObject isZero
      then: [ quantity negated ]
      otherwise: [ quantity class cannotSubtractIncommensurableQuantities ]
]

{ #category : 'arithmetic' }
ArithmeticObjectToQuantityCoercion >> / quantity [

  ^ quantity class with: arithmeticObject / quantity numericalValue basedOn: quantity unit inverse
]

{ #category : 'initialization' }
ArithmeticObjectToQuantityCoercion >> initializeFor: anArithmeticObject [

  arithmeticObject := anArithmeticObject
]
