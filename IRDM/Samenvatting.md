% Samenvatting IRDM
% Mathijs Bernson

# Inleiding Relationele databases modelleren

* Docent: Thomas Boose
* Studiepunten: 3 ects
* Studiebelasting: 84 sbu
* Modulecode: IRM

## Literatuur

* [Fundamentals of Database Systems](http://www.bol.com/nl/p/fundamentals-of-database-systems/1001004007511876/)
	* Elmasri Navathe
	* Addison-Wesley 
	* ISBN: 9780136086208

Examenstof: boek, colleges en oefeningen.

### Verdere stof

* Slides
* [Video](https://www.youtube.com/watch?v=O4PXqpv8TAw)

## Toetsvorm

* Werkstuk 50%
* Schriftelijke toets (mc) 50%

## Programma

* Week 1 & 2: Hoofdstuk 7
* Week 3: Hoofstduk 8
* Week 4: hoofdstuk 9 → cases inleveren?
* Week 5: Hoofdstuk 15 → cases inleveren!
* Week 6: Hands on workshop college
* Week 7: Hoofdstuk 10
* Week 8: Maandag werkstuk inleveren
* Week 9: Toets

## Inhoud

* [Modelleren](#modelleren)
	* [Entiteiten](#entiteiten)

## Modelleren

Modelleren is een belangrijke fase in het bouwen van database-applicaties.

stappen van concept naar implementatie

![Fasen van database design](database-design-phases.png)

We stellen twee soorten requirements aan de database(-applicatie): **functionele requirements** en **data requirements**.

### Entiteiten

Het basisobject waar een ER-diagram uit bestaat is een *entiteit*. Een entiteit is (normaalgesproken) een ding in de echte wereld, met een eigen, onafhankelijk bestaan.

#### Zwakke en sterke entiteiten

Een entiteit zonder zijn eigen *key attributes* noemen we een zwakke entiteit. Voorbeelden hiervan zijn koppeltabellen, die alleen maar *foreign keys kennen*.

Daar tegenovergesteld staan *regular entity types*, die wel hun eigen *key attributes* hebben. Deze mogen ook *strong entity types* genoemd worden.

### Attributen

Een entiteit heeft **attributen**. Attributen zijn eigenschappen die de entiteit beschrijven.

#### Composite en atomic

*Composite* attributes bestaan uit meerdere (basis) attributen. Een voorbeeld hiervan is een *adres*. Dit bestaat uit een straat, postcode, plaats etcetera.

Composite attributen kunnen genest zijn; zo kan de straat uit het adres weer bestaan uit een straatnaam, huisnummer, en ga zo maar door.

Alle "ondeelbare" attributen noemen we *atomic* attributes.

#### Single-valued en multivalued

*Single-valued* attributen hebben een enkele waarde voor een entiteit. Leeftijd is hier een voorbeeld van.

*Multivalued* attributen bestaan uit meerdere waarden voor één entiteit. Denk bijvoorbeeld aan een attribuut "diploma's" bij een persoon of "kleuren" bij een meubel of auto.
Hier kunnen beperkingen opgelegd worden, bijvoorbeeld dat een entiteit minimaal één en maximaal drie kleuren heeft.

#### Stored en derived

Sommige attributen kun je afleiden uit andere attributen. Voorbeeld hiervan is de leeftijd van een persoon, die je kunt achterhalen als je de geboortedatum hebt.
Geboortedatum is hier een *stored attribute*, en leeftijd een *derived attribute*.

#### Null-waarden

Als een bepaalde waarde leeg is, vullen we er `NULL` voor in.
De betekenis van `NULL` is 'onbekend' of 'niet van toepassing.

### Entity en entity sets

Een *entity type* definieert een collectie (of set) van entiteiten die dezelfde attributen hebben.
De verzameling entiteiten die aan een bepaald entity type toebehoren noemen we een *entity set*.

De *entity type* en *entity set* hebben doorgaans dezelfde naam.
In Er-diagrammen beschrijven we alleen entity types.

### Keys

Een attribuut dat distinct is voor iedere individuele entiteit in een set noemen we een *key attribute*.

Een entiteit kan meerdere *key attributes* hebben. In dit geval moet de combinatie van deze attributen uniek zijn.

Unique keys

Key attributen worden onderlijnd in ER-diagrammen.

### Value sets

### Soorten diagrammen

Er zijn allerlei verschillende diagram-normen om databases in te modelleren.

* Entity Relationship
	* EER
	* Chen
* UML
	* Class diagram

### Entity Relationship Diagrams

#### Chen ER diagrammen

#### Enhanced ER diagrammen

## Data modelleren

Tekst
