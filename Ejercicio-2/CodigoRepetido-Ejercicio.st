!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'private' stamp: 'JFG 5/2/2022 02:21:13'!
check: quantityOfActiveCustomers and: quantityOfSuspendedCustomers therefore: quantityOfTotalCustomers in: customerBook

	self assert: quantityOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: quantityOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: quantityOfTotalCustomers equals: customerBook numberOfCustomers.
	

	
! !


!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/1/2022 23:49:05'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	|customerBook|
	customerBook := CustomerBook new.
	self should: [customerBook addCustomerNamed: 'John Lennon'] notTakeMoreThan: 50 milliSeconds.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/1/2022 23:51:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	|customerBook|
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Paul McCartney'.
	self should: [customerBook removeCustomerNamed: 'Paul McCartney'] notTakeMoreThan: 100 milliSeconds.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/2/2022 02:16:37'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self should: [ customerBook addCustomerNamed: ''.] 
		raise: Error withExceptionDo: 
			[ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ] 
			description: self defaultFailDescription! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/2/2022 02:08:23'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self should: [ customerBook removeCustomerNamed: 'Paul McCartney']
		raise: NotFound  withExceptionDo: 
			[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ] 
			description: self defaultFailDescription.
		
		

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/2/2022 02:24:52'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self check: 0 and: 1 therefore: 1 in: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/2/2022 02:25:04'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self check: 0 and: 0 therefore: 0 in: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).




	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/2/2022 02:13:43'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr'] 
	raise: CantSuspend withExceptionDo: 
		[ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon) ]
		description: self defaultFailDescription.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JFG 5/2/2022 02:11:40'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self should: [ customerBook suspendCustomerNamed: johnLennon.]
		raise: CantSuspend  withExceptionDo: 
			[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
			description: self defaultFailDescription.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'JFG 5/2/2022 00:04:08'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ].
	! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'private' stamp: 'JFG 5/2/2022 00:37:28'!
removeCustomer: aName inCollection: coleccion 

	^coleccion remove: aName ifAbsent: Error	.

	

! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'JFG 5/2/2022 02:14:13'!
removeCustomerNamed: aName 

	|costumer1 costumer2|.
	
	costumer1 := self removeCustomer: aName inCollection: active.
	costumer2 := self removeCustomer: aName inCollection: suspended.
	
	(costumer1 = aName or: [(costumer2 = aName)]) ifTrue: [^aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
