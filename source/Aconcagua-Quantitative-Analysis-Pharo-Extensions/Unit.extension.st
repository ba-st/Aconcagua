Extension { #name : 'Unit' }

{ #category : '*Aconcagua-Quantitative-Analysis-Pharo-Extensions' }
Unit >> adaptToNumber: number andSend: selector [

  selector = #* then: [ ^ self * number ].
  selector = #/ then: [ ^ self inverse * number ].
  self error: 'Unsupported operation'
]
