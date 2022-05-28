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

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:38:31'!
test02MarsRoverMovesForwardWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover command: 'f'.
	
	self assert: marsRover position = (0@1).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:38:42'!
test03MarsRoverMovesBackwardWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover command: 'b'.
	
	self assert: marsRover position = (0@-1).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:26:39'!
test04MarsRoverRotatesToTheRightNinetyDegreesWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover command: 'r'.
	
	self assert: marsRover cardinalPoint = $E.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:29:24'!
test05MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingNorth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $N.
	marsRover command: 'l'.
	
	self assert: marsRover cardinalPoint = $W.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:39:44'!
test06MarsRoverMovesForwardWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover command: 'f'.
	
	self assert: marsRover position = (1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:43:41'!
test07MarsRoverMovesBackwardWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover command: 'b'.
	
	self assert: marsRover position = (-1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:47:23'!
test08MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover command: 'l'.
	
	self assert: marsRover cardinalPoint = $N.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:04:59'!
test09MarsRoverRotatesToTheRightNinetyDegreesWhileFacingEast
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $E.
	marsRover command: 'r'.
	
	self assert: marsRover cardinalPoint = $S.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:06:49'!
test10MarsRoverMovesForwardWhileFacingWest
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover command: 'f'.
	
	self assert: marsRover position = (-1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:08:31'!
test11MarsRoverMovesBackwardWhileFacingWest

	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover command: 'b'.
	
	self assert: marsRover position = (1@0)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:08:39'!
test12MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingWest
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover command: 'l'.
	
	self assert: marsRover cardinalPoint = $S.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:08:48'!
test13MarsRoverRotatesToTheRightNinetyDegreesWhileFacingWest
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	marsRover command: 'r'.
	
	self assert: marsRover cardinalPoint = $N.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:09:14'!
test14MarsRoverMovesForwardWhileFacingSouth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover command: 'f'.
	
	self assert: marsRover position = (0@-1)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:14:04'!
test15MarsRoverMovesBackwardWhileFacingSouth

	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover command: 'b'.
	
	self assert: marsRover position = (0@1)	.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:13:32'!
test16MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingSouth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover command: 'l'.
	
	self assert: marsRover cardinalPoint = $E.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:14:37'!
test17MarsRoverRotatesToTheRightNinetyDegreesWhileFacingSouth
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: $S.
	marsRover command: 'r'.
	
	self assert: marsRover cardinalPoint = $W.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:33:50'!
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
	marsRover command: setOfCommands.
	
	self assert: marsRover cardinalPoint = $E.
	self assert: marsRover position = (-1@0).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 02:38:02'!
test19MarsRoverMovesAndRotatesWhileCommandsAreValid
		
	| marsRover setOfCommands|
	setOfCommands := 'lbbvrf'.
	
	"
	l: S
	b: (0,1)
	f: (0,2)
	"
	
	marsRover := MarsRover inPosition: (0@0) facingTo: $W.
	
	self should: [marsRover command: setOfCommands]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover invalidCommandErrorDescription equals: anError messageText].
		
	self assert: marsRover cardinalPoint = $S.
	self assert: marsRover position = (0@2).! !


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


!MarsRover methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:42:51'!
backward
	
	(cardinalPoint = $E) ifTrue: [position := position - (1@0)].
	(cardinalPoint = $N) ifTrue: [position := position - (0@1)].
	(cardinalPoint = $W) ifTrue: [position := position - (-1@0)].
	(cardinalPoint = $S) ifTrue: [position := position - (0@-1)].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 02:19:28'!
command: aString 

	| stringPosition aCommand |
	stringPosition := 1.
	(aString size) timesRepeat: 
		[aCommand := aString at: stringPosition.
		((aCommand = $f) or:[aCommand = $b] or:[aCommand = $r] or:[aCommand = $l]) ifFalse:[^self class error: self class invalidCommandErrorDescription].
		
			(aCommand = $f) ifTrue: [self forward].
			(aCommand = $b) ifTrue: [self backward].
			(aCommand = $r) ifTrue: [self rotateToTheRight].
			(aCommand = $l) ifTrue: [self rotateToTheLeft].
		
		stringPosition  := stringPosition + 1.		]
			
	
	

	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 00:11:41'!
initializeInPosition: aPosition facingTo: aCardinalPoint

	cardinalPoint := aCardinalPoint.
	position := aPosition.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:04:19'!
rotateToTheLeft
	
	(cardinalPoint = $E) ifTrue: [^cardinalPoint := $N].
	(cardinalPoint = $N) ifTrue: [^cardinalPoint := $W].
	(cardinalPoint = $W) ifTrue: [^cardinalPoint := $S].
	(cardinalPoint = $S) ifTrue: [^cardinalPoint := $E].
	
	
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JFG 5/28/2022 01:04:30'!
rotateToTheRight
	
	(cardinalPoint = $E) ifTrue: [^cardinalPoint := $S].
	(cardinalPoint = $N) ifTrue: [^cardinalPoint := $E].
	(cardinalPoint = $W) ifTrue: [^cardinalPoint := $N].
	(cardinalPoint = $S) ifTrue: [^cardinalPoint := $W].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-5 Mars Rover'!
MarsRover class
	instanceVariableNames: 'position'!

!MarsRover class methodsFor: 'instance creation' stamp: 'JFG 5/28/2022 00:10:53'!
inPosition: aPosition facingTo: aCardinalPoint
	
	^self new initializeInPosition: aPosition facingTo: aCardinalPoint ! !


!MarsRover class methodsFor: 'error' stamp: 'JFG 5/28/2022 02:33:58'!
invalidCommandErrorDescription
	
	^ 'Command not valid'.! !
