!classDefinition: #MarsRoverTests category: 'Ejercicio-5 Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'invalidSetOfCommands north south east west validSetOfCommands forward backward rotateToTheLeft rotateToTheRight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!MarsRoverTests methodsFor: 'set up' stamp: 'JFG 5/31/2022 19:53:35'!
setUp

	north := $N.
	south := $S.
	east := $E.
	west := $W.
	forward := 'f'.
	backward := 'b'.
	rotateToTheLeft := 'l'.
	rotateToTheRight := 'r'.
	invalidSetOfCommands := 'lbbvrf'.
	validSetOfCommands := 'lrfbrb'.
	
	! !


!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:03:26'!
test01MarsRoverInitialPositionAndFacingCardinalPointsAreCorrect
	
	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: north.

	self assertThat: marsRover IsFacingTo: north andIsPositionedAt: (0@0).
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:03:17'!
test02MarsRoverMovesForwardWhileFacingNorth
	
	self assertThatMarsRoverFacingTo: north CanExecuteCommand: forward andChangesItsPositionInto: (0@1).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:03:05'!
test03MarsRoverMovesBackwardWhileFacingNorth

	self assertThatMarsRoverFacingTo: north CanExecuteCommand: backward andChangesItsPositionInto: (0@-1).
							
	
	
	! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:02:51'!
test04MarsRoverRotatesToTheRightNinetyDegreesWhileFacingNorth

	self assertThatMarsRoverFacingTo: north CanExecuteCommand: rotateToTheRight andChangesItsFacingCardinalPointInto: east.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:02:22'!
test05MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingNorth

	self assertThatMarsRoverFacingTo: north CanExecuteCommand: rotateToTheLeft andChangesItsFacingCardinalPointInto: west.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:02:07'!
test06MarsRoverMovesForwardWhileFacingEast

	self assertThatMarsRoverFacingTo: east CanExecuteCommand: forward andChangesItsPositionInto: (1@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:01:53'!
test07MarsRoverMovesBackwardWhileFacingEast

	self assertThatMarsRoverFacingTo: east CanExecuteCommand: backward andChangesItsPositionInto: (-1@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:01:43'!
test08MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingEast

	self assertThatMarsRoverFacingTo: east CanExecuteCommand: rotateToTheLeft andChangesItsFacingCardinalPointInto: north.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:01:22'!
test09MarsRoverRotatesToTheRightNinetyDegreesWhileFacingEast
	
	self assertThatMarsRoverFacingTo: east CanExecuteCommand: rotateToTheRight andChangesItsFacingCardinalPointInto: south.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:00:59'!
test10MarsRoverMovesForwardWhileFacingWest

	self assertThatMarsRoverFacingTo: west CanExecuteCommand: forward  andChangesItsPositionInto: (-1@0)	.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:00:47'!
test11MarsRoverMovesBackwardWhileFacingWest

	self assertThatMarsRoverFacingTo: west CanExecuteCommand: backward andChangesItsPositionInto: (1@0)	.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:00:34'!
test12MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingWest

	self assertThatMarsRoverFacingTo: west CanExecuteCommand: rotateToTheLeft andChangesItsFacingCardinalPointInto: south.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 20:00:17'!
test13MarsRoverRotatesToTheRightNinetyDegreesWhileFacingWest

	self assertThatMarsRoverFacingTo: west CanExecuteCommand: rotateToTheRight andChangesItsFacingCardinalPointInto: north.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 19:59:55'!
test14MarsRoverMovesForwardWhileFacingSouth

	self assertThatMarsRoverFacingTo: south CanExecuteCommand: forward andChangesItsPositionInto: (0@-1).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 19:59:45'!
test15MarsRoverMovesBackwardWhileFacingSouth

	self assertThatMarsRoverFacingTo: south CanExecuteCommand: backward andChangesItsPositionInto: (0@1).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 19:59:32'!
test16MarsRoverRotatesToTheLeftNinetyDegreesWhileFacingSouth

	self assertThatMarsRoverFacingTo: south CanExecuteCommand: rotateToTheLeft andChangesItsFacingCardinalPointInto: east.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 19:58:11'!
test17MarsRoverRotatesToTheRightNinetyDegreesWhileFacingSouth

	self assertThatMarsRoverFacingTo: south CanExecuteCommand: rotateToTheRight andChangesItsFacingCardinalPointInto: west.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 19:59:05'!
test18MarsRoverMovesAndRotatesAccordingToASetOfCommands
	
	| marsRover |
	
	marsRover := MarsRover inPosition: (0@0) facingTo: north.
	marsRover executeCommands: validSetOfCommands .
	
	self assertThat: marsRover IsFacingTo: east andIsPositionedAt: (-1@0).
	! !

!MarsRoverTests methodsFor: 'tests' stamp: 'JFG 5/31/2022 19:58:38'!
test19MarsRoverMovesAndRotatesWhileCommandsAreValid
		
	| marsRover |
	
	marsRover := MarsRover inPosition: (0@0) facingTo: west.
	
	self should: [marsRover executeCommands: invalidSetOfCommands]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Command invalidCommandErrorDescription) equals: (anError messageText)].
		
	self assertThat: marsRover IsFacingTo: south andIsPositionedAt: (0@2).! !


!MarsRoverTests methodsFor: 'private' stamp: 'JFG 5/31/2022 20:06:41'!
assertThat: aMarsRover IsFacingTo: aCardinalPoint andIsPositionedAt: aPosition
	
	self assert: (aMarsRover IsFacingTo: aCardinalPoint).
	self assert: (aMarsRover IsPositionedAt: aPosition).
	! !

!MarsRoverTests methodsFor: 'private' stamp: 'JFG 5/31/2022 20:06:41'!
assertThatMarsRoverFacingTo: aCardinalPoint CanExecuteCommand: aCommand andChangesItsFacingCardinalPointInto: aNewCardinalPoint

	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: aCardinalPoint.
	marsRover executeCommands: aCommand.
	
	self assert: (marsRover IsFacingTo: aNewCardinalPoint).
							
	! !

!MarsRoverTests methodsFor: 'private' stamp: 'JFG 5/31/2022 20:05:02'!
assertThatMarsRoverFacingTo: aCardinalPoint CanExecuteCommand: aCommand andChangesItsPositionInto: aPosition

	| marsRover |
	marsRover := MarsRover inPosition: (0@0) facingTo: aCardinalPoint.
	marsRover executeCommands: aCommand.
	
	self assert: (marsRover IsPositionedAt: aPosition).
							
	! !


!classDefinition: #Command category: 'Ejercicio-5 Mars Rover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!Command methodsFor: 'executation' stamp: 'SJ 5/31/2022 16:55:16'!
execute: aMarsRover
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'Ejercicio-5 Mars Rover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'error' stamp: 'JFG 5/29/2022 19:57:19'!
invalidCommandErrorDescription
	
	^ 'Command not valid'.! !


!Command class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 19:54:26'!
canInstantiateWith: aCommand
	
	self subclassResponsibility.! !

!Command class methodsFor: 'instance creation' stamp: 'SJ 5/31/2022 16:53:55'!
with: aCommand 

	| subclass |
	subclass := self subclasses detect: [:aSubclass | aSubclass canInstantiateWith: aCommand] ifNone: [^Command error: (self invalidCommandErrorDescription)].
	 
	^subclass new.! !


!classDefinition: #Backward category: 'Ejercicio-5 Mars Rover'!
Command subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!Backward methodsFor: 'executation' stamp: 'SJ 5/31/2022 16:56:12'!
execute: aMarsRover
	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'Ejercicio-5 Mars Rover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 19:54:52'!
canInstantiateWith: aCommand

	^aCommand = $b! !


!classDefinition: #Forward category: 'Ejercicio-5 Mars Rover'!
Command subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!Forward methodsFor: 'executation' stamp: 'SJ 5/31/2022 16:56:20'!
execute: aMarsRover
	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Ejercicio-5 Mars Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 19:55:00'!
canInstantiateWith: aCommand

	^aCommand = $f! !


!classDefinition: #RotateToTheLeft category: 'Ejercicio-5 Mars Rover'!
Command subclass: #RotateToTheLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!RotateToTheLeft methodsFor: 'executation' stamp: 'SJ 5/31/2022 16:56:25'!
execute: aMarsRover
	aMarsRover rotateToTheLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateToTheLeft class' category: 'Ejercicio-5 Mars Rover'!
RotateToTheLeft class
	instanceVariableNames: ''!

!RotateToTheLeft class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 19:55:04'!
canInstantiateWith: aCommand

	^aCommand = $l! !


!classDefinition: #RotateToTheRight category: 'Ejercicio-5 Mars Rover'!
Command subclass: #RotateToTheRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!RotateToTheRight methodsFor: 'executation' stamp: 'SJ 5/31/2022 16:56:31'!
execute: aMarsRover
	aMarsRover rotateToTheRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateToTheRight class' category: 'Ejercicio-5 Mars Rover'!
RotateToTheRight class
	instanceVariableNames: ''!

!RotateToTheRight class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 19:55:11'!
canInstantiateWith: aCommand

	^aCommand = $r! !


!classDefinition: #FacingDirection category: 'Ejercicio-5 Mars Rover'!
Object subclass: #FacingDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!FacingDirection methodsFor: 'operations' stamp: 'SJ 5/31/2022 16:59:58'!
moveBackwardsDependingOnCardinalPointFaced: aMarsRover
	
	self subclassResponsibility.! !

!FacingDirection methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:00:39'!
moveForwardDependingOnCardinalPointFaced: aMarsRover
	
	self subclassResponsibility.! !

!FacingDirection methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:01:29'!
rotateToTheLeftDependingOnCardinalPointFaced: aMarsRover
	
	self subclassResponsibility.! !

!FacingDirection methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:01:51'!
rotateToTheRightDependingOnCardinalPointFaced: aMarsRover
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FacingDirection class' category: 'Ejercicio-5 Mars Rover'!
FacingDirection class
	instanceVariableNames: ''!

!FacingDirection class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 18:37:14'!
canInstantiateWith: aCardinalPoint

	self subclassResponsibility.! !

!FacingDirection class methodsFor: 'instance creation' stamp: 'SJ 5/31/2022 16:53:55'!
with: aCommand 

	| subclass |
	subclass := self subclasses detect: [:aSubclass | aSubclass canInstantiateWith: aCommand].
	 
	^subclass new.! !


!classDefinition: #East category: 'Ejercicio-5 Mars Rover'!
FacingDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!East methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:16:45'!
moveBackwardsDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: -1  andInYAxis: 0.! !

!East methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:17:11'!
moveForwardDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: 1 andInYAxis: 0.! !

!East methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:23:20'!
rotateToTheLeftDependingOnCardinalPointFaced: aMarsRover
	aMarsRover rotateTo: $N.! !

!East methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:23:35'!
rotateToTheRightDependingOnCardinalPointFaced: aMarsRover
	aMarsRover rotateTo: $S.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Ejercicio-5 Mars Rover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 18:37:40'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $E.! !


!classDefinition: #North category: 'Ejercicio-5 Mars Rover'!
FacingDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!North methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:17:40'!
moveBackwardsDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: 0 andInYAxis: -1.! !

!North methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:17:50'!
moveForwardDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: 0 andInYAxis: 1.! !

!North methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:23:55'!
rotateToTheLeftDependingOnCardinalPointFaced: aMarsRover
	aMarsRover rotateTo: $W.! !

!North methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:24:03'!
rotateToTheRightDependingOnCardinalPointFaced: aMarsRover
	
	aMarsRover rotateTo: $E.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Ejercicio-5 Mars Rover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 18:37:50'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $N.! !


!classDefinition: #South category: 'Ejercicio-5 Mars Rover'!
FacingDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!South methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:18:03'!
moveBackwardsDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: 0 andInYAxis: 1.! !

!South methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:18:15'!
moveForwardDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: 0 andInYAxis: -1.! !

!South methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:24:11'!
rotateToTheLeftDependingOnCardinalPointFaced: aMarsRover
	aMarsRover rotateTo: $E.! !

!South methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:24:20'!
rotateToTheRightDependingOnCardinalPointFaced: aMarsRover
	
	aMarsRover rotateTo: $W.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'Ejercicio-5 Mars Rover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 18:37:56'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $S.! !


!classDefinition: #West category: 'Ejercicio-5 Mars Rover'!
FacingDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!West methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:18:29'!
moveBackwardsDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: 1 andInYAxis: 0.! !

!West methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:18:43'!
moveForwardDependingOnCardinalPointFaced: aMarsRover
	aMarsRover increaseInXAxis: -1 andInYAxis: 0.! !

!West methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:24:31'!
rotateToTheLeftDependingOnCardinalPointFaced: aMarsRover
	aMarsRover rotateTo: $S.! !

!West methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:24:39'!
rotateToTheRightDependingOnCardinalPointFaced: aMarsRover
	aMarsRover rotateTo: $N.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'Ejercicio-5 Mars Rover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'instance creation' stamp: 'JFG 5/29/2022 18:38:02'!
canInstantiateWith: aCardinalPoint

	^aCardinalPoint = $W.! !


!classDefinition: #MarsRover category: 'Ejercicio-5 Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-5 Mars Rover'!

!MarsRover methodsFor: 'questions' stamp: 'JFG 5/31/2022 20:06:41'!
IsFacingTo: aCardinalPoint 

	^cardinalPoint = aCardinalPoint ! !

!MarsRover methodsFor: 'questions' stamp: 'JFG 5/31/2022 19:54:23'!
IsPositionedAt: aPosition
	^position = aPosition.! !


!MarsRover methodsFor: 'private' stamp: 'SJ 5/31/2022 17:20:05'!
increaseInXAxis: valueForAbscissa andInYAxis: valueForOrdinate
	position := position + (valueForAbscissa @ valueForOrdinate).! !

!MarsRover methodsFor: 'private' stamp: 'JFG 5/31/2022 20:08:28'!
rotateTo: aCardinalPoint

	cardinalPoint := aCardinalPoint.
! !


!MarsRover methodsFor: 'initialization' stamp: 'JFG 5/28/2022 00:11:41'!
initializeInPosition: aPosition facingTo: aCardinalPoint

	cardinalPoint := aCardinalPoint.
	position := aPosition.
	! !


!MarsRover methodsFor: 'operations' stamp: 'SJ 5/31/2022 17:44:09'!
executeCommands: aString 

	| aCommand |
	
	aString do: [:aCharacter | 
		aCommand := Command with: aCharacter.
		aCommand execute: self.].

			
	
	

	! !

!MarsRover methodsFor: 'operations' stamp: 'SJ 5/31/2022 20:18:58'!
moveBackwards
	| aCardinalPoint |
	aCardinalPoint := FacingDirection with: 	cardinalPoint.
	aCardinalPoint moveBackwardsDependingOnCardinalPointFaced: self.
	
	! !

!MarsRover methodsFor: 'operations' stamp: 'SJ 5/31/2022 20:18:58'!
moveForward

	| aCardinalPoint |
	aCardinalPoint := FacingDirection with: 	cardinalPoint.
	aCardinalPoint moveForwardDependingOnCardinalPointFaced: self.
	! !

!MarsRover methodsFor: 'operations' stamp: 'SJ 5/31/2022 20:18:58'!
rotateToTheLeft

	| aCardinalPoint |
	aCardinalPoint := FacingDirection with: 	cardinalPoint.
	
	aCardinalPoint rotateToTheLeftDependingOnCardinalPointFaced: self.! !

!MarsRover methodsFor: 'operations' stamp: 'SJ 5/31/2022 20:18:58'!
rotateToTheRight

	| aCardinalPoint |
	aCardinalPoint := FacingDirection with: 	cardinalPoint.
	
	aCardinalPoint rotateToTheRightDependingOnCardinalPointFaced: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-5 Mars Rover'!
MarsRover class
	instanceVariableNames: 'position'!

!MarsRover class methodsFor: 'instance creation' stamp: 'JFG 5/28/2022 00:10:53'!
inPosition: aPosition facingTo: aCardinalPoint
	
	^self new initializeInPosition: aPosition facingTo: aCardinalPoint ! !
