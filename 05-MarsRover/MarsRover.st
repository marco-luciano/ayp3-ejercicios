!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'test - move forward' stamp: 'FR 12/6/2020 13:36:20'!
test02moveForwardWhenFacingToTheNorth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'f'.
	
	self assertVehicle: marsRover isAt: (0@1) andNotAt: (0@0).! !

!MarsRoverTests methodsFor: 'test - move forward' stamp: 'FR 12/6/2020 13:36:42'!
test03moveForwardWhenFacingToTheSouth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'S'.
	
	marsRover processCommands: 'f'.
	
	self assertVehicle: marsRover isAt: (0@-1) andNotAt: (0@0).! !

!MarsRoverTests methodsFor: 'test - move forward' stamp: 'FR 12/6/2020 13:36:54'!
test04moveForwardWhenFacingToTheWest

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'W'.
	
	marsRover processCommands: 'f'.
	
	self assertVehicle: marsRover isAt: (-1@0) andNotAt: (0@0).! !

!MarsRoverTests methodsFor: 'test - move forward' stamp: 'FR 12/6/2020 13:37:08'!
test05moveForwardWhenFacingToTheEast

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'E'.
	
	marsRover processCommands: 'f'.
	
	self assertVehicle: marsRover isAt: (1@0) andNotAt: (0@0).! !


!MarsRoverTests methodsFor: 'test - move backwards' stamp: 'FR 12/6/2020 13:37:23'!
test06moveBackwardsWhenFacingToTheNorth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'b'.
	
	self assertVehicle: marsRover isAt: (0@-1) andNotAt: (0@0).! !

!MarsRoverTests methodsFor: 'test - move backwards' stamp: 'FR 12/6/2020 13:37:30'!
test07moveBackwardsWhenFacingToTheSouth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'S'.
	
	marsRover processCommands: 'b'.
	
	self assertVehicle: marsRover isAt: (0@1) andNotAt: (0@0).! !

!MarsRoverTests methodsFor: 'test - move backwards' stamp: 'FR 12/6/2020 13:37:42'!
test08moveBackwardsWhenFacingToTheWest

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'W'.
	
	marsRover processCommands: 'b'.
	
	self assertVehicle: marsRover isAt: (1@0) andNotAt: (0@0).! !

!MarsRoverTests methodsFor: 'test - move backwards' stamp: 'FR 12/6/2020 13:37:53'!
test09moveBackwardsWhenFacingToTheEast

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'E'.
	
	marsRover processCommands: 'b'.
	
	self assertVehicle: marsRover isAt: (-1@0) andNotAt: (0@0).! !


!MarsRoverTests methodsFor: 'test - rotate 90 left' stamp: 'FR 12/5/2020 20:52:43'!
test10Rotate90DegreesToTheLeftWhenFacingToTheNorth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'l'.
	
	self deny: (marsRover orientation isNorth ).
	self assert: (marsRover orientation isWest ).! !

!MarsRoverTests methodsFor: 'test - rotate 90 left' stamp: 'FR 12/5/2020 20:56:58'!
test11Rotate90DegreesToTheLeftWhenFacingToTheSouth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'S'.
	
	marsRover processCommands: 'l'.
	
	self deny: (marsRover orientation isSouth ).
	self assert: (marsRover orientation isEast).! !

!MarsRoverTests methodsFor: 'test - rotate 90 left' stamp: 'FR 12/5/2020 20:57:09'!
test12Rotate90DegreesToTheLeftWhenFacingToTheWest

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'W'.
	
	marsRover processCommands: 'l'.
	
	self deny: (marsRover orientation isWest).
	self assert: (marsRover orientation isSouth).! !

!MarsRoverTests methodsFor: 'test - rotate 90 left' stamp: 'FR 12/5/2020 20:57:19'!
test13Rotate90DegreesToTheLeftWhenFacingToTheEast

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'E'.
	
	marsRover processCommands: 'l'.
	
	self deny: (marsRover orientation isEast).
	self assert: (marsRover orientation isNorth).! !


!MarsRoverTests methodsFor: 'test - rotate 90 right' stamp: 'FR 12/5/2020 20:59:44'!
test14Rotate90DegreesToTheRightWhenFacingToTheNorth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'r'.
	
	self deny: (marsRover orientation isNorth).
	self assert: (marsRover orientation isEast).! !

!MarsRoverTests methodsFor: 'test - rotate 90 right' stamp: 'FR 12/5/2020 21:00:15'!
test15Rotate90DegreesToTheRightWhenFacingToTheSouth

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'S'.
	
	marsRover processCommands: 'r'.
	
	self deny: (marsRover orientation isSouth).
	self assert: (marsRover orientation isWest).! !

!MarsRoverTests methodsFor: 'test - rotate 90 right' stamp: 'FR 12/5/2020 21:04:21'!
test16Rotate90DegreesToTheRightWhenFacingToTheWest

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'W'.
	
	marsRover processCommands: 'r'.
	
	self deny: (marsRover orientation isWest).
	self assert: (marsRover orientation isNorth).! !

!MarsRoverTests methodsFor: 'test - rotate 90 right' stamp: 'FR 12/5/2020 21:04:43'!
test17Rotate90DegreesToTheRightWhenFacingToTheEast

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'E'.
	
	marsRover processCommands: 'r'.
	
	self deny: (marsRover orientation isEast).
	self assert: (marsRover orientation isSouth).! !


!MarsRoverTests methodsFor: 'test - initialization' stamp: 'FR 12/5/2020 19:43:29'!
test01marsRoverStartsAtInitialPosition

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	self assert: (marsRover isAt: 0@0).! !


!MarsRoverTests methodsFor: 'assert - coordinates' stamp: 'FR 12/6/2020 13:35:50'!
assertVehicle: aVehicle isAt: finalPosition andNotAt: initialPosition

	self assert: (aVehicle isAt: finalPosition).
	self deny: (aVehicle isAt: initialPosition).! !


!MarsRoverTests methodsFor: 'test - complex commands' stamp: 'FR 12/5/2020 21:22:47'!
test18ComplexCommandCombination01

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'fblr'.
	
	self assert: (marsRover isAt: (0@0)).
	self assert: (marsRover orientation isNorth).! !

!MarsRoverTests methodsFor: 'test - complex commands' stamp: 'FR 12/5/2020 21:34:55'!
test19ComplexCommandCombination02

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'lffbl'.
	
	self assert: (marsRover isAt: (-1@0)).
	self assert: (marsRover orientation isSouth).! !

!MarsRoverTests methodsFor: 'test - complex commands' stamp: 'FR 12/5/2020 21:36:24'!
test20NonValidCommand

	|marsRover|
	
	marsRover := MarsRover at: 0@0 facingTo: 'N'.
	
	marsRover processCommands: 'lfflffxff'.
	
	self assert: (marsRover isAt: (-2@-2)).
	self assert: (marsRover orientation isSouth).! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'testing' stamp: 'FR 12/5/2020 20:55:49'!
isEast

	^self class isRepresentedBy: 'E'.! !

!CardinalPoint methodsFor: 'testing' stamp: 'FR 12/5/2020 20:55:53'!
isNorth

	^self class isRepresentedBy: 'N'.! !

!CardinalPoint methodsFor: 'testing' stamp: 'FR 12/5/2020 20:55:59'!
isSouth

	^self class isRepresentedBy: 'S'.! !

!CardinalPoint methodsFor: 'testing' stamp: 'FR 12/5/2020 20:56:03'!
isWest

	^self class isRepresentedBy: 'W'.! !


!CardinalPoint methodsFor: 'direction' stamp: 'FR 12/6/2020 13:23:29'!
getBackwardsDirection
	
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'direction' stamp: 'FR 12/6/2020 13:23:21'!
getForwardDirection
	
	self subclassResponsibility.! !


!CardinalPoint methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:26:54'!
getLeftCardinalPoint

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:27:01'!
getRightCardinalPoint

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: 'MarsRover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2020 20:00:50'!
createCardinalPoint: aCardinalPointInitial

	| newCardinalPoint |
	
	newCardinalPoint := self subclasses detect: [:cardinalPoint | cardinalPoint isRepresentedBy: aCardinalPointInitial ].
	
	^newCardinalPoint new.! !

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2020 19:57:00'!
isRepresentedBy: aChar
	
	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:44'!
getBackwardsDirection

	^(-1 * self getForwardDirection)! !

!East methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:29'!
getForwardDirection
	
	^(1@0).! !


!East methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:27:56'!
getLeftCardinalPoint

	^(CardinalPoint createCardinalPoint: 'N')! !

!East methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:27:47'!
getRightCardinalPoint

	^(CardinalPoint createCardinalPoint: 'S')! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2020 19:57:23'!
isRepresentedBy: aChar
	
	^aChar  = 'E'.! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:44'!
getBackwardsDirection
	
	^(-1 * self getForwardDirection).! !

!North methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:29'!
getForwardDirection

	^(0@1).! !


!North methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:28:12'!
getLeftCardinalPoint

	^(CardinalPoint createCardinalPoint: 'W').! !

!North methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:28:21'!
getRightCardinalPoint

	^(CardinalPoint createCardinalPoint: 'E').! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2020 19:57:34'!
isRepresentedBy: aChar
	
	^aChar  = 'N'.! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:44'!
getBackwardsDirection
	
	^(-1 * self getForwardDirection).! !

!South methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:29'!
getForwardDirection

	^(0@-1).! !


!South methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:28:42'!
getLeftCardinalPoint

	^(CardinalPoint createCardinalPoint: 'E').! !

!South methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:28:49'!
getRightCardinalPoint

	^(CardinalPoint createCardinalPoint: 'W').! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2020 19:57:42'!
isRepresentedBy: aChar
	
	^aChar  = 'S'.! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:44'!
getBackwardsDirection
	
	^(-1 * self getForwardDirection).! !

!West methodsFor: 'direction' stamp: 'FR 12/6/2020 13:22:29'!
getForwardDirection

	^(-1@0).! !


!West methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:29:06'!
getLeftCardinalPoint

	^(CardinalPoint createCardinalPoint: 'S').! !

!West methodsFor: 'rotate' stamp: 'FR 12/6/2020 13:29:22'!
getRightCardinalPoint

	^(CardinalPoint createCardinalPoint: 'N').! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2020 19:57:50'!
isRepresentedBy: aChar
	
	^aChar  = 'W'.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'FR 12/6/2020 13:18:01'!
initializeAt: aPosition facingTo: aCardinalPoint

	position := aPosition.
	orientation := CardinalPoint createCardinalPoint: aCardinalPoint.! !


!MarsRover methodsFor: 'position' stamp: 'FR 12/5/2020 19:47:49'!
isAt: aPosition
	
	^position = aPosition.! !

!MarsRover methodsFor: 'position' stamp: 'FR 12/5/2020 20:13:52'!
moveBy: aPoint

	position := position + aPoint.! !


!MarsRover methodsFor: 'commands' stamp: 'FR 12/6/2020 13:30:47'!
processCommands: stringOfCommands
	
	stringOfCommands asArray do: [:command | 
		command  = $f ifTrue: [self moveBy: orientation getForwardDirection .] ifFalse: [
			command = $b ifTrue: [self moveBy: orientation getBackwardsDirection ] ifFalse: [
				command  = $l ifTrue: [self faceTo: orientation getLeftCardinalPoint 		] ifFalse: [
					command = $r ifTrue: [self faceTo: orientation getRightCardinalPoint ] ifFalse: [
						^self].
					].
				].
			].
		]	! !


!MarsRover methodsFor: 'orientation' stamp: 'FR 12/5/2020 20:49:38'!
faceTo: aCardinalPoint

	orientation := aCardinalPoint.! !

!MarsRover methodsFor: 'orientation' stamp: 'FR 12/5/2020 20:30:21'!
orientation

	^orientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'FR 12/5/2020 19:45:11'!
at: aPosition facingTo: aCardinalPoint
	
	^self new initializeAt: aPosition facingTo: aCardinalPoint.! !
