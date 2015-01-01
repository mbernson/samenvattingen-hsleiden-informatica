% Samenvatting IWIS
% Mathijs Bernson

# Wiskunde voor ICT'ers

## Informatie

* Keuzevak, niet verplicht
* Studiepunten: 3 ECTS
* Studiebelasting: ?
* Modulecode: IWIS
* Beoordeling: Schriftelijke toets van 120 minuten. Cijfer moet >= 5.5 zijn.

## Literatuur

* Moduleboek(en) IWIS, delen A en B

## Leerdoelen

* Een structuur herkennen in een rij (meet-)gegevens
* De structuur beschrijven met een recurrente betrekking
* Bij telproblemen nagaan of de volgorde een rol speelt
* Gestructureerd een telprobleem oplossen m.b.v. permutaties en/of combinaties
* Vectorvoorstellingen en vergelijkingen van lijnen en vlakken opstellen
* Gebruik maken van het inproduct van vectoren
* Intersectieproblemen tussen lijnen en vlakken onderling op te lossen
* Binair en hex kennen
* Bisectie toepassen bij numerieke nulpuntbenadering

## Toetstof

De hoofdstukken uit de modulewijzers.

### Niet inbegrepen

Dit is allemaal **geen** toetsstof:

* §4.5 uit hoofdstuk 4
* §4.6 alle opgaven behalve: 8, 13, 14

## Errata voor het boek

Het volgende staat verkeerd in het boek:

* §4.7 opgave 2b. Het antwoord moet zijn: 10^4(26^2 - 1)

## Inhoud

* [Foo](#foo)
* [Bar](#bar)
* [Baz](#baz)

## Recurrente betrekkingen

```haskell
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

## Combinatoriek

Combinatoriek is een kwestie van systematisch (en 'slim') tellen.

Een veel voorkomende vraag is om het aantal rangschikkingen van verschillende objecten te berekenen. Dit noemen we **permutaties**.

Bij dit soort vragen moet je opletten, en het volgende checken:

* [Is de volgorde belangrijk?](#geordende-rijen)
* Zijn de elementen uniek?

Gebruik **nooit** zomaar een formule om tot een antwoord te komen. De context is altijd belangrijk.

Maak het niet te ingewikkeld. Schrijf het probleem bijvoorbeeld uit met stipjes en zet daaronder de vermenigvuldiging (faculteit) die je gaat uitvoeren.

### Faculteit

Stel, je hebt 5 letters (van A t/m E). Alle mogelijke rangschikkingen hiervan zijn $5!$ (5 faculteit).

$$ 5! = 5 * 4 * 3 * 2 * 1 $$

Deze manier van rekenen is nuttig als de **volgorde** van de objecten een rol speelt.

### Geordende rijen

Een **rij** is per definitie geordend.

$$ \frac{\frac{5!}{(5-3)!}}{3!} = \frac{5!}{3! * (5-3)!} = \frac{120}{6*2} = 10 $$

### Ongeordende rijen (verzamelingen)

Een rij waarvan de ordening niet belangrijk is noemen we een **verzameling**.

### Binomiaalcoëfficiënten

* Gegeven een verzameling met precies $n$ elementen, met $n \ge 0$.
* Hoeveel verschillende deelverzamelingen zijn er met precies $k$ elementen? ( $0 \ge k \ge n$ )

Antwoord:

$$ \binom{n}{k} = \frac{n!}{k!(n - k)!} $$

Voorbeeld:

$$ \binom{5}{3} = \frac{5!}{3!(5 - 3)!} = \frac{120}{6*2} = 10 $$

## Fouten en nauwkeurigheid

We bedrijven wiskunde in een "perfecte wereld", waarin lijnen precies recht zijn, getallen oneindig precies kunnen zijn, enzovoort. Computers worden echter beperkt door hun geheugen/CPU. Daarom kan een computer getallen slechts **benaderen**, het wordt **afgerond**.

### De absolute fout

Stel, we meten iemands lengte in meters, met een naukeurigheid van .01 meter. Als we zeggen dat de lengte 1.87 meter is, is de werkelijke lengte hier bijna nooit aan gelijk. De afstand tussen de uitkomsten is .01; dus alle lengtes die afgerond worden naar 1.87 liggen daar hoogstens $(1/2)•0.01$ (de **helft** van onze nauwkeurigheid) vanaf.

Kortom: de werkelijke lengte ligt in het interval $[1.865, 1.875>$, waarbij de linkergrenswaarde wel en de rechtergrenswaarde niet wordt meegenomen.

We schrijven: 1.87 ± 0.005 en noemen 0.005 de **absolute fout**.

### Foutenrekening: optellen en aftrekken

a ± f₁ en b ± f₂ zijn twee meetuitkomsten met absolute fouten f₁ en f₂. Dan geldt voor de som resp. het verschil:

**$(a + b) ± (f₁ + f₂)$** resp. **$(a - b) ± (f₁ + f₂)$**

## Sommatie

Som ∑ (Sigma).

**Ondergrens** staat onderaan, **bovengrens** staat bovenaan. In de ondergrens zien we aan welke variabele we binden.

$$\sum\limits_{i=3}^6 = 3^2 + 4^2 + 5^2 + 6^2 = 86$$

De som van i = 3 tot 6 van i

$$ \vec{a} + \vec{b} = {a\brack b} + {a\brack b} $$

## Intersectieberekeningen

## Numerieke nulpuntsbenadering met bisectie

## Vectoren

Translatie in een gekozen assenstelsel.

Een vector $ 3\brack 5 $ verplaats 3 op de x-as (naar rechts) en 5 op de y-as (omhoog). Het is een vrije vector, dus mag het beginpunt overal zijn.

### Som

$$ \vec{a} + \vec{b} = {a\brack b} + {a\brack b} $$

### Vermenigvuldiging

### Lengte van een vector

### Hoek tussen vectoren

$$ \sin \alpha = \frac o s, \cos \alpha = \frac a s, \tan \alpha = \frac o a $$

### Inproduct

Het inproduct van vectoren $ a = a_1 a_2 ... $ en is:

$$ (a, b) = a_1 b_1 + a_2 b_2 $$

### Normaalvector

## Binaire en hexadecimale talstelsels

### Binair

```
binair = decimaal
0 = 0
1 = 1
01 = 2
10 = 1
?
...
```

### Hex

## Toetstips

* Zoals altijd zijn de stappen naar je antwoord het belangrijkst. Schrijf het op, maak ook tekeningetjes (bijv. bij combinatoriek).
