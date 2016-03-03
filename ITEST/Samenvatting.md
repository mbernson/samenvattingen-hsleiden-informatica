% Samenvatting ITEST
% Mathijs Bernson

# Samenvatting Software testing

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: ITEST

## Literatuur

* Test Driven Development By Example, Kent Beck - ISBN 9780321146533
* Software Testing: An ISEB Foundation, Morgan & Samaroo - ISBN 9781902505794

## Onderwerpen

### Kennen

* Soorten/typen tests
* Unit testing
* Test coverage
* Input space partitioning
* Design by contract
* ISTQB principes

### Kunnen

* Test driven development uitvoeren/demonstreren
* Mocken d.m.v. bijv. Mockito

## Inhoud

* [Foo](#foo)
* [Bar](#bar)
* [Baz](#baz)

## Statisch vs. dynamisch testen

Bij statische tests wordt de code niet uitgevoerd.
In dynamische tests wordt de code wel uitgevoerd, met test data.

## De wet van Bernson

> Alle software breekt voortdurend.

## Zeven testprincipes van ISTQB

**Dit leren!**

1. Testing shows the presence of bugs, not their absence!
2. Exhaustive testing is impossible
3. Early testing is recommended
4. Defects are clustered
5. Pesticide paradox: new types of bugs will always appear
6. [Importance of] testing is context dependent
7. Absence of errors fallacy
	* De afwezigheid van errors kan bedrieglijk zijn.

### 1. Testing shows the presence of bugs, not absence

> Program testing can be used to show the presence of bugs, but never to show their absence!

Dijkstra quote. Je zou eerst moeten denken aan de specificaties, en die hand-in-hand laten gaan met het testen.

### 2. Exhaustive testing is impossible

Alles testen is onmogelijk. In de meeste programma's zijn er zo veel combinaties van invoer, control flow dat het niet 100% getest kan worden.

Zelf prioriteit geven aan wat je moet testen adhv hoe snel een stuk code fout kan gaan.

```
if(i > 8 && i <= 20) {
	// ...
}
```

Wat moet je hieraan testen?
Pak een waarde eronder, een erboven en een in het midden. Bijv. 7, 8, 10, 20, 21.

### 3. Early testing

Vroeg beginnen met testen is aan te bevelen!
Vroeg in het project zijn de kosten van het bugfixen (en de kosten van aanpassen) namelijk nog laag.

(Zie grafiek in slide 8 van week 1)

### 4. Defect clustering

De fouten in code zijn niet gelijkmatig verdeeld. De ene package kan er meer hebben dan de andere. Mogelijke redenen:

* Slechte programmeurs hebben aan die module gewerkt
* De module is complex

### 5. Pesticide paradox

Bugs worden "resistent" tegen bepaalde "medicijnen" (oplossingen).
Er zullen altijd weer nieuwe bugs de kop opsteken waar je niet eerder aan gedacht had.

### 6. Testing is context dependent

Hoe ernstig is het als het mis gaat met de software? Stem de testen/testmethodes hierop af.

### 7. Absence of errors fallacy

Er zijn altijd errors, je kan niet bewijzen dat ze er niet zijn.
Als je geen errors hebt lijkt alles goed te gaan en bug-vrij te zijn.

## ISTQB kort

1. Testen bewijst de **aanwezigheid** van bugs, niet de **afwezigheid**
2. Je kan **nooit alles** testen
3. Begin **zo vroeg mogelijk** met testen
4. Fouten zijn **ongelijkmatig** verdeeld
5. Er komen altijd nieuwe bugs waar je niet aan gedacht had (**pesticide paradox**)
6. Hoe belangrijk testing is hangt af van de **context**
7. **Errors zijn er altijd**, ook al zie je ze niet

## Testtypes

* Regression test -> geschiktheid
* Load test -> prestatie-efficiëntie
* Stress test -> prestatie-efficiëntie
* Performance test -> prestatie-efficiëntie
* Penetratie test (pentest) -> beveiligbaarheid
* Usability test -> bruikbaarheid
* Failover test -> betrouwbaarheid

## Defensive en non-defensive programming

### Non-defensive

* I can't make a mistake.
* It doesn't matter what people think.
* Whatever my brain comes up with is going to be a great idea.

* It is possible to write perfect software.
* My brain tells me the truth, and it can't find any errors, therefore I have written perfect software.
* My code is who I am and people who criticize its perfection are criticizing me.

### Defensive

* Software has errors.
* You are not your software, yet you are are responsible for the errors.
* You can never remove the errors, only reduce their probability.

## Design by contract

Bij _design by contract_ worden de interfaces van abstracte software componenten precies gedefinieerd.
Zo'n specificatie noemen we een _contract_.

![Design by contract](Design_by_contract.svg)

## Test driven development

Test driven development (TDD) is een proces waarbij het schrijven van de code geleidt wordt door de tests. De tests worden eerst geschreven, en pas daarna wordt de code geïmplementeerd.

1. Add a test and watch it fail
2. Write code until the tests are green
3. Refactor code

Repeat as many times as necessary.

Meer uitgebreid:

1. Add a [little] test
2. Run all tests and watch it fail
3. Make a little change
4. Run the tests and succeed
5. Refactor to remove duplication

### Isolated test

Tests mogen elkaar **nooit** beïnvloeden.
Ze moeten elkaar volledig [kunnen] negeren.
