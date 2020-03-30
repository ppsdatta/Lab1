Class {
	#name : #HostCell,
	#superclass : #CellComponent,
	#instVars : [
		'dead'
	],
	#category : #Lab1
}

{ #category : #adding }
HostCell >> add: organism [
	self dead ifTrue: [ self error: 'It is a dead cell' ].
	^ self routineCheckup: organism 
]

{ #category : #'instance creation' }
HostCell >> cellFactory: op [
	^ (Dictionary new 
		at: 'aagc' put: [ :organ :arg :dna | organ addLayer: arg ];
		at: 'atcg' put: [ :organ :arg :dna | organ dna: dna ]; yourself) at: op
]

{ #category : #accessing }
HostCell >> dead [
	^ dead
]

{ #category : #accessing }
HostCell >> dead: anObject [
	dead := anObject
]

{ #category : #initialization }
HostCell >> initialize [
	dead := false
]

{ #category : #cellactions }
HostCell >> kill [
	self dead: true
]

{ #category : #parsing }
HostCell >> parseDNA: strand [
	| components composite |
	
	self dead ifTrue: [ self error: 'It is a dead cell' ].
	
	components := strand splitOn: 'atgcatgc'.
	composite := CellComponent new.
	components do: [ :component | 
		| parts op arg |
		parts := component splitOn: 'ata'.
		op := parts at: 1.
		arg := parts at: 2.
		self perform: op on: composite withArg: arg	 withDNA: strand
	].
  ^ composite
]

{ #category : #parsing }
HostCell >> parseDNA: strand forOrganism: organismClass [
	| components composite |
	
	self dead ifTrue: [ self error: 'It is a dead cell' ].
	
	components := strand splitOn: 'atgcatgc'.
	composite := organismClass new.
	components do: [ :component | 
		| parts op arg |
		parts := component splitOn: 'ata'.
		op := parts at: 1.
		arg := parts at: 2.
		self perform: op on: composite withArg: arg	 withDNA: strand
	].
  ^ composite
]

{ #category : #cellactions }
HostCell >> perform: op on: organism withArg: arg withDNA: strand [
	self dead ifTrue: [ self error: 'It is a dead cell' ].
	(self cellFactory: op) value: organism value: arg value: strand
]

{ #category : #cellactions }
HostCell >> routineCheckup: aThing [
	| sig |
	
	self dead ifTrue: [ self error: 'It is a dead cell' ].
	
	sig := aThing what: self.
	(sig = self signature) ifTrue: [ ^ #OK ] ifFalse: [ ^ sig ]
]

{ #category : #accessing }
HostCell >> signature [ 
	^ self shouldNotImplement 
]
