!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!Numero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:38:23'!
* aMultiplicand

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:19:03'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:59:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:33'!
beAddedToAFraccion: aFraccionAugend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:15'!
beAddedToAnEntero: anEnteroAugend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:41:04'!
beMultipliedByAFraccion: aFraccionMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:40:43'!
beMultipliedByAnEntero: anEnteroMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:42:02'!
beSubtractedFromAFraccion: aFraccionMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:41:46'!
beSubtractedFromAnEntero: anEnteroMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:59'!
divideAFraccion: aFraccionDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:47'!
divideAnEntero: anEnteroDividend

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:23:54'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:40:43'!
* aMultiplicand
	
	^aMultiplicand beMultipliedByAnEntero: self ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:39:15'!
+ anAdder 
	
	^anAdder beAddedToAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:41:46'!
- aSubtrahend 
	
	^aSubtrahend beSubtractedFromAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:39:48'!
/ aDivisor 
	
	^aDivisor divideAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:13:12'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:15:21'!
fibonacci

	self subclassResponsibility 
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:12:57'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'JS 5/9/2022 16:13:55'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'JS 5/9/2022 16:14:11'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:22:13'!
asDenominatorOf: aNumerator

	^Fraccion safeWith: aNumerator over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:33'!
beAddedToAFraccion: aFraccionAugend

	^self + aFraccionAugend
	
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:14:01'!
beAddedToAnEntero: anEnteroAugend
	
	^self class with: anEnteroAugend integerValue + self integerValue
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:42:53'!
beMultipliedByAFraccion: aFraccionMultiplier

	^self * aFraccionMultiplier ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:14:04'!
beMultipliedByAnEntero: anEnteroMultiplier

	^self class with: anEnteroMultiplier integerValue * self integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:42:02'!
beSubtractedFromAFraccion: aFraccionMinuend 
			
	^aFraccionMinuend numerator - (aFraccionMinuend denominator * self) / (aFraccionMinuend denominator)
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:14:07'!
beSubtractedFromAnEntero: anEnteroMinuend 
	
	^self class with: anEnteroMinuend integerValue - self integerValue
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:59'!
divideAFraccion: aFraccionDividend

	^aFraccionDividend numerator / (aFraccionDividend denominator * self) ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:22:58'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:19:11'!
over: anEnteroDivisor
	
	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: anEnteroDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := anEnteroDivisor // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	! !



!Entero methodsFor: 'value' stamp: 'JS 5/9/2022 16:25:48'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self subclassResponsibility! !


!Entero methodsFor: 'printing' stamp: 'JS 5/9/2022 16:14:27'!
printOn: aStream

	aStream print: self integerValue ! !


!Entero methodsFor: 'testing' stamp: 'JS 5/9/2022 16:14:16'!
isNegative
	
	^self integerValue < 0! !

!Entero methodsFor: 'testing' stamp: 'JS 5/9/2022 16:14:18'!
isOne
	
	^self integerValue = 1! !

!Entero methodsFor: 'testing' stamp: 'JS 5/9/2022 16:14:23'!
isZero
	
	^self integerValue = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/9/2022 16:24:25'!
with: aValue 
	
	Entero allSubclasses 
		detect:  [ :aSubclass | aSubclass canInstantiateWith: aValue] 
		ifFound: [ :selectedSubclass | ^selectedSubclass for: aValue] 
		ifNone:  [ self error: 'aValue debe ser anInteger' ].! !


!Entero class methodsFor: 'error descriptions' stamp: 'NR 9/23/2018 22:03:31'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para enteros negativos'! !


!Entero class methodsFor: 'private' stamp: 'JS 5/9/2022 15:52:29'!
canInstantiateWith: aValue

	self subclassResponsibility ! !

!Entero class methodsFor: 'private' stamp: 'JS 5/9/2022 15:56:07'!
for: aValue

	^self new! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!Cero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:09:27'!
* aMultiplicand

	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:08:19'!
+ anAdder 
	
	^anAdder! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:08:15'!
- aSubtrahend 
	
	^aSubtrahend negated! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:10:10'!
fibonacci

	^Entero with: 1! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:08:36'!
negated

	^self! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:08:22'!
divideAnEntero: aDividend

	self error: self class canNotDivideByZeroErrorDescription! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:23:16'!
over: aDivisor

	^self! !


!Cero methodsFor: 'value' stamp: 'JS 5/9/2022 16:08:25'!
integerValue

	^0! !


!Cero methodsFor: 'testing' stamp: 'JS 5/9/2022 16:08:39'!
isZero

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'private' stamp: 'JS 5/9/2022 15:53:35'!
canInstantiateWith: aValue

	^aValue = 0! !



!classDefinition: #EnteroDistintoDeCeroYUno category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Entero subclass: #EnteroDistintoDeCeroYUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!EnteroDistintoDeCeroYUno methodsFor: 'initialization' stamp: 'JS 5/9/2022 16:20:20'!
initializeWith: aValue 
	
	value := aValue! !


!EnteroDistintoDeCeroYUno methodsFor: 'value' stamp: 'JS 5/9/2022 16:25:21'!
integerValue

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroDistintoDeCeroYUno class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
EnteroDistintoDeCeroYUno class
	instanceVariableNames: ''!

!EnteroDistintoDeCeroYUno class methodsFor: 'private' stamp: 'JS 5/9/2022 15:53:45'!
canInstantiateWith: aValue

	^false! !

!EnteroDistintoDeCeroYUno class methodsFor: 'private' stamp: 'JS 5/9/2022 15:56:41'!
for: aValue

	^self new initializeWith: aValue! !


!classDefinition: #EnteroMayorAUno category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
EnteroDistintoDeCeroYUno subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!EnteroMayorAUno methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:16:07'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.

	^(self - one) fibonacci + (self - two) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'private' stamp: 'JS 5/9/2022 15:54:00'!
canInstantiateWith: aValue

	^aValue > 1! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
EnteroDistintoDeCeroYUno subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:15:47'!
fibonacci
	
	^self error: Entero negativeFibonacciErrorDescription ! !


!EnteroNegativo methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:23:41'!
divideAnEntero: aDividend
	
	^aDividend negated / self negated! !


!EnteroNegativo methodsFor: 'testing' stamp: 'JS 5/9/2022 16:25:03'!
isNegative
	
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'private' stamp: 'JS 5/9/2022 15:54:07'!
canInstantiateWith: aValue

	^aValue < 0! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!Uno methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:10:16'!
* aMultiplicand 
	
	^aMultiplicand! !

!Uno methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 16:10:00'!
fibonacci
	
	^ self! !


!Uno methodsFor: 'value' stamp: 'JS 5/9/2022 16:10:29'!
integerValue

	^1! !


!Uno methodsFor: 'testing' stamp: 'JS 5/9/2022 16:11:05'!
isOne

	^true! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 16:21:36'!
asDenominatorOf: aNumerator

	^aNumerator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'private' stamp: 'JS 5/9/2022 15:54:15'!
canInstantiateWith: aValue

	^aValue = 1! !



!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:41:04'!
* aMultiplicand
	
	^aMultiplicand beMultipliedByAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:39:33'!
+ anAdder 
	
	^anAdder beAddedToAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:42:02'!
- aSubtrahend 
	
	^aSubtrahend beSubtractedFromAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/9/2022 15:39:59'!
/ aDivisor 
	
	^aDivisor divideAFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:33'!
beAddedToAFraccion: aFraccionAugend

	| newNumerator newDenominator |
	
	newNumerator := (aFraccionAugend numerator * denominator) + (aFraccionAugend denominator * numerator).
	newDenominator := aFraccionAugend denominator * denominator.
	
	^newNumerator / newDenominator
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:15'!
beAddedToAnEntero: anEnteroAugend

	^anEnteroAugend * denominator + numerator / denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:43:02'!
beMultipliedByAFraccion: aFraccionMultiplier

	^(aFraccionMultiplier numerator * numerator) / (aFraccionMultiplier denominator * denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:42:43'!
beMultipliedByAnEntero: anEnteroMultiplier

	^anEnteroMultiplier * numerator / denominator 
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:42:02'!
beSubtractedFromAFraccion: aFraccionMinuend

	| newNumerator newDenominator |
	
	newNumerator := (aFraccionMinuend numerator * denominator) - (aFraccionMinuend denominator * numerator).
	newDenominator := aFraccionMinuend denominator * denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:41:46'!
beSubtractedFromAnEntero: anEnteroMinuend

	^denominator * anEnteroMinuend - numerator / denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:59'!
divideAFraccion: aFraccionDividend

	^(aFraccionDividend numerator * denominator) / (aFraccionDividend denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JS 5/9/2022 15:39:48'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend * denominator / numerator
	! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'JS 5/9/2022 16:17:48'!
initializeSafeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:05:44'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio-Solucion-Extra'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation - private' stamp: 'JS 5/9/2022 16:16:59'!
safeWith: aDividend over: aDivisor

	"Sólo para ser enviado desde los objetos de la jerarquia ya que se asume que aDividend no es 0, y aDivisor no es ni 0 ni 1 ni negativo - Hernan y Nicolás."
	
	^self new initializeSafeWith: aDividend over: aDivisor ! !
