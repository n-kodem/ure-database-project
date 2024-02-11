CREATE VIEW ValidConcessions AS
SELECT * FROM concession_fuel
UNION ALL
SELECT * FROM concession_other_fuel;
-- Widok zawierający informacje o aktywnych koncesjach.

CREATE VIEW ExpiringConcessions AS
SELECT *
FROM concession_expiry
WHERE datawygasniecia BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 30 DAY);
-- Ten widok wyświetla informacje o koncesjach, które wygasają w ciągu najbliższych 30 dni. Jest to przydatne narzędzie do monitorowania koncesji, które wymagają uwagi lub odnowienia w krótkim okresie czasu.

CREATE VIEW FuelConcessionsWithExciseNumbers AS
SELECT *
FROM concession_fuel
WHERE nrakcyzowy IS NOT NULL;
-- Ten widok wyświetla informacje tylko o koncesjach paliwowych, które posiadają przypisane numery akcyzowe. Może to być przydatne do szybkiego odnalezienia koncesji paliwowych związanych z akcyzą.

CREATE VIEW LocationRelatedConcessions AS
SELECT *
FROM concession_withdrawn
UNION ALL
SELECT *
FROM concession_expiry
WHERE miejscowosc = 'Warszawa';
-- Ten widok zawiera informacje o koncesjach wycofanych oraz koncesjach, które wygasły, ale dotyczą tylko Warszawy.

CREATE VIEW ConcessionsWithActivePromises AS
SELECT c.*, p.*
FROM concession_withdrawn c
JOIN concession_promise p ON c.nip = p.nip
WHERE p.dataod <= CURDATE() AND p.datado >= CURDATE();
-- Ten widok łączy informacje o koncesjach wycofanych z aktywnymi obietnicami dotyczącymi tych koncesji. Wyświetla tylko te koncesje, dla których istnieją aktywne obietnice (czyli obietnice, które są obecnie w okresie ważności).

CREATE VIEW FuelConcessionsWithExpiryDate AS
SELECT *, TIMESTAMPDIFF(DAY, NOW(), datado) AS days_until_expiry
FROM concession_fuel;
-- Ten widok oblicza liczbę dni pozostałych do wygaśnięcia koncesji paliwowych. Jest przydatny do monitorowania terminów ważności koncesji.

CREATE VIEW WithdrawnConcessionsWithNotes AS
SELECT *, CONCAT_WS(' ', nazwa, uwagi) AS full_description
FROM concession_withdrawn;
-- Ten widok łączy nazwę koncesji z uwagami, tworząc pełen opis koncesji wycofanych. Jest przydatny do szybkiego dostępu do informacji o koncesjach wraz z ich dodatkowymi uwagami.

CREATE VIEW FuelConcessionsWithExciseNumber AS
SELECT dkn, nazwa, nrakcyzowy
FROM concession_fuel;
-- Ten widok wyświetla tylko numer akcyzowy oraz inne istotne informacje dla koncesji paliwowych. Może być używany do szybkiego uzyskania dostępu do informacji akcyzowych.
