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
	* Is de "fysieke" opslagstructuur.
	* Is onzichtbaar voor de buitenwereld.
* **Conceptual** (logische laag)
	* Beschrijft de structuur van de database.
	* Tabellen
	* Vorig jaar met IRDB behandeld.
* **External** (view laag)
	* De API van de database.
	* Dit is wat de buitenwereld gebruikt.
	* Views

Dit wordt de _three-schema architecture_ genoemd.

Het "DBMS" conept is ontstaan uit software die het wegschrijven naar een file handelt. Hier is een relationeel systeem omheen gebouwd.
Een DBMS wil _Data independence_ waarborgen. In theorie wordt deze scheiding met het drie-schema model behaald.

#### Tedd Codd

Bedacht een relationeel model in de jaren '60. Is in de jaren '70 geïmplementeerd door Oracle.

* Relation -> Tabel
* Tuple -> Row
* Attribute -> Column

### DML, DDL en DCL

* DDL
	* Data Definition Language (statements)
	* Creëren van structuren
* DML
	* Data Manipulation Statements
	* SELECT's, UPDATE's (SET WHERE AND OR) enz.
* DCL
	* Data Control Language
	* Security
		* Toegang beheren

## Nieuwe SQL

### Views

Views werken als een virtuele tabel. Ze kunnen gegevens opvragen, en kunnen deze eventueel ook muteren.

```sql
CREATE [OR REPLACE] VIEW some_view_name
AS SELECT a, b, c
	FROM t1, t2, t3
	WHERE a = b AND c = d
	GROUP BY b
[WITH CHECK OPTION]; -- INSERT and UPDATE commands on the view will be checked
                     -- to ensure new rows satisfy the view-defining condition.
```

Bevat geen data, maar is gelinkt aan één of meer _base tables_. De gebruiker ziet het verschil niet bij bijv. een SELECT statement.

Joins kun je soms vervangen door een view.

Een **update view** kan het volgende **niet** hebben:

* Meer dan één base table
* Distinct
* Group by of having

### Triggers

Wordt geactiveerd bij een bepaalde gebeurtenis (conditie). Dan wordt er een actie uitgevoerd.

Een trigger kan niet expliciet worden aangeroepen (anders dan een stored procedure).

Veelvoorkomende events (triggers) zijn:

* Een time trigger.
* Een UPDATE, INSERT of DELETE in een tabel.

De actie kan van alles zijn, bijv. code in een andere taal. Kan ook SQL-code zijn.

#### Opbouw

Trigger maken met CREATE TRIGGER. Bevat het volgende:

* Events
	* BEFORE, AFTER, INSTEAD OF
	* FOR EACH ROW of FOR EACH STATEMENT
* Conditie
* Body

Vraag: blocking of non-blocking? Hangt ervan af.
Bij een transactie moet je wachten tot de trigger is uitgevoerd.

_Zie boek voor voorbeelden van triggers_

### Stored procedures

Behoort ook tot de categorie _actieve data_. Is een stuk SQL-code die aangeroepen kan worden en iets doet. Heeft in- en uitvoerparameters.

Trigger kan een stored procedure aanroepen.

## Constraints

TODO

## Relationele algebra

TODO

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
-- Etc etc

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

* Atomicity
Operatie wordt compleet afgemaakt of helemaal niet.
* Consistenty preservation
De db moet in een consistente staat blijven.
* Isolation
Transacties mogen elkaar niet beïnvloeden. Updates/inserts/deletes van een transactie zijn onzichtbaar voor de buitenwereld totdat deze zijn gecommit.
* Durability or permanency
Als een transactie eenmaal gecommit is, mogen de changes nooit verloren gaan door een latere fout.

## Recovery en logging

### Recovery

Bij een transactie kunnen er dingen mis gaan. Dit gebeurt met ROLLBACK. Mogelijke oorzaken van het falen van een transactie kunnen zijn:

* Systeemcrash (hardware of software falen)
* Transactie of systeem error (een conditie in je code klopt niet en je wilt terugrollen)

Recovery kent een _undo_ en een _redo_ operatie.

### Logging

Een _recovery manager_ schrijft de hele tijd in een speciale journal. Daarmee kun je teruglezen wat er gefaald is en recoveren.

## Beveiliging

### Access Control

### SQL injectie

Lijkt me voor de hand liggend.

### Encryptie

Hashing?

## Distributed databases

Cassandra

## NoSQL

_Zie reader_