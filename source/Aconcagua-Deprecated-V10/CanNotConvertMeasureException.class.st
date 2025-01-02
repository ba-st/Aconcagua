Class {
	#name : 'CanNotConvertMeasureException',
	#superclass : 'Object',
	#category : 'Aconcagua-Deprecated-V10',
	#package : 'Aconcagua-Deprecated-V10'
}

{ #category : 'testing' }
CanNotConvertMeasureException class >> isDeprecated [

  ^ true
]

{ #category : 'signaling' }
CanNotConvertMeasureException class >> signalSourceMeasure: aSourceMeasure targetUnit: aTargetUnit [

  self
    deprecated: 'Use ArithmeticError'
    transformWith:
      'CanNotConvertMeasureException signalSourceMeasure: `@source targetUnit: `@target'
      -> 'ArithmeticError signal: ''Incommensurable units are not comparable'''.

  ArithmeticError signal: 'Incommensurable units are not comparable'
]
