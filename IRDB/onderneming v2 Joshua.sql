--   CreeerDatabaseOnderneming.sql
--   Script waarmee de database Onderneming die hoort bij 
--   het boek van Bordoloi/Bock -- SQL voor Oracle -- wordt gemaakt.

--   Verwijder eerst alle eventueel aanwezige voorwaarden en tabellen 
--   zodat de te maken database 'schoon' is.

 ALTER TABLE afdeling
	 DROP CONSTRAINT fk_afd_mdw;
 DROP TABLE gezinslid CASCADE;
 DROP TABLE opdracht CASCADE;
 DROP TABLE medewerker CASCADE;
 DROP TABLE project CASCADE;
 DROP TABLE locatie CASCADE;
 DROP TABLE afdeling CASCADE;

--   De tabellen worden gecreeerd

--   Creeer de tabel afdeling
CREATE TABLE afdeling (
    afd_nr                  INTEGER
        CONSTRAINT pk_afdeling PRIMARY KEY,
    afd_naam                VARCHAR(20)
        CONSTRAINT nn_afd_naam NOT NULL,
    afd_mgr_sofi_nr         CHAR(9),
    afd_mgr_start_datum     DATE
);

--   Creeer de tabel locatie
CREATE TABLE locatie (
    loc_afd_nr             INTEGER, 
    loc_plaats             VARCHAR(20),
        CONSTRAINT pk_locatie 
            PRIMARY KEY (loc_afd_nr, loc_plaats),
        CONSTRAINT fk_loc_afd_nr 
            FOREIGN KEY (loc_afd_nr) REFERENCES afdeling
) ;
  
--   Creeer de tabel project
CREATE TABLE project (
    proj_nr                 INTEGER 
        CONSTRAINT pk_project PRIMARY KEY,
    proj_naam               VARCHAR(25) 
        CONSTRAINT nn_proj_naam NOT NULL,
    proj_locatie            VARCHAR(25),
    proj_afd_nr             INTEGER,
        CONSTRAINT fk_proj_afd_nr FOREIGN KEY (proj_afd_nr)
            REFERENCES afdeling
);

--   Creeer de tabel medewerker  
CREATE TABLE medewerker (
    mdw_sofi_nr             CHAR(9)
        CONSTRAINT pk_medewerker PRIMARY KEY,
    mdw_achternaam          VARCHAR(25)
        CONSTRAINT nn_mdw_achternaam NOT NULL,
    mdw_voornaam            VARCHAR(25)
        CONSTRAINT nn_mdw_voornaam NOT NULL,
    mdw_tussenvoegsel       VARCHAR(25),
    mdw_adres               VARCHAR(50),
    mdw_plaats              VARCHAR(25), 
    mdw_provincie           CHAR(2), 
    mdw_postcode            VARCHAR(7),
    mdw_geb_datum           DATE, 
    mdw_salaris             NUMERIC(7,2) 
        CONSTRAINT ck_mdw_salaris  
            CHECK (mdw_salaris <= 85000),
    mdw_parkeerplaats       INTEGER
        CONSTRAINT un_mdw_parkeerplaats UNIQUE,
    mdw_geslacht            CHAR(1),
    mdw_afd_nr              INTEGER,
    mdw_mgr_sofi_nr         CHAR(9),
        CONSTRAINT fk_mdw_afd FOREIGN KEY (mdw_afd_nr)
            REFERENCES afdeling
                ON DELETE SET NULL,
        CONSTRAINT fk_mdw_mgr_sofi_nr FOREIGN KEY (mdw_mgr_sofi_nr)
            REFERENCES medewerker
	        ON DELETE SET NULL
) ;
  
--   Creeer de tabel opdracht
CREATE TABLE opdracht (
    opd_mdw_sofi_nr         CHAR(9),
    opd_proj_nr             INTEGER, 
    opd_uren                NUMERIC(5,1), 
        CONSTRAINT pk_opdracht 
            PRIMARY KEY (opd_mdw_sofi_nr, opd_proj_nr),
        CONSTRAINT fk_opd_mdw 
            FOREIGN KEY (opd_mdw_sofi_nr) REFERENCES medewerker
                ON DELETE CASCADE, 
        CONSTRAINT fk_opd_proj_nr
            FOREIGN KEY (opd_proj_nr) REFERENCES project
                ON DELETE CASCADE
) ;
  
--   Creeer de tabel gezinslid
CREATE TABLE gezinslid (
    gez_mdw_sofi_nr         CHAR(9), 
    gez_naam                VARCHAR(50), 
    gez_geslacht            CHAR(1),
    gez_geb_datum           DATE,
    gez_relatie             VARCHAR(10),
        CONSTRAINT pk_gezinslid 
            PRIMARY KEY (gez_mdw_sofi_nr, gez_naam),
        CONSTRAINT fk_gez_mdw_sofi_nr  
            FOREIGN KEY (gez_mdw_sofi_nr) REFERENCES medewerker
                ON DELETE CASCADE
) ;
  
--   Voeg een vreemde sleutelvoorwaarde toe tussen de tabellen afdeling 
--   en medewerker.
ALTER TABLE afdeling ADD CONSTRAINT fk_afd_mdw  
    FOREIGN KEY (afd_mgr_sofi_nr)  
        REFERENCES medewerker (mdw_sofi_nr);

--   DE TABELLEN VULLEN MET GEGEVENS

--   Rijen van de tabel afdeling.  Het SOFI-nummer van de afdelingsmanager 
--   en de datum van indiensttreding zijn null.
INSERT INTO afdeling VALUES (7, 'Productie', NULL, NULL );
INSERT INTO afdeling VALUES (3, 'Administratie', NULL, NULL);
INSERT INTO afdeling VALUES (1, 'Hoofdvestiging', NULL, NULL );

--   Rijen van de tabel locatie.  
INSERT INTO locatie VALUES (1, 'Eindhoven');
INSERT INTO locatie VALUES (3, 'Maastricht');
INSERT INTO locatie VALUES (7, 'Oegstgeest');
INSERT INTO locatie VALUES (7, 'Groningen');
INSERT INTO locatie VALUES (7, 'Eindhoven');
COMMIT;

--   Rijen van de tabel project.
INSERT INTO project VALUES (1, 'Orderverwerking', 'Oegstgeest', 7);
INSERT INTO project VALUES (2, 'Salarisadministratie', 'Groningen', 7);
INSERT INTO project VALUES (3, 'Magazijn', 'Eindhoven', 7);
INSERT INTO project VALUES (10, 'Inventaris', 'Maastricht', 3);
INSERT INTO project VALUES (20, 'Personeelszaken', 'Eindhoven', 1);
INSERT INTO project VALUES (30, 'Debiteuren', 'Maastricht', 3);
COMMIT;

--   Rijen van de tabel medewerker.
INSERT INTO medewerker VALUES ( '999666666', 'Bordoloi', 'Bijoy', NULL, 
    'Zuidelijke Rondweg 12', 'Eindhoven', 'NB', '6202 EK', 
    TO_DATE ('10-11-1967', 'DD-MM-YYYY'), 55000, 1, 'M', 1, NULL );  
INSERT INTO medewerker VALUES ( '999555555', 'Jochems', 'Suzan', 
    NULL, 'Nuthseweg 17', 'Maastricht', 'LI', '9394 LR',
    TO_DATE('20-06-1971', 'DD-MM-YYYY'), 43000, 3, 'V', 
    3, '999666666' ); 
INSERT INTO medewerker VALUES ( '999444444', 'Zuiderweg', 'Willem',
    NULL, 'Lindberghdreef 303', 'Oegstgeest', 'ZH', '2340 RV',  
    TO_DATE('12-08-1975', 'DD-MM-YYYY'), 43000, 32, 'M', 
    7, '999666666' ); 
INSERT INTO medewerker VALUES ( '999887777', 'Muiden', 'Martina',
    'van der', 'Hoofdstraat 14', 'Maarssen', 'UT', '9394 LM',  
    TO_DATE('19-07-1978', 'DD-MM-YYYY'), 25000, 402, 'V', 
    3, '999555555' ); 
INSERT INTO medewerker VALUES( '999222222', 'Amelsvoort', 'Henk', 
    'van', 'Zeestraat 14', 'Maastricht', 'LI', '9394 MK',
    TO_DATE('29-03-1969', 'DD-MM-YYYY'), 25000, 422, 'M', 
    3, '999555555' ); 
INSERT INTO medewerker VALUES ( '999111111', 'Bock', 'Douglas', 
    NULL, 'Monteverdidreef 2', 'Oegstgeest', 'ZH', '6312 CB',
    TO_DATE('01-09-1955', 'DD-MM-YYYY'), 30000, 542, 'M', 
    7, '999444444' ); 
INSERT INTO medewerker VALUES ( '999333333', 'Joosten', 'Dennis',
    NULL, 'Eikenstraat 10', 'Groningen', 'GR', '6623 HK',
    TO_DATE('15-09-1972', 'DD-MM-YYYY'), 38000, 332, 'M', 
    7, '999444444' ); 
INSERT INTO medewerker VALUES ( '999888888', 'Pregers', 'Shanya',
    NULL, 'Overtoomweg 44', 'Eindhoven', 'NB', '6202 MR',
    TO_DATE('31-07-1972', 'DD-MM-YYYY'), 25000, 296, 'V', 
    7, '999444444' ); 
COMMIT;

--   Rijen van de tabel opdracht.
INSERT INTO opdracht VALUES ( '999111111', 1, 31.4);
INSERT INTO opdracht VALUES ( '999111111', 2, 8.5);
INSERT INTO opdracht VALUES ( '999333333', 3, 42.1);
INSERT INTO opdracht VALUES ( '999888888', 1, 21.0);
INSERT INTO opdracht VALUES ( '999888888', 2, 22.0);
INSERT INTO opdracht VALUES ( '999444444', 2, 12.2);
INSERT INTO opdracht VALUES ( '999444444', 3, 10.5);
INSERT INTO opdracht VALUES ( '999444444', 1, NULL);
INSERT INTO opdracht VALUES ( '999444444', 10, 10.1);
INSERT INTO opdracht VALUES ( '999444444', 20, 11.8);
INSERT INTO opdracht VALUES ( '999887777', 30, 30.8);
INSERT INTO opdracht VALUES ( '999887777', 10, 10.2);
INSERT INTO opdracht VALUES ( '999222222', 10, 34.5);
INSERT INTO opdracht VALUES ( '999222222', 30, 5.1);
INSERT INTO opdracht VALUES ( '999555555', 30, 19.2);
INSERT INTO opdracht VALUES ( '999555555', 20, 14.8);
INSERT INTO opdracht VALUES ( '999666666', 20, NULL);
COMMIT;

--   rijen van de tabel gezinslid.
INSERT INTO gezinslid VALUES ( '999444444', 'Josefine', 'V',  
    TO_DATE ('04-05-1996', 'DD-MM-YYYY'), 'DOCHTER');
INSERT INTO gezinslid VALUES ( '999444444', 'Andrew', 'M',  
    TO_DATE('25-10-1998', 'DD-MM-YYYY'), 'ZOON');
INSERT INTO gezinslid VALUES ( '999444444', 'Suzan', 'V', 
    TO_DATE('05-03-1975', 'DD-MM-YYYY'), 'PARTNER');
INSERT INTO gezinslid VALUES ( '999555555', 'Alex', 'M',  
    TO_DATE('29-02-1968', 'DD-MM-YYYY'), 'PARTNER');
INSERT INTO gezinslid VALUES ( '999111111', 'Jos', 'M',  
    TO_DATE('01-01-1978', 'DD-MM-YYYY'), 'ZOON');
INSERT INTO gezinslid VALUES ( '999111111', 'Diana', 'V',  
    TO_DATE ('31-12-1978', 'DD-MM-YYYY'), 'DOCHTER');
INSERT INTO gezinslid VALUES ( '999111111', 'Mary', 'V',  
    TO_DATE('05-05-1957', 'DD-MM-YYYY'), 'PARTNER');
COMMIT;

--   Werk de rijen van de tabel afdeling bij met het SOFI-nummer
--   van de manager en diens datum indiensttreding.
UPDATE afdeling SET afd_mgr_sofi_nr = '999444444', 
    afd_mgr_start_datum = TO_DATE ('22-05-1998', 'DD-MM-YYYY')
    WHERE afd_nr = '7';       
UPDATE afdeling SET afd_mgr_sofi_nr = '999555555', 
    afd_mgr_start_datum = TO_DATE ('01-01-2001', 'DD-MM-YYYY')
    WHERE afd_nr = '3';       
UPDATE afdeling SET afd_mgr_sofi_nr = '999666666', 
    afd_mgr_start_datum = TO_DATE ('19-06-1981', 'DD-MM-YYYY')
    WHERE afd_nr = '1';       
COMMIT;

--   Tel de rijen van de tabel als controle of het script correct werkt.
SELECT COUNT(*) AS "Telling afdeling is 3" FROM afdeling;
SELECT COUNT(*) AS "Telling locatie is 5" FROM locatie;
SELECT COUNT(*) AS "Telling project is 6" FROM project;
SELECT COUNT(*) AS "Telling medewerker is 8" FROM medewerker;
SELECT COUNT(*) AS "Telling opdracht is 17" FROM opdracht;
SELECT COUNT(*) AS "Telling gezinslid is 7" FROM gezinslid;
SELECT COUNT(*) AS "Aantal vrouwen" FROM gezinslid WHERE gez_geslacht = 'V';
SELECT gez_naam Voornaam FROM gezinslid WHERE gez_geslacht = 'V';
SELECT gez_naam AS "Voornaam met een I" FROM gezinslid WHERE gez_geslacht = 'V' AND gez_naam LIKE '%i%';
UPDATE gezinslid SET gez_naam = 'Josafine' WHERE gez_naam = 'Josefine';
SELECT gez_naam AS "Voornaam met een I" FROM gezinslid WHERE gez_geslacht = 'V' AND gez_naam LIKE '%i%';
SELECT mdw_voornaam FROM medewerker ORDER BY mdw_voornaam ASC;
SELECT mdw_voornaam FROM medewerker ORDER BY mdw_voornaam DESC;
SELECT * FROM gezinslid WHERE gez_geslacht = 'V';
-- Klopt niet SELECT * FROM gezinslid HAVING gez_geslacht = 'V';
 SELECT gez_mdw_sofi_nr FROM gezinslid GROUP BY gez_mdw_sofi_nr HAVING gez_mdw_sofi_nr = '999111111';

-- Cartesisch product (records t1 * records t2)
-- Joins

SELECT COUNT(*) FROM medewerker, gezinslid;
SELECT mdw_voornaam, gez_naam FROM gezinslid, medewerker;
SELECT mdw_voornaam, mdw_sofi_nr, gez_naam, gez_mdw_sofi_nr FROM medewerker, gezinslid WHERE mdw_voornaam = 'Douglas';
SELECT mdw_voornaam, mdw_sofi_nr, gez_naam, gez_mdw_sofi_nr FROM medewerker, gezinslid WHERE mdw_sofi_nr = gez_mdw_sofi_nr;
SELECT mdw_voornaam, mdw_sofi_nr, gez_naam, gez_mdw_sofi_nr FROM medewerker, gezinslid WHERE mdw_sofi_nr = gez_mdw_sofi_nr AND gez_naam LIKE '%J%';

-- 15-01-2014

SELECT * FROM medewerker WHERE mdw_voornaam LIKE'___n%' ORDER BY mdw_voornaam
SELECT t1.mdw_voornaam Medewerkernaam, t2.mdw_voornaam Manager FROM medewerker t1, medewerker t2 WHERE t1.mdw_mgr_sofi_nr = t2.mdw_sofi_nr

SELECT t1.mdw_voornaam Medewerkernaam, t2.mdw_voornaam Manager FROM medewerker t1, medewerker t2 WHERE t1.mdw_mgr_sofi_nr = t2.mdw_sofi_nr

SELECT * FROM medewerker

SELECT mdw_voornaam, mdw_salaris FROM medewerker WHERE mdw__salaris > '25000' AND mdw_sofi_nr NOT IN (SELECT gez_mdw_sofi_nr FROM gezinslid GROUP BY gez_mdw_sofi_nr

SELECT * FROM locatie, afdeling WHERE afd_naam LIKE '%O%' OR loc_plaats LIKE '%O%'
SELECT * FROM medewerker

SELECT mdw_voornaam, COUNT(mdw_voornaam) FROM medewerker, gezinslid WHERE mdw_sofi_nr = gez_mdw_sofi_nr GROUP BY mdw_voornaam

SELECT t2.mdw_voornaam, Count(t1.mdw_voornaam) FROM medewerker t1, medewerker t2 WHERE t1.mdw_mgr_sofi_nr = t2.mdw_sofi_nr GROUP BY t2.mdw_voornaam

SELECT * FROM project
SELECT * FROM afdeling
SELECT * FROM locatie
SELECT proj_nr FROM project WHERE proj_afd_nr = (SELECT afd_nr FROM afdeling WHERE afd_naam = 'Hoofdvestiging')

SELECT mdw_voornaam

--   Einde van het script                                          
