"
This class is used to load Aconcagua from github repository
"
Class {
	#name : 'BaselineOfAconcagua',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAconcagua',
	#package : 'BaselineOfAconcagua'
}

{ #category : 'baselines' }
BaselineOfAconcagua >> baseline: spec [

  <baseline>
  spec for: #pharo do: [
      spec postLoadDoIt: #configureArithmeticObjectInstancesAsInvariant.
      self
        setUpDependencies: spec;
        setUpDeploymentPackages: spec;
        setUpTestPackages: spec.

      spec
        group: 'Tools' with: 'Buoy-Tools';
        group: 'Development' with: #( 'Tests' 'Tools' );
        group: 'CI' with: 'Tests';
        group: 'default' with: 'Development'
    ]
]

{ #category : 'postload' }
BaselineOfAconcagua >> configureArithmeticObjectInstancesAsInvariant [

	ArithmeticObject makeInstancesInvariant
]

{ #category : 'accessing' }
BaselineOfAconcagua >> projectClass [

	^ MetacelloCypressBaselineProject

]

{ #category : 'baselines' }
BaselineOfAconcagua >> setUpDependencies: spec [

  spec
    baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v8' ];
    project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
    project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
    project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ]
]

{ #category : 'baselines' }
BaselineOfAconcagua >> setUpDeploymentPackages: spec [

  spec
    package: 'Aconcagua-Arithmetic' with: [ spec requires: 'Buoy-Deployment' ];
    group: 'Deployment' with: 'Aconcagua-Arithmetic'.

  spec
    package: 'Aconcagua-Arithmetic-Pharo-Extensions'
    with: [ spec requires: 'Aconcagua-Arithmetic' ];
    group: 'Deployment' with: 'Aconcagua-Arithmetic-Pharo-Extensions'.

  spec
    package: 'Aconcagua-Quantitative-Analysis' with: [ spec requires: 'Aconcagua-Arithmetic' ];
    group: 'Deployment' with: 'Aconcagua-Quantitative-Analysis'.

  spec
    package: 'Aconcagua-Quantitative-Analysis-Extensions'
    with: [ spec requires: 'Aconcagua-Quantitative-Analysis' ];
    group: 'Deployment' with: 'Aconcagua-Quantitative-Analysis-Extensions'.

  spec
    package: 'Aconcagua-Quantitative-Analysis-Pharo-Extensions'
    with: [ spec requires: 'Aconcagua-Quantitative-Analysis-Extensions' ];
    group: 'Deployment' with: 'Aconcagua-Quantitative-Analysis-Pharo-Extensions'
]

{ #category : 'baselines' }
BaselineOfAconcagua >> setUpTestPackages: spec [

  spec
    package: 'Aconcagua-Arithmetic-Tests'
    with: [ spec requires: #( 'Aconcagua-Arithmetic-Pharo-Extensions'
           'Buoy-SUnit' ) ];
    group: 'Tests' with: 'Aconcagua-Arithmetic-Tests'.

  spec
    package: 'Aconcagua-Quantitative-Analysis-Tests' with: [
        spec requires: #( 'Aconcagua-Quantitative-Analysis-Pharo-Extensions'
               'Buoy-SUnit' )
      ];
    group: 'Tests' with: 'Aconcagua-Quantitative-Analysis-Tests'
]
