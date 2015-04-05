% Samenvatting ISEN
% Mathijs Bernson, Reinier Neuwahl

# Samenvatting Sensortechnologie

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: <foobar>

## Literatuur

* Boek Electronics Fundamentals - ISBN 9781292025681
* Slides
* Papers e.d.

## Leerdoelen
 
1. Internet of Things, basisprincipes
	* Het hebben van een beeld van de reikwijdte, de effecten op business en op de samenleving van het "Internet of Things" (IOT). De belangrijkste componenten van het IOT kunnen omschrijven in relatie tot elkaar en met de business en de techniek. De relatie tussen internet of things en Big Data kennen (grotendeels zelfstudie en gastcolleges ). 
2. Sensortechnologie theorie
	* Heeft een breed basiskennis van sensoren circuits en hoe de extensie hiervan werkt naar sensornetwerken en uiteindelijk internet of things.
	* Kent de randvoorwaarden en de principes bij het toepassen van sensoren, op verschillende abstractieniveaus en kent de principes van signalen, versterkers,filters, A/D conversie en digitale signaal bewerking. 
3. Projectplanning en Uitvoering.
	* De student kent de eisen en kenmerken voor het opstellen van een projectplan. O.a. probleemstelling, onderzoeksvraag, businessplan,deliverables en rapporteren. Het opleveren van een werkende demonstrator op basis van onderzoek door project groep.

## Inhoud

* [Elektriciteit](#elektriciteit)
	* [Kwantiteit en eenheden](#kwantiteit-en-eenheden)
	* [Meten](#meten)
	* [Significant digits](#significant-digits)
* [Atomen](#atomen)
	* [Valentie-elektronen](#valentie-elektronen)
	* [Vrije elektronen](#vrije-elektronen)
	* [Koperatoom](#koperatoom)
	* [Materialen](#materialen)
		* [Geleiders](#geleiders)
		* [Halfgeleiders](#halfgeleiders)
		* [Isolatoren](#isolatoren)
* [Coulomb](#coulomb)
	* [Wet van Coulomb](#wet-van-coulomb)
	* [Positieve en negatieve lading](#positieve-en-negatieve-lading)
* [Voltage](#voltage)
	* [Voltage als eenheid](#voltage-als-eenheid)
	* [DC voltage bronnen](#dc-voltage-bronnen)
		* [Batterijen](#batterijen)
			* [Typen batterijen](#typen-batterijen)
		* [Brandstofcellen](#brandstofcellen)
		* [Zonnecellen](#zonnecellen)
		* [Generatoren](#generatoren)
		* [Thermokoppels](#thermokoppels)
		* [Piëzo-elektrische sensors](#piëzo-elektrische-sensors)
* [Spanning](#spanning)
	* [Inleiding](#inleiding)
	* [Definitie](#definitie)
* [Weerstand](#weerstand)
	* [Ohm](#ohm)
	* [Weerstanden](#weerstanden)
		* [Kleurcodes](#kleurcodes)
		* [Variabele weerstanden](#variabele-weerstanden)
		* [Variabele weerstand sensors](#variabele-weerstand-sensors)
* [Elektrische circuits](#elektrische-circuits)
	* [Schakelaars](#schakelaars)
	* [Bescherming voor circuits](#bescherming-voor-circuits)
* [Kabels](#kabels)
	* [Weerstand in kabels](#weerstand-in-kabels)
* [Aarde](#aarde)
* [Circuitmetingen](#circuitmetingen)
* [Wet van Ohm](#wet-van-ohm)
* [Energy](#energy)
* [Power](#power)

---------------------------------------------------------

## Elektriciteit

### Kwantiteit en eenheden

| Eenheid        | Symbool | SI eenheid | Symbool |
|----------------|---------|------------|---------|
| capacitance    | C       | farad      | F       |
| charge         | Q       | coulomb    | C       |
| conductance    | G       | siemens    | S       |
| current        | I       | ampere     | A       |
| energy or work | W       | joule      | J       |
| frequency      | f       | hertz      | Hz      |
| impedance      | Z       | ohm        | Ω       |
| inductance     | L       | henry      | H       |
| power          | P       | watt       | W       |
| reactance      | X       | ohm        | Ω       |
| resistance     | R       | ohm        | Ω       |
| voltage        | V       | volt       | V       |

**TODO** andere tabel ook overnemen

### Meten

De **fout** (error) is het verschil tussen de ideale waarde en de gemeten (waargenomen) waarde.

Met **nauwkeurigheid** (accuracy) bedoelen we het bereik van de behaalde foutwaarden, van kleinst tot grootst.

Tot slot is de **precisie** een maatstaaf van de consistente herhaalbaarheid van een bepaald iets. Voorbeeld: pijlen dicht bij elkaar schieten. Dan is de *fout* tussen de pijlen gelijkwaardig, maar het is niet *nauwkeurig* in het midden geschoten.

### Significant digits

1. Niet-nul cijfers zijn altijd significant.
2. Nullen die links van het eerste niet-nul cijfer staan, zijn nooit significant.
3. Nullen tussen niet-nul cijfers zijn altijd significant.
4. Nullen rechts van de decimaal voor een decimaal getal zijn significant.
5. Nullen links van de decimaal van een heel getal zijn misschien significant, afhankelijk van de meting.

---------------------------------------------------------

## Atomen

Een atoom is het kleinste deeltje van een stof die de karakteristieke eigenschappen van die stof behoudt.

Atomen bestaan uit protonen, neutronen en elektronen.
De kern van een atoom noemen we de **nucleus**. De nucleus bestaat uit **protonen** (altijd positief geladen) en **neutronen** (ongeladen).

Om de nucleus draaien **elektronen**. Deze elektronen zijn per definitie negatief geladen.

Een atoom heeft meestal evenveel protonen als neutronen. Hierop zijn uitzonderingen, zoals het waterstofatoom.

In de natuurlijke staat hebben atomen evenveel elektronen als protonen.

Alle elementen in het periodiek systeem hebben een **atoomnummer**.

De banen die elektronen volgen rond de nucleus delen we op in een aantal **schillen** (energy bands). Elk gegeven atoom heeft een vast aantal van deze schillen. De schillen nummeren we als 1, 2, 3, enzovoort, met 1 als dichtste bij de nucleus.

Elke schil heeft op zijn beurt een maximum aantal elektronen op bepaalde banen zitten.

* Proton -> positief
* Elektron -> negatief
* Neutron -> ongeladen, neutraal

### Valentie-elektronen

Elektronen die verder om de nucleus draaien hebben meer energie, en zijn minder sterk gebonden tot het atoom dan de elektronen die dichterbij zijn.

De buitenste schil van het atoom noemen we **valentieschil**. Deze schil is niet volledig opgevuld.

### Vrije elektronen

Een **ion** is een atoom dat niet langer in balans is qua lading.

We hebben het over een **positief ion** wanneer het aantal protonen hoger is dan het aantal elektronen.

Andersom, wanneer het aantal elektronen hoger is dan het aantal protonen, is het een **negatief ion**.

### Koperatoom

Koper is het meestgebruikte metaal in elektrische toepassingen.
Het koperatoom heeft 29 electronen die om de nucleus draaien in vier schillen.
Bij voldoende thermische energie kan de valentie-elektron wegbreken van het atoom, en een vrij elektron worden. Bij kamertemperatuur zijn er vrij elektronen aanwezig in koper.

### Materialen

De materialen die we bij elektronica gebruiken vallen in drie categorieën:

#### Geleiders

Geleiders staan spanning toe. Ze hebben een groot aantal vrije elektronen. Ze worden gekenmerkt door één tot drie valentie-elektronen in hun structuur.

De meeste metalen zijn goede geleiders. Koper en zilver.

#### Halfgeleiders

Halfgeleiders worden onder de geleiders geclassificeerd om spanning te geleiden, omdat ze minder vrije elektronen hebben.
Dankzij hun karakteristieken vormen sommige halfgeleiders de basis voor elektrische apparaten. Denk aan dioden, transistors en geïntegreerde circuits.

Silicium en germanium zijn bekende halfgeleiders.

#### Isolatoren

Isolators zijn nuttig omdat het heel slechte geleiders zijn. Ze worden gebruikt om te voorkomen dat spanning op ongewenste manieren loopt.

Isolatoren hebben geen vrij elektronen in hun structuur. De valentie-elektronen worden gebonden aan de nucleus en niet beschouwd als vrij.

Niet-metalen worden meestal als isolatoren beschouwd. De meest praktische isolatoren in de elektronica zijn glas, porselein, teflon en polyethyleen.

## Coulomb

De Coulomb is de eenheid van elektrische lading.
Eén Coulomb is gelijk aan de lading die 6.25 * 10^(18) elektronen bezitten.

### Wet van Coulomb

> Een kracht *F* bestaat tussen twee ladingen *Q1* en *Q2*, die direct proportioneel is aan het product van de twee ladingen, en invers proportioneel tot het kwadraat van de afstand *d* tussen de ladingen.

Een enkel elektron heeft een lading van 1.6 * 10^(-19) Coulomb.

**TODO** formule overnemen van pagina 29

Q = #electrons / (6.25 * 10^18 electrons/C)

### Positieve en negatieve lading

Herhaling van wat we eerder door hebben genomen. Namelijk: als #protonen == #elektronen, dan is het atoom neutraal geladen.

Als #protonen > #elektronen dan het positief geladen. Als #protonen < #elektronen dan is het atoom negatief geladen.

## Voltage

**V = W / Q**

Waarin V = voltage in volts, W = energie in joules, en Q = lading in Coulombs.

Je kunt het voltage zien als het drukverschil dat ontstaat als er water door een buis gepompt wordt, in een gesloten watersysteem.

### Voltage als eenheid

> Eén volt is het potentiaal verschil (voltage) tussen twee punten wanneer één joule aan energie gebruikt wordt om één coulomb aan lading van punt A naar B te brengen.

### DC voltage bronnen

Voltage kan op de volgende manieren gegenereerd worden:

* Chemische energie
* Lichtenergie
* Magnetische energie gecombineerd met mechanische beweging

Voltagebronnen kunnen AC of DC geven.

#### Batterijen

Een batterij is een bron van voltage die bestaat uit één of meer cellen, die chemische energie direct omzet in elektrische energie.

Batterijen hebben een negatieve uitvoer, de **anode** en een positieve uitvoer, de **cathode**. De anode heeft een surplus aan elektronen. Daardoor kan het een negatieve lading afgeven. De cathode heeft een positief potentieel, en kan daarmee elektronen aannemen.

Een **primaire batterij** is niet-oplaadbare, die een onomkeerbare chemische reactie uitvoert. Daarom wordt hij weggegooid als hij opgebruikt is.

**Secundaire batterijen** zijn herbruikbaar omdat hun chemische reacties omkeerbaar zijn.

##### Typen batterijen

* Alkaline-MnO2
	* Primaire batterij
	* Heeft langer shelf-life en hogere power density dan een koolstof-zink batterij.
* Carbon-zinc (koolstof-zink)
	* Primaire batterij
	* Gebruikt in zaklampen en kleine apparaten.
	* Verkrijgbaar in AAA, AA, C en D.
* Lead-acid (loodaccu)
	* Secundaire batterij
	* Gebruikt in auto-accu's en schepen.
* Lithium-ion
	* Secundaire batterij
	* Wordt veel gebruikt in draagbare elektronica.
* Lithium-MnO2
	* Primaire batterij
	* Wordt gebruikt in fotografie-apparatuur, rookalarmen en andere elektronica.
* Nikkel-metaal hybride
	* Secundaire batterij
	* Wordt gebruikt in laptops, telefoons, camcorders enz
* Zilveroxide
	* Primaire batterij
	* Wordt gebruikt in horloges, foto-apparatuur, gehoorapparaten.
* Zinc-lucht
	* Wordt gebruikt in gehoorapparaten, medische apparatuur en dergelijken.

#### Brandstofcellen

Een brandstofcel zet elektrochemische energie direct om in DC-voltage. Er wordt een brandstof (meestal waterstof) gecombineerd met een oxidator (meestal zuurstof), waardoor er een reactie ontstaat. Hierbij komt energie vrij.

Dit proces is schoon, stil en heeft een hogere efficiëntie dan verbranding.

#### Zonnecellen

Zonnecellen werken volgens het fotovoltaïsch effect, waarbij lichtenergie direct om wordt gezet naar elektrische energie.

Een zonnecel bestaat uit twee lagen van twee halfgeleiders. Wanneer één laag wordt blootgesteld aan licht, steken er veel elektronen over van de ene laag naar de andere. Hierdoor ontstaat er een potentiaal verschil (voltage).

#### Generatoren

Converteren mechanische energie naar elektrische energie d.m.v. elektromagnetische inductie. Een geleider wordt door een magnetisch veld geroteerd, waardoor er een voltage ontstaat in de geleider.

#### Thermokoppels

Thermokoppels bestaan uit twee verschillende soorten materiaal. Bij de scheidingslijn tussen deze materialen ontstaat positieve en negatieve spanning. Het voltage wordt gegenereerd als functie van de temperatuur.

#### Piëzo-elektrische sensors

Deze genereren een voltage wanneer een piëzo-elektrisch materiaal wordt vervormd door een externe kracht.
Vanwege deze eigenschap worden Piëzo-elektrische sensoren gebruikt in druksensoren, krachtsensoren, versnellingsmeters, microfoons enzovoort.

---------------------------------------------------------

## Spanning

### Inleiding

De beweging van elektronen wordt veroorzaakt door de polarisatie van het materiaal, waarbij de uiteinden van het materiaal positief en negatief geladen worden. De negatieve kant duwt de elektronen van zich af, en de positieve kant trekt de elektronen aan.

De beweging van de vrije elektronen van de negatieve kant naar de positieve kant wordt spanning (current) genoemd. Het symbool voor spanning is *I*.

### Definitie

De definitie van spanning is de **snelheid waarmee een lading zich verplaatst**.

Spanning wordt gemeten aan het aantal elektronen (hoeveelheid lading) die een punt passeren in een bepaalde tijd.

**I = Q / t**

*I* is spanning in Amperes (A). *Q* is de lading van de elektronen in Coulombs (C). *t* is de tijd in seconden.

> Eén ampere (1A) is de hoeveelheid spanning die bestaat wanneer 1 coulomb aan elektronen door een bepaalde doorsnede wordt bewogen in 1 seconde.

---------------------------------------------------------

## Weerstand

Weerstand is de hoeveelheid tegendruk tegen spanning.

Als er spanning is door een materiaal dat weerstand biedt, ontstaat er hitte door het botsen van vrije elektronen en atomen.
Zo kan een (koper)draad bijvoorbeeld warm worden als er genoeg spanning doorheen gaat.

De analogie voor weerstand is een deels geopende klep in een watersysteem, die de doorstroom van het water beperkt.

### Ohm

Weerstand *R* drukken we uit in Ohms, met als symbool de Griekse letter omega: Ω.

> Eén ohm (1Ω) aan weerstand bestaat wanneer er 1 ampere aan spanning bestaat in een materiaal waarover 1 volt aan stroom op staat.

Het tegengestelde van weerstand is **geleiding**, met als symbool *G*. Dit is een maat van het gemak waarmee spanning tot stand komt.

**G = 1 / R**

De eenheid van geleiding is **siemens**, met als symbool *S*.

### Weerstanden

Met een **weerstand** bedoelen we een onderdeel dat ontworpen is om een specifieke hoeveelheid weerstand te bieden.

Weerstanden passen we toe om:

* Spanning te beperken,
* Voltage te verdelen,
* (Soms) hitte op te wekken.

Weerstanden vallen in twee categorieën, vast en variabel. Vaste weerstanden hebben een hoeveelheid weerstand die niet kan veranderen.

#### Kleurcodes

Bij veel vaste weerstanden wordt met kleurcodes aangegeven wat de tolerantiewaarde en de weerstandwaarde is.

Meestal heb je te maken met 4-band kleurcodes. Die lees je als volgt:

1. Eerste band: eerste digit van weerstand
2. Tweede band: tweede digit van weerstand
3. Derde band: Multiplier van de weerstand in tientallen
	* Dit is het aantal nullen achter de weerstand
4. Vierde band: Percentage tolerantie

Het 5-band systeem werkt als volgt:

1. Eerste band: eerste digit van weerstand
2. Tweede band: tweede digit van weerstand
3. Derde band: derde digit van weerstand
3. Vierde band: Multiplier van de weerstand in tientallen
	* Dit is het aantal nullen achter de weerstand
4. Vijfde band: Percentage tolerantie
	* **Let op**: dit zijn andere percentages dan het 4-band systeem

#### Variabele weerstanden

Bij variabele weerstanden is het makkelijk om de hoeveelheid weerstand te veranderen.

De variabele weerstand waarmee we het voltage variëren heet een **potentiometer** (potmeter).

De variabele weerstand die gebruikt wordt om de spanning te regelen heet de **rheostat**.

* Potentiometer
* Tapered potentiometer

#### Variabele weerstand sensors

* Thermistors
	* Weerstand is een functie van temperatuur
* Fotoconductieve cellen
	* Weerstand is een functie van licht
* Strain gauges (drukmeter)
	* Weerstand is een functie van druk

## Elektrische circuits

Een **circuit** bestaat uit een bron van voltage, een component waar dit doorheen moet gaan (genaamd de **load**), en een pad voor de spanning om doorheen te gaan.

Circuits modelleren we in **schematics**.

In een **gesloten circuit** is er een compleet pad waar de spanning doorheen loopt. Bij een **gesloten circuit** is dit pad gebroken.
Met schakelaars kan een circuit geopend of gesloten worden.

### Schakelaars

* SPST
	* Single-Pole-Single-Throw
* SPDT
	* Single-Pole-Double-Throw
* DPST
	* Double-Pole-Single-Throw
* DPDT
	* Double-Pole-Double-Throw
* NOPB
	* Normally open push button
* NCPB
	* Normally closed push button
* Single-pole rotary

### Bescherming voor circuits

Zekeringen en circuitbrekers worden gebruikt om opzettelijk een open circuit te maken wanneer de spanning een bepaalde waarde overschrijdt.

---------------------------------------------------------

## Kabels

Een Amerikaanse norm om de diameter van een kabel te standaardiseren is de American Wire Gauge (AWG). De eenheid hiervan is de **circular mil** (CM).

1CM staat gelijk aan de oppervlakte van draad waarvan de diameter 0.001 inches is.

We kunnen de hoeveelheid CM's van een draad vinden door de diameter in duizendsten van een inch uit te drukken en vervolgens te kwadrateren:

**A = d^2**

Waarin *A* de oppervlakte van de doorsnede in circular mils is, en *d* de diameter in mils is.

### Weerstand in kabels

- Geen enkel materiaal geleidt perfect. De geleiding hangt af van drie eigenschappen:

1. Het soort materiaal
2. De lengte van de draad
3. De doorsnede

De temperatuur beïnvloedt de geleiding ook.

Elk materiaal kent een mate van weerstand (*resistivity*) die we aanduiden met de Rho (𝜌). Dit is een constante bij een gegeven temperatuur.

Dit maakt de formule voor de mate van weerstand *R*:

**R = (𝜌l) / A**

Waarin *l* de lengte is en *A* de oppervlakte van de doorsnede.

---------------------------------------------------------

## Aarde

Aarde is een referentiepunt in het circuit. We kennen twee soorten aarde:

* *Earth ground*
	* Connectie die verbonden is met de aarde zelf.
* *Reference ground*
	* Definieert 0V voor het circuit.
	* Wordt ook wel **common** genoemd, met label COM of COMM.

## Circuitmetingen

Het kan nodig zijn om voltage, spanning of weerstand in een circuit te meten.
Dit doe je respectievelijk met een **voltmeter**, een **ammeter** of een **ohmmeter**. Alledrie bestaan samen als een multimeter.

De kleinste afwijking die een meter kan meten noemen we de **resolutie**.

## Wet van Ohm

De wet van Ohm beschrijft mathematisch hoe voltage (V), spanning (I), en weerstand (R) binnen een circuit tot elkaar relateren.

De wet kan in drie verschillende vormen worden geschreven. Welke je gebruikt hangt af van de *eenheid* die je moet bepalen.

**I = V / R**

Waar *I* de spanning in amperes is, *V* het voltage in volts is, en *R* de weerstand in Ohms is.

Uit deze formule volgt dat als *V* toeneemt of afneemt, *I* toeneemt of afneemt. Dit principe is omgekeerd met *R*.

### Andere vormen

**V = I * R**

Voltage berekenen als je de spanning en weerstand weet.

**R = V / I**

Weerstand berekenen als je het voltage n de spanning weet.

## Energy

*Energie* is het vermogen om werk te verrichten.
*Kracht/power* is de mate waarin energie wordt gebruikt.

Kracht is energie gedeeld door tijd:

**P = W / t**

De SI eenheid voor energie is **Joule** (J).

Als je de joules deelt door tijd in seconden, krijg je een wattage eruit.

Eén **watt** is de hoeveelheid kracht waarbij één joule aan energie in één seconde wordt verbruikt.

Het aantal joules gebruikt in 1 seconde is dus altijd gelijk aan het aantal watts.

### Kilowatt-uur

De **Kilowatt-uur** is een praktische eenheid om elekriciteitsverbruik in uit te drukken. Het staat voor de energie die bij 1000 watt aan kracht in één uur wordt verbruikt.

## Power

### Wet van Watt

Voor het berekenen van de kracht in een elektronisch circuit.

**P = (I^2) * R**

Power (Watts) = Spanning (Amperes) * Weerstand (Ohms)

**P = V * I**

Power (Watts) = Voltage (Volt) * Spanning (Ampere)

**P = (V^2)/R**

Power (Watts) = Voltage (Volt) kwadraat gedeeld door Weerstand (Ohms)

### Power rating

Maximale hoeveelheid kracht die een weerstand kan weerstaan zonder te beschadigen.

## Energie conversie en voltage drop

Het voltage aan één kant van een weerstand is lager dan aan de andere kant, doordat er energie opgegeven wordt. Dit verschijnsel noemen we de *voltage drop*.

## Efficientie van een voeding

De efficientie is de verhouding van invoer (stroom) over uitvoer (stroom).

De output is **altijd** lager dan de **input**.

### Ampere-uur rating van batterijen

Bepaalt de tijd dat een batterij een bepaalde hoeveelheid spanning kan leveren bij een vastgesteld voltage.

Een rating van 1 ampere-uur betekent dat een batterij gemiddeld 1 ampere aan spanning gedurende een 1 kan leveren, bij een vastgesteld voltage.

Hoe meer spanning een batterij moet leveren, hoe korter de levensduur. Batterijen worden vaak ook vastgesteld op een specifiek amperage, naast het voltage.

Dan hebben we het bijvoorbeeld over een auto-accu van 70Ah, die op 12 volt 3.5 ampere levert. Dit kan hij dus gedurende 20 uur doen.

## Gelijkspanning en wisselspanning

