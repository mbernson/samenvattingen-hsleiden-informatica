% Samenvatting ILNUX1
% Mathijs Bernson

## Vakinformatie

<img src="Tux.svg" alt="Tux" style="width: 35%; float: right; border: 0;" />

ILNUX1 is een keuzevak voor Linux, met als doel het behalen van LPIC level 1 Linux certificering. Dit bestaat uit de officiële LPI certificering en een mondeling assessment op de Hogeschool.

## Stappen

1. Leer de stof
2. Haal LPI certifica(a)t(en) bij een examencentrum
3. Haal mondeling assessment op de Hogeschool
4. Ontvang studiepunten! (profit)

## Inhoud

* [Linux intro](#linux-intro)
	* [Leertips](#leertips)
* [LPIC-1](#lpic-1)
	* [101 Systeem architectuur](#systeem-architectuur)
	* [102 Installatie en package management](#installatie-en-package-management)
	* [103 GNU en Unix commands](#gnu-en-unix-commands)
	* [104 Devices, filesystems, fs hierarchy standard](#devices-filesystems-fs-hierarchy-standard)
* [LPIC 102](#lpic-102)
	* [Shell, scripting en data management](#shell-scripting-en-data-management)
	* [Command line basics](#command-line-basics)
	* [GUI's en desktops](#guis-en-desktops)
	* [Administratieve taken](#administratieve-taken)
	* [Essentiële systeemservices](#essentiële-systeemservices)
	* [Netwerk fundamenten](#netwerk-fundamenten)
	* [Security](#security)
* [Bronnen](#bronnen)
	* [Citaten](#citaten)

## Level 1

Bestaat uit LPIC 101 en 102.
Volgens LPI vallen de volgende taken onder *level 1*:

1. Work at the Linux command line
2. Perform easy maintenance tasks: help users, add users to a larger system, backup and restore, shutdown and reboot.
3. Install and configure a workstation (including X windows) and connect it to a LAN, or a standalone PC to the Internet.

## Linux intro

Linux is een OS (operating system) kernel. De kernel is het stuk software dat tussen de hardware en de programma's op een computer in zit.
Met alleen de kernel heb je nog geen volledig OS. Daarom zijn er vele Linux-distributies gebouwd met Linux als kernel. Deze voegen o.a. software toe om het systeem te beheren, software om processen en services te beheren (init systeem), en eventueel een grafische desktop-omgeving.

Omdat het flexibel, open source en pragmatisch is, zijn Linux OS'es uitermate geschikt om netwerken, servers en computersystemen mee te bouwen. Grote hoeveelheden (internet) servers, effectenbeurzen, mobiele telefoons, televisies en embedded devices worden allemaal gebouwd op Linux. [1]

De enige markt waar het Linux niet is gelukt om in door te dringen is die van desktop (en laptop) computers. Hierin zijn Windows en Mac OS nog steeds dominant.

### Linux en Unix

TODO, plaatje erbij!

### Leertips

Ga oefenen! De beste manier om jezelf bekend te maken met Linux is om er veel "vlieguren" mee te maken.

De Linux-distributie die het belangrijkste is voor dit vak is [Debian](https://www.debian.org/index.nl.html). Ik raad aan om deze distributie te installeren op een VM (Virtualbox) of VPS (van TransIP of DigitalOcean) als oefensysteem. Een VM of VPS kent weinig risico; je kunt hem kosteloos weggooien en opnieuw opbouwen als er iets verkeerd gaat.
Het gebruiken van een VPS is ook nog eens leerzaam over hoe het internet, IP, DNS enzovoort werken.

Een andere leuke manier om te oefenen is met de Raspberry Pi. Dit is een kleine, goedkope Linux-computer die ontworpen is voor het onderwijs. Voor €35 koop je een Raspberry Pi, en hiervoor zijn heel veel leuke projecten mogelijk waarmee je veel over Linux leert. Google "raspberry pi projects" o.i.d.

Als je dit hebt opgezet, geef je jezelf concrete doelen om te behalen, zoals:

* Installeer een webserver, en toon mijn eigen (PHP) website.
* Maak gebruikers en een groep voor iedereen in je huishouden, en stel permissies voor hen in.
* Installeer een database en zet hier wat gegevens in.

## LPIC-1

### 101 Systeem architectuur

#### 101.1 Determine and configure hardware settings

Fundamentele hardware kunnen configureren.

##### Firmware

De voornaamste soorten firmware op x86 en x68-64 computers zijn BIOS (basic input output system) en EFI (extensible firmware interface). BIOS is legacy, EFI is de opvolger.

UEFI (unified extensible firmware interface) is in principe 'EFI 2.0'. Tot op de huidige kernel versie op het moment van schrijven (3.5.0) maakt de Linux kernel geen gebruik van UEFI features.

##### IRQ (interrupt request)

Is een event die de CPU verstoort, zodat het event eerst afgehandeld kan worden.
Ieder moederbord heeft een gegeven aantal IRQ toewijzingen. In de oude systsemen waren dit er 16, genummerd van 0 tot 15. Een aantal hardware componenten krijgen zo'n nummer toegewezen, waaronder:

* Toetsenbord
* Floppy disk controller
* Geluidskaart
* PS/2 muis
* Parallelle poort
* Realtime clock

*Zie tabel op pagina 111 van ILNUX boek*

In Linux kunnen we de IRQ toewijzingen verkennen door `/proc/interrupts` uit te lezen, bijvoorbeeld met het `cat` commando.

##### I/O adressen

I/O addressen (ook wel I/O ports) genoemd zijn unieke locaties in het geheugen die gereserveerd zijn voor communicatie tussen de CPU en bepaalde fysieke hardware apparaten.
Net als IRQ's worden deze vaak geassocieerd met specifieke apparaten. Over het algemeen zouden ze niet gedeeld moeten zijn.

Voorbeelden van Linux devices gekoppeld aan I/O adressen zijn: `/dev/ttyS0`, `/dev/lp0` en `/dev/fd0`.

Informatie over de I/O adressen in de kernel kun je verkrijgen door `/proc/ioports` uit te lezen, bijv. met `cat`.

##### DMA adressen

Met *direct memory addressing* (DMA) is communicatie tussen een device en het RAM mogelijk zonder dat de CPU daaraan tepas komt.

##### Coldplug en hotplug

Hotplug devices kun je verwisselen (loskoppelen en aankoppelen) terwijl het systeem aan staat. Bij coldplug devices kan dit alleen wanneer het uit staat.

Bijna alle moderne aansluitingen zijn hotplug. Voorbeelden van hotplug zijn:

* USB
* Ethernet
* Firewire

Voorbeelden van coldplug zijn:

* SATA
* Parallelle poorten
* RS-232
* SCSI
* PCI (-e)

##### Sysfs, d-bus en udev

Sysfs is een virtueel filesystem die gekoppeld is op `/sys`.
Hierin is informatie te vinden over devices die aan het systeem gekoppeld zijn.

D-Bus is virtuele koppelingslaag tussen processen onderling en hardware. Het faciliteert communicatie tussen processen, en verwerkt events die door processen en hardware worden veroorzaakt. Een daarvan is het aansluiten en loskoppelen van hardware.

Udev is verantwoordelijk om het virtuele filesystem `/dev` (eerder behandeld door ons) te onderhouden. Vroeger deed Linux dit met conventionele bestanden. Met udev kan dit dynamisch worden bijgehouden, bijvoorbeeld wanneer drivers worden geladen en ontladen.

##### Kernel modules

Met kernel modules kan ondersteuning voor nieuwe hardware aan de Linux kernel worden toegevoegd. Deze kunnen dynamisch worden ingeladen en ontladen door *root*, om toegang tot een stuk hardware te verschaffen of te ontzeggen.
De kernel modules bevinden zich doorgaans in `/lib/modules`. Met het commando `lsmod` krijg je een overzicht van de modules die actief zijn in je systeem.

Je kunt kernel modules laden met de commando's `insmod` en `modprobe`. Insmod wordt gebruik om een enkele module te activeren. Het vereist dat alle modules waar je van afhankelijk bent al geladen zijn.
Modprobe kijkt echter zelf naar deze afhankelijkheden van de module, en activeert deze automatisch.
Daarom heeft modprobe meestal de voorkeur boven insmod.

Modprobe staat tevens toe om de korte modulenaam te gebruiken i.p.v. het volledige pad naar het modulebestand.

Je verwijdert een module met het commando `rmmod`. Deze accepteert de korte naam van de module, en geen pad naar het bestand.

##### USB devices

De kernel heeft alle low-level USB drivers standaard ingeschakeld. Daarnaast zijn er specifieke drivers voor specifieke USB apparaten.

Met `lsusb` krijgen we informatie over alle USB bussen en daaraan aangesloten apparaten.

Management van USB devices in Linux wordt gedaan met `usbmgr` en `hotplug`. Beiden zorgen voor device-specifieke configuratie.

Usbmgr laadt de nodige modules voor een gegeven USB device.

Hotplug bevat hiernaast een manier om device specifieke scripts uit te voeren, die in `/etc/hotplug/usb` staan. Deze worden geïdentificeerd a.d.h.v. het USB device ID. Zo kan het ervoor zorgen dat de permissies op een USB device automatisch ingesteld worden.

#### 101.2 Boot the system

Hoe het systeem de boot procedure doorloopt. Kennis van boot sequence, bootloaders, init systemen.

* SysV init
* systemd
* Upstart (basis)

##### Bootloaders

Nadat de firmware geladen is, begint de firmware met het uitvoeren van de bootloader. Deze wordt geladen van de eerste sector van de opstartschijf. (MBR of de EFI-systeempartitie)
De bootloader laadt vervolgens de kernel in en geeft de controle hieraan door.

DOS/Windows maken doorgaans gebruik van een secundaire bootloader, die door de primaire bootloader wordt aangeroepen. Deze laadt vervolgens de kernel.

De popluaire Linux bootloaders LILO en GRUB staan echter ook toe om direct een kernel in te laden, zonder een secundaire bootloader.

Er zijn twee versies van GRUB op dit moment: GRUB 2 en GRUB legacy.

GPT vs. MBR **TODO**

###### Installatie van Grub

```
# grub-install /dev/sda
of
# grub-install 'hd(0)'
```

###### Configuratie van Grub

Configuratie van grub legacy staat in `/boot/grub/menu.list`. De configuratie van grub 2 staat in `/boot/grub/grub.cfg`.

De notatie van hardeschijven en partities in grub heeft de vorm van `hd(0,0)`. Hierin is het eerste getal de hardeschijf, en het tweede getal de partitie.

In beide grub's begint het tellen van de schijven bij 0. In grub legacy begint het tellen van de partities bij 0. Bij grub 2 **begint deze echter bij 1**.

Het bijwerken van de configuratie (toevoegen van nieuwe bootable OS partities) kan automatisch met `update-grub` of `grub-mkdonfig > /boot/grub/grub.cfg`.

##### Dmesg

De berichten die de kernel en modules tijdens boot genereren worden opgeslagen in de *kernel ring buffer*. Dit is een plaats voor logs *in memory*, met een beperkte grootte. Na verloop van tijd wordt het begin weer overschreven. Bij iedere boot wordt de buffer gewist.

De locatie van deze buffer is doorgaans `/var/log/dmesg`. De inhoud kan bekeken worden met het commando `dmesg`. Het kan handig zijn om deze in een pager te gooien, dmv `dmesg | less`.

##### Boot proces

Samengevat:

1. Stroom gaat aan, de CPU voert de firmware code uit.
2. De firmware voert zijn taken uit en zoekt de bootloader op.
3. De bootloader neemt controle over van de firmware en laadt de kernel of een chain loader.
4. De kernel neemt het over. Het schakelt devices in, zet mounts op en begint het eerste programma uit te voeren: het init systeem dat standaard op `/sbin/init` staat.
5. Het init systeem krijgt PID 1 en kan `/etc/inittab` lezen. Maar dit verschilt per init systeem.
	* Het init systeem bepaalt welke programma's er verder gestart moeten worden.

##### Init systemen

TODO: https://en.wikipedia.org/wiki/UNIX_System_V#/media/File:Unix_history-simple.svg

In het boek wordt bijna overal van het SysV init systeem gebruik gemaakt. Dit is het traditionele Unix/Linux init systeem dat voortgekomen is uit het SysV Unix OS. Dit verscheen in 1983.

###### Upstart

Upstart doet min of meer hetzelfde als de SysV scripts, maar is ontworpen om beter met moderne *hotplug* hardware om te gaan.

Het wijkt af van SysV omdat het geen `/etc/inittab` en runlevel-specifieke startup scripts meer gebruikt. In plaats daarvan zitten alle configuratiebestanden voor services in `/etc/init`.
Er wordt een nieuw configuratie formaat gebruikt waarin de afhankelijkheden van een service worden genoemd.
Upstart is nog wel compatibel met traditionele runlevel specifieke scripts. Het roept alles in `/etc/rd?.d` aan wanneer dat nodig is.

###### Systemd

Systemd is een nieuwer init systeem dat door een aantal distributies als default gekozen is.
Het is een geïntegreerde daemon op je systeem, die processen parallel kan starten. Hierdoor wordt er een snelheidswinst geboekt bij het opstarten. Daarnaast worden er geen shellscripts meer gebruikt, waardoor systemd geen subshells hoeft op te starten. Hiermee wordt nog meer tijd gewonnen.

Met het commando `systemctl` kun je systemd besturen. De subcommando's hiervoor komen overeen met de oude stijl init scripts. `systemctl start <service>` begint een service, `stop` eindigt het, enzovoort.
Met `systemctl list-units` zie je de status van alle geconfigureerde services.

#### 101.3 Runlevels, boot targets, shutdown/reboot

Weten hoe je runlevels en boot targets wisselt, inclusief single user mode.

Processen beëindigen.

##### Runlevels

Linux gebruikt *runlevels* om te bepalen welke features op het moment beschikbaar zijn.

| Runlevel |    Doel    |
| 0 | Transitie van levels |
| 1, s of S | Single-user mode |
| 2 | Debian multi-user (grafisch) |
| 3 | Fedora/Mandriva/RH multi-user met console login |
| 4 | Ongedefinieerd, of voor eigen gebruik |
| 5 | Fedora/Mandriva/RH multi-user met grafische login |
| 6 | Reboot het systeem (transitie) |

In `/etc/inittab` staan alle services die bij een bepaald runlevel moeten werken.

Met het commando `runlevel` check je wat het huidige runlevel van het systeem is.

Je checkt welke services bij welke runlevels horen met het commando `chkconfig --list`. 

Je wisselt van runlevel met het commando `init <level>`. Dus `init 6` gaat naar runlevel 6, waardoor het systeem zal herstarten.

##### Afsluiten en herstarten

Omdat het handmatig wisselen van runlevels onintuitief is, zijn er extra commando's voor het herstarten, afsluiten enzovoort. Deze commando's zijn `shutdown`, `halt`, `reboot` en `poweroff`.

Shutdown is hiervan het meest veelzijdig, met flags `-h` voor een halt en `-r` voor een reboot. Daarnaast zijn er de flags `-k` om alle gebruikers sessies te beëindigen, en `-c` om een shutdown actie te annuleren.

Het formaat is dus `shutdown [FLAGS] TIME`. Met `shutdown -h now` zal het systeem onmiddelijk afsluiten. I.p.v. `now` kun je `+10` voor bijv. 10 minuten in de toekomst gebruiken.

### 102 Installatie en package management

APT/dpkg, RPM, yum, pacman...

#### 102.1 Hard disk layout

#### 102.2 Boot manager installeren

#### 102.3 Shared libraries

#### 102.4 Debian package management

#### 102.5 RPM en YUM package management

### 103 GNU en Unix commands

Core utils?

#### 103.1 Work on the command line

##### Command line basics

Op Linux zul je vaak werken met een command line. Hierbij gebruikt je altijd een programma dat we de **shell** noemen. Het accepteert tekst invoer en geeft je tekst terug.

##### Verschillende shells

Er zijn een aantal verschillende shells beschikbaar op Linux, waar onder:

* bash (Bourne Again shell)
* csh (C-shell)
* zsh
* ksh (Korn shell)
* sh -> verwijst naar de standaard shell op dit systeem, meestal /bin/bash.

Bash is de leidende shell voor dit vak.

##### Shell basics

De shell kent interne (builtin) commando's en externe commando's. Wanneer je een commando intypt, zoekt de shell naar het programma dat daarmee correspondeert. Als deze al ingebouwd is in de shell, voert hij dit uit. Anders wordt een extern programma gezocht in je `$PATH` variabele.

Je kunt zien welke commando's onderdeel van je shell zijn door `man builtins` uit te voeren.

De path variabele bevat alle paden waarin de shell moet zoeken naar het gegeven programma, gescheiden door een dubbele punt. De waarde van `$PATH` kan bijvoorbeeld `/home/mathijs/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin` zijn.

Wanneer wij bijv. `rm foo.txt` uitvoeren, zoekt de shell naar het bestand `rm`, beginnend in `/home/mathijs/bin`, daarna in `/usr/local/sbin` enzovoort, net zolang totdat `rm` gevonden is.

Wanneer het programma niet gevonden kan worden vermeldt de shell dit. Als we willen weten welke executable er precies gebruikt wordt voor een gegeven naam kunnen we `which <naam>` uitvoeren. Dit drukt het volledige pad naar de executable af.

##### Environment variables

Je shell kan een groot aantal variabelen bijhouden. Deze noemen we *environment variables*. Deze kunnen in shell configuratiebestanden gedefinieerd worden, en door programma's gebruikt worden.

We kunnen de environment op een paar manieren beheren. Met het commando `env` kunnen we de huidige variabelen inspecteren. `env` maakt het ook mogelijk om een programma of script eenmalig uit te voeren met andere variabelen.

Je kunt variabelen instellen voor de hele sessie door `VARIABELE=waarde` of `export VARIABELE=naam` uit te voeren.

##### Man pages

Verdeeld in sections

1. Executable programs and shell commands
2. System calls provided by the kernel
3. Library calls provided by program libraries
4. Device files (usually stored in /dev)
5. File formats
6. Games
7. Miscellaneous (macro packages, conventions, and so on)
8. System administration commands (programs run mostly or exclusively by root)
9. Kernel routines

##### stdin, stdout en stderr

http://www.linusakesson.net/programming/tty/

#### $PATH

Pad waarin gezocht wordt naar executables, wanneer je niet het volledige pad naar de executable hebt gegeven.

Volgorde? Aliases?



#### 103.2 Process text streams using filters

#### 103.3 Basic file management 

#### 103.4 Use streams, pipes and redirects

#### 103.5 Create, monitor and kill processes

#### 103.6 Modify execution priorities

#### 103.7 Regular expressions

#### 103.8 vi en vim

Vi is een text editor op de command-line. De naam staat voor 'visual' [editor]. De Nederlander Bram Molenaar heeft later 'vim' (vi-improved) geschreven. Deze voegt een heleboel functionaliteit toe bovenop vi, maar de basisprincipes blijven hetzelfde.

**Tip: lees deze tekst en ga daarna oefenen met vi!**

##### Modes

Vi is een zogeheten *modal editor*, d.w.z. dat het verschillende modi heeft waarin je kan werken. De belangrijkste zijn:

* Command mode
	* Bestuurt de editor met toetscommando's
	* Met `escape` keer je altijd terug naar deze mode.
* Insert mode
	* Tekst invoer
	* Met onder meer `i`, `o` en `a` kom je in insert mode.
* Ex mode
	* Geven van 'command line' opdrachten
	* Door `:` (dubbele punt) te typen kom je in ex mode.
* Visual mode
	* Visuele tekst selectie maken
	* Met `v` kom je in visual mode.

##### Open, schrijven en afsluiten

Het commando `vi <bestandsnaam>` start vi. Binnen het programma kun je met `:e` nieuwe bestanden openen of aanmaken. Met `:w` schrijf je een nieuw of bestaand bestand weg naar de schijf. Met `:q` stop je vi.

Ieder commando met een ! erachter voert dat commando geforceerd uit.

##### Navigeren door textbestanden

Navigeren per karakter kan met de pijltjestoetsen, maar in vi worden hier h, j, k, en l voor aanbevolen. Dit is echter de minst efficiënte manier om je cursor te bewegen.

Met w spring je een woord vooruit, met b een woord achteruit.

##### Tekst objecten

Commando's in vi kunnen gecombineerd worden. Zo betekent `dw` 'delete word'. Het wist hij alles totaan het volgende woord. `diw` wist alles in het woord, totaan de spaties ervoor en erna.

##### Zoeken

Tekst doorzoeken kan met `/` en `?`. Slash zoekt vooruit, vraagteken zoekt achteruit.

### 104 Devices, filesystems, fs hierarchy standard

#### 104.1 Partitioning and filesystems

#### 104.2 Filesystem integrity

#### 104.3 Mounting and unmounting

#### 104.4 Disk quotas

#### 104.5 Permissions and ownership

#### 104.6 Hard links and symbolic links

#### 104.7 Find files and place files

## LPIC 102

### Shell, scripting en data management

#### Pipes

**Belangrijk**!

#### Shell configuratie

bashrc, zshrc, profile, configuratiebestanden hoe en wat.

#### Environment variabelen

`env` en `export`

### GUI's en desktops

X-window system.

### Administratieve taken

### Essentiële systeemservices

* Init system?

### Netwerk fundamenten

### Security

## Bronnen

* [LPI exam 101: detailed objectives](http://www.lpi.org/linux-certifications/programs/lpic-1/exam-101/)
* [LPI exam 102: detailed objectives](http://www.lpi.org/linux-certifications/programs/lpic-1/exam-102/)

* Boek: *Linux Professional Institute Certification Study Guide (Exams 101 and 102), 3rd Edition*

* [The TTY demystified](http://www.linusakesson.net/programming/tty/) - Linus Akesson

### Citaten

1. [How Linux is built](https://www.youtube.com/watch?v=yVpbFMhOAwE)