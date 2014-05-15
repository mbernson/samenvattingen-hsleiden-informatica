-- a
select count(*)
	from locatie, afdeling
	where loc_plaats LIKE '%o%'
		or afd_naam LIKE '%o%';
-- Antwoord: 13 (Dertien) √

-- b
-- Antwoord: WHERE √

-- c
select mdw_achternaam
	from medewerker
	join afdeling on afd_nr = mdw_afd_nr 
	where afd_naam = 'Hoofdvestiging'
	limit 1;
-- Antwoord: Bordoloi √

-- d
select mdw_voornaam, count(gez_naam) as aantal_gezinsleden
	from medewerker
	join gezinslid on mdw_sofi_nr = gez_mdw_sofi_nr
	group by mdw_voornaam
	order by aantal_gezinsleden asc
	limit 1;
-- Antwoord: Suzan √

-- e
-- Antwoord: ALTER TABLE √

-- f
select a.mdw_voornaam as manager, count(b.mdw_voornaam) as medewerkers
	from medewerker a, medewerker b
	where b.mdw_mgr_sofi_nr = a.mdw_sofi_nr
	group by a.mdw_voornaam
	order by medewerkers desc
	limit 1;
-- Antwoord: Willem √

-- g
select project.*, afd_naam
	from project
	join afdeling on afd_nr = proj_afd_nr
	where afd_naam = 'Hoofdvestiging'
	limit 1;
-- Antwoord: 20 (Twintig) √

-- h
select mdw_voornaam, sum(opd_uren) as uren
	from medewerker
	join opdracht on mdw_sofi_nr = opd_mdw_sofi_nr
	group by mdw_voornaam
	order by uren asc
	limit 1;
	
select sum(opd_proj_nr)
-- Antwoord: Suzan