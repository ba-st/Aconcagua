"
This class is used to load Aconcagua from github repository
"
Class {
	#name : #BaselineOfAconcagua,
	#superclass : #BaselineOf,
	#instVars : [
		'repositories'
	],
	#category : 'BaselineOfAconcagua'
}

{ #category : #baselines }
BaselineOfAconcagua >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			
			spec
				package: 'Aconcagua-Core' with: [ spec requires: 'Mole' ];
				package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].

			spec
				group: 'Deployment' with: #('Aconcagua-Core');
				group: 'Development' with: #('Aconcagua-Tests');
				group: 'default' with: #('Development') ]
]

{ #category : #baselines }
BaselineOfAconcagua >> setUpDependencies: spec [

	spec
		baseline: 'Mole'
		with: [ spec
				repository: 'github://ba-st/Mole:v1/source';
				loads: #('Deployment') ]
]
