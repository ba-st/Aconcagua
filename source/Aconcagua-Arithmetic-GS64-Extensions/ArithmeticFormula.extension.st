Extension { #name : 'ArithmeticFormula' }

{ #category : '*Aconcagua-Arithmetic-GS64-Extensions' }
ArithmeticFormula >> _coerce: arithmeticObject [

  ^ ArithmeticObjectToFormulaCoercion for: arithmeticObject
]

{ #category : '*Aconcagua-Arithmetic-GS64-Extensions' }
ArithmeticFormula >> _generality [

  ^ 120
]
