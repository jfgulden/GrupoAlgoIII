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

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'JMS 4/21/2022 20:41:22'!
habitat
	^Habitat.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'JMS 4/21/2022 20:41:48'!
intentarReproducirse
	self habitat cantidadDeOrugas > 0 ifFalse: [^nil].
	self habitat sacrificarOruga.
	self habitat nuevoHuevoDeAvispas.! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejasParte2'!
AvispaOrnella class
	instanceVariableNames: ''!

!AvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'JMS 4/21/2022 20:54:23'!
habitat
	^Habitat.! !

!AvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'JMS 4/21/2022 20:55:14'!
intentarReproducirse
	self habitat cantidadDeOrugas > 0 ifFalse: [^nil].
	self habitat sacrificarOruga.
	self habitat nuevoHuevoDeAvispas.! !


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

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'JMS 4/21/2022 21:07:37'!
habitat
	^Habitat.! !

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'JMS 4/21/2022 21:11:32'!
intentarReproducirse
	self habitat cantidadDePolillas > 0 ifFalse: [^nil].
	self habitat sacrificarPolilla.
	self habitat nuevoHuevoDeAvispas.! !


!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'HuevosDeAvispas Orugas Polillas'!

!Habitat class methodsFor: 'HuevosDeAvispas' stamp: 'JMS 4/21/2022 20:13:44'!
cantidadDeHuevosDeAvispas
	^HuevosDeAvispas.! !

!Habitat class methodsFor: 'HuevosDeAvispas' stamp: 'JMS 4/21/2022 20:23:34'!
huevosAlInicioDeLosTiempos: cantidad
	HuevosDeAvispas := cantidad.! !

!Habitat class methodsFor: 'HuevosDeAvispas' stamp: 'JMS 4/21/2022 20:26:25'!
nuevoHuevoDeAvispas
		HuevosDeAvispas := HuevosDeAvispas + 1. ! !


!Habitat class methodsFor: 'Orugas' stamp: 'JMS 4/21/2022 20:10:34'!
cantidadDeOrugas
	^Orugas.! !

!Habitat class methodsFor: 'Orugas' stamp: 'JMS 4/21/2022 20:32:20'!
nacimientoDeOrugas: cantidad
	Orugas := Orugas + cantidad. 
	! !

!Habitat class methodsFor: 'Orugas' stamp: 'JMS 4/21/2022 20:19:50'!
orugasAlInicioDeLosTiempos: cantidad
	Orugas := cantidad.! !

!Habitat class methodsFor: 'Orugas' stamp: 'JMS 4/21/2022 20:25:44'!
sacrificarOruga
	Orugas := Orugas - 1.! !


!Habitat class methodsFor: 'Polillas' stamp: 'JMS 4/21/2022 21:14:58'!
cantidadDePolillas
	^Polillas.! !

!Habitat class methodsFor: 'Polillas' stamp: 'JMS 4/21/2022 21:16:32'!
nacimientoDePolillas: cantidad
	Polillas := Polillas + cantidad. ! !

!Habitat class methodsFor: 'Polillas' stamp: 'JMS 4/21/2022 21:16:58'!
polillasAlInicioDeLosTiempos: cantidad
	Polillas := cantidad.! !

!Habitat class methodsFor: 'Polillas' stamp: 'JMS 4/21/2022 21:14:15'!
sacrificarPolilla
	Polillas := Polillas - 1.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'JMS 4/22/2022 20:11:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	HuevosDeAvispas := 0.
	Orugas := 0.
	Polillas := 0.! !


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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
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


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:57'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 19:25:14'!
habitat
	^Habitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 21:19:07'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat nacimientoDeOrugas: 2.
	self habitat nacimientoDePolillas: 2.
	"Implementar cuando sea necesario"! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 19:30:51'!
laAvispaOriana
	^AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 20:49:09'!
laAvispaOrnella
	^AvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 20:56:40'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 20:31:33'!
queElHabitatTengaDosOrugasMas
	self habitat nacimientoDeOrugas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 21:20:08'!
queElHabitatTengaDosPolillasMas
	self habitat nacimientoDePolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 20:32:55'!
queElHabitatTengaUnaOrugaMas
	self habitat nacimientoDeOrugas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 21:20:29'!
queElHabitatTengaUnaPolillaMas
	self habitat nacimientoDePolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMS 4/21/2022 21:18:34'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat huevosAlInicioDeLosTiempos: 0.
	self habitat orugasAlInicioDeLosTiempos: 0.
	self habitat polillasAlInicioDeLosTiempos: 0.
	"Implementar cuando sea necesario"! !

Habitat initializeAfterFileIn!