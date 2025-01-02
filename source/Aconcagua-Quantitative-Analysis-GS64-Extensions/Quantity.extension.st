Extension { #name : 'Quantity' }

{ #category : '*Aconcagua-Quantitative-Analysis-GS64-Extensions' }
Quantity >> _coerce: arithmeticObject [

  ^ ArithmeticObjectToQuantityCoercion for: arithmeticObject
]

{ #category : '*Aconcagua-Quantitative-Analysis-GS64-Extensions' }
Quantity >> _generality [

  ^ 115
]
