% Samenvatting IAD1
% Mathijs Bernson

# Samenvatting Algoritmen en Datastructuren 1

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: IAD1

## Literatuur

* Titel: Algorithms (4th edition)
* Auteur: Robert Sedgewick
* Co-auteur: Kevin Wayne
* ISBN10 032157351X
* ISBN13 9780321573513

Oud boek: Algorithms and problem solving using Java

## Leerdoelen

De student kan verschillende **algoritmen** implementeren a.d.h.v. praktische beschrijvingen. De student kan de **Orde van algoritmen** bepalen en weet het verschil tussen orde en performance/benchmark test te verwoorden.

De student kent voorbeelden van problemen die zich efficiënt laten oplossen en problemen die binnen **realistische tijd en ruimte** opgelost kunnen worden.

Daarnaast ken de student voorbeelden van problemen die zich enkel in **onrealistische tijd en ruimte** laten oplossen en problemen die partieel- correct of helemaal niet correct oplosbaar zijn.

De student kan parallelle algoritmes ontwerpen en kent de beperkingen op het gebied van de Orde van het algoritme.

## Inhoud

* [Big O](#big-o)
* [P vs. NP](#p-vs.-np)
* [Sorteeralgo's](#sorteeralgos)
	* [Mergesort](#mergesort)
	* [Heapsort](#heapsort)
	* [Bubblesort](#bubblesort)
	* [Quicksort](#quicksort)
* [Zoek algo's](#zoek-algos)
	* [Complexiteit](#complexiteit)
* [Datastructuren](#datastructuren)
	* [Hash table](#hash-table)
	* [Trees](#trees)
		* [Binary tree](#binary-tree)
		* [AVL tree](#avl-tree)
* [Compressie](#compressie)
	* [Huffman](#huffman)
	* [LZW (Lempel-Ziv-Welch)](#lzw-lempel-ziv-welch)
		* [Encoding](#encoding)
		* [Decoding](#decoding)
* [Grafentheorie](#grafentheorie)
* 
## Voorbeeldvragen toets

> Waarom zou je in-place sorting toepassen, en waar wordt dit gebruikt?

Antwoord: in-place sorting hoeft geen nieuwe geheugen allocaties te doen, waardoor het zuiniger is.

> Waarom zou je merge sort ipv quicksort kiezen?

Antwoord: omdat de *best case* van mergesort beter is dan de *worst case* van quicksort.

> Wat is de complexiteit van het volgende code snippet?

## Big O

Geeft de (tijd)complexiteitsgraad van een algoritme aan. Dat wil zeggen hoe het algoritme zich gedraagt naarmate de grootte van het probleem toeneemt.

> Indicatie van hoe de tijd die het algoritme nodig heeft toeneemt naarmate de grootte van de invoer toeneemt.

## P vs. NP

*P = NP* is een belangrijk onopgelost probleem in de informatica. Het stelt dat:

> Problemen die moeilijk op te lossen zijn, ook moeilijk te controleren zijn.

**P** zijn de problemen die in polynomiale tijd opgelost kunnen worden. **NP** zijn problemen waarvan het *antwoord* in polynomiale tijd gecontroleerd kan worden.

## Sorteeralgo's

* [Mergesort](#mergesort)
* [Heapsort](#heapsort)
* [Bubblesort](#bubblesort)
* [Quicksort](#quicksort)

De complexiteit van sorteeralgoritmes is als volgt:

| Algoritme  | Best    | Average | Worst   |
|------------|---------|---------|---------|
| Quicksort  | n log n | n log n | n²      |
| Bubblesort | n       | n²      | n²      |
| Heapsort   | n log n | n log n | n log n |
| Mergesort  | n log n | n log n | n log n |

### Insertion sort

Dit algoritme lijkt op de manier waarop je speelkaarten in je hand sorteert. Je gaat één voor één door de kaarten heen, en zet ze op de juiste plek tussen de reeds gesorteerde kaarten.

In een array in computergeheugen moeten we alle resterende items een plek naar rechts opschuiven om dit te kunnen doen.

```java
void sort(Comparable[] a) {
    for(int i = 1; i < a.length; i++) {
        for(int j = i; j > 0 && a[j] < a[j-1]; j--) {
            exchange(a, j, j-1);
        }
    }
}
```

### Mergesort

Werking: Pak van een array telkens

### Heapsort

TODO

### Bubblesort

Zeer inefficient

### Quicksort

TODO

## Zoek algo's

* [Binary search](#binary-search)

De complexiteit van zoek algo's is als volgt:

| Algoritme     | Best    | Average | Worst   |
|---------------|---------|---------|---------|
| Binary search |         | log n   |         |

## Herkennen van complexiteit

Vaak is van de code af te leiden wat de complexiteit van het geïmplementeerde algoritme is. Dit gaat niet altijd op, maar 

## Datastructuren

### Hash table

Een *hash table* slaat key => value paren op, op een manier waarop deze snel opgevraagd kunnen worden.

De plaats in de interne **array** wordt bepaald door de **key** door een **hash functie** te halen. Het resultaat hiervan is het adres in de array waar de **value** wordt opgeslagen.

Als twee **keys** dezelfde **hashwaarde** hebben, spreken we van een **collision**. Eén mogelijke oplossing hiervoor is **linear probing**, waarbij de waarde verder in de hash wordt geplaatst. Er is ook **quadratic probing** en **double hashing**.

Met **separate chaining** worden er **buckets** in de interne array bijgehouden, waardoor elementen met dezelfde hashwaarde samen in een bucket vallen.

### Trees

#### Binary tree

TODO

#### AVL tree

Georgy Adelson-Velsky and Evgenii Landis' tree, named after the inventors.

## Compressie

We kennen **lossless** en **lossy** compressie algoritmen. Lossless (verlies loos) algoritmen hebben geen kwaliteitsverlies van wat het comprimeert.
Lossy (verlies) algoritmen hebben wel kwaliteitsverlies.

**Lossless**:

* GIF
* MPEG-4
* ZIP
* Huffman
* LZ (Lempel-Ziv)

**Lossy**:

* JPEG
* MPEG-2
* Mp3

### Huffman

TODO, zie isec

### LZW (Lempel-Ziv-Welch)

#### Encoding

```
1    Initialize table with single character strings
2    P = first input character
3    WHILE not end of input stream
4        C = next input character
5        IF P + C is in the string table
6            P = P + C
7        ELSE
8            output the code for P
9		         add P + C to the string table
10           P = C
11   END WHILE
12   output code for P 
```

#### Decoding

```
1    Initialize table with single character strings
2    OLD = first input code
3    output translation of OLD
4    WHILE not end of input stream
5        NEW = next input code
6        IF NEW is not in the string table
7            S = translation of OLD
8            S = S + C
9        ELSE
10           S = translation of NEW
11       output S
12       C = first character of S
13       OLD + C to the string table
14       OLD = NEW
15   END WHILE
```

## Grafentheorie

TODO

# Bronnen

* http://www.kennislink.nl/publicaties/p-np-dat-is-de-vraag
* https://en.wikipedia.org/wiki/P_versus_NP_problem