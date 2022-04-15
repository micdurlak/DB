--queries

SELECT * FROM seanse WHERE data_seansu = '2021-08-01' AND id_sali IN (75,76,77,78,79,80,81,82,83);

SELECT id_filmu, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego FROM seanse WHERE data_seansu = '2021-08-01' AND id_sali IN (
	SELECT id FROM sale_kinowe WHERE id_kina IN (
		SELECT id FROM kina WHERE miejscowosc = 'Kraków')
);

--first joins

SELECT f.tytul_filmu, f.czas_trwania, s.data_seansu, s.godzina_seansu, s.cena_biletu_normalnego, 
		s.cena_biletu_ulgowego, f.wersja_jezykowa, sk.nazwa_sali, sk.pietro  
FROM seanse s
JOIN filmy f ON s.id_filmu=f.id
JOIN sale_kinowe sk ON sk.id = s.id_sali
WHERE s.data_seansu = '2021-08-01'
	AND sk.id_kina IN (SELECT id FROM kina WHERE nazwa_kina = 'Helio');

SELECT sk.nazwa_sali, sk.pietro, sk.ilosc_miejsc, k.nazwa_kina, k.miejscowosc
FROM sale_kinowe sk INNER JOIN kina k
ON sk.id_kina = k.id;

SELECT sk.id, sk.nazwa_sali, sk.pietro, sk.ilosc_miejsc, k.nazwa_kina, k.miejscowosc
FROM sale_kinowe sk LEFT JOIN kina k
ON sk.id_kina = k.id;

SELECT sk.id, sk.nazwa_sali, sk.pietro, sk.ilosc_miejsc, k.nazwa_kina, k.miejscowosc
FROM sale_kinowe sk FULL OUTER JOIN kina k
ON sk.id_kina = k.id;

--first calculations

SELECT SUM(cena_biletu_normalnego), AVG(cena_biletu_normalnego), MIN(cena_biletu_normalnego), MAX(cena_biletu_normalnego)
FROM seanse
WHERE id_sali < 20;

SELECT k.nazwa_kina, COUNT(sk.id) AS "Ilość sal"
FROM kina k LEFT JOIN sale_kinowe sk ON k.id = sk.id_kina
GROUP BY k.nazwa_kina
ORDER BY "Ilość sal" DESC;

SELECT sk.id, COUNT (skm.id)
FROM sale_kinowe sk LEFT JOIN sale_kinowe_miejsca skm ON sk.id = skm.id_sali
WHERE sk.id_kina = (SELECT id FROM kina WHERE nazwa_kina = 'Helio')
GROUP BY sk.id;




