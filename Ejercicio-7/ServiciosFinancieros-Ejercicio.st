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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'JFG 6/6/2022 14:53:42'!
test01
	"una transferencia es entre 2 receptive accounts"
	"deberia poder consultar cada contraparte de la accion (es decir la extraccion a la cuenta de la q se extrajo el dinero y el deposito en la cuenta donde de deposito el dinero) -> se diferencia la extraccion o un deposito comun de otra extraccion/deposito para transferencia"
	"una transferencia necesita: 2 cuentas (en donde se hace la extraccion y en donde se hace el deposito) y el monto"
	|accountOfDeposit accountOfWithdraw transfer transferValue |
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	Deposit register: 100 * peso on: accountOfWithdraw.
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: accountOfWithdraw balance equals: transferValue.
	self assert: accountOfDeposit balance equals: transferValue.
	
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 10:40:53'!
test02
	"una transferencia donde una cuenta puede quedar en negativo"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: accountOfWithdraw balance equals: transferValue negated.
	self assert: accountOfDeposit balance equals: transferValue.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 11:39:25'!
test03
	"una transferencia donde se consultan cada pata"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: transfer withdrawLeg equals: (accountOfWithdraw "transactions last").
	self assert: transfer depositLeg equals: (accountOfDeposit "transactions last").
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 11:41:59'!
test04
	"una transferencia donde se consultan las contrapartes"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: (transfer hasCounterPartOf: transfer withdrawLeg) equals: transfer depositLeg.
	self assert: (transfer hasCounterPartOf: transfer depositLeg) equals: transfer withdrawLeg.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 11:48:37'!
test05
	"Una transferencia de ida y vuelta"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	Deposit register: 100 * peso on: accountOfWithdraw.
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	transfer := Transfer from: accountOfDeposit to: accountOfWithdraw withValue: transferValue.	
	
	self assert: accountOfWithdraw balance equals: 100 * peso.
	self assert: accountOfDeposit balance equals: 0 * peso.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 11:53:35'!
test06
	"Una transferencia donde la cuenta de extraccion no puede ser igual a la cuenta de deposito"
	|account transferValue|
	
	account := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	self should: [Transfer from: account to: account withValue: transferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 12:31:53'!
test07
	"una transferencia no puede hacerse si el transferValue es negativo"
	|accountOfDeposit accountOfWithdraw transferValue|

	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := -50 * peso.
	
	self should: [Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SJ 6/6/2022 14:45:37'!
test08
	"una transferencia no puede hacerse si el transferValue es cero"
	|accountOfDeposit accountOfWithdraw transferValue|

	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 0 * peso.
	
	self should: [Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'JFG 6/6/2022 15:22:14'!
test09
	"una transferencia donde se consultan las contrapartes"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: (transfer counterPartOf: accountOfWithdraw) equals: transferValue.
	self assert: (transfer counterPartOf: accountOfDeposit) equals: transferValue negated.
! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


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


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SJ 6/5/2022 21:50:07'!
balance

	^transactions sum: [ :aTransaction |
		(aTransaction isKindOf: Withdraw) ifTrue: [aTransaction valueForBalance.] 
			ifFalse: [aTransaction value]. ] ifEmpty: [0]. ! !

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JFG 6/6/2022 15:26:29'!
isLeg
	
	! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawLeg depositLeg value amountOfMoneyToBeTransferred'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'operations' stamp: 'JFG 6/6/2022 15:23:54'!
hasCounterPartOf: aReceptiveAccount 
	
	(aReceptiveAccount = withdrawLeg) ifTrue: [^depositLeg] ifFalse: [^withdrawLeg].! !


!Transfer methodsFor: 'private accessing' stamp: 'JFG 6/6/2022 15:28:59'!
counterPartOf: anAccount 

	(anAccount = withdrawLeg) ifTrue: [^ value] ifFalse: [^ value negated].
! !

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/6/2022 00:40:52'!
depositLeg
	^depositLeg.! !

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/6/2022 00:41:09'!
withdrawLeg
	^withdrawLeg.! !


!Transfer methodsFor: 'initialization' stamp: 'SJ 6/6/2022 11:34:39'!
initializeFrom: accountOfWithdrawal to: accountOfDeposit for: AmountOfMoneyToBeTransferred 
	withdrawLeg := accountOfWithdrawal "register: (Withdraw for: AmountOfMoneyToBeTransferred)".
	depositLeg := accountOfDeposit "register: (Deposit for: AmountOfMoneyToBeTransferred)".
	value := AmountOfMoneyToBeTransferred.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'SJ 6/6/2022 00:39:43'!
for: aValue
	^ self new initializeFor: aValue ! !

!Transfer class methodsFor: 'instance creation' stamp: 'SJ 6/6/2022 12:39:13'!
from: anAccountOfWithdrawal to: anAccountOfDeposit withValue: AmountOfMoneyToBeTransferred 
	
	((self isAValidTransactionWith: anAccountOfWithdrawal and: anAccountOfDeposit) 
		and: [self transferValueIsValid: AmountOfMoneyToBeTransferred])
		ifFalse: [Transfer error: self invalidTransactionErrorDescription].
	
	Withdraw register: AmountOfMoneyToBeTransferred on: anAccountOfWithdrawal.
	Deposit register: AmountOfMoneyToBeTransferred on: anAccountOfDeposit.
	
	^self new initializeFrom: anAccountOfWithdrawal to: anAccountOfDeposit for: AmountOfMoneyToBeTransferred.
	
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
