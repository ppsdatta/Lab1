Class {
	#name : #CellComponent,
	#superclass : #Object,
	#category : #Lab1
}

{ #category : #cellactions }
CellComponent >> addLayer: arg [
	^ self shouldNotImplement 
]

{ #category : #cellactions }
CellComponent >> dna: dna [
	^ self shouldNotImplement 
]

{ #category : #cellactions }
CellComponent >> what: aCell [
	^ aCell signature
]
