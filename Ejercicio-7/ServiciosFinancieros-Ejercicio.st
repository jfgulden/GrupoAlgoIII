!classDefinition: #PortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: 'account1 account2 deposit11 deposit22 accountWithoutTransactions portfolioWithAccount1 portfolioWithAccount1AndAccount2 portfolioWithAccount2AndPortfolio portfolioWithAccount1AndAccountWithoutTransactions emptyPortfolio portfolioWithAccountWithoutTransactions portfolioWithPortfolio transactionss portfolioWithAccount3 account3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:29:33'!
test10givenANotEmptyPortfolioWithTransactionsRegisteredTheBalanceCanBeCalculated
	"Obtenemos el balance de un portfolio"
	self assert: portfolioWithAccount1AndAccount2 balance equals: (150 * peso).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test11givenAPortfolioWithAnotherPortfolioContainigAccountsWithRegisteredTransactionsTheTotalBalanceCanBeCalculated
	"Obtenemos el balance de un portfolio con un portfolio adentro"
	
	| portfolio portfolioAux anAccount1 anAccount2 |
	
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount2.
	Deposit register: 50 * peso on: anAccount1.
	
	portfolioAux addElement: anAccount1.

	portfolio addElement: portfolioAux.
	portfolio addElement: anAccount2.
	
	self assert: portfolio balance equals: (150 * peso).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:34:30'!
test12givenAPortfolioContainingAnAccountThePortfolioRegistersTheTransactionOfSaidAccount
	"Chequeamos que la única cuenta que se encuentra en el portfolio haya registrado una transacción"
	
	self assert: (portfolioWithAccount2AndPortfolio hasRegistered: deposit11).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:36:16'!
test13givenAPortfolioContainingTwoAccountsButOnlyOneWithARegisteredTransactionThePortfolioRegistersTheTransaction
	"Chequeamos que la segunda cuenta que se encuentra en el portfolio haya registrado una transacción"
	"
	| portfolio anAccount1 anAccount2 deposit |
	
	portfolio := Portfolio new.
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.

	
	deposit := Deposit register: 100 * peso on: anAccount2.

	portfolio addElement: anAccount1.
	portfolio addElement: anAccount2.
"
	self assert: (portfolioWithAccount1AndAccountWithoutTransactions hasRegistered: deposit11).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:37:14'!
test14givenAnEmptyPortfolioTheTotalBalanceIsZero
	"Chequeamos que un portfolio vacio tenga balance=0"

	self assert: emptyPortfolio balance equals: 0.
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:38:22'!
test15givenAPortfolioContainingAnAccountWithNoTransactionsTheBalanceOfThePortfolioIsZero
	"Chequeamos que un portfolio no vacio con sus cuentas con balance = 0 tenga balance=0"

	self assert: portfolioWithAccountWithoutTransactions balance equals: 0.
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:40:27'!
test16givenAPortfolioWithAnotherPortfolioContainingAnAccountWithATransactionTheFirstPortfolioRegistersTheTransaction
	"Chequeamos que un portfolio con un portfolio dentro encuentre la transacción"
	"
	| portfolio portfolioAux anAccount deposit |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.

	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: anAccount.
	
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	"
	self assert: (portfolioWithPortfolio hasRegistered: deposit11).

	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:41:24'!
test17givenAPortfolioContainingAnAccountWithNoTransactionsThePortfolioDoesNotRegisterTheTransactionSent
	"Chequeamos que un portfolio con un portfolio sin transacciones registradas no encuentre ninguna"

	self deny: (portfolioWithAccountWithoutTransactions hasRegistered: deposit11).
		
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:42:46'!
test18givenAnEmptyPortfolioTheTransactionSentIsNotRegistered
	"Chequeamos que un portfolio vacio no encuentre transacciones registradas que se hicieron en una cuenta no incluida en el portfafolio"
	
	self deny: (emptyPortfolio hasRegistered: deposit11).
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:49:46'!
test19givenAPortfolioContainingAnAccountWithTransactionsThePortfolioObtainsAllTransactions
	"Chequeamos que un portfolio con una cuenta pueda obtener todas las transacciones de esa cuenta"

	self assert: (portfolioWithAccount3 transactions) equals: transactionss.
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:50:08'!
test20givenAnEmptyPortfolioNoTransactionCanBeObtained
	"Chequeamos que un portfolio vacio no tenga transacciones"
	
	| portfolio |
	portfolio := Portfolio new.

	self assert: (emptyPortfolio transactions) equals: nil.
	
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test21givenAPortfolioContainingAnAccountWithNoTransactionsThereAreNoTransactionsInPortfolio
	"Chequeamos que un portfolio vacio no tenga transacciones registradas"
	
	| portfolio anAccount transactions |
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	transactions := OrderedCollection new.

	portfolio addElement: anAccount.

	self assert: (portfolio transactions) equals: transactions.
	
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test22givenAPortfolioContainingAnotherPortfolioWithANotEmptyAccountThePortfolioObtainsAllTransactions
	"Chequeamos que un portfolio con un portfolio dentro obtenga todas las transacciones registradas en una cuenta incluida en este último"
	
	| portfolio portfolioAux anAccount deposit transactions |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.

	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: anAccount.
	transactions := OrderedCollection new.
	transactions add: deposit.
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self assert: (portfolio transactions) equals: transactions.
	
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test23canNotAddTheSameAccountTwiceInAPortfolio
	"Chequeamos que no se pueda agregar una cuenta ya agregada"
	
	| portfolio anAccount |
	portfolio := Portfolio new.

	anAccount := ReceptiveAccount new.
	portfolio addElement: anAccount.
	
	self
		should: [ portfolio addElement: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio elementAlreadyIncludedErrorDescription].
		
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test24canNotAddAnAccountToAPortfolioThatContainsAnotherPortfolioWithTheSameAccount
	"Chequeamos que no se pueda agregar una cuenta que ya ha sido agregada a un portfolio agregado"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self
		should: [ portfolio addElement: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio elementAlreadyIncludedErrorDescription].
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test25canNotAddTheSamePortfolioInAPortfolio
	"Chequeamos que no se pueda agregar un portfolio que sea igual a self"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self
		should: [ portfolio addElement: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddItselfErrorDescription].
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test26canNotAddTheSameAccountInAPortfolioThatIsContainedInAnotherPortfolioThatAlreadyAddedTheAccount
	"Chequeamos que no se pueda agregar una cuenta que ya se agrego"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolio addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self
		should: [ portfolioAux addElement: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
	
		! !

!PortfolioTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:16:33'!
test27canNotAddAPortfolioInAPortfolioWithAnAccountAlreadyAddedInSecondPortfolio
	"Chequeamos que no se pueda agregar un portfolio a otro portfolio con cuentas agregadas iguales"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolio addElement: anAccount.
	portfolioAux addElement: anAccount.
	
	self
		should: [ portfolio addElement: portfolioAux ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
	
		! !


!PortfolioTests methodsFor: 'setup' stamp: 'JFG 6/9/2022 00:49:11'!
setUp
	
	| deposit3 deposit4 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.

	
	deposit11 := Deposit register: 100 * peso on: account1 .
	deposit22 :=  Deposit register: 50 * peso on: account2.
	deposit3 := Deposit register: 100 * peso on: account3.
	deposit4 := Deposit register: 50 * peso on: account3.
	
	transactionss := OrderedCollection new.
	transactionss addAll: {deposit3. deposit4}.
	
	accountWithoutTransactions := ReceptiveAccount new.
	
	portfolioWithAccount1 := Portfolio new.
	portfolioWithAccount1 addElement: account1.
	
	portfolioWithAccount1AndAccount2 := Portfolio new.
	portfolioWithAccount1AndAccount2 addElement: account1.
	portfolioWithAccount1AndAccount2 addElement: account2.
	
	portfolioWithAccount2AndPortfolio := Portfolio new.
	portfolioWithAccount2AndPortfolio addElement: portfolioWithAccount1.
	portfolioWithAccount2AndPortfolio addElement: account2.
	
	portfolioWithAccount1AndAccountWithoutTransactions := Portfolio new.
	portfolioWithAccount1AndAccountWithoutTransactions addElement: accountWithoutTransactions.
	portfolioWithAccount1AndAccountWithoutTransactions addElement: account1.
	
	emptyPortfolio := Portfolio new.
	
	portfolioWithAccountWithoutTransactions := Portfolio new.
	portfolioWithAccountWithoutTransactions addElement: accountWithoutTransactions.
	
	portfolioWithPortfolio := Portfolio new.
	portfolioWithPortfolio addElement: portfolioWithAccount1.
	
	portfolioWithAccount3 := Portfolio new.
	portfolioWithAccount3 addElement: account3.

	

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:10:22'!
test01aTransferenceWithdrawsAndDepositsTheCorrectAmountOfMoneyInTheInvolvedAccounts
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

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:12:04'!
test02aTransferenceCanWithdrawMoneyFromAnAccountEvenIfTheBalanceOfSaidAccountIsLeftOnNegative
	"una transferencia donde una cuenta puede quedar en negativo"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: accountOfWithdraw balance equals: transferValue negated.
	self assert: accountOfDeposit balance equals: transferValue.! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:13:03'!
test03whenConsultedATransferenceHasTwoLegs
	"una transferencia donde se consultan cada pata"
	|accountOfDeposit accountOfWithdraw transfer transferValue aDepositLeg aWithdrawLeg |
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	aWithdrawLeg := Withdraw register: transferValue on: accountOfWithdraw.
	aDepositLeg := Deposit register: transferValue on: accountOfDeposit.
	
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: (transfer withdrawLeg isKindOf: Withdraw).
	self assert: (transfer depositLeg isKindOf: Deposit).
	! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:14:03'!
test04givenATransferenceTheCounterPartsOfEachLegAreDemanded
	"una transferencia donde se consultan las contrapartes"
	|accountOfDeposit accountOfWithdraw transfer transferValue|
	
	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	transfer := Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue.	
	
	self assert: (transfer hasCounterPartOf: transfer withdrawLeg) equals: transfer depositLeg.
	self assert: (transfer hasCounterPartOf: transfer depositLeg) equals: transfer withdrawLeg.! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:15:16'!
test05aTransferenceCanBeMadeBothWaysUsingTwoDifferentAccounts
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

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:16:26'!
test06whenATransferenceIsBeingMadeTheAccountsInvolvedCanNotBeTheSame
	"Una transferencia donde la cuenta de extraccion no puede ser igual a la cuenta de deposito"
	|account transferValue|
	
	account := ReceptiveAccount new.
	transferValue := 50 * peso.
	
	self should: [Transfer from: account to: account withValue: transferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:17:10'!
test07whenATransferenceIsBeingMadeTheTransferValueCanNotBeNegative
	"una transferencia no puede hacerse si el transferValue es negativo"
	|accountOfDeposit accountOfWithdraw transferValue|

	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := -50 * peso.
	
	self should: [Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !

!TransferTests methodsFor: 'transfer tests' stamp: 'SJ 6/8/2022 19:17:38'!
test08whenATransferenceIsBeingMadeTheTransferValueCanNotBeZero
	"una transferencia no puede hacerse si el transferValue es cero"
	|accountOfDeposit accountOfWithdraw transferValue|

	accountOfDeposit := ReceptiveAccount new.
	accountOfWithdraw := ReceptiveAccount new.
	transferValue := 0 * peso.
	
	self should: [Transfer from: accountOfWithdraw to: accountOfDeposit withValue: transferValue]
		raise: Error
		withExceptionDo: [ :anError | self assert: (Transfer invalidTransactionErrorDescription) equals: (anError messageText)].! !


!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:23:54'!
test10givenANotEmptyPortfolioWithTransactionsRegisteredTheBalanceCanBeCalculated
	"Obtenemos el balance de un portfolio"
	
	| portfolio anAccount1 anAccount2 |
	
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount1.
	Deposit register: 100 * peso on: anAccount2.
	portfolio := Portfolio new.
	
	portfolio addElement: anAccount1.
	portfolio addElement: anAccount2.
	
	self assert: portfolio balance equals: (200 * peso).
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:25:03'!
test11givenAPortfolioWithAnotherPortfolioContainigAccountsWithRegisteredTransactionsTheTotalBalanceCanBeCalculated
	"Obtenemos el balance de un portfolio con un portfolio adentro"
	
	| portfolio portfolioAux anAccount1 anAccount2 |
	
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount2.
	Deposit register: 50 * peso on: anAccount1.
	
	portfolioAux addElement: anAccount1.

	portfolio addElement: portfolioAux.
	portfolio addElement: anAccount2.
	
	self assert: portfolio balance equals: (150 * peso).
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:03:22'!
test12givenAPortfolioContainingAnAccountThePortfolioRegistersTheTransactionOfSaidAccount
	"Chequeamos que la única cuenta que se encuentra en el portfolio haya registrado una transacción"
	
	| portfolio anAccount deposit |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: anAccount.

	portfolio addElement: anAccount.
	
	self assert: (portfolio hasRegistered: deposit) = true.
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:28:47'!
test13givenAPortfolioContainingTwoAccountsButOnlyOneWithARegisteredTransactionThePortfolioRegistersTheTransaction
	"Chequeamos que la segunda cuenta que se encuentra en el portfolio haya registrado una transacción"
	
	| portfolio anAccount1 anAccount2 deposit |
	
	portfolio := Portfolio new.
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.

	
	deposit := Deposit register: 100 * peso on: anAccount2.

	portfolio addElement: anAccount1.
	portfolio addElement: anAccount2.

	self assert: (portfolio hasRegistered: deposit).
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:29:23'!
test14givenAnEmptyPortfolioTheTotalBalanceIsZero
	"Chequeamos que un portfolio vacio tenga balance=0"
	
	| portfolio |
	portfolio := Portfolio new.

	self assert: portfolio balance equals: 0.
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:31:48'!
test15givenAPortfolioContainingAnAccountWithNoTransactionsTheBalanceOfThePortfolioIsZero
	"Chequeamos que un portfolio no vacio con sus cuentas con balance = 0 tenga balance=0"
	
	| portfolio anAccount |
	portfolio := Portfolio new.

	anAccount := ReceptiveAccount new.
	portfolio addElement: anAccount.
	
	self assert: portfolio balance equals: 0.
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'JFG 6/8/2022 23:56:06'!
test16givenAPortfolioWithAnotherPortfolioContainingAnAccountWithATransactionTheFirstPortfolioRegistersTheTransaction
	"Chequeamos que un portfolio con un portfolio dentro encuentre la transacción"
	
	| portfolio portfolioAux anAccount deposit |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.

	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: anAccount.
	
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self assert: (portfolio hasRegistered: deposit).

	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:11:56'!
test17givenAPortfolioContainingAnAccountWithNoTransactionsThePortfolioDoesNotRegisterTheTransactionSent
	"Chequeamos que un portfolio con un portfolio sin transacciones registradas no encuentre ninguna"
	
	| portfolio anAccount deposit aUselessAccount |
	portfolio := Portfolio new.

	anAccount := ReceptiveAccount new.
	aUselessAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: aUselessAccount.
	
	portfolio addElement: anAccount.
		
	self deny: (portfolio hasRegistered: deposit).
		
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 00:11:28'!
test18givenAnEmptyPortfolioTheTransactionSentIsNotRegistered
	"Chequeamos que un portfolio vacio no encuentre transacciones registradas que se hicieron en una cuenta no incluida en el portfafolio"
	
	| portfolio anAccount deposit |
	portfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: anAccount.
	
	self deny: (portfolio hasRegistered: deposit).
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:38:58'!
test19givenAPortfolioContainingAnAccountWithTransactionsThePortfolioObtainsAllTransactions
	"Chequeamos que un portfolio con una cuenta pueda obtener todas las transacciones de esa cuenta"
	
	| portfolio anAccount withdraw1 deposit2 withdraw2 deposit1 transactions |
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	transactions := OrderedCollection new.
	deposit1 := Deposit register: 100 * peso on: anAccount.
	withdraw1 := Withdraw register: 50 * peso on: anAccount.
	deposit2 := Deposit register: 100 * peso on: anAccount.
	withdraw2 := Withdraw register: 50 * peso on: anAccount.
	
	transactions addAll: {deposit1. withdraw1. deposit2. withdraw2}.
	
	portfolio addElement: anAccount.
	self assert: (portfolio transactions) equals: transactions.
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'JFG 6/9/2022 01:05:12'!
test20givenAnEmptyPortfolioNoTransactionCanBeObtained
	"Chequeamos que un portfolio vacio no tenga transacciones"
	
	| portfolio emptyCollection |
	portfolio := Portfolio new.
	emptyCollection := OrderedCollection new.

	self assert: (portfolio transactions) equals: emptyCollection.
	
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:45:37'!
test21givenAPortfolioContainingAnAccountWithNoTransactionsThereAreNoTransactionsInPortfolio
	"Chequeamos que un portfolio vacio no tenga transacciones registradas"
	
	| portfolio anAccount transactions |
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	transactions := OrderedCollection new.

	portfolio addElement: anAccount.

	self assert: (portfolio transactions) equals: transactions.
	
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:48:50'!
test22givenAPortfolioContainingAnotherPortfolioWithANotEmptyAccountThePortfolioObtainsAllTransactions
	"Chequeamos que un portfolio con un portfolio dentro obtenga todas las transacciones registradas en una cuenta incluida en este último"
	
	| portfolio portfolioAux anAccount deposit transactions |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.

	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: anAccount.
	transactions := OrderedCollection new.
	transactions add: deposit.
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self assert: (portfolio transactions) equals: transactions.
	
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:51:14'!
test23canNotAddTheSameAccountTwiceInAPortfolio
	"Chequeamos que no se pueda agregar una cuenta ya agregada"
	
	| portfolio anAccount |
	portfolio := Portfolio new.

	anAccount := ReceptiveAccount new.
	portfolio addElement: anAccount.
	
	self
		should: [ portfolio addElement: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio elementAlreadyIncludedErrorDescription].
		
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:52:55'!
test24canNotAddAnAccountToAPortfolioThatContainsAnotherPortfolioWithTheSameAccount
	"Chequeamos que no se pueda agregar una cuenta que ya ha sido agregada a un portfolio agregado"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self
		should: [ portfolio addElement: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio elementAlreadyIncludedErrorDescription].
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:54:03'!
test25canNotAddTheSamePortfolioInAPortfolio
	"Chequeamos que no se pueda agregar un portfolio que sea igual a self"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolioAux addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self
		should: [ portfolio addElement: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddItselfErrorDescription].
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 19:58:49'!
test26canNotAddTheSameAccountInAPortfolioThatIsContainedInAnotherPortfolioThatAlreadyAddedTheAccount
	"Chequeamos que no se pueda agregar una cuenta que ya se agrego"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolio addElement: anAccount.
	portfolio addElement: portfolioAux.
	
	self
		should: [ portfolioAux addElement: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
	
		! !

!TransferTests methodsFor: 'portfolio tests' stamp: 'SJ 6/8/2022 20:00:31'!
test27canNotAddAPortfolioInAPortfolioWithAnAccountAlreadyAddedInSecondPortfolio
	"Chequeamos que no se pueda agregar un portfolio a otro portfolio con cuentas agregadas iguales"
	
	| portfolio portfolioAux anAccount |
	portfolio := Portfolio new.
	portfolioAux := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolio addElement: anAccount.
	portfolioAux addElement: anAccount.
	
	self
		should: [ portfolio addElement: portfolioAux ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio elementAlreadyIncludedErrorDescription].
	
		! !


!TransferTests methodsFor: 'setup' stamp: 'JFG 6/9/2022 00:30:27'!
setUp
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

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/8/2022 23:41:55'!
getMasterPortfolio
	precedingPortfolio = nil ifTrue: [^self].
	^ precedingPortfolio getMasterPortfolio.! !

!Portfolio methodsFor: 'accessing' stamp: 'JFG 6/9/2022 01:04:28'!
transactions

	^elements inject: OrderedCollection new into: [ :listOfTransactions :anAccount | listOfTransactions , anAccount transactions.].

	
	! !


!Portfolio methodsFor: 'error handler' stamp: 'SJ 6/8/2022 18:39:29'!
elementIsAlreadyIncluded
	self error: self class elementAlreadyIncludedErrorDescription.! !


!Portfolio methodsFor: 'assertions' stamp: 'SJ 6/8/2022 18:14:23'!
assertAccountFrom: aPortfolio isNotEqualTo: anAccount
	self assertPortfolioDoesNotInclude: anAccount.! !

!Portfolio methodsFor: 'assertions' stamp: 'JFG 6/8/2022 23:29:54'!
assertElementIsNotContainedInPortfolio: anElement
	"aca empiezo a recorrer todo el arbol desde el portfolio que contiene a todos, desde el nivel mas grande"
	"voy al nivel mas alto, empiezo a recorrer desde ahi, masterPortfolio es el nivel mas alto"
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


!ReceptiveAccount methodsFor: 'assertions' stamp: 'SJ 6/8/2022 18:38:50'!
assertAccountFrom: aPortfolio isNotEqualTo: anElement
	self = anElement ifTrue: [aPortfolio elementIsAlreadyIncluded]. ! !


!ReceptiveAccount methodsFor: 'accessing - private' stamp: 'SJ 6/8/2022 16:36:32'!
assignPortfolioContainingIt: aPortfolio
	^self.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawLeg depositLeg value amountOfMoneyToBeTransferred'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'operations' stamp: 'JFG 6/6/2022 15:23:54'!
hasCounterPartOf: aReceptiveAccount 
	
	(aReceptiveAccount = withdrawLeg) ifTrue: [^depositLeg] ifFalse: [^withdrawLeg].! !


!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/8/2022 18:53:11'!
counterPartOf: aTransactionLeg 

	(aTransactionLeg = withdrawLeg) ifTrue: [^ depositLeg ] ifFalse: [^ withdrawLeg].
! !

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/6/2022 00:40:52'!
depositLeg
	^depositLeg.! !

!Transfer methodsFor: 'private accessing' stamp: 'SJ 6/6/2022 00:41:09'!
withdrawLeg
	^withdrawLeg.! !


!Transfer methodsFor: 'initialization' stamp: 'SJ 6/8/2022 18:48:43'!
initializeFrom: accountOfWithdrawal to: accountOfDeposit for: AmountOfMoneyToBeTransferred 
	
	withdrawLeg := Withdraw register: AmountOfMoneyToBeTransferred on: accountOfWithdrawal.
	depositLeg := Deposit register: AmountOfMoneyToBeTransferred on: accountOfDeposit.
	value := AmountOfMoneyToBeTransferred.
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'SJ 6/6/2022 00:39:43'!
for: aValue
	^ self new initializeFor: aValue ! !

!Transfer class methodsFor: 'instance creation' stamp: 'JFG 6/7/2022 15:15:32'!
from: anAccountOfWithdrawal to: anAccountOfDeposit withValue: AmountOfMoneyToBeTransferred 
	
	((self isAValidTransactionWith: anAccountOfWithdrawal and: anAccountOfDeposit) 
		and: [self transferValueIsValid: AmountOfMoneyToBeTransferred])
		ifFalse: [Transfer error: self invalidTransactionErrorDescription].
	
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
