!classDefinition: #Cinta category: 'Factorio'!
DenotativeObject subclass: #Cinta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cinta class' category: 'Factorio'!
Cinta class
	instanceVariableNames: 'origen contenido destino'!

!Cinta class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:23:53'!
agregar: unElemento
	contenido add: unElemento
	 ! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 20:52:05'!
conectarA: unDestino
	destino := unDestino.

! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:21:03'!
extraer
	destino agregar: contenido removeFirst.! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:25:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	origen := nil.
	contenido := ((OrderedCollection new)).
	destino := Contenedor.! !

!Cinta class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:03:46'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #Contenedor category: 'Factorio'!
DenotativeObject subclass: #Contenedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Contenedor class' category: 'Factorio'!
Contenedor class
	instanceVariableNames: 'contenido'!

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:35:04'!
agregar: unaMena
	contenido add: unaMena.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:00'!
cantidadDe: unaMenaDeMuestra
	^contenido count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:20'!
cantidadDeMenas
	^contenido size.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:25:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: #carbon; yourself).! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:35:51'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'Factorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:33:23'!
conectarA: unDestino
	destino := unDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:33:50'!
extraer
	destino agregar: #carbon.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:25:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := Cinta.! !


!classDefinition: #FactorioTest category: 'Factorio'!
DenotativeObject subclass: #FactorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FactorioTest class' category: 'Factorio'!
FactorioTest class
	instanceVariableNames: ''!

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 01:01:45'!
configurarCircuitoExtractorCaja.

	Contenedor vaciar.
	ExtractorDeCarbon conectarA: Contenedor.	
! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 00:55:32'!
hacerAndarCircuitoExtractorCaja

	ExtractorDeCarbon extraer.
	! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 00:53:55'!
test01ExtractorCaja
	self configurarCircuitoExtractorCaja.
	
	self hacerAndarCircuitoExtractorCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.! !


!FactorioTest class methodsFor: 'escenario 2' stamp: 'mlm 10/25/2020 20:50:21'!
configurarCircuitoExtractorCintaCaja

	Contenedor vaciar.
	Cinta vaciar.
	ExtractorDeCarbon conectarA: Cinta.
	Cinta conectarA: Contenedor.
	"No se olviden de vaciar la cinta tambien!!"
	"Conectamos el extractor a la cinta, luego conectamos la cinta a la caja"
! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'mlm 10/25/2020 21:14:39'!
hacerAndarCircuitoExtractorCintaCaja
	ExtractorDeCarbon extraer.
	Cinta extraer.
	
	
	"Hacemos andar el extractor, asi deja un carbon en la cinta.
	Luego hacemos andar la cinta (con algun mensaje) y deberia dejar el carbon en la caja.	"! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'SF 10/23/2020 00:58:33'!
test02ExtractorCintaCaja
	self configurarCircuitoExtractorCintaCaja.
	
	self hacerAndarCircuitoExtractorCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.
	"Tambien tenemos que chequear que en la cinta no haya nada. Cero carbon."! !


!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:01:20'!
configurarCircuitoExtractorExtractorCintaCintaCaja

	Contenedor vaciar.
	"Además de vaciar el Contenedor (arriba) también vaciamos las dos cintas"
	"Conectamos el extractor de carbon a una de las cintas"
	"Conectamos el extractor de hierro a la otra cinta"
	"Ahora conectamos la primer cinta al Contenedor"
	"Y conectamos la segunda cinta a la primer cinta"
	
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:02:57'!
hacerAndarCircuitoExtractorExtractorCintaCintaCaja
	
	"Hacemos andar el extractor, asi deja un carbon en la cinta.
	Lo mismo con el otro extractor, asi deja una mena de hierro en la otra cinta.
	Hacemos andar la cinta con la mena de hierro, asi la deposita en la cinta que tiene el carbon.
	Ahora podemos hacer andar la ultima cinta, la que recibió primero el carbon 
	y ahora tambien tiene el hierro y que deje todo en el Contenedor."! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:03:37'!
test03ExtractorExtractorCintaCintaCaja
	self configurarCircuitoExtractorExtractorCintaCintaCaja.
	
	self hacerAndarCircuitoExtractorExtractorCintaCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: (Contenedor cantidadDe: #hierro) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 2.
	"Tambien tenemos que chequear que no haya nada en las cintas"! !

Cinta initializeAfterFileIn!
Contenedor initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!