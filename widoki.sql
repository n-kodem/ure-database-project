SELECT NIP, NazwaFirmy, Adres, Telefon, Email
FROM WykazKRS;


SELECT NazwaFirmy, Udzialowcy
FROM WykazKRS
LEFT JOIN Udzialowcy ON WykazKRS.ID = Udzialowcy.FirmaID
WHERE WykazKRS.NIP = '1234567890';


SELECT NazwaFirmy, IloscPracownikow, SrednieZarobki
FROM WykazKRS
LEFT JOIN DanePracownicze ON WykazKRS.ID = DanePracownicze.FirmaID;
