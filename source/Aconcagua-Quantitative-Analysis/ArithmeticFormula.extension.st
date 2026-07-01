Extension { #name : 'ArithmeticFormula' }

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> convertTo: targetUnit [

  ^ self value convertTo: targetUnit
]

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> numericalValue [

  ^ self value numericalValue
]

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> numericalValueInCanonicalUnit [

  ^ self value numericalValueInCanonicalUnit
]

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> productWithQuantity: multiplier [

  ^ self value productWithQuantity: multiplier
]

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> productWithUnit: unit [

  ^ self value productWithUnit: unit
]

{ #category : '*Aconcagua-Quantitative-Analysis' }
ArithmeticFormula >> unit [

  ^ self value unit
]
