Extension { #name : 'ArithmeticFormula' }

{ #category : '*Aconcagua-Arithmetic-Pharo-Extensions' }
ArithmeticFormula >> adaptToNumber: number andSend: selector [

  ^ number perform: selector with: self value
]
