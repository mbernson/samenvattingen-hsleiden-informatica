% Samenvatting ICP
% Mathijs Bernson

# Samenvatting Concepten van Programmeertalen

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: ICP

## Literatuur

* Concepts of programming languages, Sebesta - ISBN 000000000
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

* [Onderwerpen per week](#onderwerpen-per-week)
* [Inleiding en historie](#inleiding-en-historie)
	* [Imperatief versus declaratief](#imperatief-versus-declaratief)
	* [Language design tradeoffs](#language-design-tradeoffs)
	* [Implementaties van programmeertalen](#implementaties-van-programmeertalen)
		* [Compilatie](#compilatie)
		* [Pure interpretatie](#pure-interpretatie)
		* [Hybride implementatie systemen](#hybride-implementatie-systemen)
	* [Evolutie van programmeertalen](#evolutie-van-programmeertalen)
* [Syntax en semantiek](#syntax-en-semantiek)
	* [Beschrijven van syntax](#beschrijven-van-syntax)
		* [Onderdelen van Syntax](#onderdelen-van-syntax)
	* [Contextvrije grammatica](#contextvrije-grammatica)
	* [Backus-Naur Form (BNF)](#backus-naur-form-bnf)
	* [Attribute grammars](#attribute-grammars)
* [Lexical en syntactical analysis](#lexical-en-syntactical-analysis)
* [Concepten samengevat](#concepten-samengevat)
	* [Names, bindings, and scopes](#names-bindings-and-scopes)
		* [Variabelen](#variabelen)
		* [Binding](#binding)
	* [Data types](#data-types)
	* [Expressions and assignment statements](#expressions-and-assignment-statements)
	* [Statement-level control structures](#statement-level-control-structures)
	* [Subprograms](#subprograms)
	* [Abstract data types and encapsulation constructs](#abstract-data-types-and-encapsulation-constructs)
	* [Concurrency](#concurrency)
	* [Exception handling and event handling](#exception-handling-and-event-handling)

## Inleiding

Waarom het vak ICP?

* Interessant
* Beter leren om talen te gebruiken
* Makkelijker aanleren van nieuwe programmeertalen, door het begrijpen van de kenmerken.

Compilers vs. interpreters -> volgende week

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

1. Inleiding en historie
2. Syntax, semantiek en lexicale/syntactische analyse
3. Names, binding, scopes, datatypes, expressies en toekenningen
4. Subprograms, adt's en encapsulation
5. Object geörienteerd programmeren en concurrency
6. Exception handling en functioneel programmeren
7. Logisch programmeren

## Inleiding en historie

Von Neumann Architectuur

### Imperatief versus declaratief

Imperatief: Hoe moet iets gebeuren?
Voorbeelden:

* Java
* Meeste OO-talen

Declaratief: Wat voor resultaat wil je hebben?
Voorbeelden:

* Haskell
* SQL
* Functionele talen neigen naar declaratief

### Language design tradeoffs

* Reliability vs. cost of execution
* Readability vs. writability
	* Vb: APL, bizarre programmeertaal
* Writability (flexibility) vs. reliability
	* Vb: C++ pointers zijn krachtig en flexibel maar onbetrouwbaar

### Implementaties van programmeertalen

#### Compilatie

Programma's worden vertaald naar machinecode. Dit is inclusief JIT systemen.

Voordelen:

* Efficient
* Geen runtime nodig

Nadelen:

* Architectuur- en OS-specifiek; dus niet portable
* Soms onveilig door directe toegang tot hardware (C en C++)

#### Pure interpretatie

Programmacode wordt geïnterpreteeerd door een ander programma, de interpreter.

Voordelen:

* Portable
* Geen compilatietijd, sneller ontwikkelen
* Vaak hoge abstractie

Nadelen

* Inefficient

#### Hybride implementatie systemen

Een compromis tussen compilers en pure interpreters. Er is nog wel een compile-time proces.

Voorbeeld: Java

### Evolutie van programmeertalen

## Syntax en semantiek

De **syntax** van een programmeertaal is de vorm van de expressies, *statements*
en *program units*.
Met de **semantiek** bedoelen we de betekenis van de voorgenoemde dingen.

### Beschrijven van syntax

BNF en context-vrije grammatica

#### Onderdelen van Syntax

* Sentence - karakters over een bepaald alfabet
* Language - set van zinnen
* Lexeme - laagst mogelijke syntactische unit
* Token - een categorie van lexemes (zoals een *identifier*)

Twee manieren om een taal te herkennen:

* Recognizers
	* Leest input strings over het alphabet van de taal en bepaald of de input bij de taal hoort
* Generators
	* Genereert sentences van een taal

### Contextvrije grammatica

Ontwikkeld door Noam Chomsky in de jaren '50.
Bedoeld om de syntax van natuurlijke talen te beschrijven.

### Backus-Naur Form (BNF)

Uitgevonden door John Backus om de syntax van Algol 58 te beschrijven.
Deze werd aangepast door Peter Naur, en bekend als Backus-Naur Form (BNF).
BNF is equivalent aan Chomsky's manier om contextvrije grammatica uit te
drukken.

```
<assign> → <var> = <expression>
```

### Attribute grammars

Een *attribute grammar* wordt gebruikt om meer van de structuur van een
programmeertaal te beschrijven dan een context-vrije grammatica dat kan.
Deze "extensie" staat toe dat bepaalde taalregels eenvoudiger beschreven worden.

Sommige eigenschappen van de structuur van programmeertalen zijn moeilijk of
onmogelijk te beschrijven met BNF.

Moeilijk voorbeeld: in Java kan een float niet aan een int variabele toe worden
gewezen, maar wel andersom.

Onmogelijk voorbeeld: alle variabelen moeten gedeclareerd worden voordat ze
gerefereerd worden. Het is bewezen dat deze regel onmogelijk in BNF uitgedrukt
kan worden.

*Attribute grammars* zijn een formele aanpak om de correctheid van de statische
semantische regels van een programma te beschrijven en te controleren.

## Lexical en syntactical analysis

## Concepten samengevat

### Names, bindings, and scopes

#### Variabelen

Imperatieve programmeertalen zijn in meer of mindere mate een abstractie van de
onderliggende von Neumann architectuur.

Een variabele is een abstractie van een computer geheugencel of verzameling van
geheugencellen.
Een variabele heeft zes attributen:

1. Naam
	* Dit kan in de meeste talen geen reserved keyword zijn.
2. Adres
3. Waarde
4. Type
	* Bepaalt wat voor (bereik van) waarden er in de variabele kunnen worden bewaard.
5. Lifetime
6. Scope

#### Binding

Is de associatie tussen een **attribuut** en een **entiteit**, zoals tussen een
variabele en z'n type. Het moment waarop een binding plaatsvind noemen we
**binding time**. Bindings kunnen gebeuren tijdens x fasen.

Objective-C gebruikt *messaging*, dit komt neer op dynamic dispatch or late
binding.

### Data types

### Expressions and assignment statements

### Statement-level control structures

### Subprograms

### Abstract data types and encapsulation constructs

### Concurrency

### Exception handling and event handling
