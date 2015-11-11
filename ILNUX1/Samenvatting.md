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

TODO

[![](Unix_history-simple.svg) Tijdlijn van Unices (klik voor vergroting)](Unix_history-simple.svg)

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

----------------------------
| Runlevel  |    Doel    |
| 0         | Transitie van levels |
| 1, s of S | Single-user mode |
| 2         | Debian multi-user (grafisch) |
| 3         | Fedora/Mandriva/RH multi-user met console login |
| 4         | Ongedefinieerd, of voor eigen gebruik |
| 5         | Fedora/Mandriva/RH multi-user met grafische login |
| 6         | Reboot het systeem (transitie) |
----------------------------

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

Partitioneren van schijven

Partitie tabellen

Mount points?

#### 102.2 Boot manager installeren

Zie [het kopje over bootloaders](#bootloaders).

#### 102.3 Shared libraries

#### Package management

Software onder Linux wordt doorgaans beheerd d.m.v. *package managers*. Deze tools automatiseren de installatie, de-installatie en upgrades van software op het systeem.

Er bestaan twee grote package managers: RPM en Debian package managers.

Bij het begrijpen van package management zijn de volgende begrippen van belang:

* **Packages**: een verzameling bestanden die geïnstalleerd worden op het systeem. Bevat daarnaast metadata over zichzelf.
* **Installed file database**: iedere package manager houdt bij welke bestanden en packages geïnstalleerd zijn in een vorm van een database.
* **Depencendies (afhankelijkheden)**: de package manager houdt bij welke packages van elkaar afhankelijk zijn.
* **Checksums**: er wordt gecontroleerd of de packages en bestanden geldig zijn d.m.v. checksums.
* **Upgrades en de-installatie**: Omdat er een bestandenlijst wordt bijgehouden is het makkelijk om packages te updaten of te de-installeren. Deze handelingen vervangen of verwijderen ieder bestand van de package.
* **Binary package creation**: Je kunt zelf binaries (gecompileerde) packages creëren als je wilt.

##### 102.4 Debian package management

Het basis commando van Debian package management is `dpkg`. De belangrijkste subcommando's zijn:

* `dpgk -i` - installeer package
* `dpgk -r` - verwijder package, maar behoud de configuratie ervan.
* `dpgk -P|--purge` - verwijder package inclusief de configuratie

APT (advanced package tool) is een suite van commando's die met werken met dpkg makkelijker maken. Zo geeft `apt-cache` informatie over de Debian package database.
Het commando `apt-get` lijkt op `yum` bij RedHat distro's. Het is een meta package manager die gemakkelijk packages kan installeren en updaten over het internet of vanaf een CD-ROM.

De belangrijkste apt-get commando's zijn:

* `apt-get update` - Werk de database van beschikbare packages bij
* `apt-get upgrade` - Upgrade alle geïnstalleerde packages naar de nieuwste versie
* `apt-get install [packages]` - Installeer packages
* `apt-get remove [packages]` - Verwijder packages, maar laat configuratie intact
* `apt-get purge [packages]` - Verwijder packages inclusief configuratie

De tools dselect, aptitude, and Synaptic bieden een higher-level interface voor APT.

##### 102.5 RPM en YUM package management

###### RPM - RedHat Package Manager

RPM is door Red Hat ontwikkeld voor hun Linux-distributie. Het wordt inmiddels gebruikt door vele andere distributies.

RPM's package naming conventie is: `packagename-a.b.c-x.arch.rpm`. Daarin staat `a.b.c` voor de versie, `x` voor het buildnummer en `arch` voor de architectuur.

Ieder RPM package zou in theorie werken op een RPM-distributie. Echter kun je last krijgen van de volgende compatibiliteitsproblemen:

* Verschillende distro's gebruiken verschillende versies van RPM
* Sommige packages zijn niet beschikbaar voor bepaalde distributies
* Package namen kunnen verschillen per distributie
* Bestanden in de package kunnen per distributie verschillen
* Packages kunnen afhankelijk zijn van de directory layout van een bepaalde distributie

RPM is het low-level programma om packages te installeren. De belangrijkste commando's zijn:

* Querying and verifying packages:
	* `rpm {-q|--query} [select-options] [query-options]`
	* `rpm {-V|--verify} [select-options] [verify-options]`
* Installing, upgrading and removing packages:
	* `rpm {-i|--install} [install-options] PACKAGE_FILE ...`
	* `rpm {-U|--upgrade} [install-options] PACKAGE_FILE ...`
	* `rpm {-F|--freshen} [install-options] PACKAGE_FILE ...`
	* `rpm {-e|--erase} [--allmatches] [--nodeps] [--noscripts] [--notriggers] [--test] PACKAGE_NAME ...`

###### YUM - Yellowdog updater modified

Yum is een package manager met een hoger niveau van abstractie dan RPM. Het kan automatisch packages en hun afhankelijkheden installeren vanuit *package repositories* over het internet.

De syntax van Yum is `yum [options] [command] [package...]`, en de belangrijkste commando's zijn:

* `yum install` - installeer één of meer package
* `yum update` - update één of meer packages
* `yum check-update` - Controleer of er updates zijn
* `yum upgrade` - Equivalent aan `yum update --obsoletes`
* `yum remove|erase` - Verwijder een package en de dependencies
* `yum list` - Toon package informatie

Oefen de rest zelf!

##### Package managers vergelijking

Debian en RPM zijn incompatibel met elkaar. In 99% van de situaties heb je maar één van deze package managers op je systeem.

### 103 GNU en Unix commands

Core utils?

#### ls, mv, cp, rm, touch, file

Info over en manipulatie van bestanden.

* ls -> directory listing
* mv -> move [source] [target]
* cp -> copy (-r = recursive) [source] [target]
* rm -> remove (-f = force) [target]
* rmdir -> rm -r
* touch -> creëer bestand [target] of update de modified timestamp
* file -> bestands informatie

#### dd

Rauwe (binaire) kopie van- en naar bestanden of devices maken.

#### Compressie

Tar is de meestgebruikte compressiemethode op UNIX/Linux systemen.

##### gzip, gunzip, zcat

TAR ezelsbruggetje:

> tar xzf = eXtract Ze Files

> tar czf = Compress Ze Files

##### xz

(De)compressie van .xz/.lzma bestanden. Syntax is vrijwel hetzelfde als die van gzip.

##### CPIO

Manipuleert en maakt archive bestanden (tar, binary, (old) ASCII, CRC, HPUX).
Het heeft drie modi:

1. Copy-out mode - maakt een archief en kopieert bestanden ernaartoe
2. Copy-in mode - haalt data uit een archief
3. Copy-pass mode - kopieert een directory tree van één plaats naar een ander

#### 103.1 Work on the command line

##### Command line basics

Op Linux zul je veel werken met een command line. Hierbij gebruikt je altijd een programma dat we de **shell** noemen. Het accepteert tekst invoer en geeft je tekst terug.

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

#### $PATH

Pad waarin gezocht wordt naar executables, wanneer je niet het volledige pad naar de executable hebt gegeven.

Volgorde? Aliases?

#### Globbing

Globbing wil zeggen dat een padnaam wordt uitgebreid door de shell. Dit is wat er gebeurt wanneer we bijv. wildcards (*) gebruiken.

We geven bijvoorbeeld het commando `mv -n *.txt` in een map waar `foo.txt`, `bar.txt` en `archive.zip` staan.
De shell breidt dit automatisch uit naar: `mv -n foo.txt bar.txt`. Dit is het daadwerkelijke commando dat uitgevoerd wordt.

#### 103.2 Process text streams using filters

#### 103.3 Basic file management 

#### 103.4 Use streams, pipes and redirects

Streams, pipes and redirects zijn belangrijk om te leren in Linux/UNIX. 

Linux behandelt de input en output van programma's allebei als *streams*. Streams zijn een gestandaardiseerde interface, waarmee de invoer en uitvoer van programma's beheerd en gekoppeld kan worden.

##### stdin, stdout en stderr

De drie belangrijke soorten streams zijn:

1. stdin - standard input
2. stdout - standard output
3. stderr - standard error output

#### Redirection

*Redirection* wil zeggen dat we de input of output ergens anders naartoe sturen. Hiervoor zijn een aantal operators beschikbaar in de shell.

Voorbeelden:

* `psql mijndatabase < dump.sql`
	* Stuur de inhoud van `dump.sql` naar het commando psql.
* `cat >> ~/.ssh/authorized_keys`
	* Stuur de inhoud van het toetsenbord naar het bestand authorized_keys.

#### File combining commands

##### Join

Met het `join` commando kunnen we een relationele join doen op twee tekstbestanden die meerdere kolommen bevatten.

Het commando is echter vrij beperkt; de tekstbestanden moeten allebei op **dezelfde volgorde** staan.

Voorbeeld: `join -1 3 -2 2 cameras.txt lenses.txt`

##### Paste

Dit commando combineert twee bestanden regel voor regel. Hierbij wordt regel 1 uit bestand 1 gevolgd uit regel 1 uit bestand 2, enzovoort.

Use case is bijv. om twee CSV-bestanden te combineren tot één tabel, met alle kolommen uit beide bestanden.

#### 103.5 Create, monitor and kill processes

##### Procesinformatie

Er zijn een aantal commando's om informatie te krijgen over draaiende processen:

* `ps` - Geeft eenmalig een lijst met draaiende processen (volgens de gegeven opties)
* `top` - Geeft een procesoverzicht dat voortdurend ververst wordt met een instelbare interval.
* `htop` - Hetzelfde als `top`, maar met mooie kleurtjes.

##### Job control

Binnen onze shell kunnen we meerdere processen beheren. Met ctrl-z stuur je een signaal naar de shell om het proces op de voorgrond te *pauzeren* (suspend). Hierdoor kunnen we andere dingen doen.

Met het commando `jobs` krijg je een overzicht van alle processen in de shell. Ieder proces is genummerd, beginnend bij 1. Let op: deze nummering **staat los** van de PIDs.

Met `fg [number]` roep je een job naar de voorgrond, en hervat deze indien nodig. `bg [number]` laat de job doorlopen in de achtergrond als deze gepauzeerd was.

Een programma kan ook direct naar de achtergrond worden gestuurd door een *&* (ampersand) achter het commando te zetten.

##### Signals

<img src="Kill_Linux.jpg" alt="Process killing" style="width: 35%; float: right; border: 0;">

Processen in de kernel kun je manipuleren door de kernel er **signalen** naartoe te laten sturen. Er zijn rond de 64 signalen gedefinieerd. Je kunt zien welke signalen jouw systeem ondersteunt door `kill -l` uit te voeren.

Een aantal van de belangrijkste signalen zijn:

* SIGINT (interrupt) - Stop op een nette manier
* SIGKILL - Forceer stop, zonder cleanup
* SIGQUIT - Eindig het proces en geef een *core dump*
* SIGTSTP - Pauzeer executie
* SIGSEGV - Krijgt het proces als het ongeldig virtueel geheugen probeert te benaderen
* SIGTERM - Eindig het proces, bijna gelijk aan SIGINT

Sommige toetscombinaties in de shell sturen ook een signaal naar het proces dat op de voorgrond draait:

* Ctrl-C stuurt een `SIGINT`
* Ctrl-Z stuurt een `SIGTSTP`
* Ctrl-\ stuurt een `SIGQUIT`

Met het commando `kill` kunnen we een signaal naar één of meer processen sturen. Dit commando heeft de volgende vorm: `kill [options] <pid> [...]`.

Het `killall` commando is een variant op het `kill` commando. Deze killt processen op basis van hun naam i.p.v. hun PID. **Let op**: Op sommige niet-Linux systemen zorgt het `killall` commando ervoor dat **alle processen** onder de huidige gebruiker gekilld worden. Dus RTFM.

**Tip**: lees het artikel [The TTY demystified](http://www.linusakesson.net/programming/tty/) door Linus Akesson voor diepte informatie over dit onderwerp!

#### 103.6 Modify execution priorities

Ieder proces in Linux/UNIX krijgt een prioriteit toegewezen. Aan de hand hiervan bepaalt de kernel hoeveel CPU-tijd ieder proces krijgt. Deze prioriteit is een heel getal tussen -20 en 19.
Standaard is deze 0. De CPU-prioriteit in Linux/UNIX wordt ook wel *nice[ness]* genoemd.

**Let op**: Hoe lager het getal, hoe hoger de prioriteit.

Met de commando's `nice` en `renice` bepaal je wat voor prioriteit een proces heeft. `nice` start een proces met een gegeven prioriteit, en `renice` stelt de prioriteit van een lopend proces bij.

Voorbeeldjes:

* `nice -n priority command`
* `renice priority [[-p] pids] [[-g] pgrps] [[-u] users]`

#### 103.7 Regular expressions

TODO

#### 103.8 vi (en vim)

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

fsck

#### 104.3 Mounting and unmounting

mount umount

#### 104.4 Disk quotas

#### 104.5 Permissions and ownership

#### 104.6 Hard links and symbolic links

Al een beetje behandeld

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

## Verklarende woordenlijst

* RTFM - Read the f*cking manpage/manual

## Bronnen

* [LPI exam 101: detailed objectives](http://www.lpi.org/linux-certifications/programs/lpic-1/exam-101/)
* [LPI exam 102: detailed objectives](http://www.lpi.org/linux-certifications/programs/lpic-1/exam-102/)

* Boek: *Linux Professional Institute Certification Study Guide (Exams 101 and 102), 3rd Edition*

* [The TTY demystified](http://www.linusakesson.net/programming/tty/) - Linus Akesson

### Citaten

1. [How Linux is built](https://www.youtube.com/watch?v=yVpbFMhOAwE)