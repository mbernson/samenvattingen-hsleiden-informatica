% Samenvatting ICP
% Mathijs Bernson

# Samenvatting Concepten van Programmeertalen

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: ICP

## Literatuur

* Boek X - ISBN 000000000
* Boek Y - ISBN 000000000
* Slides Z
* [Reader A](http://example.com)

## Leerdoelen

De student leert:

- theoretisch concepten van programmeertalen te benoemen.
- de theoretische concepten toe te passen op een concrete object-georiënteerde programmeertaal.
- theoretische paradigma’s van programmeerstijlen te benoemen.

De volgende onderdelen komen aan de orde:

**Algemene onderwerpen**:

* Evolution and the major programming languages
* Syntax and semantics
* Lexical and syntax analysis

**Concepten**:

* Names, bindings, and scopes
* Data types
* Expressions and assignment statements
* Statement-level control structures
* Subprograms
* Abstract data types and encapsulation constructs
* Concurrency
* Exception handling and event handling

**Paradigma's**:

* Object-oriented programming
* Functional programming
* Logic programming

## Inhoud

* [Foo](#foo)
* [Bar](#bar)
* [Baz](#baz)

## Inleiding

Waarom het vak ICP?

* Interessant
* Beter leren om talen te gebruiken
* Makkelijker aanleren van nieuwe programmeertalen, door het begrijpen van de kenmerken.

Compilers vs. interpreters -> volgende week

Moduleinfo

## Leerdoelen

Student kan:

* De historie van programmeertalen beschrijven
* Basis theoretische concepten van programmeertalen beschrijven, en de implementatie van deze concepten beschrijven op basis van een concrete programmeertaal.
* Geavanceerde theoretische concepten van programmeertalen beschrijven [en de implementatie van deze concepten beschrijven op basis van een concrete programmeertaal]. [...]
* Theoretische paradigma's van programmeerstijlen [in programmacode] herkennen en beschrijven op basis van een concrete programmeertaal.
* Verder aanvullen

## Toetsing

Voor dit vak schrijf je een verslag van rond de 50 pagina's. Mag in het Nederlands of Engels.

Het verslag gaat over een programmeertaal van je keuze waarin je deze taal in detail onderzoekt.
Keuze van talen is o.a.: Obj-C, C++, C#, VB.NET, Python, Perl en Ruby.

## Onderwerpen per week

Inleiding en historie

Syntax, semantiek en lexicale/syntactische analyse

Names, binding, scopes, datatypes, expressies en toekenningen

Subprograms, adt's en encapsulation

Object geörienteerd programmeren en concurrency

Exception handling en functioneel programmeren

Logisch programmeren

## Deadlines

18 januari 2016 om 12:00
[andere deadlines op slides]

## Verder

Von Neumann Architectuur

## *Imperatief versus declaratief*

Imperatief: Hoe moet iets gebeuren?
Voorbeelden:

* Java
* Meeste OO-talen

Declaratief: Wat voor resultaat wil je hebben?
Voorbeelden:

* Haskell
* SQL
* Functionele talen neigen naar declaratief

## Language design tradeoffs

* Reliability vs. cost of execution
* Readability vs. writability
	* Vb: APL, bizarre programmeertaal
* Writability (flexibility) vs. reliability
	* Vb: C++ pointers zijn krachtig en flexibel maar onbetrouwbaar

## Implementaties van programmeertalen

### Compilatie

Programma's worden vertaald naar machinecode. Dit is inclusief JIT systemen.

Voordelen:

* Efficient
* Geen runtime nodig

Nadelen:

* Architectuur- en OS-specifiek; dus niet portable
* Soms onveilig door directe toegang tot hardware (C en C++)

### Pure interpretatie

Programmacode wordt geïnterpreteeerd door een ander programma, de interpreter.

Voordelen:

* Portable
* Geen compilatietijd, sneller ontwikkelen
* Vaak hoge abstractie

Nadelen

* Inefficient

### Hybride implementatie systemen

Een compromis tussen compilers en pure interpreters. Er is nog wel een compile-time proces.

Voorbeeld: Java


### Evolutie van programmeertalen

### Syntax en semantiek

### Lexical en syntactical analysis