"
c1 := SampleCell1 new.
c2 := SampleCell2 new.
v1 := Virus new dna: 'aagcatafatatgcatgcaagcataacidatgcatgcatcgataaaa'.
c1 add: v1; 'add: v1 -> this is error as the cell is dead'

"
Class {
	#name : #Virus,
	#superclass : #DNAOrganism,
	#instVars : [
		'layers'
	],
	#category : #Lab1
}

{ #category : #cellactions }
Virus >> addLayer: arg [
	layers add: arg asString
]

{ #category : #accessing }
Virus >> dna [
	^ (self layers isEmpty) ifTrue: [ super dna ] ifFalse: #sealed
]

{ #category : #initialization }
Virus >> initialize [
	super initialize.
	layers := OrderedCollection new
]

{ #category : #cellactions }
Virus >> invade: aCell [
	| result|
	
	
	self layers removeAll.
	result := (1 to: 10) collect: [ :i | aCell parseDNA: self dna forOrganism: self class ].
	aCell kill.
	
	^ result
]

{ #category : #accessing }
Virus >> layers [
	^ layers
]

{ #category : #accessing }
Virus >> layers: anObject [
	layers := anObject
]

{ #category : #cellactions }
Virus >> what: aCell [ 
	^ (aCell signature asSymbol = #target) 
		 ifTrue: [ self invade: aCell ]
		 ifFalse: [ super what: aCell ]
]
