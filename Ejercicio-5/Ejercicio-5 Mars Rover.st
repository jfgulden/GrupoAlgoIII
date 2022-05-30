!classDefinition: #MarsRoverTests category: 'Ejercicio-5 Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:06:52'!
test01MarsRoverInitialPositionAndFacingCardinalPointsAreCorrect
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.

	self assert: marsRover position = (0@0).
	self assert: marsRover cardinalPoint = $N.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test02MarsRoverMovesForwardWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover executeCommands: 'f'.
	
	self assert: marsRover position = (0@1).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test03MarsRoverMovesBackwardWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover executeCommands: 'b'.
	
	self assert: marsRover position = (0@-1).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test04MarsRoverRotatesToTheRightNinetyDegreesWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover executeCommands: 'r'.
	
	self assert: marsRover cardinalPoint = $E.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test05MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover executeCommands: 'l'.
	
	self assert: marsRover cardinalPoint = $W.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test06MarsRoverMovesForwardWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover executeCommands: 'f'.
	
	self assert: marsRover position = (1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test07MarsRoverMovesBackwardWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover executeCommands: 'b'.
	
	self assert: marsRover position = (-1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test08MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover executeCommands: 'l'.
	
	self assert: marsRover cardinalPoint = $N.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test09MarsRoverRotatesToTheRightNinetyDegreesWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover executeCommands: 'r'.
	
	self assert: marsRover cardinalPoint = $S.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test10MarsRoverMovesForwardWhileFacingWest
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover executeCommands: 'f'.
	
	self assert: marsRover position = (-1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test11MarsRoverMovesBackwardWhileFacingWest

	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover executeCommands: 'b'.
	
	self assert: marsRover position = (1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test12MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingWest
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover executeCommands: 'l'.
	
	self assert: marsRover cardinalPoint = $S.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test13MarsRoverRotatesToTheRightNinetyDegreesWhileFacingWest
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover executeCommands: 'r'.
	
	self assert: marsRover cardinalPoint = $N.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test14MarsRoverMovesForwardWhileFacingSouth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover executeCommands: 'f'.
	
	self assert: marsRover position = (0@-1)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test15MarsRoverMovesBackwardWhileFacingSouth

	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover executeCommands: 'b'.
	
	self assert: marsRover position = (0@1)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test16MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingSouth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover executeCommands: 'l'.
	
	self assert: marsRover cardinalPoint = $E.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test17MarsRoverRotatesToTheRightNinetyDegreesWhileFacingSouth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover executeCommands: 'r'.
	
	self assert: marsRover cardinalPoint = $W.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:57:17'!
test18MarsRoverMovesAndRotatesAccordingToASetOfCommands
	
	| marsRover setOfCommands |
	setOfCommands := 'lrfbrb'.
	"
	left: W
	r: N
	f: (0,1)
	b: (0,0)
	r: E
	b: (-1,0)
	"
	
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover executeCommands: setOfCommands.
	
	self assert: marsRover cardinalPoint = $E.
	self assert: marsRover position = (-1@0).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:40:54'!
test19MarsRoverMovesAndRotatesWhileCommandsAreValid
		
	| marsRover setOfCommands|
	setOfCommands := 'lbbvrf'.
	
	"
	l: S
	b: (0,1)
	f: (0,2)
	"
	
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	
	self should: [marsRover executeCommands: setOfCommands]
		raise: Error
		withExceptionDo: [ :anError | self assert: Command invalidCommandErrorDescription equals: anError messageText].
		
	self assert: marsRover cardinalPoint = $S.
	self assert: marsRover position = (0@2).! !


!classDefinition: #CardinalPoint category: 'Ejercicio-5 Mars Rover'!
Object subclass: #CardinalPoint
	instanceVariableNames: 'marsRoverAssociated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:27:45'!
backward
	
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:37:05'!
initializeWith: aMarsRover

	marsRoverAssociated := aMarsRover.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:01:01'!
moveBackwardsDependingOnCardinalPointFaced
	
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:06:36'!
moveForwardDependingOnCardinalPointFaced
	
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:06:55'!
rotateToTheLeftDependingOnCardinalPointFaced
	
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:07:01'!
rotateToTheRightDependingOnCardinalPointFaced
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: 'Ejercicio-5 Mars Rover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:37:14'!
canInstantiateWith: aCardinalPoint

	self subclassResponsibility.! !

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:38:43'!
with: aCardinalPoint associatedTo: aMarsRover   
	
	| subclass |
	subclass := self subclasses detect: [:aSubclass | aSubclass canInstantiateWith: aCardinalPoint].
	
	^subclass new initializeWith: aMarsRover.! !


!classDefinition: #East category: 'Ejercicio-5 Mars Rover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!East methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:02:13'!
moveBackwardsDependingOnCardinalPointFaced
	marsRoverAssociated decreasePositionInXAxis.! !

!East methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:10:58'!
moveForwardDependingOnCardinalPointFaced
	marsRoverAssociated increasePositionInXAxis.! !

!East methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:13:18'!
rotateToTheLeftDependingOnCardinalPointFaced
	marsRoverAssociated rotateToNorth.! !

!East methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:17:23'!
rotateToTheRightDependingOnCardinalPointFaced
	
	marsRoverAssociated rotateToSouth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Ejercicio-5 Mars Rover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:37:40'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $E.! !


!classDefinition: #North category: 'Ejercicio-5 Mars Rover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!North methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:08:25'!
moveBackwardsDependingOnCardinalPointFaced
	marsRoverAssociated decreasePositionInYAxis.! !

!North methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:34:34'!
moveForwardDependingOnCardinalPointFaced
	marsRoverAssociated increasePositionInYAxis.! !

!North methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:16:27'!
rotateToTheLeftDependingOnCardinalPointFaced
	marsRoverAssociated rotateToWest.! !

!North methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:17:39'!
rotateToTheRightDependingOnCardinalPointFaced
	
	marsRoverAssociated rotateToEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Ejercicio-5 Mars Rover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:37:50'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $N.! !


!classDefinition: #South category: 'Ejercicio-5 Mars Rover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!South methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:09:02'!
moveBackwardsDependingOnCardinalPointFaced
	marsRoverAssociated increasePositionInYAxis.! !

!South methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:11:42'!
moveForwardDependingOnCardinalPointFaced
	marsRoverAssociated decreasePositionInYAxis.! !

!South methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:16:38'!
rotateToTheLeftDependingOnCardinalPointFaced
	marsRoverAssociated rotateToEast.! !

!South methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:17:51'!
rotateToTheRightDependingOnCardinalPointFaced
	
	marsRoverAssociated rotateToWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'Ejercicio-5 Mars Rover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:37:56'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $S.! !


!classDefinition: #West category: 'Ejercicio-5 Mars Rover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!West methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:09:40'!
moveBackwardsDependingOnCardinalPointFaced
	marsRoverAssociated increasePositionInXAxis.! !

!West methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:12:05'!
moveForwardDependingOnCardinalPointFaced
	marsRoverAssociated decreasePositionInXAxis.! !

!West methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:16:48'!
rotateToTheLeftDependingOnCardinalPointFaced
	marsRoverAssociated rotateToSouth.! !

!West methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:18:03'!
rotateToTheRightDependingOnCardinalPointFaced
	
	marsRoverAssociated rotateToNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'Ejercicio-5 Mars Rover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 18:38:02'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $W.! !


!classDefinition: #Command category: 'Ejercicio-5 Mars Rover'!
Object subclass: #Command
	instanceVariableNames: 'aMarsRoverAssociated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!Command methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 20:04:01'!
execute
	
	self subclassResponsibility.! !

!Command methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 20:29:11'!
initializeWith: aMarsRover

	aMarsRoverAssociated := aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'Ejercicio-5 Mars Rover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 19:54:26'!
canInstantiateWith: aCommand
	
	self subclassResponsibility.! !

!Command class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 19:57:19'!
invalidCommandErrorDescription
	
	^ 'Command not valid'.! !

!Command class methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:45:52'!
with: aCommand associatedTo: aMarsRover

	| subclass |
	subclass := self subclasses detect: [:aSubclass | aSubclass canInstantiateWith: aCommand] ifNone: [^self class error: self class invalidCommandErrorDescription].
	 
	^subclass new initializeWith: aMarsRover.! !


!classDefinition: #Backward category: 'Ejercicio-5 Mars Rover'!
Command subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 20:31:55'!
execute
	aMarsRoverAssociated moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'Ejercicio-5 Mars Rover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 19:54:52'!
canInstantiateWith: aCommand

	^aCommand = $b! !


!classDefinition: #Forward category: 'Ejercicio-5 Mars Rover'!
Command subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:27:41'!
execute
	aMarsRoverAssociated moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Ejercicio-5 Mars Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 19:55:00'!
canInstantiateWith: aCommand

	^aCommand = $f! !


!classDefinition: #RotateToTheLeft category: 'Ejercicio-5 Mars Rover'!
Command subclass: #RotateToTheLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!RotateToTheLeft methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:27:56'!
execute
	aMarsRoverAssociated rotateToTheLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateToTheLeft class' category: 'Ejercicio-5 Mars Rover'!
RotateToTheLeft class
	instanceVariableNames: ''!

!RotateToTheLeft class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 19:55:04'!
canInstantiateWith: aCommand

	^aCommand = $l! !


!classDefinition: #RotateToTheRight category: 'Ejercicio-5 Mars Rover'!
Command subclass: #RotateToTheRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!RotateToTheRight methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:28:08'!
execute
	aMarsRoverAssociated rotateToTheRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateToTheRight class' category: 'Ejercicio-5 Mars Rover'!
RotateToTheRight class
	instanceVariableNames: ''!

!RotateToTheRight class methodsFor: 'as yet unclassified' stamp: 'JFG 5/29/2022 19:55:11'!
canInstantiateWith: aCommand

	^aCommand = $r! !


!classDefinition: #MarsRover category: 'Ejercicio-5 Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!MarsRover methodsFor: 'category-name' stamp: 'JFG 5/28/2022 00:10:33'!
cardinalPoint
	^cardinalPoint ! !

!MarsRover methodsFor: 'category-name' stamp: 'JFG 5/28/2022 00:42:15'!
forward

	(cardinalPoint = $E) ifTrue: [position := position + (1@0)].
	(cardinalPoint = $N) ifTrue: [position := position + (0@1)].
	(cardinalPoint = $W) ifTrue: [position := position + (-1@0)].
	(cardinalPoint = $S) ifTrue: [position := position + (0@-1)].! !

!MarsRover methodsFor: 'category-name' stamp: 'JFG 5/28/2022 00:05:51'!
position
	^position.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:37:57'!
backward
	
	| aCardinalPoint |
	aCardinalPoint := CardinalPoint with: cardinalPoint associatedTo: aMarsRover .
	position := aCardinalPoint backward.
	
	"
	(cardinalPoint = $E) ifTrue: [position := position - (1@0)].
	(cardinalPoint = $N) ifTrue: [position := position - (0@1)].
	(cardinalPoint = $W) ifTrue: [position := position - (-1@0)].
	(cardinalPoint = $S) ifTrue: [position := position - (0@-1)].
	"! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 20:36:51'!
decreasePositionInXAxis
	position := position - (1@0).
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:04:32'!
decreasePositionInYAxis
	position := position - (0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:58:48'!
executeCommands: aString 

	| stringPosition aCommand command |
	
	stringPosition := 1.
	(aString size) timesRepeat: 
		[aCommand := aString at: stringPosition.
		
		command := Command with: aCommand associatedTo: self."
		(command = $f or: [command = $b] or: [command = $r]or: [command = $l]) ifFalse: [^command]."
		command execute.
		
			"(aCommand = $f) ifTrue: [self forward].
			(aCommand = $b) ifTrue: [self backward].
			(aCommand = $r) ifTrue: [self rotateToTheRight].
			(aCommand = $l) ifTrue: [self rotateToTheLeft]."
		
		stringPosition  := stringPosition + 1.		]
			
	
	

	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:03:41'!
increasePositionInXAxis
	position := position + (1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:03:53'!
increasePositionInYAxis
	position := position + (0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:11:41'!
initializeInPosition: aPosition facingTo: aCardinalPoint

	cardinalPoint := aCardinalPoint.
	position := aPosition.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:39:13'!
moveBackwards
	| aCardinalPoint |
	aCardinalPoint := CardinalPoint with: 	cardinalPoint associatedTo: self.
	aCardinalPoint moveBackwardsDependingOnCardinalPointFaced.
	
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:39:20'!
moveForward

	| aCardinalPoint |
	aCardinalPoint := CardinalPoint with: 	cardinalPoint associatedTo: self.
	aCardinalPoint moveForwardDependingOnCardinalPointFaced.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:15:40'!
rotateToEast
	cardinalPoint := $E.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:13:51'!
rotateToNorth
	cardinalPoint := $N.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:14:48'!
rotateToSouth
	cardinalPoint := $S.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:39:26'!
rotateToTheLeft
	| aCardinalPoint |
	aCardinalPoint := CardinalPoint with: 	cardinalPoint associatedTo: self.
	
	aCardinalPoint rotateToTheLeftDependingOnCardinalPointFaced.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:39:30'!
rotateToTheRight

	| aCardinalPoint |
	aCardinalPoint := CardinalPoint with: 	cardinalPoint associatedTo: self.
	
	aCardinalPoint rotateToTheRightDependingOnCardinalPointFaced.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SJ 5/29/2022 21:15:17'!
rotateToWest
	cardinalPoint := $W.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-5 Mars Rover'!
MarsRover class
	instanceVariableNames: 'position'!

!MarsRover class methodsFor: 'instance creation' stamp: 'JFG 5/28/2022 00:10:53'!
inPosition: aPosition facingTo: aCardinalPoint
	
	^self new initializeInPosition: aPosition facingTo: aCardinalPoint ! !

