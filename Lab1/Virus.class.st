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
	self layers removeAll.
	^ (1 to: 10) collect: [ :i | aCell parseDNA: self dna forOrganism: self class ]
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
