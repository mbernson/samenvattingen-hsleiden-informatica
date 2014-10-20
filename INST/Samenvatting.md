% Samenvatting INST
% Mathijs Bernson

# Inleiding Netwerkstructuren

## Inhoudsopgave

* [Netwerken](#netwerken)
* [Protocollen](#protocollen)
* [Lagen](#lagen)
	* [Applicatielaag](#applicatielaag)
		* HTTP, FTP, SMTP en DNS
	* [Transportlaag](#transportlaag)
		* [Connection-oriented transport](#connection-oriented-transport) (TCP)
		* [Connectionless transport](#connectionless-transport) (UDP)
	* [Netwerklaag](#netwerklaag)
		* [IP](#ip)
		* [Routing](#routing)
	* [Datalinklaag](#datalinklaag)
	* [Fysieke laag](#fysieke-laag)
* [Tools](#tools)

## Stof

* Boek Computernetwerken top-down (editie 6) (verplicht)
* Slides

## Modulehandleiding

### Competenties

* Analyseren
* Ontwerpen
* Realiseren

-> Van netwerk(structur)en

### Kennis hebben over

* [HTTP](#http)
* Proxy's
* SMTP
* Datatransport stappen
* TCP/UDP
* IP
	* ipv4/ipv6
	* [IP-adressen](#ip-adressen)
* [Subnetmaskers](#subnetmaskers)
	* Hoe ze functioneren
	* Berekenen
* 5 lagen van de internet protocol stack
* Werking gerouteerd netwerk
* IP-netwerk ontwerpen
* IP-netwerk configureren
* NAT
* Lagen van de TCP/IP netwerkstack
* DHCP-structuur
* [DNS-structuur](#dns)
* Ethernet, CSMA/CD en CSMA/CA
* Draadloze netwerken (IEEE 802.11)
* TCP/IP tools (ipconfig, tracert, ping, nbtstat, route, arp)
* Werking/functie van onderdelen van een netwerk (netwerkkaart, hub, switch, bridge, router)

## Lesinhoud

1. Introductie
2. Applicatieprotocollen
3. Transportprotocollen
4. en 5. internetprotocollen
6. Datalinkprotocollen

--------------------------------------

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

TCP is een voorbeeld van _connection-oriented_ communicatie. Dit is betrouwbaar, en kan fouten herstellen bij missende data. Daarbij vraagt het eventueel de data opnieuw aan.

Dit in tegenstelling tot _connectionless_ communicatie, zoals UDP. Het is onbetrouwbaar, en gooit gewoon data over de schutting. Er wordt niet gecontroleerd of de data aankomst.

// Door status-informatie uit te wisselen 

### Gebruik van het medium

Ruimte op de link reserveren voor de duur van de communicatiesessie -> _circuit switching_

Ruimte op de link gebruiken zolang dat nodig is -> _packet switching_

--------------------------------------

## Lagen

Protocollen kun je zien als verschillende, op elkaar gestapelde lagen. Iedere laag is gescheiden (ingekapseld) van de rest. Dit heeft als voordeel dat willekeurige laag verwisseld kan worden zonder dat de andere lagen daar iets van merken. Ook is er minder overhead doordat applicaties gebruik kunnen maken van dezelfde onderliggende protocollen.

Het boek en de rest van deze samenvatting zijn gefocust op deze lagen, en gaan er van boven naar beneden (top-down) doorheen.

### Lagen en het OSI-model

Er zijn meerdere protocolstacks; de _vereenvoudigde_, vijflaagse stack en het zevenlaags OSI-model. Bij INST gebruiken we alleen het vereenvoudigde vijflaagsmodel.

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

--------------------------------------

## Applicatielaag

Op de applicatielaag worden netwerkapplicaties en hun bijbehorende protocollen uitgevoerd. Voorbeelden zijn [`HTTP(s)`](#http), [`SMTP`](#smtp), [`DNS`](#dns) en [`FTP`](#ftp). Al deze protocollen zijn gebouwd bovenop TCP, omdat ze behoefte hebben aan betrouwbare gegevensoverdracht.

Met een applicatielaagprotocol wisselt een applicatie op de ene _host_ packets met informatie uit met een applicatie op een andere _host_.
Deze packets worden **berichten** genoemd.

#### HTTP (HyperText Transfer Protocol)

Is een simpel, tekstgebaseerd protocol. Bestaat uit _requests_ en _responses_, die elk met een header en body verstuurd worden.

#### FTP (File Transfer Protocol)

Een eenvoudig protocol om bestanden mee te kopiëren.

#### SMTP (Simple Message Transfer Protocol)

Bezorgen van e-mail.

#### DNS (Domain Name System)

Koppelt (domein)namen aan IP-adressen. DNS is een gedistribueerde database, die is geïmplementeerd in een hiërarchie van DNS-servers. Er zijn drie hoofdsoorten DNS servers:

* Root DNS servers
	* Weten waar de TLD-servers zijn.
* Top-level-domain (TLD) servers
	* Hoogste domain in de hiërarchie (zoals .com of .nl).
	* Weet waar authenticerende DNS-servers zijn.
* Authenticerende DNS-servers
	* Weten waar de lokale DNS-server zijn, zodat alles bij de juiste plaats terecht komt. (?)

--------------------------------------

## Transportlaag

De transportlaag verzorgt het transport van berichten van de applicaties. Er worden maar twee transportlagen gebruikt: **TCP** en **UDP**.

Een packet van de transportlaag noemen we een **segment**.

### TCP

TCP biedt betrouwbare, _connection oriented_ communicatie tussen applicaties.

#### Three-way handshake

Om een TCP/IP (socket-)verbinding op te stellen wordt er een handshake, bestaande uit drie berichten uitgevoerd. Hiermee onderhandelen de twee computers over de parameters van het TCP netwerk socket voordat er data wordt verstuurd.

#### Beveiliging met SSL/TLS

_Transport Layer Security_ is de opvolger van _Secure Sockets Layer_. Uit gewoonte wordt het meestal nog SSL genoemd.

### UDP

## Multiplexing en demultiplexing

Worden ookwel "muxing" en "demuxing" genoemt. Multiplexing is het combineren van meerdere signalen of streams in één signaal over een _gedeeld medium_. Multiplexing vindt plaats in de transportlaag.

--------------------------------------

## Netwerklaag

De netwerklaag transporteert packets (uit de transportlaag) van een verzendende host naar een ontvangende host. Om dit te doen zijn er twee belangrijke functies: forwarding en routering.

### Forwarding

Wanneer een pakket binnenkomt bij de ingaande link van een router, bepaalt de router naar welke uitgaande link het packet moet worden verzonden.

Elke router heeft een **forwardinstabel**. De router zendt een packet door adhv de waarde van een veld in de header van het packet, en het doorzoekt de forwardingstabel op deze headerwaarde. Vervolgens wordt het packet naar deze waarde verstuurd.

### Routering

De netwerklaag moet het pad bepalen dat de packets moeten volgen om vanaf de zender bij de ontvanger terecht te komen. **Routeringsalgoritmen** worden gebruikt om dit pad te vinden/bepalen.

### IP

IP garandeert **niet** of de pakketjes **bezorgd** worden, en ook **niet** of ze op **tijd/volgorde** aankomen.

#### IP-adressen

Een IP-adres is een 32-bits identificatie voor een host, router, fysieke link, of digitale broodrooster.

#### DHCP

_Dynamic Host Configuration Protocol_. Deelt IP-adressen uit aan apparaten die zich op het netwerk aansluiten.

* Client broadcast _DHCP discover_-bericht
* DHCP-server antwoordt met _DHCP offer_-bericht
* Client verzoekt IP-adres _DHCP request_-bericht
* DHCP server zendt adres _DHCP ACK_-bericht

#### IP-datagramfragmentatie

MTU = Maximum Transmission Unit. Dit is de maximale hoeveelheid gegevens die een datalinklaag-frame kan transporteren.

### Interfaces

Onder een _interface_ vallen de connecties tussen  

#### Subnetmaskers

### Routing

Een packet van de netwerklaag noemen we een **datagram**.

--------------------------------------

## Datalinklaag

* Datalinklaag
	* [Context](#link-layer-context)
	* [Services](#link-layer-services)
		* Flow control
		* Fout detectie/correctie
	* Multiple access
		* CSMA/CD
* Hardware
	* [Hubs](#hubs)
	* [Bridges](#bridges)
	* [Routers](#routers)
	* [Switches](#switches)

### Link layer context

De datalinklaag voorkomt fouten en zorgt voor een betrouwbare bestandsoverdracht. Dit gebeurt met **frames** tussen twee verbonden eenheden. 
Framing kun je ook wel linktoegang noemen. Het verpakt een [datagram](#netwerklaag) in een frame, voegt een header toe en daarna de trailer.

* Het implementeert toegangsmethoden als het medium is gedeeld. 
* Het geeft fysieke adressen in de frame om headers, source en destination te identificeren.

// Een packet van de datalinklaag noemen we dus een **frame**

### Link layer services

De services van de linklayer zijn flow control, error detectie en error correctie.

Onder flow control worden de snelheidsafspraken tussen zender en ontvangers gemaakt. Error detectie zorgt er voor dat de ruis wordt onderdrukt, terwijl Error correctie er voor zorgt dat onvolledige pakketten opnieuw worden verstuurd. 

* Flow control
	* Snelheidsafspraken tussen zender en ontvanger
* Error detectie
	* Errors veroorzaakt door _atennuation_ (ruis, verlies van intensiteit enz.)
	* De ontvanger lost dit op door om herzenden te vragen, of frames te negeren
* Error correctie
	* Ontvanger identificeert en corrigeert bit error(s) zonder aanvraag herzending.
	* Kan precies zien welke bits verkeerd staan.

### MAC protocollen

Er zijn drie klassen mac protocollen: _Channel partitioning_, _Random access_ en het zogenoemde ‚Om de beurt’. _Channel partitioning_ deelt de lijn op in kleinere delen en verdeelt deze. _Random access_ word het meeste gebruikt en staat botsingen toe, maar herstelt deze ook. 

De voordelen van het random access protocol is dat de pakketten in volledige snelheid worden verstuurd, omdat er geen specifieke coördinatie van de pakketten is. Wanneer er twee of meer verzendende host zijn, dan veroorzaakt dit botsingen op de lijn. Het protocol specificeert hoe je botsingen detecteert, en hoe je ervan hersteld, dit kan bijvoorbeeld door middel van vertraagde herzendingen. 

### Carrier Sense Multiple Access / Collision Detection

CSMA staat voor _Carrier Sense Multiple Access_. Dit protocol luistert voordat het zend. Wanneer de lijn onbezet is, dan zend deze het gehele pakket. Wanneer de lijn bezet is, dan wordt er gewacht met het versturen van het pakket. 
Een persistent CSMA probeert meteen met waarschijnlijk van dat de lijn beschikbaar is het pakket te versturen. Non-persistent CSMA doet dit na een random interval. 

In CSMA is het nogsteeds mogelijk om botsingen te krijgen. Wanneer dit plaatsvind, word er tijd verspeeld. De afstand van de pakketen en de prorogatie van de vertraging zijn de belangrijkste oorzaken van de botsingen. Propogatie vertraging betekend dat beide frames elkaar niet ‚horen’.

De CD van CSMA/CD staat voor _Collision detection_. Dit detecteert in korte tijd de botsingen, breekt de zending af en reduceert hierdoor verspilling van de tijd. Het herstelt zich dor middel van persistente of non persistente herzendingen. 
Collision detection is met name makkelijk binnen bedrade netwerken, daar hier de traffic van de pakketten nog enigszins geordend is. 

‚Om de beurt’ mac protocollen zijn bijvoorbeeld Polling als Token passing protocollen. Bij Polling nodigt de master een slaven uit om omstebeurt te zenden. Risico's van dit protocol zijn polling overhead, latentie en single point of failure. 

Bij Token passing controleert de token de volgorde van de ene naar de andere host, door middel van een token message. Hierbij kan helaas token overhead, latentie en eveneens single point of failure ontstaan. 

--------------------------------------

## Fysieke laag

Bits over de draad.

### Hardware

Binnen connectiviteit vallen repeaters en hubs onder de fysieke laag, bridges en switches onder de datalinklaag en routeren onder de netwerklaag.

Het is niet aan te raden om hele grote LANs te gebruiken. Een factor hierin is bijvoorbeeld dat de kabellengte van de netwerkkabels niet groter mogen zijn dan een X aantal meters. Een andere factor is dat er teveel colissions in het netwerk optreden. 

#### Hubs

Hubs herhalen ontvangen bits van één interface, en sturen dit naar de andere interfaces. Een hub kan je in een hiërarchie plaatsen. De voordelen van deze apparaten zijn dat de simpel en goedkoop zijn, ze zijn multi-tier: ze zorgen ervoor dat het lan blijft functioneren wanneer een hub uitvalt, en het vergroot de maximum afstand tussen node pairs (100m per hub). 
Een nadeel van het apparaat is dat het een enkel collision domain is. Daarnaast kan het verschillende ethernet types niet verbinden (geen 10BaseT met 100BaseT).

#### Bridges

Bridges zijn slimmer dan hubs. Ze opereren op ethernet frames, bekijken de frame header en sturen frames selectief door op basis van destination. Een bridge isoleert collision domains aangezien deze frames kan tegenhouden. Wanneer een frame word doorgestuurd, gebruikt de bridge CSMA/CD om toegang te krijgen tot een segment.

De voordelen van bridges zijn dus:

* Het **isoleren** van collision domains
* Het ondersteunen van verschillende ethernet verbindingen
* Ze zijn transparant
	* Wijzigingen aan host LAN adapters zijn niet nodig.

Doordat bridges frames filteren en doorsturen, worden deze LAN-segmenten niet naar andere LANs gestuurd.

Door middel van een eigen tabel houdt het bij welke hosts er bereikt kunnen worden. Hierin staan: Node LAN adress, bridge interface en time stamp. 

Wanneer de destination van een pakket zich binnen het LAN bevind, dan wist die de frame. Anders zoekt hij de host in zijn filter tabel en stuurt het door. 

#### Bridges vs routers

Bridges en routers zijn allebei store-and-forward apparaten. Routers werken op de netwerklaag en bekijken de headers van de netwerklaag. Bridges kijken in de linklaag en kijken dus in de linklaag headers.

Routers vinden hun weg door middel van **routing**tabellen en bijbehorende algoritmes, terwijl bridges hun weg vinden door middel van **filter**tabellen en bijbehorende algoritmes. 

Bridges hebben als voordeel dat de werking simpel is en dat het weinig bandbreedte vereist. Nadelen van de bridges zijn; de topologie zijn beperkt (er moet een spanning tree worden gemaakt), en dat bridges geen bescherming bieden tegen broadast storms (eindeloos broadcasten door een host). 

Routers hebben dus als voordeel dat zij een willekeurige topologie kunnen gebruiken, dat de cycling word beperkt door TTL counters en dat ze firewall bescherming hebben tegen broadcast storms. Nadelen hiervan is dat er geavanceerde kennis voor nodig is (IP adres configuratie), en dat deze meer bandbreedte vragen. 

#### Switches

> If you're having network problems I feel bad for you, son <br />
> I've got 99 problems but a switch ain't one

_~ Jay-Z_

Een switch is niet meer dan een stekkerblok in een stroom netwerk; het maakt meerdere ingangen. Het is een in één kastje gestopt bridged netwerk met 1 computer per netwerksegment.

--------------------------------------

## Proxy

Een proxy is een "tussenstation" waar verker doorheen vloeit. Waartussen dit gebeurt kunnen we indelen in een aantal categorieën:

### Forward proxy

Deze zit tussen een intern netwerk en het internet.

**Voorbeeld**: Een _caching proxy_ kan resources lokaal bewaren, zodat er veel hogere snelheden gehaald worden. Er kan ook informatie door worden gefilterd.

### Open proxy

Werkt van server tot server. Kan gebruikt worden om privacy te besschermen doordat het de oorsprong van verkeer verbergt.

**Voorbeeld**: Open (web-)proxy privacybeschermer. Het is onzichtbaar (voor de andere kant) welke clients er achter de proxy zitten.

### Reverse proxy

Een _reverse proxy_ werkt tegenovergesteld aan een _forward proxy_. Requests komen vanaf het internet binnen, de proxy beantwoord die door resources op te halen van één of meer interne servers.

**Voorbeeld**: Nginx met Unicorn of PHP-FPM. Web-requests komen binnen bij Nginx, deze passt door aan een ander proces, en stuurt de response daarvan terug.

## Tools

* Traceroute
* Ping
* I{p,f}config
* Route
* Arp

### Traceroute

Toont de route die pakketjes volgen via alle _gateways_ naar hun bestemming.

### I{p,f}config

Ifconfig == _InterFace Configuration_