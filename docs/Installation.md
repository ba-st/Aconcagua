# Installation

## Basic Installation

You can load **Aconcagua** evaluating:
```smalltalk
Metacello new
	baseline: 'Aconcagua';
	repository: 'github://ba-st/Aconcagua:v{version}/source';
	load.
```
>  Change `{version}` to some released version if you want a pinned one.

## Using as dependency

In order to include **Aconcagua** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

	spec
		baseline: 'Aconcagua'
			with: [ spec
				repository: 'github://ba-st/Aconcagua:v{version}/source';
				loads: #('Deployment')];
		import: 'Aconcagua'.
```
> Replace `{version}` with the version you want to depend on

```smalltalk
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('Aconcagua') ] ]
```
## Platform Compatibility

| Pharo version | Aconcagua version |
| ----------- | ------------- |
| Previous to 6.0 | Go to https://github.com/mtaborda/aconcagua |
| 6.0 | Use version 6.0.0 |
| 6.1 or 7.0 | Use version 7.0.0 |

