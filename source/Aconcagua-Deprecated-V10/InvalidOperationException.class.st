Class {
	#name : 'InvalidOperationException',
	#superclass : 'Error',
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'testing' }
InvalidOperationException class >> isDeprecated [
  "Replaced by ArithmeticError"

  ^ true
]
