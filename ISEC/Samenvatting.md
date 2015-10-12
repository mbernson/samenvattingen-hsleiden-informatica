% Samenvatting ISEC
% Mathijs Bernson

# Samenvatting ISEC

## Informatie

* Studiepunten: 3 ECTS
* Studiebelasting: 84 SBU
* Modulecode: ISEC

## Literatuur

* William Stallings, 2010. Network security essentials, fourth edition. Uitgever: Pearson, ISBN 978-0-13-706792-3.
	* Hoofdstukken 1, 2.1, 2.2, 2.4, 3.1, 3.4, 3.6, 4.2, 8, 9, 10 en 11.
* Computernetwerken, een top-down benadering (Kurose en Ross) *niet verplicht*
* Slides

## Leerdoelen

Voor ISEC moet je 

## Onderwerpen

De begrippen die je moet kennen voor dit vak zijn onder andere:

* Network Security, CIA (confidentiality,integrity, availability)
* Authentication, Accountability,Non Repudiation
* Threats, Attacks,Security Services,Security Mechanisms,
* Security Policies
* Network Aspects, OSI-TCPIP Security, Bandwidth, Channel Capacity
* Error Detection and Correction Coding, Hash Coding
* Shannons Theorems on Capacity, Source Coding, Huffmann Coding
* Parity Checking, Checksums, Cyclic Redundancy Coding
* History Cryptography, Caesar codes (intro modular arithmetic)
* One Time Pad Cryptography.
* Cryptoanalysis, Relative Frequency Attack, Vigniere coding.
* Modern Symmetric Key Cryptography The DES standard
* Modern Asymmetric Key Cryptography RSA , Gebruik Priem Getallen
* Demilitarized zones, Firewalls, Virtual Private Networks, Intrusion Detection
* Authentication protocols (Kerberos). Digital Signatures ,Password Strength, Pretty Good Privacy PGP

Technieken:

* De verschillen tussen symmetrische en asymmetrische encryptie beschrijven
* De stappen bij Kerberos authenticatie beschrijven en aangeven welke beveiligingsdoeleinden door de verschillende stappen worden geleverd
* De stappen bij Public Key Encryptie beschrijven
* De stappen bij Private Key Encryptie beschrijven
* De verschillende typen en de werking van firewalls beschrijven
* De functie en werking van een Demilitarized Zone (DMZ) beschrijven
* De functie en werking van een Virtual Private Network (VPN) 

Behandeld worden de onderwerpen beveiligingsbeleid, beveiligingsrisico’s, internetdiensten, firewalls, DMZ, VPN, error detection en correction, symmetrische / asymmetrische / public key encryptie, crypto-analyse, intrusion detection, logische en fysieke beveiliging, authenticatie, Kerberos, packet filtering.

## Toets tips

Neem een (wetenschappelijke) rekenmachine mee! Deze zul je nodig hebben voor de berekeningen.
**Let op**: een **grafische rekenmachine** is niet toegestaan.

## Inhoud

* [Security concepts](#security-concepts)
	* [CIA triad](#cia-triad)
	* [Threats](#threats)
	* [Attack](#attack)
	* [Soorten attacks](#soorten-attacks)
		* [Passive attack](#passive-attack)
			* [Interception](#interception)
			* [Traffic analysis](#traffic-analysis)
		* [Active attack](#active-attack)
			* [Replay](#replay)
			* [Modification](#modification)
			* [Denial of service](#denial-of-service)
	* [X.800 security services](#x.800-security-services)
	* [Level of impact](#level-of-impact)
* [OSI TCP/IP](#osi-tcpip)
	* [Information theory](#information-theory)
		* [Channel capacity, bandwith](#channel-capacity-bandwith)
		* [Source coding, compression](#source-coding-compression)
		* [Channel coding](#channel-coding)
* [Encryptie](#encryptie)
	* [Terminologie](#terminologie)
	* [Symmetrisch vs. asymmetrisch](#symmetrisch-vs.-asymmetrisch)
		* [Symmetrisch](#symmetrisch)
		* [Asymmetrisch](#asymmetrisch)
	* [Algoritmen](#algoritmen)
		* [DES](#des)
		* [3DES](#des-1)
		* [AES](#aes)
		* [Stream cipher vs. block cipher](#stream-cipher-vs.-block-cipher)
	* [Feistel cipher structuur](#feistel-cipher-structuur)
	* [Public key encryptie](#public-key-encryptie)
		* [Diffie Helman key exchange](#diffie-helman-key-exchange)

## Security concepts

Technologie op zichzelf is onvoldoende om goede beveiliging te kunnen bereiken.
Security is een combinatie van technologie, proces en gedrag. (En beleid/policies?)

> Information security = network security + computer security

### CIA triad

* **Confidentiality** dekt twee concepten:
	* Data confidentiality: privé/geheime informatie is niet beschikbaar voor ongeautoriseerde personen.
	* Privacy: personen hebben controle/invloed over welke informatie over hen wordt verzameld en opgeslagen.
* **Integrity** dekt twee concepten:
	* Data integrity: informatie en programma's worden alleen op een geautoriseerde manier gewijzigd.
	* System integrity: een systeem werkt op de juiste manier zonder ongeautoriseerde manipulaties daaraan (opzettelijk of niet).
* **Availability**
	* Systeem werkt en reageert op tijd, service is beschikbaar voor geautoriseerde gebruikers.

Authentication, accountability, non-repudiation

Set van acties in **technologie**, **proces** en **gedrag** behouden *confidentiality*, *integrity* en *availability* op een **acceptabel** niveau.
Wat "acceptabel" inhoudt, verschilt per situatie of doelgroep.

### Threats

Gebruik maken van een *vulnerability* (zwakte), om security te doorbreken en schade te veroorzaken.

> A possible danger that might exploit a vulnerability given a Circumstance, Capability, action, or event to breach security and cause harm

### Attack

Een aanval die resulteert van een threat.

> An assault on system security that derives from a threat

### Soorten attacks

We onderscheiden **passieve** en **actieve** aanvallen.
Een passieve aanval verandert niks aan systeem *resources*.
Een actieve aanval doet dit wel.

Passieve aanvallen zijn moeilijk om te detecteren, maar er zijn manieren om hun success te **voorkomen**.
Het is moeilijk om actieve aanvallen te voorkomen, omdat er teveel mogelijke fysieke, software en netwerk kwetsbaarheden zijn. Bij actieve aanvallen ligt de nadruk op het **detecteren**.

#### Passive attack

Passieve aanvallen omvatten het aftappen/afluisteren van communicatie zonder deze te veranderen. Het doel is om informatie te verkrijgen.

##### Interception



##### Traffic analysis

#### Active attack

Een actieve aanval omvat het aanpassen van de data stroom of het namaken van een legitieme datastroom.

##### Replay

Data wordt met op een passieve manier afgevangen, en later opnieuw verzonden om een ongeautoriseerd effect te behalen.

##### Modification

Deel van een legitiem bericht wordt veranderd om een ongeautoriseerd effect te behalen.

##### Denial of service

Het normale gebruik van een communicatiemiddel blokkeren, bijvoorbeeld door het te overladen met berichten.

### X.800 security services

* Authenticatie
	* De garantie dat een communicerende eniteit is wie het zegt dat het is
* Toegangscontrole (access control)

TODO

### Level of impact

## OSI TCP/IP

### Information theory

#### Channel capacity, bandwith

#### Source coding, compression

#### Channel coding

## Encryptie

Er worden twee soorten encryptie behandeld: [**symmetrische encryptie**](#symmetrische-encryptie) en [**public-key encryptie**](#public-key-encryptie).

### Symmetrischche encryptie

* Symmetrische encryptie bestaat uit 5 delen:
	* **Plaintext** - Het oorspronkelijke bericht
	* **Encryptie algoritme** - Die de plaintext transofrmeert
	* **Geheime sleutel** (secret key) - Dient als invoer voor het algoritme
	* **Ciphertext** - *Scrambled* uitvoer van het algoritme
	* **Decryptie algoritme** - Transformeert de ciphertext

De veiligheid van symmetrische encryptie valt of staat met de **geheimhouding** van de **geheime sleutel**.

Voor het veilig gebruiken van symmetrische encryptie zijn er twee voorwaarden:

1. Er wordt een sterk algoritme gebruikt.
2. De secret key blijft geheim, en wordt op een veilige manier uitgewisseld.

### Public-key encryptie

* Asymmetrisch
* Niet inherent veiliger
* Geen vervanger van symmetrische encryptie vanwege overhead
* Key distributie is (wederom) de bottleneck

### Algoritmen

* DES
	* 3DES (triple DES)
* AES

#### DES

#### 3DES

Doet een encrypt-decrypt-encrypt sequentie zoals:

```
E = Encryptie functie
D = Decryptie functie

K = key
P = plaintext

C = E(K3, D(K2, E(K1, P)))
```

**Voordeel**: Triple-DES kan data decrypten die door single-DES is encrypted.

**Nadeel**: Geen cryptografisch voordeel boven DES.

#### AES

#### Stream cipher vs. block cipher

Een *block cipher* verwerkt de input als een blok, in één keer.

Een *stream cipher* doet dit als een continue stroom van data. 

Het kan een plain text encrypten terwijl de data binnenkomt, byte voor byte.

Een voorbeeld hiervan is RC4.

### Feistel cipher structuur

#### Diffie Helman key exchange

## Parity check

Met een parity bit

## Cyclic Redundancy check (CRC)