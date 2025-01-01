"
A unit of measurement, or unit of measure, is a definite magnitude of a quantity,
defined and adopted by convention or by law, that is used as a standard for
measurement of the same kind of quantity.

Any other quantity of that kind can be expressed as a multiple of the unit of measurement.
"
Class {
	#name : 'UnitOfMeasure',
	#superclass : 'Unit',
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'testing' }
UnitOfMeasure class >> isAbstract [

  ^ self = UnitOfMeasure
]

{ #category : 'accessing' }
UnitOfMeasure >> dimension [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
UnitOfMeasure >> isCommensurableWith: unitOfMeasure [

  ^ self dimension = unitOfMeasure dimension
]

{ #category : 'testing' }
UnitOfMeasure >> isDimensionless [

  ^ self dimension isDimensionless
]

{ #category : 'accessing' }
UnitOfMeasure >> pluralName [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
UnitOfMeasure >> singularName [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
UnitOfMeasure >> symbol [

  ^ self subclassResponsibility
]
