!classDefinition: #CintaAzul category: 'Factorio'!
DenotativeObject subclass: #CintaAzul
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaAzul class' category: 'Factorio'!
CintaAzul class
	instanceVariableNames: 'origen contenido destino'!

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:31:38'!
agregar: unElemento
	contenido add: unElemento
	 ! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:31:38'!
conectarA: unDestino
	destino := unDestino.

! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:31:38'!
extraer
	destino agregar: contenido removeFirst.! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:47:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	origen := nil.
	contenido := ((OrderedCollection new)).
	destino := CintaRoja.! !

!CintaAzul class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:31:38'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaRoja category: 'Factorio'!
DenotativeObject subclass: #CintaRoja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaRoja class' category: 'Factorio'!
CintaRoja class
	instanceVariableNames: 'origen contenido destino'!

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:23:53'!
agregar: unElemento
	contenido add: unElemento
	 ! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 20:52:05'!
conectarA: unDestino
	destino := unDestino.

! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:21:03'!
extraer
	destino agregar: contenido removeFirst.! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:47:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	origen := nil.
	contenido := ((OrderedCollection new)).
	destino := Contenedor.! !

!CintaRoja class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:03:46'!
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

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:47:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: #carbon; add: #hierro; yourself).! !

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

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:47:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaRoja.! !


!classDefinition: #ExtractorDeHierro category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'Factorio'!
ExtractorDeHierro class
	instanceVariableNames: 'destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:37:37'!
conectarA: unDestino
	destino := unDestino.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:37:55'!
extraer
	destino agregar: #hierro.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'mlm 10/25/2020 21:47:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaAzul.! !


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


!FactorioTest class methodsFor: 'escenario 2' stamp: 'mlm 10/25/2020 21:30:47'!
configurarCircuitoExtractorCintaCaja

	Contenedor vaciar.
	CintaRoja vaciar.
	ExtractorDeCarbon conectarA: CintaRoja.
	CintaRoja conectarA: Contenedor.
	"No se olviden de vaciar la cinta tambien!!"
	"Conectamos el extractor a la cinta, luego conectamos la cinta a la caja"
! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'mlm 10/25/2020 21:30:47'!
hacerAndarCircuitoExtractorCintaCaja
	ExtractorDeCarbon extraer.
	CintaRoja extraer.
	
	
	"Hacemos andar el extractor, asi deja un carbon en la cinta.
	Luego hacemos andar la cinta (con algun mensaje) y deberia dejar el carbon en la caja.	"! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'SF 10/23/2020 00:58:33'!
test02ExtractorCintaCaja
	self configurarCircuitoExtractorCintaCaja.
	
	self hacerAndarCircuitoExtractorCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.
	"Tambien tenemos que chequear que en la cinta no haya nada. Cero carbon."! !


!FactorioTest class methodsFor: 'escenario 3' stamp: 'mlm 10/25/2020 21:39:27'!
configurarCircuitoExtractorExtractorCintaCintaCaja

	Contenedor vaciar.
	"Cinta del extractor de carbón"
	CintaRoja vaciar.
	"Cinta del extractor de hierro"
	CintaAzul vaciar.
	ExtractorDeCarbon conectarA: CintaRoja.
	ExtractorDeHierro conectarA: CintaAzul.
	CintaRoja conectarA: Contenedor.
	CintaAzul conectarA: CintaRoja.
	"Además de vaciar el Contenedor (arriba) también vaciamos las dos cintas"
	"Conectamos el extractor de carbon a una de las cintas"
	"Conectamos el extractor de hierro a la otra cinta"
	"Ahora conectamos la primer cinta al Contenedor"
	"Y conectamos la segunda cinta a la primer cinta"
	
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'mlm 10/25/2020 21:44:27'!
hacerAndarCircuitoExtractorExtractorCintaCintaCaja
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	CintaAzul extraer.
	CintaRoja extraer.
	CintaRoja extraer.
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

CintaAzul initializeAfterFileIn!
CintaRoja initializeAfterFileIn!
Contenedor initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!