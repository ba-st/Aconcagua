"
A discrete interval is a finite set of discrete values that lie within certain bounds,
usually taken from the set of integers or some other countable set.

This implementation can be used with any arithmetic objects as the values
"
Class {
	#name : 'DiscreteInterval',
	#superclass : 'SequenceableCollection',
	#instVars : [
		'start',
		'end',
		'step',
		'count'
	],
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic'
}

{ #category : 'instance creation' }
DiscreteInterval class >> from: start to: end by: step [

  AssertionChecker
    enforce: [ start isComparableTo: step ]
    because: 'Cannot create an interval with incommensurable quantities' localized
    raising: ArithmeticError.

  AssertionChecker
    refuse: [ step isZero ]
    because: 'Cannot create an interval with an invalid step' localized
    raising: InstanceCreationFailed.

  ^ self new initializeFrom: start to: end by: step
]

{ #category : 'adding' }
DiscreteInterval >> add: newObject [

  <ignoreForCoverage>
  self shouldNotImplement
]

{ #category : 'accessing' }
DiscreteInterval >> at: index [

  AssertionChecker
    enforce: [ index between: 1 and: count ]
    because: 'Index out of range' localized
    raising: SubscriptOutOfBounds.

  ^ start + ( ( index -  1 ) * step )
]

{ #category : 'accessing' }
DiscreteInterval >> at: index put: object [

  <ignoreForCoverage>
  self shouldNotImplement
]

{ #category : 'initialization' }
DiscreteInterval >> initializeCount [

  count := ( end - start / step ) truncated + 1.
  AssertionChecker
    enforce: [ count strictlyPositive ]
    because: 'Cannot create an interval with an invalid step' localized
    raising: InstanceCreationFailed
]

{ #category : 'initialization' }
DiscreteInterval >> initializeFrom: theStart to: theEnd by: aStep [

  start := theStart.
  end := theEnd.
  step := aStep.
  self initializeCount
]

{ #category : 'accessing' }
DiscreteInterval >> size [

  ^ count
]
