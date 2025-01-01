Extension { #name : 'Number' }

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> additionWithQuantity: augend [

  ^ self isZero then: [ augend ] otherwise: [ Quantity cannotAddIncommensurableQuantities ]
]

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> divisionFromQuantity: dividend [

  ^ Quantity with: dividend numericalValue / self basedOn: dividend unit
]

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> isComparableTo: arithmeticObject [

  ^ arithmeticObject isNumber
]

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> isDimensionless [

  ^ true
]

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> productWithQuantity: multiplier [

  ^ self * multiplier
]

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> productWithUnit: unit [

  ^ Quantity with: self basedOn: unit
]

{ #category : '*Aconcagua-Quantitative-Analysis-Extensions' }
Number >> subtractionFromQuantity: minuend [

  ^ self isZero then: [ minuend ] otherwise: [ Quantity cannotSubtractIncommensurableQuantities ]
]
