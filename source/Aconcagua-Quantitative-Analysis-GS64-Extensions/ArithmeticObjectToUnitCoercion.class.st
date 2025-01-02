Class {
	#name : 'ArithmeticObjectToUnitCoercion',
	#superclass : 'Object',
	#instVars : [
		'arithmeticObject'
	],
	#category : 'Aconcagua-Quantitative-Analysis-GS64-Extensions',
	#package : 'Aconcagua-Quantitative-Analysis-GS64-Extensions'
}

{ #category : 'instance creation' }
ArithmeticObjectToUnitCoercion class >> for: anArithmeticObject [

  ^ self new initializeFor: anArithmeticObject
]

{ #category : 'arithmetic' }
ArithmeticObjectToUnitCoercion >> * unit [

  ^ unit * arithmeticObject
]

{ #category : 'arithmetic' }
ArithmeticObjectToUnitCoercion >> / unit [

  ^ unit inverse * arithmeticObject
]

{ #category : 'initialization' }
ArithmeticObjectToUnitCoercion >> initializeFor: anArithmeticObject [

  arithmeticObject := anArithmeticObject
]
