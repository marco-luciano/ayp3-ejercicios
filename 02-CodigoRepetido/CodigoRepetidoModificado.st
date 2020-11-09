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
	instanceVariableNames: 'testCustomerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:18:45'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| executionTimeInMilliseconds |
	
	self setUpTestCustomerBook.
	
	executionTimeInMilliseconds := self codeExecutionTime: [testCustomerBook addCustomerNamed: 
		'John Lennon'.].
	
	self assert: (executionTimeInMilliseconds ) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:18:51'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| executionTimeInMilliseconds paulMcCartney |
	
	self setUpTestCustomerBook.
	paulMcCartney := 'Paul McCartney'.
	
	testCustomerBook addCustomerNamed: paulMcCartney.
	  	
	executionTimeInMilliseconds := self codeExecutionTime: [testCustomerBook
		removeCustomerNamed: 		paulMcCartney.].
	
	self assert: (executionTimeInMilliseconds ) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:18:55'!
test03CanNotAddACustomerWithEmptyName 
			
	self setUpTestCustomerBook.
	
	self execute: [ testCustomerBook addCustomerNamed: ''.]  
		expectingError: Error   
		andTestErrorWith: [ :anError | 
			self assert: anError messageText = CustomerBook 
				customerCanNotBeEmptyErrorMessage.
			self assert: testCustomerBook isEmpty ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:18:59'!
test04CanNotRemoveAnInvalidCustomer

	| johnLennon |
			
	self setUpTestCustomerBook.
	johnLennon := 'John Lennon'.
	testCustomerBook addCustomerNamed: johnLennon.
	
	self execute: [ testCustomerBook removeCustomerNamed: 'Paul McCartney'.]
		expectingError: NotFound  
		andTestErrorWith: [ :anError | 
			self assert: testCustomerBook numberOfCustomers = 1.
			self assert: (testCustomerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:25:46'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney|
	
	self setUpTestCustomerBook.
	paulMcCartney := 'Paul McCartney'.
	
	testCustomerBook addCustomerNamed: paulMcCartney.
	testCustomerBook suspendCustomerNamed: paulMcCartney.
	
	self assertNumberOfActive: 0 andNumberOfSuspended: 1.
	self assert: (testCustomerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:25:24'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	
	self setUpTestCustomerBook.
	paulMcCartney := 'Paul McCartney'.
	
	testCustomerBook addCustomerNamed: paulMcCartney.
	testCustomerBook suspendCustomerNamed: paulMcCartney.
	testCustomerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfActive: 0 andNumberOfSuspended: 0.
	self deny: (testCustomerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:19:15'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
			
	self setUpTestCustomerBook.
	johnLennon := 'John Lennon'.
	testCustomerBook addCustomerNamed: johnLennon.
	
	self execute: [ testCustomerBook suspendCustomerNamed: 'Ringo Starr'.] 
		expectingError: CantSuspend  
		andTestErrorWith: [ :anError | 
			self assert: testCustomerBook numberOfCustomers = 1.
			self assert: (testCustomerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FR 11/3/2020 21:19:21'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |
			
	self setUpTestCustomerBook.
	johnLennon := 'John Lennon'.
	testCustomerBook addCustomerNamed: johnLennon.
	testCustomerBook suspendCustomerNamed: johnLennon.
	
	self execute: [ testCustomerBook suspendCustomerNamed: johnLennon.] 
		expectingError: CantSuspend 
		andTestErrorWith: [ :anError | 
			self assert: testCustomerBook numberOfCustomers = 1.
			self assert: (testCustomerBook includesCustomerNamed: johnLennon) ].

! !


!CustomerBookTest methodsFor: 'CambiarNombre' stamp: 'FR 11/3/2020 21:24:31'!
assertNumberOfActive: numberOfActive andNumberOfSuspended: numberOfSuspended
	
	self assert: numberOfActive equals: testCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspended equals: testCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfActive  + numberOfSuspended equals: testCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'CambiarNombre' stamp: 'FR 11/3/2020 20:55:18'!
codeExecutionTime: aBlockOfCode
	|millisecondsBeforeExecution millisecondsAfterExecution|
	
	millisecondsBeforeExecution  := Time  millisecondClockValue * millisecond .
	aBlockOfCode value.
	millisecondsAfterExecution := Time millisecondClockValue  * millisecond .
	
	^millisecondsAfterExecution - millisecondsBeforeExecution.
	! !

!CustomerBookTest methodsFor: 'CambiarNombre' stamp: 'FR 11/3/2020 18:30:19'!
execute: aBlock expectingError: anError andTestErrorWith: assertBlock

	[ aBlock  value. self fail ]
		on: anError
		do: [ :theError | assertBlock value: theError ]! !


!CustomerBookTest methodsFor: 'tests setup' stamp: 'FR 11/3/2020 21:18:34'!
setUpTestCustomerBook
	
	testCustomerBook := CustomerBook new.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

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
