Extension { #name : 'Quantity' }

{ #category : '*Aconcagua-Quantitative-Analysis-Pharo-Extensions' }
Quantity >> adaptToNumber: number andSend: selector [

  selector = #* then: [ ^ self class with: number * numericalValue basedOn: unit ].
  selector = #/ then: [ ^ self class with: number / numericalValue basedOn: unit inverse ].
  selector = #+ then: [
      ^ number isZero then: [ self ] otherwise: [ self class cannotAddIncommensurableQuantities ] ].
  selector = #- then: [
      ^ number isZero
          then: [ self negated ]
          otherwise: [ self class cannotSubtractIncommensurableQuantities ]
    ].
  self error: 'Unsupported operation'
]
