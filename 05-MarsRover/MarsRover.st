!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'mlm 11/30/2020 22:12:59'!
test01MarsRoverIsFacingNorth
	
	"comment stating purpose of message"

	| marsRover |
	
	marsRover := MarsRover new.
	
	self assert: marsRover isFacingNorth.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'mlm 11/30/2020 22:11:03'!
test02MarsRoverIsFacingSouth
	
	"comment stating purpose of message"

	| marsRover |
	
	marsRover := MarsRover new.
	
	self assert: marsRover isHeadingSouth
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'mlm 11/30/2020 22:12:11'!
test03MarsRoverIsFacingEast
	"comment stating purpose of message"

	| marsRover |
	
	marsRover := MarsRover new.
	
	self assert: marsRover isFacingEast
! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mlm 11/30/2020 22:13:21'!
isFacingNorth
	^true! !
