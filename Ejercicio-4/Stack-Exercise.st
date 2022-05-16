!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'JFG 5/15/2022 18:07:49'!
test06TopReturnsLastPushedObject
	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'JFG 5/15/2022 18:16:12'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'JFG 5/15/2022 18:16:17'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test unlimited stack' stamp: 'JFG 5/15/2022 18:16:20'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:47'!
test11StackWithLimitShouldBeEmptyWhenCreated

	| stack |
		
	stack := OOStack withSize: 1.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:42'!
test12PushAddElementsToTheLimitedStack

	| stack |
	
	stack := OOStack withSize: 1.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:37'!
test13PopRemovesElementsFromTheLimitedStack

	| stack |
	
	stack := OOStack withSize: 1.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:33'!
test14PopReturnsLastPushedObjectFromALimitedStack

	| stack pushedObject |
	
	stack := OOStack withSize: 1.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:27'!
test15LimitedStackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack withSize: 4.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:23'!
test16TopReturnsLastPushedObjectFromALimitedStack
	| stack pushedObject |
	
	stack := OOStack withSize: 1.
	
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:19'!
test17TopDoesNotRemoveObjectFromALimitedStack

	| stack pushedObject |
	
	stack := OOStack withSize: 1.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:15'!
test18CanNotPopWhenThereAreNoObjectsInTheLimitedStack

	| stack |
	
	stack := OOStack withSize: 1.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:08'!
test19CanNotPopWhenThereAreNoObjectsInTheLimitedStackAndTheLimitedStackHadObjects

	| stack |
	
	stack := OOStack withSize: 1.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:22:04'!
test20CanNotTopWhenThereAreNoObjectsInTheLimitedStack

	| stack |

	stack := OOStack withSize: 1.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:21:41'!
test21StackWithNegativeLimitCanNotBeCreated
	
	| stack |
	
	self
		should: [ stack := OOStack withSize: -1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack invalidSizeErrorDescription			]
		! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:21:29'!
test22LimitedStackCanNotPushWhenTheStackIsFull
	
	| stack |
	
	stack := OOStack withSize: 1.
	stack push: 'something'.
	
	self
		should: [ stack push: 'something'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack limitReachedErrorDescription		]
		! !

!OOStackTest methodsFor: 'test limited stack' stamp: 'JFG 5/15/2022 19:49:07'!
test23StackWithLimitZeroCanNotBeCreated
	
	| stack |
	
	self
		should: [ stack := OOStack withSize: 0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack invalidSizeErrorDescription			]
		! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyPrefix prefixWithSpace prefix emptyStack stackWithManyElements stackWithAMatchableElement wordWithUpperCases wordWithLowerCases wordWithUpperAndLowerCases invertedWord collectionWithMatchableElements matchableWord1 matchableWord2 matchableWord3 stackWithNoMatchableElements stackWithLowerCasesWord'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 14:54:31'!
test01CanNotFindByPrefixInAnEmptyStack
	
	self
		should: [ (SentenceFinderByPrefix new) findIn: emptyStack with: prefix ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 15:37:21'!
test02CanNotFindByPrefixWithAnEmptyPrefix
	
	self
		should: [ (SentenceFinderByPrefix new) findIn: stackWithManyElements with: emptyPrefix]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:22:03'!
test03CanNotFindByPrefixWithSpaces
	
	self
		should: [ (SentenceFinderByPrefix new) findIn: stackWithManyElements with: prefixWithSpace ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpacesErrorDescription]
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:22:13'!
test04GivenANotEmptyStackAMatchIsFound
	| aCollection |
	
	aCollection := (SentenceFinderByPrefix new) findIn: stackWithAMatchableElement with: prefix.
	
	self assert: aCollection size = 1.
	self assert: (aCollection includes: matchableWord1).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:26:30'!
test05GivenANotEmptyStackFindByPrefixIsCaseSensitive

	| aCollection |
	
	aCollection := SentenceFinderByPrefix new findIn: stackWithLowerCasesWord with: prefix.
	
	self assert: (aCollection isEmpty).

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:27:05'!
test06GivenANotEmptyStackAMatchIsFoundAndStackRemainsIntact

	| stackAux |

	stackAux := 	OOStack new.
	
	self fillStackWithOneElement: stackAux.
	
	SentenceFinderByPrefix new findIn: stackWithAMatchableElement with: prefix.
	
	self assert: stackWithAMatchableElement top = stackAux top.
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:06:56'!
test06GivenANotEmptyStackSeveralMatchesAreFound

	| collection |
	
	collection := SentenceFinderByPrefix new findIn: stackWithManyElements with: prefix.
	
	self assert: (collectionWithMatchableElements includesAllOf: collection).

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:27:29'!
test07GivenANotEmptyStackSeveralMatchesAreFoundAndStackRemainsIntact

	| stackAux |

	stackAux := OOStack new.
	
	self fillStackWithManyElements: stackAux.

	SentenceFinderByPrefix new findIn: stackWithManyElements with: prefix.
	
	stackWithManyElements size timesRepeat: [self assert: stackWithManyElements pop = stackAux pop].

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:16:43'!
test08GivenANotEmptyStackNoMatchesAreFound

	| aCollection |

	aCollection := SentenceFinderByPrefix new findIn: stackWithNoMatchableElements with: prefix.
	
	self assert: aCollection isEmpty

	
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JFG 5/15/2022 16:28:07'!
test10GivenANotEmptyStackSeveralMatchesAreFoundThenStackIsEmptiedAndNoMatchesAreFound
	
	SentenceFinderByPrefix new findIn: stackWithAMatchableElement with: prefix.
	
	stackWithAMatchableElement pop.
	
	self
		should: [ (SentenceFinderByPrefix new) findIn: stackWithAMatchableElement with: prefix]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]

	
	! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'JFG 5/15/2022 16:14:57'!
fillCollectionWithMatchableElements: aCollection
	
	aCollection addAll: {matchableWord1. matchableWord2. matchableWord3}.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'JFG 5/15/2022 16:26:52'!
fillStackWithALowerCasesElement: aStack.
	
	aStack push: wordWithLowerCases.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'JFG 5/15/2022 16:12:37'!
fillStackWithManyElements: aStack
	
	
	aStack push: matchableWord1.
	aStack push: matchableWord2.
	aStack push: matchableWord3.
	self fillStackWithNoMatchableElements: aStack.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'JFG 5/15/2022 16:10:56'!
fillStackWithNoMatchableElements: aStack.

	aStack push: wordWithUpperCases .
	aStack push: wordWithLowerCases .
	aStack push: wordWithUpperAndLowerCases .
	aStack push: invertedWord.
! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'JFG 5/15/2022 15:22:46'!
fillStackWithOneElement: aStack
	
	aStack push: matchableWord1.! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'JFG 5/15/2022 16:26:46'!
setUp

	emptyStack := OOStack new.
	stackWithManyElements := OOStack new.
	stackWithAMatchableElement := OOStack new.
	stackWithNoMatchableElements := OOStack new.
	collectionWithMatchableElements := OrderedCollection new.
	stackWithLowerCasesWord := OOStack new.
	
	emptyPrefix := ''.
	prefixWithSpace := 'Win ter'.
	prefix := 'Win'.
	matchableWord1 := 'Winter'.
	matchableWord2 := 'Winner'.
	matchableWord3 := 'Winter is coming'.
	wordWithLowerCases := 'winter'.
	wordWithUpperCases := 'WINTER'.
	wordWithUpperAndLowerCases := 'wInTeR'.
	invertedWord := 'retniW'.
	
	self fillCollectionWithMatchableElements: collectionWithMatchableElements.
	self fillStackWithManyElements: stackWithManyElements.
	self fillStackWithOneElement: stackWithAMatchableElement.
	self fillStackWithNoMatchableElements: stackWithNoMatchableElements.
	self fillStackWithALowerCasesElement: stackWithLowerCasesWord.
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackElements aLimit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'JFG 5/15/2022 19:34:03'!
initialize

	stackElements := OrderedCollection new.! !

!OOStack methodsFor: 'initialization' stamp: 'JFG 5/15/2022 16:53:55'!
initializeWith: aSize

	aLimit := aSize.! !


!OOStack methodsFor: 'accessing' stamp: 'JFG 5/15/2022 19:34:03'!
size
	^stackElements size.! !

!OOStack methodsFor: 'accessing' stamp: 'JFG 5/15/2022 20:18:13'!
top
	^self stackState top: stackElements.! !


!OOStack methodsFor: 'operations' stamp: 'JFG 5/15/2022 20:18:13'!
pop
	^ self stackState pop: stackElements.! !

!OOStack methodsFor: 'operations' stamp: 'JFG 5/15/2022 20:22:28'!
push: anElement

	 self stackState push: anElement into: stackElements.! !


!OOStack methodsFor: 'state' stamp: 'JFG 5/15/2022 19:34:03'!
isEmpty
	^ stackElements isEmpty.! !

!OOStack methodsFor: 'state' stamp: 'JFG 5/15/2022 19:34:03'!
isFull
	^stackElements size = aLimit.
	
	! !


!OOStack methodsFor: 'private' stamp: 'JFG 5/15/2022 20:18:13'!
stackState 
	^(OOStackState returnStackState: self)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'JFG 5/15/2022 16:54:25'!
invalidSizeErrorDescription
	
	^ 'Size is not valid'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'JFG 5/15/2022 17:02:46'!
limitReachedErrorDescription
	
	^ 'Stack is full'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'JFG 5/15/2022 19:21:06'!
withSize: aSize
	
	(aSize > 0) ifFalse: [^self error: self invalidSizeErrorDescription].
	
	^ self new initializeWith: aSize.! !


!OOStack class methodsFor: 'state' stamp: 'SJ 5/14/2022 01:17:04'!
canInstantiateWithAStateOf: aStack
	OOStackState subclassResponsibility.! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'private' stamp: 'SJ 5/13/2022 23:36:30'!
canInstantiateWithAStateOf: aStack
	self subclassResponsibility.! !

!OOStackState class methodsFor: 'private' stamp: 'JFG 5/15/2022 19:26:45'!
returnStackState: aStack
	
	^( self subclasses detect: [:aSubclass | aSubclass canInstantiateWithAStateOf: aStack] ) new.! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'error' stamp: 'SJ 5/13/2022 23:28:41'!
EmptyStackErrorHandler
	^self error: OOStack stackEmptyErrorDescription.! !


!EmptyStack methodsFor: 'accessing' stamp: 'SJ 5/14/2022 01:24:52'!
top: aStack
	^self EmptyStackErrorHandler.! !


!EmptyStack methodsFor: 'operations' stamp: 'SJ 5/14/2022 00:56:44'!
pop: aStack
	^self EmptyStackErrorHandler.! !

!EmptyStack methodsFor: 'operations' stamp: 'JFG 5/15/2022 17:23:35'!
push: anElement into: aStack

	aStack add: anElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'private' stamp: 'JFG 5/15/2022 17:30:13'!
canInstantiateWithAStateOf: aStack
	
	^ aStack isEmpty.! !


!classDefinition: #FullStack category: 'Stack-Exercise'!
OOStackState subclass: #FullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FullStack methodsFor: 'operations' stamp: 'JFG 5/15/2022 17:31:12'!
pop: aStack
	^aStack removeLast.! !

!FullStack methodsFor: 'operations' stamp: 'JFG 5/15/2022 18:45:26'!
push: anElement into: aStack
	
	^OOStack error: OOStack limitReachedErrorDescription.! !


!FullStack methodsFor: 'accessing' stamp: 'JFG 5/15/2022 17:31:19'!
top: aStack
	^aStack last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullStack class' category: 'Stack-Exercise'!
FullStack class
	instanceVariableNames: ''!

!FullStack class methodsFor: 'private' stamp: 'JFG 5/15/2022 17:30:26'!
canInstantiateWithAStateOf: aStack

	^ aStack isFull.! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'operations' stamp: 'SJ 5/14/2022 00:03:36'!
pop: aStack
	^aStack removeLast.! !

!NotEmptyStack methodsFor: 'operations' stamp: 'JFG 5/15/2022 17:22:57'!
push: anElement into: aStack

	aStack add: anElement.! !


!NotEmptyStack methodsFor: 'accessing' stamp: 'SJ 5/14/2022 01:18:50'!
top: aStack
	^aStack last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'private' stamp: 'JFG 5/15/2022 19:07:04'!
canInstantiateWithAStateOf: aStack

	^ aStack isEmpty not and: [aStack isFull not].! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JFG 5/15/2022 13:34:09'!
add: anElement to: aCollection ifItBeginsWith: aPrefix

	(anElement beginsWith: aPrefix) ifTrue: [aCollection add: anElement].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JFG 5/15/2022 12:13:01'!
unstack: newStack andStackInto: aStack.

	(newStack size) timesRepeat: [ aStack push: newStack pop].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JFG 5/15/2022 13:07:32'!
unstack: aStack andStackInto: newStack evaluatingForEachElement: aBlock
	
	(aStack size) timesRepeat: [
		newStack push: aStack pop.
		aBlock value: newStack top].! !


!SentenceFinderByPrefix methodsFor: 'public' stamp: 'JFG 5/15/2022 13:33:25'!
findIn: aStack with: aPrefix

	|aCollection newStack|
	
	self assertThatAPrefixIsNotEmpty: aPrefix.
	self assertThatAPrefixHasNoSpaces: aPrefix.
	self assertThatAStackIsNotEmpty: aStack.
	
	aCollection := OrderedCollection new.
	newStack := OOStack new.
	
	self unstack: aStack 
		andStackInto: newStack 
		evaluatingForEachElement: [:anElement | self add: anElement to: aCollection ifItBeginsWith: aPrefix].
		
	self unstack: newStack andStackInto: aStack.
	
	^aCollection 

	
	
	
	
	
	! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'JFG 5/15/2022 13:24:00'!
assertThatAPrefixHasNoSpaces: aPrefix

	(aPrefix includesSubString: ' ') ifTrue: [self class error: self class prefixWithSpacesErrorDescription]! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'JFG 5/15/2022 13:22:17'!
assertThatAPrefixIsNotEmpty: aPrefix

	(aPrefix = '') ifTrue: [self class error: self class prefixEmptyErrorDescription]! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'JFG 5/15/2022 13:19:07'!
assertThatAStackIsNotEmpty: aStack

	(aStack isEmpty) ifTrue: [OOStack error: OOStack stackEmptyErrorDescription]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JFG 5/15/2022 13:21:01'!
prefixEmptyErrorDescription

	^ 'Prefix is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JFG 5/15/2022 13:23:30'!
prefixWithSpacesErrorDescription
	
	^ 'Prefix has spaces'.! !
