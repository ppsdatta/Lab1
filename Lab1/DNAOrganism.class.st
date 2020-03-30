Class {
	#name : #DNAOrganism,
	#superclass : #CellComponent,
	#instVars : [
		'dna'
	],
	#category : #Lab1
}

{ #category : #accessing }
DNAOrganism >> dna [
	^ dna
]

{ #category : #cellactions }
DNAOrganism >> dna: aStrand [
	dna := aStrand 
]
