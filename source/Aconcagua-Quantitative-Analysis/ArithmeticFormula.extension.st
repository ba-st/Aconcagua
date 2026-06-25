Extension { #name : 'ArithmeticFormula' }

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> productWithQuantity: multiplier [

  ^ self value productWithQuantity: multiplier
]

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> productWithUnit: unit [

  ^ self value productWithUnit: unit
]
