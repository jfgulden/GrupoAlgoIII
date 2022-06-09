!classDefinition: #PortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: 'account1 account2 deposit1 deposit2 portfolioWithAccount1 portfolio portfolioWithAccountWithoutTransactions noneTransactions account1Transactions accountWithoutTransactions portfolioWithAccount2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test01givenAnEmptyPortfolioTheTotalBalanceIsZero

	self assert: portfolio balance equals: 0.
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:45:16'!
test02givenAPortfolioContainingAnAccountWithNoTransactionsTheBalanceOfThePortfolioIsZero

	self assert: portfolioWithAccountWithoutTransactions balance equals: 0.
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:13:28'!
test03givenANotEmptyPortfolioWithTransactionsRegisteredTheBalanceCanBeCalculated

	self assert: portfolioWithAccount1 balance equals: (100 * peso).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:43:40'!
test04givenAPortfolioWithAnotherPortfolioContainigAccountsWithRegisteredTransactionsTheTotalBalanceCanBeCalculated

	portfolioWithAccount1 addElement: portfolioWithAccount2.
	
	self assert: portfolioWithAccount1 balance equals: (150 * peso).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test05givenAnEmptyPortfolioTheTransactionSentIsNotRegistered
	
	self deny: (portfolio hasRegistered: deposit1).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:45:16'!
test06givenAPortfolioContainingAnAccountWithNoTransactionsThePortfolioDoesNotRegisterTheTransactionSent

	self deny: (portfolioWithAccountWithoutTransactions hasRegistered: deposit1).
		
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:44:51'!
test07givenAPortfolioContainingTwoAccountsButOnlyOneWithARegisteredTransactionThePortfolioRegistersTheTransaction

	portfolioWithAccount1 addElement: accountWithoutTransactions.
	
	self assert: (portfolioWithAccount1 hasRegistered: deposit1).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:21:01'!
test08givenAPortfolioContainingAnAccountThePortfolioRegistersTheTransactionOfSaidAccount
	
	self assert: (portfolioWithAccount1 hasRegistered: deposit1).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test09givenAPortfolioWithAnotherPortfolioContainingAnAccountWithATransactionTheFirstPortfolioRegistersTheTransaction

	portfolio addElement: portfolioWithAccount1.
	
	self assert: (portfolio hasRegistered: deposit1).

	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:52:47'!
test10givenAnEmptyPortfolioNoTransactionCanBeObtained

	self assert: (portfolio transactions) equals: noneTransactions.
	
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:52:47'!
test11givenAPortfolioContainingAnAccountWithNoTransactionsThereAreNoTransactionsInPortfolio

	self assert: (portfolioWithAccountWithoutTransactions transactions) equals: noneTransactions.
	
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:37:17'!
test12givenAPortfolioContainingAnAccountWithTransactionsThePortfolioObtainsAllTransactions

	self assert: (portfolioWithAccount1 transactions) equals: account1Transactions.
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test13givenAPortfolioContainingAnotherPortfolioWithANotEmptyAccountThePortfolioObtainsAllTransactions

	portfolio addElement: portfolioWithAccount1.
	
	self assert: (portfolio transactions) equals: account1Transactions.
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'SJ 6/9/2022 12:52:29'!
test14canNotAddTheSameAccountTwiceInAPortfolio
	
	self
		should: [ portfolioWithAccount1 addElement: account1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio elementAlreadyIncludedErrorDescription].
		
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test15canNotAddAnAccountToAPortfolioThatContainsAnotherPortfolioWithTheSameAccount
	
	portfolio addElement: portfolioWithAccount1.
	
	self
		should: [portfolio addElement: account1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test16canNotAddTheSamePortfolioInAPortfolio
	
	self
		should: [ portfolio addElement: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddItselfErrorDescription].
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test17canNotAddTheSameAccountInAPortfolioThatIsContainedInAnotherPortfolioThatAlreadyAddedTheAccount
	
	portfolioWithAccount1 addElement: portfolio.
	
	self
		should: [ portfolio addElement: account1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
		
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 16:51:31'!
test18canNotAddAPortfolioInAPortfolioWithAnAccountAlreadyAddedInSecondPortfolio
	
	portfolio addElement: account1.
	self
		should: [ portfolio addElement: portfolioWithAccount1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
	
		! !


!PortfolioTests methodsFor: 'setup' stamp: 'JFG 6/9/2022 16:52:47'!
setUp

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	accountWithoutTransactions := ReceptiveAccount new.

	"Accounts 1 and 2 have transactions registered"
	deposit1 := Deposit register: 100 * peso on: account1 .
	deposit2 :=  Deposit register: 50 * peso on: account2.

	noneTransactions := OrderedCollection new.
	
	account1Transactions := OrderedCollection new.
	account1Transactions add: deposit1.
	
	portfolio := Portfolio new.
		
	portfolioWithAccount1 := Portfolio new.
	portfolioWithAccount1 addElement: account1.
	
	portfolioWithAccount2 := Portfolio new.
	portfolioWithAccount2 addElement: account2.
	
	portfolioWithAccountWithoutTransactions := Portfolio new.
	portfolioWithAccountWithoutTransactions addElement: accountWithoutTransactions.


	

! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTests
	instanceVariableNames: 'accountWithDeposit accountWithWithdraw transferValue transfererence accountWithWithdrawAndZeroBalance transferenceLeavingNegativeBalance accountOfDeposit1 transference returningTransference accountOfDepositAndWithdraw anotherAccountOfDepositAndWithdraw oneWaytransference invalidTransferenceWithTheSameAccounts aNegativeTransferValue zeroTransferValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 12:55:09'!
test01aTransferenceWithdrawsAndDepositsTheCorrectAmountOfMoneyInTheInvolvedAccounts
	
	self assert: accountWithWithdraw balance equals: transferValue.
	self assert: accountWithDeposit balance equals: transferValue.
	
! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 12:54:58'!
test02aTransferenceCanWithdrawMoneyFromAnAccountEvenIfTheBalanceOfSaidAccountIsLeftOnNegative

	self assert: accountWithWithdrawAndZeroBalance balance equals: transferValue negated.
	self assert: accountOfDeposit1 balance equals: transferValue.! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 14:29:13'!
test03whenConsultedATransferenceHasTwoLegs
	
	self assert: (transference withdrawLeg isKindOf: TransferWithdrawLeg).
	self assert: (transference depositLeg isKindOf: TransferDepositLeg).
	! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 14:39:21'!
test04givenATransferenceTheCounterPartsOfEachLegAreDemanded
	
	self assert: (transference withdrawLeg counterPart ) equals: transference depositLeg.
	self assert: (transference depositLeg counterPart ) equals: transference withdrawLeg.! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 12:05:53'!
test05aTransferenceCanBeMadeBothWaysUsingTwoDifferentAccounts

	self assert: accountOfDepositAndWithdraw balance equals: 100 * peso.
	self assert: anotherAccountOfDepositAndWithdraw balance equals: 0 * peso.! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 12:54:42'!
test06whenATransferenceIsBeingMadeTheAccountsInvolvedCanNotBeTheSame
	
	self should: [Transfer from: accountWithWithdraw to: accountWithWithdraw withValue: transferValue.]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 12:54:31'!
test07whenATransferenceIsBeingMadeTheTransferValueCanNotBeNegative

	self should: [Transfer from: accountWithWithdraw to: accountWithDeposit withValue: aNegativeTransferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/9/2022 12:54:35'!
test08whenATransferenceIsBeingMadeTheTransferValueCanNotBeZero
	
	self should: [Transfer from: accountWithWithdraw to: accountWithDeposit withValue: zeroTransferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !


!TransferTests methodsFor: 'setup' stamp: 'SJ 6/9/2022 12:14:20'!
setUp
	
	accountWithDeposit := ReceptiveAccount new.
	accountOfDeposit1 := ReceptiveAccount new.
	
	accountWithWithdraw := ReceptiveAccount new.

	transferValue := 50 * peso.
	aNegativeTransferValue := transferValue negated.
	zeroTransferValue := 0 * peso.
	
	Deposit register: 100 * peso on: accountWithWithdraw.
	oneWaytransference := Transfer from: accountWithWithdraw to: accountWithDeposit withValue: transferValue.	
	
	accountOfDepositAndWithdraw := ReceptiveAccount new.
	anotherAccountOfDepositAndWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountOfDepositAndWithdraw.
	transference := Transfer from: accountOfDepositAndWithdraw to: anotherAccountOfDepositAndWithdraw withValue: transferValue.	
	returningTransference := Transfer from: anotherAccountOfDepositAndWithdraw to: accountOfDepositAndWithdraw withValue: transferValue.	
	
	accountWithWithdrawAndZeroBalance := ReceptiveAccount new.
	transferenceLeavingNegativeBalance := Transfer from: accountWithWithdrawAndZeroBalance to: accountOfDeposit1 withValue: transferValue.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTests class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTests class
	instanceVariableNames: 'accountWithDeposit'!


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'SJ 6/9/2022 14:31:25'!
valueForBalance
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: 'value completeTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'value' stamp: 'SJ 6/9/2022 14:22:37'!
value
	^completeTransference value.! !

!TransferTransaction methodsFor: 'value' stamp: 'SJ 6/9/2022 14:20:24'!
valueForBalance
	self subclassResponsibility.! !


!TransferTransaction methodsFor: 'initialization' stamp: 'SJ 6/9/2022 14:19:01'!
initializeWith: aTransfer
	completeTransference := aTransfer.! !


!TransferTransaction methodsFor: 'accessing' stamp: 'SJ 6/9/2022 14:17:12'!
counterPart
	self subclassResponsibility.! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'SJ 6/9/2022 14:19:11'!
counterPart
	^completeTransference withdrawLeg.! !

!TransferDepositLeg methodsFor: 'accessing' stamp: 'SJ 6/9/2022 14:21:57'!
valueForBalance
	^self value.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'SJ 6/9/2022 14:19:27'!
counterPart
	^completeTransference depositLeg.! !

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'SJ 6/9/2022 14:34:10'!
valueForBalance
	^self value negated.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'SJ 6/5/2022 21:42:33'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'SJ 6/5/2022 21:42:27'!
valueForBalance
	^value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'elements transactions precedingPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'operations' stamp: 'JFG 6/8/2022 23:32:24'!
addElement: anElement
	self assertElementIsNotContainedInPortfolio: anElement.
	anElement assignPortfolioContainingIt: self.
	elements add: anElement.
			
! !

!Portfolio methodsFor: 'operations' stamp: 'JFG 6/9/2022 00:10:47'!
hasRegistered: aTransaction
	
	^ elements anySatisfy: [:anElement | (anElement hasRegistered: aTransaction)].

	! !


!Portfolio methodsFor: 'initialization' stamp: 'JFG 6/8/2022 23:41:55'!
assignPortfolioContainingIt: aPortfolio
	precedingPortfolio := aPortfolio.! !

!Portfolio methodsFor: 'initialization' stamp: 'JFG 6/8/2022 23:41:55'!
initialize
	
	elements := OrderedCollection new.
	precedingPortfolio := nil.
	! !


!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/8/2022 23:32:24'!
balance
	| balance |
	balance := 0.
	
	elements ifEmpty: [^0].
	
	elements do: [:anElement | balance := balance + anElement balance].

	^balance.
	
! !

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/8/2022 23:32:24'!
elements
	^ elements ! !

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/9/2022 16:59:12'!
getMasterPortfolio
	"Recorre hasta llegar al nivel mas alto (El porfatolio que se encuentra en la raiz del arbol) y lo devuelve"
	
	precedingPortfolio = nil ifTrue: [^self].
	^ precedingPortfolio getMasterPortfolio.! !

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/9/2022 01:04:28'!
transactions

	^elements inject: OrderedCollection new into: [ :listOfTransactions :anAccount | listOfTransactions , anAccount transactions.].

	
	! !


!Portfolio methodsFor: 'error handler' stamp: 'SJ 6/8/2022 18:39:29'!
elementIsAlreadyIncluded
	self error: self class elementAlreadyIncludedErrorDescription.! !


!Portfolio methodsFor: 'assertions' stamp: 'JFG 6/9/2022 17:03:03'!
assertAccountFrom: aPortfolio isNotEqualTo: anAccount
	self assertPortfolioDoesNotInclude: anAccount.! !

!Portfolio methodsFor: 'assertions' stamp: 'JFG 6/9/2022 17:02:14'!
assertElementIsNotContainedInPortfolio: anElement
	"Recorre todos los portfolios comenzando por el Portfolio 'Master'. Es decir, el portfolio principal que se encuentra en la raiz del arbol y que no está contenido en ningun otro portfolio"
	
	self getMasterPortfolio assertPortfolioDoesNotInclude: anElement.
	(anElement isKindOf: Portfolio) ifTrue: [
		anElement elements do: [ :Element | 
			self assertElementIsNotContainedInPortfolio: Element]].
	
	
	! !

!Portfolio methodsFor: 'assertions' stamp: 'JFG 6/8/2022 23:32:24'!
assertPortfolioDoesNotInclude: anElement
	self = anElement ifTrue: [self error: self class canNotAddItselfErrorDescription].
	elements do: [:element | element assertAccountFrom: self isNotEqualTo: anElement].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'SJ 6/7/2022 20:04:05'!
canNotAddItselfErrorDescription
	^'Cannot add portfolio to itself'.! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'JFG 6/7/2022 17:09:10'!
elementAlreadyIncludedErrorDescription
	
	^'Element has already been added'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SJ 6/9/2022 14:32:11'!
balance

	^transactions sum: [ :aTransaction |
		aTransaction valueForBalance] ifEmpty: [0]. ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'assertions' stamp: 'SJ 6/8/2022 18:38:50'!
assertAccountFrom: aPortfolio isNotEqualTo: anElement
	self = anElement ifTrue: [aPortfolio elementIsAlreadyIncluded]. ! !


!ReceptiveAccount methodsFor: 'accessing - private' stamp: 'SJ 6/8/2022 16:36:32'!
assignPortfolioContainingIt: aPortfolio
	^self.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawLeg depositLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/6/2022 00:40:52'!
depositLeg
	^depositLeg.! !

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/9/2022 14:35:10'!
value
	^value! !

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/6/2022 00:41:09'!
withdrawLeg
	^withdrawLeg.! !


!Transfer methodsFor: 'initialization' stamp: 'SJ 6/9/2022 14:07:12'!
initializeWith: aValue
	value := aValue.
	depositLeg := TransferDepositLeg new initializeWith: self.
	withdrawLeg := TransferWithdrawLeg new initializeWith: self.! !

!Transfer methodsFor: 'initialization' stamp: 'SJ 6/9/2022 14:13:16'!
shouldBeRegisteredFrom: anAccountOfWithdrawal to: anAccountOfDeposit.
	anAccountOfWithdrawal register: withdrawLeg.
	anAccountOfDeposit register: depositLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'SJ 6/9/2022 14:40:20'!
from: anAccountOfWithdrawal to: anAccountOfDeposit withValue: amountOfMoneyToBeTransferred 
	| aTransference |
	
	((self isAValidTransactionWith: anAccountOfWithdrawal and: anAccountOfDeposit) 
		and: [self transferValueIsValid: amountOfMoneyToBeTransferred])
		ifFalse: [Transfer error: self invalidTransactionErrorDescription].
		
	aTransference := self new initializeWith: amountOfMoneyToBeTransferred.
	
	aTransference shouldBeRegisteredFrom: anAccountOfWithdrawal to: anAccountOfDeposit.
	
	^aTransference.
	
	! !


!Transfer class methodsFor: 'error descriptions' stamp: 'SJ 6/6/2022 12:03:05'!
invalidTransactionErrorDescription
	^'Invalid transaction'! !


!Transfer class methodsFor: 'assertions' stamp: 'SJ 6/6/2022 12:11:20'!
isAValidTransactionWith: aReceptiveAccount and: aReceptiveAccount2 
	^aReceptiveAccount ~= aReceptiveAccount2.! !

!Transfer class methodsFor: 'assertions' stamp: 'SJ 6/6/2022 12:27:47'!
transferValueIsValid: aValue
	^aValue > 0.! !
