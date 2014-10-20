% Samenvatting IDPI
% Mathijs Bernson

## Inleiding Design Patterns

## Literatuur

* Design Patterns - ISBN 978-0-201-63361-0
* Head First Design Patterns - ISBN 0596007124
* Slides

## Leerdoelen

De student leert Design Patterns toe te passen tijdens het ontwerpen en realiseren van software. Het gaat hierbij om de volgende 15 GoF-patterns: Strategy, Observer, Decorator, Factory Method, Abstract Factory, Singleton, Command, Adapter, Facade, Template Method, Iterator, Composite, State, Proxy en MVC.

De student leert:

* Wat een Design Pattern is en wat de classificatie van Patterns is; 
* De werking en toepassing van deze 15 GoF (Gang of Four) Design Patterns in hun afzonderlijkheid.
* Vaardigheden in het analyseren van kleinschalige softwaresystemen op zowel functioneel als technisch niveau. 
* Om verbanden te leggen tussen de verschillende patterns en combinaties van patterns toe te passen. 

## Inhoudelijke beschrijving

De student leert Design Patterns toe te passen tijdens het ontwerpen en realiseren van software. Het gaat hierbij om 15 GoF-patterns.
 Eerst worden de Patterns afzondelijkheid behandeld. Waartoe dient het Pattern, welk probleem wordt ermee opgelost, tot welke klasse behoort het Pattern.

Ook leert de student om verbanden te leggen tussen de verschillende patterns en combinaties van patterns toe te passen.

## Eindeisen

De student kan:

* Uitleggen wat een _design pattern_ is en wat de classificatie van patterns is.
* De werking en toepassing van de 15 GoF design patterns in hun afzonderlijkheid uitleggen.
* Verbanden leggen tussen de verschillende patterns en combinaties van patterns toepassen.

## Inhoudsopgave

* [Inleiding en introductie](#inleiding-en-introductie)
* [Patterns](#patterns)
	* [Creational](#creational-patterns)
		* [Factories](#factories)
		* [Singleton](#singleton)
	* [Structural](#structural-patterns)
		* [Adapter](#adapter)
		* [Proxy](#proxy)
		* [Composite](#composite)
		* [Decorator](#decorator)
		* [Façade](#façade)
	* [Behavioral](#behavioral-patterns)
		* [Command](#command)
		* [Iterator](#iterator)
		* [Observer](#observer)
		* [Strategy](#strategy)
		* [Template Method](#template)
		* [State](#state)
	* [MVC](#mvc)
* [Outro](#outro)

## Inleiding en introductie

### Wat zijn design patterns

> Een *design pattern* is een formele manier om een oplossing te documenteren voor een ontwerpprobleem in een bepaald veld.

> Binnen de software-ontwikkeling is een *design pattern* een generieke, herbruikbare oplossing voor een vaak voorkomend probleem (binnen een bepaalde context) in software-ontwerp.

Ee

### Waarom _design patterns_?

Het ontwerpen van OO-software is moeilijk, en om dit ook nog eens herbruikbaar te maken is nog moeilijker.

Tegenwoordig laat men vaak het idee van **herbruikbaarheid** (het hergebruiken van classes tussen projecten) vallen, en richt zich vooral op **onderhoudbaarheid** van software.

### Soorten patterns

We onderscheiden drie soorten van design patterns, *structural*, *creational* en *behavioral* patterns.

## Composition over inheritance

Inheritance breekt compositie. Compositie is flexibeler omdat de onderdelen uitwisselbaar zijn.

## Interface/implementation

> Program to an interface, not an implementation.

## Creational patterns

### Abstract factory

Een *abstract factory* biedt een interface om families van gerelateerde (of afhankelijke) objecten te creëren, zonder dat je van hun concrete classes af hoeft te weten.

#### Voorbeeld

Een user interface toolkit, die verschillende soorten look-and-feels moet ondersteunen. Voor iedere look-and-feel kan er een factory gemaakt worden, die widgets produceert. Zo hoeven de class-namen niet hard gecodeerd te worden.

![De implementatie van `Button` is afhankelijk van de gekozen factory.](Abstract_factory.svg)

#### Wanneer te gebruiken

Een abstract factory is handig wanneer een systeem niet afhankelijk moet zijn van hoe bepaalde objecte gecreëerd worden. Neem bijvoorbeeld een systeem met verschillende productfamilies, die uitwisselbaar moeten zijn.

Ook kun je met een abstract factory alleen de interface van de "producten" blootstellen, zonder de implementaties te onthullen.

### Singleton

Met het singleton pattern zorg je ervoor er precies één instance van een class bestaat, en er globale toegang tot die instance is. Deze toegang verloopt via één punt, waar de wrapper van de singleton controle over heeft.

Het pattern is nuttig bij objecten waarvan er maar één logische instantie bestaat. Zo is er altijd maar één window manager actief.

Echter werkt het singleton pattern als een *global variable*, wat iets slechts is. Als weinig andere objecten de singleton instance nodig hebben, zou je ook *dependency injection* kunnen gebruiken.

Voor het instantiëren van de singleton instance kan **lazy** of **eager** initialization toegepast worden.

## Structural patterns

### Decorator

Een decorator voegt op dynamische manier functionaliteit (verantwoordelijkheden) toe aan een object, zonder de class van dat object te beïnvloeden.

Deze uitbreiding van functionaliteit is doorgaans statisch, maar kan soms ook tijdens runtime bereikt worden.

Het wordt bereikt door de oorspronkelijke class te subclassen (of dezelfde interface te implementeren), en.

![](Decorator.svg)

Het pattern is zo ontworpen dat decorators genest kunnen worden.

### Adapter

Een adapter past de ene interface aan naar de andere.
Structural pattern.

### Proxy

Een proxy is een class die werkt als interface voor iets anders. Het omhult een _subject_ en heeft controle over de toegang daartoe. Dit mechanisme kunnen we voor een aantal doeleinden gebruiken. Zie de soorten proxies hierna.

#### Virtual proxy

Neemt de plaats in van een complex of zwaar object. Voorbeeld: **image proxy**.

#### Remote proxy

Heeft te maken met een object dat ergens anders staat. Voorbeeld: **remote method invocation**.

#### Security proxy

Kan bepaalde methods van de _subject_ afschermen.

### Façade

Een façade verhult een complex systeem en geeft daar een (eenvoudiger) interface naartoe.

### Composite

Structureel pattern voor het samenstellen van **bomen** van objecten.

## Behavioral patterns

### Strategy

"Encapsulate what varies" in een interface. Programmeer hier vervolgens tegenaan en sta toe om dit in te vullen.

### Observer

Clients kunnen luisteren naar updates van een ander object.

### Command

command pattern is een encapsulation van het uit te voeren request.

### Iterator

Abstractie om te itereren over dingen

### Template Method

### Template

Eén class stelt een algoritme(s) vast, en roep daarvoor methods aan. Als je dergelijke methods override en zo het gedrag van het algoritme aanpast, pas je het _template pattern_ toe.

Het boek geeft hier een voorbeeld van een `Beverage`, met `Coffee` en `Tea` subclasses. Die overriden specifieke methods voor hun doeleinden.

#### Single responsibiliy (SRP)

#### Hollywood principle

> Don't call us, we'll call you.

#### Tell, don't ask

### State

Behavioral pattern. Lijkt op het [strategy pattern](#strategy);

Een _context_-object heeft op elk moment maar één bepaalde _state_. Hier kan het calls aan geven. De context bepaalt een beginstaat. Vanuit de _state_ kan er een _transition_ naar een nieuwe state gedaan worden. Dit kan ook vanuit de context.

Voorbeeld: **auto huren**.

### MVC

Model view controller

#### Model

Data en _business logic_.

#### View

Alleen wat zichtbaar is voor de user. Geen logica.

#### Controller

Legt de koppeling tussen model en view.

## Outro

Tekst