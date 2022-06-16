!classDefinition: #Account category: #'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'acccessing' stamp: 'JFG 6/15/2022 18:29:43'!
name
	
	self subclassResponsibility.! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/16/2022 02:44:37'!
accounts

	| accountCollection |
	accountCollection := OrderedCollection new.
	accounts do: [:anAccount | accountCollection add: anAccount].
	^accountCollection.! !

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/15/2022 18:29:59'!
name
	
	^name! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'JFG 6/16/2022 02:05:51'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'composition' stamp: 'JFG 6/16/2022 02:05:51'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'JFG 6/16/2022 02:05:51'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'JFG 6/14/2022 18:48:29'!
initializeWith: aName
	
	name := aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'JFG 6/15/2022 18:26:06'!
elements
	
	^accounts! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'private' stamp: 'JFG 6/15/2022 23:27:05'!
affectReport: aReport
	
	^ aReport affectReportForPortfolio: self.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JFG 6/14/2022 18:48:06'!
named: aName 

	^self new initializeWith: aName
		! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JFG 6/16/2022 02:05:51'!
named: aName with: anAccount

	^(self new initializeWith: aName)
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JFG 6/16/2022 02:05:51'!
named: aName with: anAccount with: anotherAccount

	^(self new initializeWith: aName)
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JFG 6/16/2022 02:05:51'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JFG 6/16/2022 02:05:51'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'accessing' stamp: 'JFG 6/15/2022 18:30:07'!
name
	
	^name! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JFG 6/15/2022 18:30:30'!
initializeWith: aName

	name := aName! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JFG 6/16/2022 02:05:51'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'private' stamp: 'JFG 6/16/2022 03:06:19'!
affectReport: aReport
	
	^ aReport affectReportForReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'JFG 6/14/2022 18:48:54'!
named: aName

	^self new initializeWith: aName.! !


!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'JFG 6/14/2022 18:50:50'!
affectReport: anAccount
	
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'private' stamp: 'SJ 6/12/2022 19:43:15'!
affectTransferNet: currentTransferNet
	self subclassResponsibility.! !


!classDefinition: #Deposit category: #'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'private' stamp: 'JFG 6/14/2022 19:26:14'!
affectReport: anAccount
	
	^ anAccount affectReportForDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: #'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'private' stamp: 'JFG 6/14/2022 18:51:29'!
affectReport: anAccount
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: #'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'private' stamp: 'JFG 6/14/2022 19:26:24'!
affectReport: anAccount
	
	^ anAccount affectReportForDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: #'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'SJ 6/12/2022 17:37:48'!
affectBalance: aBalance

	^aBalance + self value negated.! !


!TransferWithdrawLeg methodsFor: 'private' stamp: 'JFG 6/14/2022 19:26:31'!
affectReport: anAccount
	
	^ anAccount affectReportForWithdrawLeg: self.! !


!classDefinition: #Withdraw category: #'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'balance' stamp: 'SJ 6/12/2022 17:30:40'!
affectBalance: aBalance

	^aBalance + self value negated! !


!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'private' stamp: 'JFG 6/14/2022 19:26:38'!
affectReport: anAccount
	
	^ anAccount affectReportForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: #'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'private' stamp: 'JFG 6/14/2022 17:07:55'!
affectReportForDeposit: anAccountTransaction
	
	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'JFG 6/14/2022 17:09:59'!
affectReportForDepositLeg: anAccountTransaction
	
	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'JFG 6/14/2022 17:10:19'!
affectReportForWithdraw: anAccountTransaction
	
	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'JFG 6/14/2022 17:10:38'!
affectReportForWithdrawLeg: anAccountTransaction
	
	self subclassResponsibility.! !


!classDefinition: #GetSummary category: #'ServiciosFinancieros-Solucion'!
Report subclass: #GetSummary
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!GetSummary methodsFor: 'initialization' stamp: 'JFG 6/13/2022 19:54:46'!
initializeWith: anAccount
	
	account := anAccount.! !


!GetSummary methodsFor: 'main protocol' stamp: 'JFG 6/16/2022 02:05:51'!
generate
	
	|summaryTransactions|
	
	summaryTransactions := OrderedCollection new.
	
	account transactions do: [:anElement | summaryTransactions add: (anElement affectReport: self)].
	summaryTransactions add: ('Balance = ', account balance asString). 
	^summaryTransactions.! !


!GetSummary methodsFor: 'private' stamp: 'JFG 6/14/2022 17:42:46'!
affectReportForDeposit: anAccountTransaction
	
	^('Depósito por ', anAccountTransaction value asString).
! !

!GetSummary methodsFor: 'private' stamp: 'JFG 6/14/2022 17:11:05'!
affectReportForDepositLeg: anAccountTransaction
	
	^('Entrada por transferencia de ', anAccountTransaction value asString).
! !

!GetSummary methodsFor: 'private' stamp: 'JFG 6/14/2022 17:42:53'!
affectReportForWithdraw: anAccountTransaction
	
	^('Extracción por ', anAccountTransaction value asString).
! !

!GetSummary methodsFor: 'private' stamp: 'JFG 6/14/2022 17:10:54'!
affectReportForWithdrawLeg: anAccountTransaction
	
	^('Salida por transferencia de ', anAccountTransaction value asString).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GetSummary class' category: #'ServiciosFinancieros-Solucion'!
GetSummary class
	instanceVariableNames: ''!

!GetSummary class methodsFor: 'as yet unclassified' stamp: 'JFG 6/13/2022 20:18:43'!
from: anAccount
	
	^self new initializeWith: anAccount.! !


!classDefinition: #GetTransferNet category: #'ServiciosFinancieros-Solucion'!
Report subclass: #GetTransferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!GetTransferNet methodsFor: 'initialization' stamp: 'JFG 6/13/2022 20:26:40'!
initializeWith: anAccount
	
	account := anAccount.! !


!GetTransferNet methodsFor: 'main protocol' stamp: 'JFG 6/14/2022 17:43:29'!
generate
	
	^account transactions 
	inject: 0 
	into: [ :currentTransferNet :transaction | currentTransferNet + (transaction affectReport: self)].! !


!GetTransferNet methodsFor: 'private' stamp: 'JFG 6/14/2022 17:12:26'!
affectReportForDeposit: anAccountTransaction
	
	^ 0 * peso! !

!GetTransferNet methodsFor: 'private' stamp: 'JFG 6/14/2022 17:23:50'!
affectReportForDepositLeg: anAccountTransaction
	
	^ anAccountTransaction value! !

!GetTransferNet methodsFor: 'private' stamp: 'JFG 6/14/2022 17:24:22'!
affectReportForWithdraw: anAccountTransaction
	
	^ 0* peso! !

!GetTransferNet methodsFor: 'private' stamp: 'JFG 6/14/2022 17:24:12'!
affectReportForWithdrawLeg: anAccountTransaction
	
	^ anAccountTransaction value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GetTransferNet class' category: #'ServiciosFinancieros-Solucion'!
GetTransferNet class
	instanceVariableNames: ''!

!GetTransferNet class methodsFor: 'as yet unclassified' stamp: 'JFG 6/13/2022 20:27:04'!
from: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #PortfolioDetailedTreePrinter category: #'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'account tabsCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'initialization' stamp: 'JFG 6/16/2022 14:43:11'!
initialize

	tabsCounter := 0.
! !

!PortfolioDetailedTreePrinter methodsFor: 'initialization' stamp: 'JFG 6/16/2022 12:34:17'!
initializeWith: anAccount 

	account := anAccount.! !


!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'JFG 6/16/2022 12:34:17'!
generate

	^ self generateTreeFrom: account.
	! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:40:41'!
affectReportForDeposit: anAccountTransaction
	
	^(self tab: ('Depósito por ', anAccountTransaction value asString)).
! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:40:51'!
affectReportForDepositLeg: anAccountTransaction
	
	^(self tab: ('Entrada por transferencia de ', anAccountTransaction value asString)).
! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:11'!
affectReportForPortfolio: aPortfolio

	| newTree |
	newTree := OrderedCollection new.
	newTree addAll: (self generateTreeFrom: aPortfolio).
	tabsCounter := tabsCounter - 1.
	^newTree.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 13:35:04'!
affectReportForReceptiveAccount: aReceptiveAccount

	| newTree |
	newTree := OrderedCollection new.
	newTree add:		(self tab: aReceptiveAccount name).
	newTree addAll: (self getDetailsFrom: aReceptiveAccount).
	
	^newTree.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:40:59'!
affectReportForWithdraw: anAccountTransaction
	
	^(self tab: ('Extracción por ', anAccountTransaction value asString)).
	! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:41:09'!
affectReportForWithdrawLeg: anAccountTransaction
	
	^(self tab: ('Salida por transferencia de ', anAccountTransaction value asString)).
! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:11'!
generateTreeFrom: aPortfolio

	| tree |
	tree := OrderedCollection new.
	tree add: (self tab: aPortfolio name).
	tabsCounter := tabsCounter + 1.
	aPortfolio accounts do: [:anAccount | tree addAll: (anAccount affectReport: self)].
	tree add: (self tab: ('Balance = ', aPortfolio balance asString)).
	^tree
	! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:11'!
getDetailsFrom: aReceptiveAccount
	
	| details | 
	details := OrderedCollection new.
	tabsCounter := tabsCounter + 1.
	
	aReceptiveAccount transactions do: [:aTransaction | details add: (aTransaction affectReport: self)].
	details add: (self tab: ('Balance = ', aReceptiveAccount balance asString)).
	
	tabsCounter := tabsCounter -1.
	^details
! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:11'!
tab: aString 
	
	| string |
	string := aString.
	tabsCounter timesRepeat: [(string := ('    ', string))].
	^string! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: #'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'as yet unclassified' stamp: 'JFG 6/16/2022 12:34:17'!
from: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #PortfolioTreePrinter category: #'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'account tabsCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'JFG 6/16/2022 14:43:20'!
initialize

	tabsCounter := 0.
! !

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'JFG 6/14/2022 18:05:46'!
initializeWith: anAccount 

	account := anAccount.! !


!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'JFG 6/16/2022 09:35:53'!
generate

	^ self generateTreeFrom: account.
	! !


!PortfolioTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:20'!
affectReportForPortfolio: aPortfolio

	| newTree |
	newTree := OrderedCollection new.
	newTree addAll: (self generateTreeFrom: aPortfolio).
	tabsCounter := tabsCounter - 1.
	^newTree.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 09:47:10'!
affectReportForReceptiveAccount: aReceptiveAccount

	| newTree |
	newTree := OrderedCollection new.
	newTree add: (self tab: aReceptiveAccount name).
	^newTree.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:20'!
generateTreeFrom: aPortfolio

	| tree |
	tree := OrderedCollection new.
	tree add: (self tab: aPortfolio name).
	tabsCounter := tabsCounter + 1.
	aPortfolio accounts do: [:anAccount | tree addAll: (anAccount affectReport: self)].
	^tree
	! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'JFG 6/16/2022 14:43:20'!
tab: aString 
	
	| string |
	string := aString.
	tabsCounter timesRepeat: [(string := ('    ', string))].
	^string! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: #'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'as yet unclassified' stamp: 'JFG 6/14/2022 18:05:04'!
from: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #Transfer category: #'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !


!classDefinition: #PortfolioDetailedTreePrinterTests category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioDetailedTreePrinterTests
	instanceVariableNames: 'secondPortfolio portfolioTreePrinter thirdPortfolio report secondPortfolioName thirdPortfolioName accountName account mainPortfolioName mainPortfolio indentationString nullAmount anAmount doubleIndentationString tripleIndentationString nullBalanceString accountAux'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinterTests methodsFor: 'set up' stamp: 'JFG 6/16/2022 15:08:58'!
setUp

	anAmount := 100 * peso.
	
	mainPortfolioName := 'Portfolio de la familia'.
	secondPortfolioName := 'Portfolio de hijos'.
	thirdPortfolioName := 'Portfolio de padres'.
	accountName := 'Cuenta de Sofi'.
	
	indentationString := '    '.
	nullBalanceString := 'Balance = 0'.
	doubleIndentationString := (indentationString , indentationString).
	tripleIndentationString := (doubleIndentationString, indentationString).
	
	account := ReceptiveAccount named: accountName.
	accountAux := ReceptiveAccount named: accountName.
	
	mainPortfolio := Portfolio named: mainPortfolioName .
	secondPortfolio := Portfolio named: secondPortfolioName.
	thirdPortfolio := Portfolio named: thirdPortfolioName.
	
	report := PortfolioDetailedTreePrinter from: mainPortfolio.
	
	portfolioTreePrinter := OrderedCollection new.

	! !


!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:13:10'!
test01givenAPortfolioWithANameWithoutTransactionsThePortfolioDetailedTreeContainsTheDetailsCorrectly
	
	portfolioTreePrinter add: mainPortfolioName.
	portfolioTreePrinter add: (indentationString , nullBalanceString).
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:13:30'!
test02givenAPortfolioWithAnAccountWithoutTransactionsThePorfolioDetailedTreeContainsTheirDetailsCorrectly

	mainPortfolio add: account.
	
	portfolioTreePrinter addAll: {
		mainPortfolioName . 
		(indentationString, accountName).
		(doubleIndentationString , nullBalanceString).
		(indentationString , nullBalanceString)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:13:51'!
test03givenAPortfolioWithAnAccountWithoutTransactionsAndAPortfolioThePortfolioDetailedTreeContainsTheirDetailsCorrectly

	mainPortfolio add: account.
	mainPortfolio add: secondPortfolio.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName). 
		(doubleIndentationString , nullBalanceString).
		(indentationString, secondPortfolioName).
		(doubleIndentationString , nullBalanceString).
		(indentationString , nullBalanceString)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:14:14'!
test04givenAPortfolioWithAPortfolioWithAnAccountWithoutTransactionsThePortfolioDetailedTreeContainsTheirDetailsCorrectly

	secondPortfolio add: account.
	mainPortfolio add: secondPortfolio.
	
	portfolioTreePrinter addAll: {
		mainPortfolioName. 
		(indentationString , secondPortfolioName). 
		(doubleIndentationString , accountName).
		(tripleIndentationString , nullBalanceString).
		(doubleIndentationString , nullBalanceString).
		(indentationString , nullBalanceString)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:14:38'!
test05givenAPortfolioWithAPortfolioWithAnAccountWithoutTransactionsAndAPortfolioThePortfolioDetailedTreeContainsTheirDetailsCorrectly

	secondPortfolio add: account.
	mainPortfolio add: secondPortfolio.
	mainPortfolio add: thirdPortfolio.

	portfolioTreePrinter addAll: {
		mainPortfolioName . 
		(indentationString , secondPortfolioName). 
		(doubleIndentationString , accountName ).
		(tripleIndentationString , nullBalanceString).
		(doubleIndentationString , nullBalanceString).
		(indentationString, thirdPortfolioName).
		(doubleIndentationString , nullBalanceString ).
		(indentationString , nullBalanceString)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:14:58'!
test06givenAPortfolioWithAnAccountWithADepositRegisteredThePorfolioDetailedTreeContainsTheirDetailsCorrectly

	Deposit register: anAmount on: account.
	mainPortfolio add: account.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName).
		(doubleIndentationString , ('Depósito por ', anAmount asString)).
		(doubleIndentationString , ('Balance = ', anAmount asString)).
		(indentationString , ('Balance = ' , anAmount asString))}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:15:06'!
test07givenAPortfolioWithAnAccountWithAWithdrawRegisteredThePorfolioDetailedTreeContainsTheirDetailsCorrectly

	Withdraw register: anAmount on: account.
	mainPortfolio add: account.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName).
		(doubleIndentationString , ('Extracción por ', anAmount asString)).
		(doubleIndentationString , ('Balance = ', anAmount negated asString)).
		(indentationString , ('Balance = ' , anAmount negated asString))}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:15:15'!
test08givenAPortfolioWithAnAccountWithATransferDepositRegisteredThePorfolioDetailedTreeContainsTheirDetailsCorrectly

	Transfer amount: 100 * peso from: accountAux to: account.
	mainPortfolio add: account.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName).
		(doubleIndentationString , ('Entrada por transferencia de ', anAmount asString)).
		(doubleIndentationString , ('Balance = ', anAmount asString)).
		(indentationString , ('Balance = ' , anAmount asString))}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	
	! !

!PortfolioDetailedTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:15:24'!
test09givenAPortfolioWithAnAccountWithATransferWithdrawRegisteredThePorfolioDetailedTreeContainsTheirDetailsCorrectly

	Transfer amount: 100 * peso from: account to: accountAux.
	mainPortfolio add: account.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName).
		(doubleIndentationString , ('Salida por transferencia de ', anAmount asString)).
		(doubleIndentationString , ('Balance = ', anAmount negated asString)).
		(indentationString , ('Balance = ' , anAmount negated asString))}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !


!classDefinition: #PortfolioTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'JFG 6/16/2022 02:05:51'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JFG 6/16/2022 02:05:51'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JFG 6/16/2022 02:05:51'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JFG 6/16/2022 02:05:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JFG 6/16/2022 02:05:51'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JFG 6/16/2022 02:05:51'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTests category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTests
	instanceVariableNames: 'secondPortfolio portfolioTreePrinter thirdPortfolio report secondPortfolioName thirdPortfolioName accountName account mainPortfolioName mainPortfolio indentationString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTests methodsFor: 'set up' stamp: 'JFG 6/16/2022 13:06:19'!
setUp

	mainPortfolioName := 'Portfolio de la familia'.
	secondPortfolioName := 'Portfolio de hijos'.
	thirdPortfolioName := 'Portfolio de padres'.
	accountName := 'Cuenta de Sofi'.
	indentationString := '    '.
	
	account := ReceptiveAccount named: accountName.
	
	mainPortfolio := Portfolio named: mainPortfolioName .
	secondPortfolio := Portfolio named: secondPortfolioName.
	thirdPortfolio := Portfolio named: thirdPortfolioName.
	
	report := PortfolioTreePrinter from: mainPortfolio.
	
	portfolioTreePrinter := OrderedCollection new.

	! !


!PortfolioTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 15:10:36'!
test01givenAPortfolioWithANameThePortfolioTreeContainsTheNameCorrectly
	
	portfolioTreePrinter add: mainPortfolioName.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	
	
	! !

!PortfolioTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:30:23'!
test02givenAPortfolioWithAnAccountThePorfolioTreeContainsTheirNamesCorrectly
	
	mainPortfolio add: account.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:30:23'!
test03givenAPortfolioWithAnAccountAndAPortfolioThePortfolioTreeContainsTheirNamesCorrectly

	mainPortfolio add: account.
	mainPortfolio add: secondPortfolio.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName . 
		(indentationString, accountName). 
		(indentationString, secondPortfolioName)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:30:23'!
test04givenAPortfolioWithAPortfolioWithAnAccountThePortfolioTreeContainsTheirNamesCorrectly

	secondPortfolio add: account.
	mainPortfolio add: secondPortfolio.
	
	portfolioTreePrinter addAll: 
		{mainPortfolioName. 
		(indentationString, secondPortfolioName). 
		((indentationString, indentationString), accountName)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !

!PortfolioTreePrinterTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:30:23'!
test05givenAPortfolioWithAPortfolioWithAnAccountAndAPortfolioThePortfolioTreeContainsTheirNamesCorrectly

	secondPortfolio add: account.
	mainPortfolio add: secondPortfolio.
	mainPortfolio add: thirdPortfolio.

	portfolioTreePrinter addAll: 
		{mainPortfolioName. 
		(indentationString, secondPortfolioName). 
		((indentationString, indentationString), accountName). 
		(indentationString, thirdPortfolioName)}.
	
	self assert: portfolioTreePrinter equals: report generate.
	
	
	! !


!classDefinition: #ReceptiveAccountTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #SummaryTests category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #SummaryTests
	instanceVariableNames: 'summary mainAccount portfolio accountReport portfolioReport secondAccount anAmount nullAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryTests methodsFor: 'set up' stamp: 'JFG 6/16/2022 12:20:57'!
setUp
	
	nullAmount := 0.
	anAmount := 100 * peso.
	
	mainAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	accountReport := GetSummary from: mainAccount.
	portfolioReport := GetSummary from: portfolio.

	summary := OrderedCollection new.! !


!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:19:31'!
test01givenAnAccountWithoutTransactionsTheSummaryIsEmpty
	
	summary add: ('Balance = ', nullAmount asString).
	
	self assert: summary equals: accountReport generate! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test02givenAnAccountWithADepositTheSummaryRegistersTheTransaction

	summary addAll: {
		('Depósito por ', anAmount asString). 
		('Balance = ', anAmount asString)}.
		
	Deposit register: anAmount on: mainAccount.
	
	self assert: summary equals: accountReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test03givenAnAccountWithAWithdrawTheSummaryRegistersTheTransaction
	

	summary addAll: {
		('Extracción por ', anAmount asString).
		('Balance = ', anAmount negated asString)}.

	Withdraw register: anAmount on: mainAccount.
	
	self assert: summary equals: accountReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test04givenAnAccountWithATransactionWithdrawTheSummaryRegistersTheTransaction

	summary addAll: {
		('Salida por transferencia de ', anAmount asString).
		('Balance = ', anAmount negated asString)}.
	
	 Transfer amount: anAmount from: mainAccount to: secondAccount.
	
	self assert: accountReport generate equals: summary.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test05givenAnAccountWithATransactionDepositTheSummaryRegistersTheTransaction
	
	summary addAll: {
		('Entrada por transferencia de ', anAmount asString).
		('Balance = ', anAmount asString)}.
	
	 Transfer amount: anAmount from: secondAccount to: mainAccount.
	
	self assert: summary equals: accountReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:19:31'!
test06givenAnEmptyPortfolioTheSummaryIsEmpty

	summary add: ('Balance = ', nullAmount asString).
	
	self assert:  summary equals: portfolioReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test07givenAPortfolioWithAnEmptyAccountThePortfolioSummaryIsEmpty

	portfolio add: mainAccount.
	summary add: ('Balance = ', nullAmount asString).
	
	self assert: summary equals: accountReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test08givenAPortfolioWithAnAccountWithADepositThePortfolioSummaryRegistersTheTransaction

	
	portfolio add: mainAccount.

	summary addAll: {
		('Depósito por ', anAmount asString). 
		('Balance = ', anAmount asString)}.

	Deposit register: anAmount on: mainAccount.
	
	self assert: summary equals: portfolioReport generate! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test09givenAPortfolioWithAnAccountWithAWithdrawThePortfolioSummaryRegistersTheTransaction
	
	portfolio add: mainAccount.
	summary addAll: {
		('Extracción por ', anAmount asString). 
		('Balance = ', anAmount negated asString)}.

	Withdraw register: anAmount on: mainAccount.
	
	self assert: summary equals: portfolioReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test10givenAPortfolioWithAnAccountWithATransactionWithdrawThePortfolioSummaryRegistersTheTransaction

	
	portfolio add: mainAccount.

	summary addAll: {
		('Salida por transferencia de ', anAmount asString).
		('Balance = ', anAmount negated asString)}.

	Transfer amount: anAmount from: mainAccount to: secondAccount .
	
	self assert: summary equals: portfolioReport generate.! !

!SummaryTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 12:20:57'!
test11givenAPortfolioWithAnAccountWithATransactionDepositThePortfolioSummaryRegistersTheTransaction
	
	
	portfolio add: mainAccount.

	summary addAll: {
		('Entrada por transferencia de ', anAmount asString).
		('Balance = ', anAmount asString)}.

	Transfer amount: anAmount from: secondAccount to: mainAccount.
	
	self assert: summary equals: portfolioReport generate.! !


!classDefinition: #TransferNetTests category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTests
	instanceVariableNames: 'account secondAccount portfolio accountReport portfolioReport anAmount nullAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTests methodsFor: 'set up' stamp: 'JFG 6/16/2022 11:51:20'!
setUp
	
	nullAmount := 0.
	anAmount := 100 * peso.
	
	account := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	accountReport := GetTransferNet from: account.
	portfolioReport := GetTransferNet from: portfolio.! !


!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:48:37'!
test01givenAnAccountWithNoTransfersTheTransferNetIsZero
	
	self assert: nullAmount equals: accountReport generate.! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:02'!
test02givenAnAccountWithTransferWithdrawTheTransferNetIsCorrect
	
	Transfer amount: anAmount from: account to: secondAccount.
	
	self assert: anAmount negated equals: accountReport generate.! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:02'!
test03givenAnAccountWithTransferDepositTheTransferNetIsCorrect

	Transfer amount: anAmount from: secondAccount to: account.
	
	self assert: anAmount equals: accountReport generate.! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:02'!
test04givenAnAccountWithADepositTheTransferNetIsZero

	Deposit register: anAmount on: account.
	
	self assert: nullAmount equals: accountReport generate.! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:02'!
test05givenAnAccountWithAWithdrawTheTransferNetIsZero

	Withdraw register: anAmount on: account.
	
	self assert: nullAmount equals: accountReport generate.! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:49:30'!
test05givenAnEmptyPortfolioTheTransferNetIsZero
	
	self assert: nullAmount equals: portfolioReport generate.! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:20'!
test06givenAPortfolioWithAnEmptyAccountTheTransferNetIsZero

	portfolio add: account.
	
	self assert: nullAmount equals: portfolioReport generate.
	! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:20'!
test07givenAPortfolioWithAnAccountWithATransferDepositTheTransferNetIsCorrect

	portfolio add: account.
	
	Transfer amount: anAmount from: secondAccount to: account. 
	
	self assert: anAmount equals: portfolioReport generate.
! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:48'!
test08givenAPortfolioWithAnAccountWithATransferWithdrawTheTransferNetIsCorrect

	portfolio add: account.
	
	Transfer amount: anAmount from: account to: secondAccount . 
	
	self assert: anAmount negated equals: portfolioReport generate.
! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:20'!
test09givenAPortfolioWithAnAccountWithADepositTheTransferNetIsZero

	portfolio add: account.
	
	Deposit register: anAmount on: account.
	
	self assert: nullAmount equals: portfolioReport generate.
! !

!TransferNetTests methodsFor: 'tests' stamp: 'JFG 6/16/2022 11:51:20'!
test10givenAPortfolioWithAnAccountWithAWithdrawTheTransferNetIsZero
	
	portfolio add: account.
	
	Withdraw register: anAmount on: account.
	
	self assert: nullAmount equals: portfolioReport generate.
! !


!classDefinition: #TransferTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !
