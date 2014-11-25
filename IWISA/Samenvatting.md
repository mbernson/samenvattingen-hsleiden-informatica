# IWIS

## Bepalen van de absolute fout

## Uitschrijven van een sommatie

## Recurrente betrekkingen

### Opstellen van een recurrente betrekking

### Gebruik van een verschilrij

### Algemene term van een recurrente betrekking bepalen

Hiermee los je de recurrente betrekking op.

### Afleiden van een recurrente betrekking

## Combinatoriek

### Faculteit

Stel, je hebt 5 letters (van A t/m E). Alle mogelijke rangschikkingen hiervan zijn $5!$ (5 faculteit).

$$ 5! = 5 * 4 * 3 * 2 * 1 $$

Deze manier van rekenen is nuttig als de **volgorde** van de objecten een rol speelt.

### Combinaties

Stel, we hebben nog steeds 5 letters van A t/m E. Hoeveel combinaties van precies 3 letters zijn er mogelijk?

Beschouw de combinatie ${ B, A, E }$ waarbij de volgorde van de objecten geen rol speelt.

Het aantal mogelijke permutaties hiervan is $3!=6$. Iedere andere **combinatie** heeft hetzelfde aantal permutaties.

Het **aantal** verschillende combinaties is te vinden door het aantal permutaties te delen door $3!$.

Dus het antwoord is:

$$ \frac{\frac{5!}{(5-3)!}}{3!} = \frac{5!}{3! * (5-3)!} = \frac{120}{6*2} = 10 $$

### Binomiaalcoëfficiënten

* Gegeven een verzameling met precies $n$ elementen, met $n \ge 0$.
* Hoeveel verschillende deelverzamelingen zijn er met precies $k$ elementen? ( $0 \ge k \ge n$ )
* Antwoord:

$$ \binom{n}{k} = \frac{n!}{k!(n - k)!} $$

Voorbeeld:

$$ \binom{5}{3} = \frac{5!}{3!(5 - 3)!} = \frac{120}{6(5 - 3)} = 10 $$

## Vectoren

Translatie in een gekozen assenstelsel.

Een vector $ 3\brack 5 $ verplaats 3 op de x-as (naar rechts) en 5 op de y-as (omhoog). Het is een vrije vector, dus mag het beginpunt overal zijn.

### Som

$$ \vec{a} + \vec{b} = {a\brack b} + {a\brack b} $$

### Vermenigvuldigen

### Lengte

### Hoek tussen vectoren

$$ \sin \alpha = \frac o s, \cos \alpha = \frac a s, \tan \alpha = \frac o a $$

### Inproduct

Het inproduct van vectoren $ a = a_1 a_2 ... $ en is:

$$ (a, b) = a_1 b_1 + a_2 b_2 $$

### Normaalvector