% Samenvatting ITEST
% Mathijs Bernson

# Samenvatting Software testing

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: ITEST

## Literatuur

* Boek X - ISBN 000000000
* Boek Y - ISBN 000000000
* Slides Z
* [Reader A](http://example.com)

## Leerdoelen

Het leren kennen en beheren van diverse soorten katten.

## Inhoud

* [Foo](#foo)
* [Bar](#bar)
* [Baz](#baz)

## Statisch vs. dynamisch testen

Bij statische tests wordt de code niet uitgevoerd.
In dynamische tests wordt de code wel uitgevoerd, met test data.

## Zeven testprincipes van ISTQP

**Dit leren!**

1. Testing shows the presence of bugs
	* Not their absence!
2. Exhaustive testing is impossible
	* Je kan nooit alles testen.
3. Early testing (is recommended)
	* Eerder testen is beter.
4. Defect clustering
	* Defecten zijn niet gelijkmatig verdeeld.
5. Pesticide paradox
	* Er komen altijd nieuwe soorten bugs.
6. Testing is context dependent
	* Hoe belangrijk is het testen, en wat moet je wel/niet testen?
7. Absence of errors fallacy
	* De afwezigheid van errors kan bedrieglijk zijn.

### 1. Testing shows the presence of bugs

> Program testing can be used to show the presence of bugs, but never to show their absence!

Edsger Dijkstra quote. Je zou eerst moeten denken aan de specificaties, en die hand-in-hand laten gaan met het testen.

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