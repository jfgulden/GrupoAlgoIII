!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'reproduccion' stamp: 'JFG 4/25/2022 00:26:22'!
intentarReproducirse
	(ElHabitat cantidadDeHuevosDeAvispaOriana > 0 ) 
		ifTrue: 
			[ ElHabitat quitarHuevoDeAvispaOriana.
			ElHabitat agregarHuevoDeAvispaLara.]
		ifFalse:
			[(ElHabitat cantidadDeHuevosDeAvispaPolly > 0) 
				ifTrue: 
					[ElHabitat quitarHuevoDeAvispaPolly.
					ElHabitat agregarHuevoDeAvispaLara.
					]
				ifFalse: [^0]]
				
	! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'reproduccion' stamp: 'JFG 4/25/2022 00:16:55'!
intentarReproducirse.
	(ElHabitat cantidadDeOrugas > 0) 
		ifTrue: 
		[	ElHabitat quitarOruga.
			ElHabitat agregarHuevoDeAvispaOriana]! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'reproduccion' stamp: 'JFG 4/24/2022 23:42:28'!
intentarReproducirse.
	(ElHabitat cantidadDePolillas > 0) 
		ifTrue: 
		[	ElHabitat quitarPolilla.
			ElHabitat agregarHuevoDeAvispaPolly. ]! !


!classDefinition: #ElHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitat class' category: 'AvispasYAbejasParte2'!
ElHabitat class
	instanceVariableNames: 'polillas orugas huevos'!

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/25/2022 00:03:30'!
agregarHuevoDeAvispaLara
	huevos at: AvispaLara put: ((huevos at: AvispaLara) + 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/25/2022 00:03:36'!
agregarHuevoDeAvispaOriana
	huevos at: AvispaOriana put: ((huevos at: AvispaOriana) + 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/25/2022 00:03:42'!
agregarHuevoDeAvispaPolly
	huevos at: AvispaPolly put: ((huevos at: AvispaPolly) + 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'SJ 4/23/2022 00:24:22'!
agregarOruga
	orugas := (orugas + 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'SJ 4/23/2022 01:21:25'!
agregarPolilla
	polillas := (polillas + 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/25/2022 00:10:58'!
quitarHuevoDeAvispaOriana
	huevos at: AvispaOriana put: ((huevos at: AvispaOriana) - 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/25/2022 00:11:38'!
quitarHuevoDeAvispaPolly
	huevos at: AvispaPolly put: ((huevos at: AvispaPolly) - 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'SJ 4/23/2022 00:26:29'!
quitarOruga
	orugas := (orugas - 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'SJ 4/23/2022 01:20:17'!
quitarPolilla
	polillas := (polillas - 1).! !

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/24/2022 23:33:14'!
resetearHabitat
	self resetearHuevosAvispas.
	orugas := 0.
	polillas := 0.! !

!ElHabitat class methodsFor: 'privado' stamp: 'JFG 4/25/2022 00:06:07'!
resetearHuevosAvispas
	huevos := Dictionary new.
	huevos at: AvispaOriana put: 0.
	huevos at: AvispaLara put: 0.
	huevos at: AvispaPolly put: 0.

	
	! !


!ElHabitat class methodsFor: 'publico' stamp: 'JFG 4/25/2022 00:08:17'!
cantidadDeHuevosDeAvispaLara
	^huevos at: AvispaLara.! !

!ElHabitat class methodsFor: 'publico' stamp: 'JFG 4/25/2022 00:04:00'!
cantidadDeHuevosDeAvispaOriana
	^huevos at: AvispaOriana.! !

!ElHabitat class methodsFor: 'publico' stamp: 'JFG 4/25/2022 00:04:04'!
cantidadDeHuevosDeAvispaPolly
	^huevos at: AvispaPolly.! !

!ElHabitat class methodsFor: 'publico' stamp: 'JFG 4/25/2022 00:04:10'!
cantidadDeHuevosDeAvispas
	^((huevos at: AvispaLara) + (huevos at: AvispaOriana) + (huevos at: AvispaPolly)).! !

!ElHabitat class methodsFor: 'publico' stamp: 'SJ 4/23/2022 00:30:58'!
cantidadDeOrugas
	^orugas.! !

!ElHabitat class methodsFor: 'publico' stamp: 'SJ 4/23/2022 01:17:25'!
cantidadDePolillas
	^polillas.! !


!ElHabitat class methodsFor: '--** private fileout/in **--' stamp: 'SJ 4/25/2022 15:37:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	polillas := 0.
	orugas := 0.
	huevos := ((Dictionary new) add: (AvispaLara->0); add: (AvispaOriana->0); add: (AvispaPolly->0); yourself).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JFG 4/25/2022 00:02:06'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JFG 4/25/2022 00:08:02'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ElHabitat cantidadDeHuevosDeAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JFG 4/24/2022 23:43:51'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ElHabitat cantidadDeHuevosDeAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JFG 4/24/2022 23:46:08'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ElHabitat cantidadDeHuevosDeAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 01:42:07'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ElHabitat cantidadDeHuevosDeAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 00:08:09'!
habitat
	^ElHabitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JFG 4/25/2022 00:09:55'!
hacerQueElHabitatTengaLosRecursosSuficientes
	ElHabitat agregarOruga. 
	ElHabitat agregarOruga. 
	ElHabitat agregarPolilla. "Agregamos 2 orugas y una polilla porque son las necesarias para poder pasar los tests"! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 02:22:49'!
laAvispaLara
	^AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 13:14:59'!
laAvispaOriana
	^AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 13:15:09'!
laAvispaOrnella
	^AvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 01:12:19'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 00:36:51'!
queElHabitatTengaDosOrugasMas
	ElHabitat agregarOruga.
	ElHabitat agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 01:22:15'!
queElHabitatTengaDosPolillasMas
	ElHabitat agregarPolilla.
	ElHabitat agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 00:28:26'!
queElHabitatTengaUnaOrugaMas
	ElHabitat agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 01:21:43'!
queElHabitatTengaUnaPolillaMas
	ElHabitat agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SJ 4/23/2022 00:33:18'!
retrocederElHabitatAlInicioDeLosTiempos
	ElHabitat resetearHabitat.! !

ElHabitat initializeAfterFileIn!