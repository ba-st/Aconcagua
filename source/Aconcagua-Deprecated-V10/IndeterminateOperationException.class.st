Class {
	#name : 'IndeterminateOperationException',
	#superclass : 'Error',
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'testing' }
IndeterminateOperationException class >> isDeprecated [ 

	^true
]

{ #category : 'signaling' }
IndeterminateOperationException class >> signalOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

  self deprecated: 'Use ArithmeticError instead'.
  ArithmeticError signal
]
