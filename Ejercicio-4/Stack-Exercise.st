!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/13/2022 23:07:05'!
initialize
	stack := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/13/2022 23:44:11'!
isEmpty
	^ stack size = 0! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:45:58'!
pop
	^(OOStackState verifyStackState: stack) pop: stack.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/9/2022 23:30:11'!
push: anElement
	stack add: anElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/13/2022 23:31:27'!
size
	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:46:31'!
top
	^(OOStackState verifyStackState: stack) top: stack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:17:04'!
canInstantiateWithAStateOf: aStack
	OOStackState subclassResponsibility.! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 00:55:56'!
pop: aStack
	self subclassResponsibility.! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:37:29'!
top: aStack
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'SJ 5/13/2022 23:36:30'!
canInstantiateWithAStateOf: aStack
	self subclassResponsibility.! !

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:39:46'!
verifyStackState: aStack
	
	^( self subclasses detect: [:aSubclass | aSubclass canInstantiateWithAStateOf: aStack] ) new.! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/13/2022 23:28:41'!
EmptyStackErrorHandler
	^self error: OOStack stackEmptyErrorDescription.! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 00:56:44'!
pop: aStack
	^self EmptyStackErrorHandler.! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:24:52'!
top: aStack
	^self EmptyStackErrorHandler.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 00:23:59'!
canInstantiateWithAStateOf: aStack
	
	^aStack isEmpty.! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 00:03:36'!
pop: aStack
	^aStack removeLast.! !

!NotEmptyStack methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 01:18:50'!
top: aStack
	^aStack last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'as yet unclassified' stamp: 'SJ 5/14/2022 00:24:11'!
canInstantiateWithAStateOf: aStack
	^aStack isEmpty not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
