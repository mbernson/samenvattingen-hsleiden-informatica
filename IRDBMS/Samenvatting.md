# IRDBMS

## Intro en literatuur

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: irdbms
* Boek: 
	* Elmasri Navathe
	* [Fundamentals of Database Systems](http://www.bol.com/nl/p/fundamentals-of-database-systems/1001004007511876/)
	* Addison-Wesley 
	* ISBN: 9780136086208
* Examenstof: boek, readers op ELO, colleges, practicumopdrachten. 
* Schriftelijke toets over de examenstof.

## Doelen

* Leren kennen van verschillende DBMS-oplossingen en de verschillen daartussen.
* Een DBMS inrichten en beheren: architectuur, performance,
beveiliging, concurrency.
* Complexe SQL opdrachten schrijven, optimaliseren en uitvoeren.

## Inhoud

* Week 1 - Inleiding
	* [Fundamentele concepten](#fundamentele-concepten)
	* [Logisch en fysiek databaseconcept](#niveaus-van-dbmsen)
	* [Verschillende DBMS oplossingen](#)
	* [DML en DDL statements](#)
* Week 2 - Relationele db's, SQL
	* [Constraints](#constraints)
	* [Views](#views)
	* [Triggers](#triggers)
* Week 3 - Query optimalisatie
	* [Query optimalisatie](#query-optimalisatie)
	* [Performance tuning](#performance-tuning)
* Week 4 - Transacties, recovery en concurrency control
	* [Transacties](#transacties)
	* [Logging](#logging)
	* [Recovery](#recovery)
	* [Concurrency control](#concurrency-control)
	* [Locking](#locking)
	* [ACID](#acid)
* Week 5 - Beveiliging
	* [Access control](#access-control)
	* [SQL injection](#sql-injection)
	* [Encryptie](#encryptie)
* Week 6 - Distributed databases
	* [Distributed databases](#distributed-databases)
	* [NoSQL](#nosql)
* Week 7
	* _Herhaling_

## Fundamentele concepten

### 3 niveau's van DBMS'en

* **Internal** (fysieke laag)
	* Dit is de "fysieke" opslagstructuur.
	* Is onzichtbaar voor de buitenwereld.
* **Conceptual** (logische laag)
	* Beschrijft de structuur van de database voor de gebruikers.
	* Tabellen
	* Vorig jaar met IRDB behandeld.
* **External** (view laag)
	* De API van de database.
	* Dit is wat de buitenwereld gebruikt.
	* Views

Dit wordt de _three-schema architecture_ genoemd.

![© 2011, Navathe](three-schema-architecture.png)

Het "DBMS" conept is ontstaan uit software die het wegschrijven naar een file handelt. Hier is een relationeel systeem omheen gebouwd.

### Data independence

Een DBMS wil _Data independence_ waarborgen. In theorie wordt deze scheiding met het drie-schema model behaald.

We kennen twee niveau's van data independence:

#### Logical data independence

Dit wil zeggen dat het **conceptuele schema** kan veranderen, maar de **externe interface** hetzelfde blijft (m.b.v. views). Hierdoor blijven applicaties gewoon werken met de database.

#### Physical data independence

Het schema niet afhankelijk is van de manier waarop het wordt opgeslagen op het opslagmedium (hardeschijf).

#### Tedd Codd

Bedacht een relationeel model in de jaren '60. Is in de jaren '70 geïmplementeerd door Oracle.

* Relation -> Tabel
* Tuple -> Row
* Attribute -> Column

### DML, DDL en DCL

Met deze drie termen delen we SQL op in drie subgedeelten, op basis van functionaliteit.

* DDL
	* Data Definition Language (statements)
	* Creëren van structuren
	* `CREATE TABLE` etc.
* DML
	* Data Manipulation Statements
	* Dit zijn alle statements om data te manipuleren.
	* `SELECT, UPDATE, INSERT` en `DELETE`
* DCL
	* Data Control Language
	* Security en access control tot de database.
	* O.a. `GRANT` en `REVOKE`

## Nieuwe SQL

### Views

Views werken als een virtuele tabel. Ze kunnen gegevens opvragen, en kunnen deze eventueel ook op een andere manier weergeven.

```sql
CREATE [OR REPLACE] VIEW some_view_name
AS SELECT a, b, c
	FROM t1, t2, t3
	WHERE a = b AND c = d
	GROUP BY b
[WITH CHECK OPTION]; -- INSERT and UPDATE commands on the view will be checked
                     -- to ensure new rows satisfy the view-defining condition.
```

Een view bevat geen data, maar is gelinkt aan één of meer _base tables_. De gebruiker ziet het verschil niet bij bijv. een SELECT statement. Views kunnen bijv. handig zijn om een query met JOINs die je vaak gebruikt te vervangen.

Het uitvoeren van UPDATEs op een view kan ingewikkeld zijn.

Een **update view** kan het volgende **niet** hebben:

* Meer dan één base table
* Distinct
* Group by of having

En een **update view** moet het volgende **wel** hebben:

* `WITH CHECK OPTION` achter de definitie.

#### Inline views

Het is ook mogelijk om een view in de `FROM` clause van een SQL-query te hebben. In dit geval bestaat de view alleen in de query zelf.

### Triggers

Triggers vallen onder _active database rules_. D.w.z. dat de database niet alleen maar een passieve kaartenbak is, maar ook acties uit kan voeren.

Dit beschouwen we als een **Event-Condition-Action** model:

1. Het **event** is hetgeen wat de trigger activeert.
2. De **condition** is de voorwaarde waaraan voldaan moet worden voordat de trigger wordt uitgevoerd.
3. De **action** is de handeling die aan de trigger verbonden is. Dit kan SQL-code of code in een andere programmeertaal zijn.

Een trigger kan niet expliciet worden aangeroepen, in tegenstelling tot een stored procedure. Triggers kunnen worden aangeroepen door (**events**):

* Een time trigger.
* Een UPDATE, INSERT of DELETE in een tabel.

#### Opbouw

Je maakt een trigger met `CREATE TRIGGER`. Bevat het volgende:

* Events
	* `BEFORE, AFTER, INSTEAD OF`
	* `FOR EACH ROW` of `FOR EACH STATEMENT`
* Conditie
* Body

Vraag: blocking of non-blocking? Hangt ervan af.
Bij een transactie moet je wachten tot de trigger is uitgevoerd.

#### Voorbeeld

![De tabellen voor het triggers voorbeeld.](employee-triggers-tabel.png)

![Met triggers wordt het totale salaris van alle afdelingen automatisch bijgehouden.](employee-triggers.png)

_Zie ook: Navathe pagina 935._

### Stored procedures

Behoort ook tot de categorie _actieve data_. Is een stuk SQL-code die aangeroepen kan worden en iets doet. Heeft in- en uitvoerparameters.

Trigger kan een stored procedure aanroepen.

## Constraints

_Constraints_ zijn een manier om data-integriteit in ons schema te garanderen. Het stelt eisen aan de data die opgeslagen wordt.

We maken onderscheid tussen drie soorten constraints.

1. _Inherent model-based constraints_ of _implicit constraints_
	* Dit zijn de beperkingen die het model van de gebruikte database(-systeem) ons oplegt.
	* Bijvoorbeeld: dezelfde rij in een tabel kan nooit twee keer bestaan. Dit wordt voorgeschreven door het database-model.
2. _Schema-based constraints_ of _explicit constraints_
	* Zijn direct uit te drukken in het schema van het datamodel.
	* Bijvoorbeeld: films hebben maar één regisseur. Dit is een _belongs to_ relatie met een _foreign key_.
3. _Application-based constraints_ of _business rules_
	* Dit zijn regels die niet in SQL uitgedrukt kunnen worden.
	* Bijvoorbeeld: Validatie van e-mail adressen e.d.

In SQL kennen we een aantal verschillende _constraints_:

* PRIMARY KEY
	* Is een kolom of combinatie van kolommen die uniek identificerend is voor alle rijen.
* UNIQUE KEY
	* Is een kolom of combinatie van kolommen.
* FOREIGN KEY
	* Verwijzing naar een rij in een andere tabel. Hiermee wordt het bestaan van de tegenhangende rij afgedwongen.
* NOT NULL
	* De waarde in een veld mag niet gelijk zijn aan NULL.
* Assertion
	* Is een stukje DDL om een zelf gedefinieerde check mee uit te voeren. Dit geeft altijd een boolean terug; klopt dit of niet?
* Stored procedure
	* M.b.v. een stored procedure is de check van de constraint niet beperkt tot de mogelijkheden van de databasetaal.
* Andere conditie (zoals "integer waarde tussen 1 en 10")
	* Hier is specifieke SQL voor.

### Data integriteit

Twee soorten, **entiteits**- en **referentiële** integriteit.

## Relationele algebra

Relationele algebra, ook bedacht door meneer Codd, is een manier waarmee we queries op een abstracte manier kunnen modelleren.

### Operaties

R en S zijn willekeurige tabellen.

* Union (R &cup; S)
	* Alle records uit R en S.
* Intersection (R &cap; S)
	* De records die zowel in R als in S zitten.
* Difference (R &mdash; S)
	* De records die in R maar niet in S zitten.

## Cartesisch product

Het Cartesisch product is een wiskundige operatie waarmee we het **product** van meerdere sets krijgen. Het symbool hiervoor is een kruis (&#10799;).

Speelkaarten zijn een goed voorbeeld: we hebben de 13 rangen {A, K, Q, J, 10, 9, 8, 7, 6, 5, 4, 3, 2} en de 4 soorten {Schoppen, Harten, Ruiten, Klaver}. Het cartesisch product hiervan zijn 52 _geordende paren_, namelijk de 52 mogelijke speelkaarten:

## Query optimalisatie

* Query tree

Todo

## Performance tuning

Indexes

## Transacties, locking en concurrency control

### Transacties

Een transactie is een logische unit van _database processing_ die één of meer statements bevat. Het combineert deze statements in een _alles-of-niets_ operatie. De tussenstappen zijn onzichtbaar voor de rest van de database totdat de transactie voltooid is.

Transacties hebben boundaries (begin en eind statements). De acties in een transactie kun je verdelen in twee categorieën: lezen en schrijven.

Dankzij transacties kunnen we queries **groeperen**, waardoor er niks tussenin kan komen. Dit geeft _concurrency control_.

#### Voorbeeld

```sql
BEGIN; -- Start de transactie

UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
UPDATE departments SET total_salary = total_salary + 100.00
    WHERE department_name = "foo";

-- Nog meer queries...

COMMIT; -- Voer de commando's uit
[of]
ROLLBACK; -- Annuleer alles uit de transactie
```

### Concurrency control

Zie transacties

Voorbeelden uit Boek: 

* lost update problem
* temporary update (dirty read) problem
* incorrect summary problem

Queries worden altijd opvolgend uitgevoerd. Serialization garandeert isolatie van de queries.

### Locking

Concurrency wordt bereikt door een _two-phase locking protocol_:

* Locking pakt ofwel _permission to read_ of _permission to write_ (voor een transactie).
* Unlocking verwijdert deze permissies van het data item (Zoals een rij).
* Lock en unlock zijn atomic operaties.

**Voorbeeldvraag**: volgen de volgende transacties het two-phase locking protocol?

Waarom zijn deze locks wel of niet serializable?

## ACID

### Atomicity
	
Atomiciteit wil zeggen dat een operatie compleet wordt afgemaakt of helemaal niet. Er is geen tussenstaat.

_Voorbeeld_: Als er in een banksysteem geld van mij naar iemand anders wordt overgemaakt, dan is er _geen moment_ waarop we geen van beiden het geld hebben, of juist allebei het geld hebben.

### Consistency preservation

De database moet in een consistente staat blijven (zijn integriteit behouden). D.w.z. dat er de door ons gestelde _constraints_ altijd geldig blijven.

### Isolation

Transacties mogen elkaar niet beïnvloeden. Updates/inserts/deletes van een transactie zijn onzichtbaar voor de buitenwereld totdat er een COMMIT heeft plaatsgevonden.

Dit is belangrijk bij bijv. rapporteren. Stel dat het genereren van een rapport een uur duurt, dan mogen er tijdens dit uur geen wijzigingen zichtbaar worden.

### Durability or permanency
	
Als een transactie eenmaal gecommit is, mogen de changes nooit verloren gaan door een latere fout. Het is hierbij belangrijk dat de database bouwt op het OS waar het op draait.

## Recovery en logging

### Recovery

Bij een transactie kunnen er dingen mis gaan. Dit gebeurt met ROLLBACK. Mogelijke oorzaken van het falen van een transactie kunnen zijn:

* Systeemcrash (hardware of software falen)
* Transactie of systeem error (een conditie in je code klopt niet en je wilt terugrollen)

Recovery kent een _undo_ en een _redo_ operatie.

### Logging

Een _recovery manager_ schrijft de hele tijd in een speciale journal. Daarmee kun je teruglezen wat er gefaald is en recoveren.

#### Binary logging?

## Deadlocks

Twee actoren wachten telkens op elkaar om toegang te krijgen tot een bepaalde _resource_. Deze situatie is onoplosbaar.

Dit kan in een RDBMS gebeuren als bijv. twee tabellen van elkaar bepaalde _resources_ willen _locken_. Het komt echter niet vaak voor.

(two-phase locking)

Om het te voorkomen moet je de locks voor beide _resources_ in het begin leggen. Dit wordt "strict(e)" of "rigoreuze" locking genoemd.

## Beveiliging

Zie slides over:

* Integrity
* Availability
* Confidentiality

En countermeasures.

mandatory vs discretionary.

### Access Control

Users en privileges.

### SQL injectie

Lijkt me voor de hand liggend. Bijna niks over verteld. Zie iweb.

### Encryptie

Hashing?

## Distributed databases

Cassandra?

## NoSQL

_Zie reader_