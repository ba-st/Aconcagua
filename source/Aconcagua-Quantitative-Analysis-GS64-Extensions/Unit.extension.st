Extension { #name : 'Unit' }

{ #category : '*Aconcagua-Quantitative-Analysis-GS64-Extensions' }
Unit >> _coerce: arithmeticObject [

  ^ ArithmeticObjectToUnitCoercion for: arithmeticObject
]

{ #category : '*Aconcagua-Quantitative-Analysis-GS64-Extensions' }
Unit >> _generality [

  ^ 110
]
