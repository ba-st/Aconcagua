"
A DiscreteIntervalTest is a test class for testing the behavior of DiscreteInterval
"
Class {
	#name : 'DiscreteIntervalTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Arithmetic-Tests',
	#package : 'Aconcagua-Arithmetic-Tests'
}

{ #category : 'tests' }
DiscreteIntervalTest >> testAt [

  | interval |
  interval := DiscreteInterval from: 11 to: 20 by: 2.

  self
    assert: interval first equals: 11;
    assert: ( interval at: 1 ) equals: 11;
    assert: ( interval at: 2 ) equals: 13;
    assert: ( interval at: 3 ) equals: 15;
    assert: ( interval at: 4 ) equals: 17;
    assert: ( interval at: 5 ) equals: 19;
    assert: interval last equals: 19
]

{ #category : 'tests' }
DiscreteIntervalTest >> testCantCreateInvalidIntervals [

  self
    should: [ DiscreteInterval from: 1 to: 0 by: 1 ]
    raise: InstanceCreationFailed
    withMessageText: 'Cannot create an interval with an invalid step'.

  self should: [ DiscreteInterval from: 1 to: -1 by: 1 ] raise: InstanceCreationFailed.
  self should: [ DiscreteInterval from: -1 to: -2 by: 1 ] raise: InstanceCreationFailed.
  self should: [ DiscreteInterval from: 1 to: 5 by: -1 ] raise: InstanceCreationFailed.
  self should: [ DiscreteInterval from: 1 to: 1 by: 0 ] raise: InstanceCreationFailed.

  self shouldnt: [ DiscreteInterval from: 1 to: 1 by: 1 ] raise: InstanceCreationFailed.
  self shouldnt: [ DiscreteInterval from: 1 to: 5 by: 10 ] raise: InstanceCreationFailed.
  self shouldnt: [ DiscreteInterval from: 1 to: 0 by: -2 ] raise: InstanceCreationFailed.

]

{ #category : 'tests' }
DiscreteIntervalTest >> testEnumeration [

  | interval sum numbers |
  interval := DiscreteInterval from: 1 to: 10 by: 1.
  sum := 0.

  interval do: [ :number | sum := sum + number ].

  self assert: sum equals: 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10.

  interval doWithIndex: [ :number :index | self assert: number equals: index ].

  numbers := OrderedCollection new.
  interval reverseDo: [ :number | numbers add: number ].

  self assert: numbers asArray equals: #( 10 9 8 7 6 5 4 3 2 1 )
]

{ #category : 'tests' }
DiscreteIntervalTest >> testInclusion [

  | interval |
  interval := DiscreteInterval from: 11 to: 20 by: 2.

  self
    deny: interval includes: 10;
    assert: interval includes: 11;
    assert: interval includes: 13;
    assert: interval includes: 15;
    assert: interval includes: 17;
    assert: interval includes: 19;
    deny: interval includes: 20
]

{ #category : 'tests' }
DiscreteIntervalTest >> testIndexOf [

  | interval |
  interval := DiscreteInterval from: 11 to: 20 by: 2.

  self
    assert: ( interval indexOf: 10 ) equals: 0;
    assert: ( interval indexOf: 11 ) equals: 1;
    assert: ( interval indexOf: 12 ) equals: 0;
    assert: ( interval indexOf: 13 ) equals: 2;
    assert: ( interval indexOf: 14 ) equals: 0;
    assert: ( interval indexOf: 15 ) equals: 3;
    assert: ( interval indexOf: 16 ) equals: 0;
    assert: ( interval indexOf: 17 ) equals: 4;
    assert: ( interval indexOf: 18 ) equals: 0;
    assert: ( interval indexOf: 19 ) equals: 5;
    assert: ( interval indexOf: 20 ) equals: 0
]
