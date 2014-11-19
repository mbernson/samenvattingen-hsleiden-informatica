% Samenvatting IWIS
% Mathijs Bernson

# Wiskunde voor ICT'ers

## Informatie

* Keuzevak, niet verplicht
* Studiepunten: 3 ECTS
* Studiebelasting: ?
* Modulecode: IWIS
* Beoordeling: Schriftelijke toets van 120 minuten. Cijfer moet >= 5.5

## Literatuur

* Moduleboek IWIS, delen A en B

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

## Inhoud

* [Foo](#foo)
* [Bar](#bar)
* [Baz](#baz)

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

## Recurrente betrekkingen

Bij recurrente betrekkingen definiëren we rijen getallen d.m.v. *pattern matching*.

```haskell
f 0 = 0
f 1 = 1
f n = f (n - 1) + f (n - 2)
```

$$
\begin{cases}
b(n) = 3 b(n - 1) + 1, n \ge 2 \\
b(1) = 1\end{cases}
$$

## Combinatoriek

## Intersectieberekeningen

## Numerieke nulpuntsbenadering met bisectie

## Vectoren

### Inproduct

## Binaire en hexadecimale talstelsels