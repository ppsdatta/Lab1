Class {
	#name : #HostCell,
	#superclass : #Object,
	#category : #Lab1
}

{ #category : #adding }
HostCell >> add: organism [
	^ self routineCheckup: organism 
]

{ #category : #'instance creation' }
HostCell >> cellFactory: op [
	^ (Dictionary new 
		at: 'aagc' put: [ :organ :arg :dna | organ addLayer: arg ];
		at: 'atcg' put: [ :organ :arg :dna | organ dna: dna ]; yourself) at: op
]

{ #category : #parsing }
HostCell >> parseDNA: strand [
	| components composite |
	
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
	
	components := strand splitOn: 'atgcatgc'.
	composite := organismClass new.
	components do: [ :component | 
		| parts op arg |
		parts := component splitOn: 'ata'.
		op := parts at: 1.
		arg := parts at: 2.
		self perform: op on: composite withArg: arg	 withDNA: strand
	].
	Transcript show: 'layers '; show: composite layers; show: ' dna '; show: composite dna; cr.
  ^ composite
]

{ #category : #cellactions }
HostCell >> perform: op on: organism withArg: arg withDNA: strand [
	(self cellFactory: op) value: organism value: arg value: strand
]

{ #category : #cellactions }
HostCell >> routineCheckup: aThing [
	| sig |
	
	sig := aThing what: self.
	(sig = self signature) ifTrue: [ ^ #OK ] ifFalse: [ ^ sig ]
]

{ #category : #accessing }
HostCell >> signature [ 
	^ self shouldNotImplement 
]
