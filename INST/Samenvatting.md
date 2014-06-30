# Samenvatting INST

## Stof

* Boek Computernetwerken top-down (editie 6) (verplicht)
* Slides

## Modulehandleiding

### Competenties

* Analyseren
* Ontwerpen
* Realiseren

### Kennis hebben over

* HTTP
* Proxy's
* SMTP
* Datatransport stappen
* TCP/UDP
* IP
	* ipv4/ipv6
	* [IP-adressen](#ip-adressen)
* Subnet masks
	* Functioneren
	* Berekenen
* Werking gerouteerd netwerk
* IP-netwerk ontwerpen
* IP-netwerk configureren
* NAT
* Lagen van de TCP/IP netwerkstack
* DHCP-structuur
* DNS-structuur
* Ethernet, CSMA/CD en CSMA/CA
* Draadloze netwerken (IEEE 802.11)
* TCP/IP tools (ipconfig, tracert, ping, nbtstat, route, arp)
* Werking/functie van onderdelen van een netwerk (netwerkkaart, hub, switch, bridge, router)
* 5 lagen van het internet protocol stack

## Inhoud

1. Introductie
2. Applicatieprotocollen
3. Transportprotocollen
4. en 5. internetprotocollen
6. Datalinkprotocollen

## Netwerken

Netwerken is alleen mogelijk als je afspraken maakt over communicatie. Denk hierbij aan afspraken als:

* Welke taal spreken we?
* Hoe controleren we de communicatie?
* Hoe vinden we elkaar?
* Hoe gebruik je het beschikbare medium?
* Hoe regel je toegang tot dit medium?

Deze afspraken worden vastgelegd in **protocollen**. Protocollen definiëren het formaat, volgorde van berichten tussen netwerkeenheden en de acties die genomen worden bij het zenden van specifieke berichten.

## Protocollen

### Elkaar vinden (adressering)

Om elkaar te kunnen vinden (bijvoorbeeld op een netwerk) moet je voldoen aan uniciteit (uniek zijn). Denk bijv. aan een post-adres. Op het internet worden [IP-adressen](#ip-adressen) gebruikt.

### Checken van communicatie

Connection-oriented vs connectionless communicatie.

Door status-informatie uit te wisselen 

### Gebruik van het medium

Ruimte op de link reserveren voor de duur van de communicatiesessie -> _circuit switching_

Ruimte op de link gebruiken zolang dat nodig is -> _packet switching_

### Lagen

Protocollen kun je zien als verschillende, op elkaar gestapelde lagen. Iedere laag is gescheiden (ingekapseld) van de rest. Dit heeft als voordeel dat willekeurige laag verwisseld kan worden zonder dat de andere lagen daar iets van merken. Ook is er minder overhead doordat applicaties gebruik kunnen maken van dezelfde onderliggende protocollen.

### Internetprotocollen en het OSI-model

Gelaagde protocollen

Er zijn meerdere protocolstacks; de _vereenvoudigde_ stack en de OSI-stack.

<table>
<tr><td>Applicatie</td></tr>
<tr><td>Transport</td></tr>
<tr><td>Netwerk</td></tr>
<tr><td>Datalink</td></tr>
<tr><td>Fysiek</td></tr>
</table>

_De vijflaagse internet protocolstack_

<table>
<tr><td>Applicatie</td></tr>
<tr><td>Presentatie</td></tr>
<tr><td>Sessie</td></tr>
<tr><td>Transport</td></tr>
<tr><td>Netwerk</td></tr>
<tr><td>Datalink</td></tr>
<tr><td>Fysiek</td></tr>
</table>

_Zevenlaags OSI-model_

#### Applicatielaag

Op de applicatielaag worden netwerkapplicaties en hun bijbehorende protocollen uitgevoerd. Voorbeelden zijn:

* `http(s)`
* `smtp`
* `ftp`

Met een applicatielaagprotocol wisselt een applicatie op de ene _host_ packets met informatie uit met een applicatie op een andere _host_.
Deze packets worden **berichten** genoemd.

#### Transportlaag

De transportlaag verzorgt het transport van berichten van de applicaties. Er worden maar twee transportlagen gebruikt: **TCP** en **UDP**.
Een packet van de transportlaag noemen we een **segment**.

#### Netwerklaag

Een packet van de netwerk noemen we een **datagram**.

#### Datalinklaag

Een packet van de datalinklaag noemen we een **frame**

#### Fysieke laag

De 