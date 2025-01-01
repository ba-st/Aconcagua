Class {
	#name : 'ArithmeticObjectToFormulaCoercion',
	#superclass : 'Object',
	#instVars : [
		'aithmeticObject'
	],
	#category : 'Aconcagua-Arithmetic-GS64-Extensions',
	#package : 'Aconcagua-Arithmetic-GS64-Extensions'
}

{ #category : 'instance creation' }
ArithmeticObjectToFormulaCoercion class >> for: anArithmeticObject [

	^self new initializeFor: anArithmeticObject
]

{ #category : 'arithmetic' }
ArithmeticObjectToFormulaCoercion >> * arithmeticFormula [

  ^ aithmeticObject * arithmeticFormula value
]

{ #category : 'arithmetic' }
ArithmeticObjectToFormulaCoercion >> + arithmeticFormula [

  ^ aithmeticObject + arithmeticFormula value
]

{ #category : 'arithmetic' }
ArithmeticObjectToFormulaCoercion >> - arithmeticFormula [

  ^ aithmeticObject - arithmeticFormula value
]

{ #category : 'arithmetic' }
ArithmeticObjectToFormulaCoercion >> / arithmeticFormula [

  ^ aithmeticObject / arithmeticFormula value
]

{ #category : 'comparing' }
ArithmeticObjectToFormulaCoercion >> < arithmeticFormula [

  ^ aithmeticObject < arithmeticFormula value
]

{ #category : 'comparing' }
ArithmeticObjectToFormulaCoercion >> <= arithmeticFormula [

  ^ aithmeticObject <= arithmeticFormula value
]

{ #category : 'comparing' }
ArithmeticObjectToFormulaCoercion >> = arithmeticFormula [

  ^ aithmeticObject = arithmeticFormula value
]

{ #category : 'comparing' }
ArithmeticObjectToFormulaCoercion >> > arithmeticFormula [

  ^ aithmeticObject > arithmeticFormula value
]

{ #category : 'comparing' }
ArithmeticObjectToFormulaCoercion >> >= arithmeticFormula [

  ^ aithmeticObject >= arithmeticFormula value
]

{ #category : 'comparing' }
ArithmeticObjectToFormulaCoercion >> hash [

  ^ aithmeticObject hash
]

{ #category : 'initialization' }
ArithmeticObjectToFormulaCoercion >> initializeFor: anArithmeticObject [

  aithmeticObject := anArithmeticObject
]
