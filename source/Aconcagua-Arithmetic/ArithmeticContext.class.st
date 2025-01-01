Class {
	#name : 'ArithmeticContext',
	#superclass : 'Object',
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic'
}

{ #category : 'accessing' }
ArithmeticContext class >> default [

  ^ self new
]

{ #category : 'accessing' }
ArithmeticContext >> additionIdentity [

  ^ 0
]

{ #category : 'accessing' }
ArithmeticContext >> multiplicationIdentity [

  ^ 1
]
