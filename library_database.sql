-- ====================================================================
-- DATABASE: biblioteka
-- Complete MySQL script: Database, Tables, Data, and Queries 1-20
-- ====================================================================

DROP DATABASE IF EXISTS biblioteka;
CREATE DATABASE biblioteka;
USE biblioteka;

-- --------------------------------------------------------------------
-- 1. TABLE CREATION
-- --------------------------------------------------------------------

CREATE TABLE Stanowiska(
    Id_stanowisko INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nazwa VARCHAR(40)
);

CREATE TABLE Pracownicy(
    Id_pracownika INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nazwisko VARCHAR(50),
    Imie VARCHAR(40),
    Id_stanowisko INT,
    Miasto VARCHAR(30),
    Data_zatrudnienia DATE,
    wynagrodzenie DECIMAL(10,2),
    FOREIGN KEY FK_STANOW_PRACOW (Id_stanowisko) REFERENCES Stanowiska (Id_stanowisko)
);

CREATE TABLE Dzialy(
    Id_dzial INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nazwa VARCHAR(40)
);

CREATE TABLE Ksiazki(
    Sygnatura INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Tytul VARCHAR(100),
    Nazwisko VARCHAR(50),
    Imie VARCHAR(40),
    Wydawnictwo VARCHAR(40),
    Miejsce_wyd VARCHAR(40),
    Rok_wyd INT,
    Objetosc_ks INT,
    Cena DECIMAL(10,2),
    Id_dzial INT,
    FOREIGN KEY FK_DZIALY_KSIAZKI (Id_dzial) REFERENCES Dzialy (Id_dzial)
);

CREATE TABLE Czytelnicy(
    Nr_czytelnika INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nazwisko VARCHAR(35),
    Imie VARCHAR(15),
    Data_ur DATE,
    Ulica VARCHAR(40),
    Kod INT,
    Miasto VARCHAR(40),
    Data_zapisania DATE,
    Data_skreslenia DATE,
    Nr_legitymacji INT,
    Funkcja ENUM('PD','S'),
    Plec ENUM('K','M')
);

CREATE TABLE Wypozyczenia(
    Nr_transakcji INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Sygnatura INT NOT NULL,
    Id_pracownika INT NOT NULL,
    Nr_czytelnika INT NOT NULL,
    Data_wypozyczenia DATE NOT NULL,
    Data_zwrotu DATE,
    FOREIGN KEY FK_PRACOW_WYPOZ (Id_pracownika) REFERENCES Pracownicy (Id_pracownika),
    FOREIGN KEY FK_WYPOZ_KSIAZKI (Sygnatura) REFERENCES Ksiazki (Sygnatura),
    FOREIGN KEY FK_CZYT_WYPOZ (Nr_czytelnika) REFERENCES Czytelnicy (Nr_czytelnika)
);

-- --------------------------------------------------------------------
-- 2. DATA INSERTION
-- --------------------------------------------------------------------

-- Stanowiska
INSERT INTO Stanowiska VALUES (null, 'Bibliotekarz');
INSERT INTO Stanowiska VALUES (null, 'Ksiegowy');
INSERT INTO Stanowiska VALUES (null, 'Kierownik');
INSERT INTO Stanowiska VALUES (null, 'Dyrektor');
INSERT INTO Stanowiska VALUES (null, 'Konserwator');

-- Pracownicy
INSERT INTO Pracownicy VALUES (null, 'Kowalczuk', 'Jan', 1, 'Lublin', '2007-05-05', 1700);
INSERT INTO Pracownicy VALUES (null, 'Czuj', 'Krystyna', 2, 'Lublin', '2006-04-02', 2850);
INSERT INTO Pracownicy VALUES (null, 'Brzeski', 'Mateusz', 3, 'Lublin', '2006-05-07', 2900);
INSERT INTO Pracownicy VALUES (null, 'Darecki', 'Antoni', 4, 'Lublin', '2007-05-28', 2700);
INSERT INTO Pracownicy VALUES (null, 'Molek', 'Anna', 5, 'Lublin', '2008-09-11', 1200);
INSERT INTO Pracownicy VALUES (null, 'Potepa', 'Krzysztof', 1, 'Lublin', '2000-07-24', 9000);
INSERT INTO Pracownicy VALUES (null, 'Potepa', 'Wojciech', 1, 'Warszawa', '2008-08-02', 1900);
INSERT INTO Pracownicy VALUES (null, 'Tomaszewki', 'Radoslaw', 1, 'Lublin', '2005-12-02', 2100);
INSERT INTO Pracownicy VALUES (null, 'Ignatowicz', 'Emilia', 1, 'Warszawa', '2000-07-24', 2000);
INSERT INTO Pracownicy VALUES (null, 'Potepa', 'Mariusz', 1, 'Lublin', '2006-02-13', 1700);
INSERT INTO Pracownicy VALUES (null, 'Borowik', 'Lukasz', 1, 'Lublin', '1999-03-14', 1900);
INSERT INTO Pracownicy VALUES (null, 'Malinowski', 'Dariusz', 2, 'Biala Podlaska', '2004-05-24', 3000);
INSERT INTO Pracownicy VALUES (null, 'Zielinska', 'Danuta', 1, 'Biala Podlaska', '1999-05-06', 2000);
INSERT INTO Pracownicy VALUES (null, 'Makarski', 'Tomasz', 1, 'Lublin', '2000-07-07', 2000);
INSERT INTO Pracownicy VALUES (null, 'Zielonka', 'Mateusz', 1, 'Biala Podlaska', '2009-03-14', 2000);

-- Dzialy
INSERT INTO Dzialy VALUES (null, 'Informatyka');
INSERT INTO Dzialy VALUES (null, 'Ekonomia');
INSERT INTO Dzialy VALUES (null, 'Fantastyka');
INSERT INTO Dzialy VALUES (null, 'Historia');
INSERT INTO Dzialy VALUES (null, 'Prawo');
INSERT INTO Dzialy VALUES (null, 'Literatura dla dzieci i modziezy');
INSERT INTO Dzialy VALUES (null, 'Literatura');
INSERT INTO Dzialy VALUES (null, 'Medyczne');
INSERT INTO Dzialy VALUES (null, 'Przyrodnicze');

-- Ksiazki
INSERT INTO Ksiazki VALUES (null, 'Fotografowanie aparatem cyfrowym - samouczek', 'Krzymowski', 'Bogdan', 'Help', 'Warszawa', 2010, 484, 25.90, 1);
INSERT INTO Ksiazki VALUES (null, 'Strategia bekitnego oceanu', 'Mauborgne', 'Rene', 'MT Biznes', 'Warszawa', 2007, 336, 61.90, 2);
INSERT INTO Ksiazki VALUES (null, 'Metro 2033', 'Glukhovsky', 'Dmitry', 'Insignis Media', 'Warszawa', 2010, 592, 37.90, 3);
INSERT INTO Ksiazki VALUES (null, 'Pieko Pacyfiku', 'Sledge', 'Eugene B.', 'Magnum', 'Warszawa', 2010, 328, 37.99, 7);
INSERT INTO Ksiazki VALUES (null, 'Prawo pracy', 'Florek', 'Ludwik', 'C.H. Beck', 'Warszawa', 2009, 370, 42.49, 5);
INSERT INTO Ksiazki VALUES (null, 'Uwarunkowania i plany rozwoju turystyki', 'Mlynarczyk', 'Zygmunt', 'Wydawnictwo Naukowe UAM', 'Warszawa', 2008, 100, 49.00, 2);
INSERT INTO Ksiazki VALUES (null, 'Ekspresja receptorow sterydowych', 'Skrzypczak', 'Maciej', 'Wydawnictwo Naukowe UAM', 'Warszawa', 2008, 121, 115.00, 1);
INSERT INTO Ksiazki VALUES (null, 'Adobe Flash i PHP', 'Keefe', 'Matthew', 'Helion', 'Warszawa', 2010, 496, 71.10, 1);
INSERT INTO Ksiazki VALUES (null, 'Pancerni korsarze Kriegsmarine', 'Kaczmarek', 'Rafal', 'Attyka', 'Wroclaw', 2010, 268, 89.90, 7);
INSERT INTO Ksiazki VALUES (null, 'Kodeks ruchu drogowego', 'Halinski', 'Wieslaw', 'Muza', 'Poznan', 2010, 236, 79.90, 5);
INSERT INTO Ksiazki VALUES (null, 'Pan Tadeusz', 'Mickiewicz', 'Adam', 'PWN', 'Warszawa', 1945, 300, 70.00, 7);
INSERT INTO Ksiazki VALUES (null, 'Programowanie', 'Matejek', 'Roman', 'PWN', 'Warszawa', 1995, 100, 79.00, 1);
INSERT INTO Ksiazki VALUES (null, 'Grafika', 'Malas', 'Grzegorz', 'PWN', 'Warszawa', 1999, 105, 155.00, 1);
INSERT INTO Ksiazki VALUES (null, 'Programowanie obiektowe', 'Matejek', 'Roman', 'PWN', 'Warszawa', 1995, 100, 79.00, 1);
INSERT INTO Ksiazki VALUES (null, '100 najwiekszych osiagniec medycyny', 'Eugene', 'Straus W.', 'Swiat Ksiazki', 'Poznan', 2003, 491, 112.00, 8);
INSERT INTO Ksiazki VALUES (null, 'Atlas Ptakow', 'Hecker', 'Frank', 'RM', 'Krakow', 1999, 189, 72.00, 9);
INSERT INTO Ksiazki VALUES (null, 'Geografia Fizyczna Polski', 'Richling', 'Andrzej', 'PWN', 'Warszawa', 2005, 200, 115.00, 9);
INSERT INTO Ksiazki VALUES (null, 'Podstawy ekonomii', 'Kwiatkowski', 'Eugeniusz', 'PWN', 'Warszawa', 2007, 553, 69.90, 2);

-- Czytelnicy
INSERT INTO Czytelnicy VALUES (null, 'Adamowski', 'Franciszek', '1944-10-09', 'Orzechowa', 21500, 'Biala Podlaska', '2008-01-30', null, 12222, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Kowalski', 'Zygmunt', '1990-07-23', 'AL.1000-lecia', 21500, 'Biala Podlaska', '2007-09-02', null, 12123, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Kola', 'Mariusz', '1979-11-14', 'Moniuszki', 21500, 'Biala Podlaska', '2007-04-12', null, 12730, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Szala', 'Rafal', '1999-01-24', 'Francuska', 21500, 'Biala Podlaska', '2006-05-15', null, 134271, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Borowik', 'Kalina', '1972-09-09', 'Chemska', 21500, 'Biala Podlaska', '2000-12-01', '2007-12-14', 12693, 'S', 'K');
INSERT INTO Czytelnicy VALUES (null, 'Kowalczuk', 'Ziemowit', '1989-04-14', 'Zygmunta Augusta', 21500, 'Biala Podlaska', '2003-04-12', null, 1067, 'PD', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Oledzki', 'Arek', '1979-04-13', 'Dluga', 21500, 'Biala Podlaska', '2010-01-05', null, 1234, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Adamowski', 'Pawel', '1990-11-14', 'Krzywa', 19500, 'Lublin', '2008-04-10', '2009-05-02', 1543, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Borowinska', 'Katarzyna', '1965-06-23', 'Nowa', 19500, 'Goldap', '2006-07-24', '2009-08-15', 1365, 'S', 'K');
INSERT INTO Czytelnicy VALUES (null, 'Doroszuk', 'Marek', '1981-12-14', 'Suwalska', 19500, 'Lublin', '2007-05-12', null, 2543, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Daniluk', 'Aleksandra', '1989-12-28', 'Daleka', 19500, 'Lublin', '2007-10-12', null, 4321, 'S', 'K');
INSERT INTO Czytelnicy VALUES (null, 'Darecki', 'Adam', '1988-11-14', 'Sosnowa', 21500, 'Biala Podlaska', '2006-12-12', null, 1267, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Kowalski', 'Marek', '1983-11-14', 'Jodlowa', 21500, 'Biala Podlaska', '2006-03-12', '2009-03-19', 1268, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Borowinska', 'Katarzyna', '1956-05-14', 'Nowa', 21500, 'Biala Podlaska', '2009-12-01', null, 1269, 'S', 'K');
INSERT INTO Czytelnicy VALUES (null, 'Ziemowit', 'Marek', '1979-11-14', 'Moniuszki', 21500, 'Biala Podlaska', '2006-04-12', null, 1270, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Pawelec', 'Rafal', '1965-11-14', 'Kosynierow', 21040, 'Piaski', '2008-05-12', null, 1271, 'S', 'M');
INSERT INTO Czytelnicy VALUES (null, 'Ziemowit', 'Rafal', '1955-03-24', 'Sidorska', 21048, 'Lublin', '2008-05-12', null, 1271, 'S', 'M');

-- Wypozyczenia
INSERT INTO Wypozyczenia VALUES (null, 11, 14, 2, '2009-12-05', '2010-03-22');
INSERT INTO Wypozyczenia VALUES (null, 12, 7, 1, '2009-10-09', '2010-01-16');
INSERT INTO Wypozyczenia VALUES (null, 9, 7, 3, '2009-05-01', '2009-09-04');
INSERT INTO Wypozyczenia VALUES (null, 2, 3, 11, '2006-12-12', '2007-12-14');
INSERT INTO Wypozyczenia VALUES (null, 3, 3, 4, '2009-01-09', '2009-04-05');
INSERT INTO Wypozyczenia VALUES (null, 1, 14, 11, '2010-03-03', null);
INSERT INTO Wypozyczenia VALUES (null, 1, 6, 2, '2009-12-06', null);
INSERT INTO Wypozyczenia VALUES (null, 15, 6, 3, '2009-10-14', '2009-12-05');
INSERT INTO Wypozyczenia VALUES (null, 13, 8, 4, '2010-05-09', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 14, 5, '2009-05-05', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 11, 5, '2009-06-14', null);
INSERT INTO Wypozyczenia VALUES (null, 8, 11, 2, '2009-11-05', null);
INSERT INTO Wypozyczenia VALUES (null, 9, 3, 3, '2009-12-22', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 11, 4, '2010-01-08', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 13, 11, '2010-03-05', null);
INSERT INTO Wypozyczenia VALUES (null, 13, 13, 5, '2009-12-05', '2010-03-22');
INSERT INTO Wypozyczenia VALUES (null, 15, 13, 3, '2009-10-09', '2010-01-16');
INSERT INTO Wypozyczenia VALUES (null, 9, 1, 3, '2009-05-01', '2009-09-04');
INSERT INTO Wypozyczenia VALUES (null, 2, 1, 5, '2009-12-12', null);
INSERT INTO Wypozyczenia VALUES (null, 6, 1, 4, '2009-01-09', '2009-04-05');
INSERT INTO Wypozyczenia VALUES (null, 4, 11, 1, '2010-03-03', null);
INSERT INTO Wypozyczenia VALUES (null, 1, 9, 2, '2009-12-06', null);
INSERT INTO Wypozyczenia VALUES (null, 15, 9, 3, '2009-11-14', '2009-12-05');
INSERT INTO Wypozyczenia VALUES (null, 13, 9, 4, '2010-01-22', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 9, 5, '2009-12-14', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 8, 6, '2009-09-30', null);
INSERT INTO Wypozyczenia VALUES (null, 7, 8, 2, '2008-11-05', '2008-11-05');
INSERT INTO Wypozyczenia VALUES (null, 9, 8, 3, '2009-12-22', '2010-01-05');
INSERT INTO Wypozyczenia VALUES (null, 1, 14, 3, '2010-01-08', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 7, 6, '2010-03-05', null);
INSERT INTO Wypozyczenia VALUES (null, 9, 1, 1, '2009-11-05', '2010-03-22');
INSERT INTO Wypozyczenia VALUES (null, 12, 1, 1, '2009-11-09', '2010-01-16');
INSERT INTO Wypozyczenia VALUES (null, 9, 10, 3, '2009-05-01', '2009-09-04');
INSERT INTO Wypozyczenia VALUES (null, 2, 10, 5, '2009-12-16', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 10, 6, '2009-02-09', '2009-04-05');
INSERT INTO Wypozyczenia VALUES (null, 4, 13, 1, '2010-03-03', null);
INSERT INTO Wypozyczenia VALUES (null, 1, 7, 2, '2009-12-06', null);
INSERT INTO Wypozyczenia VALUES (null, 15, 7, 3, '2009-10-14', '2009-12-05');
INSERT INTO Wypozyczenia VALUES (null, 13, 7, 4, '2010-05-09', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 7, 5, '2009-05-05', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 11, 1, '2009-06-14', null);
INSERT INTO Wypozyczenia VALUES (null, 8, 11, 2, '2009-11-05', null);
INSERT INTO Wypozyczenia VALUES (null, 9, 11, 3, '2009-12-22', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 11, 4, '2010-01-08', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 11, 5, '2010-03-05', null);
INSERT INTO Wypozyczenia VALUES (null, 13, 8, 5, '2009-12-05', '2010-03-22');
INSERT INTO Wypozyczenia VALUES (null, 15, 8, 1, '2009-10-09', '2010-01-16');
INSERT INTO Wypozyczenia VALUES (null, 9, 8, 3, '2009-05-01', '2009-09-04');
INSERT INTO Wypozyczenia VALUES (null, 2, 11, 5, '2009-12-12', null);
INSERT INTO Wypozyczenia VALUES (null, 6, 11, 4, '2009-01-09', '2009-04-05');
INSERT INTO Wypozyczenia VALUES (null, 1, 11, 1, '2010-03-03', null);
INSERT INTO Wypozyczenia VALUES (null, 2, 11, 2, '2009-12-06', null);
INSERT INTO Wypozyczenia VALUES (null, 1, 11, 3, '2009-11-14', '2009-12-05');
INSERT INTO Wypozyczenia VALUES (null, 5, 11, 4, '2010-01-22', null);
INSERT INTO Wypozyczenia VALUES (null, 13, 13, 4, '2009-12-14', null);
INSERT INTO Wypozyczenia VALUES (null, 10, 13, 6, '2009-09-30', null);
INSERT INTO Wypozyczenia VALUES (null, 7, 13, 3, '2008-11-05', '2008-11-05');
INSERT INTO Wypozyczenia VALUES (null, 7, 13, 3, '2009-12-22', '2010-01-05');
INSERT INTO Wypozyczenia VALUES (null, 3, 13, 3, '2010-01-08', null);
INSERT INTO Wypozyczenia VALUES (null, 3, 13, 7, '2010-03-05', null);

-- --------------------------------------------------------------------
-- 3. QUERIES (TASKS 1-20)
-- --------------------------------------------------------------------

-- Task 1: Display reader and employee in a single column (distinct, ordered by reader last name DESC)
SELECT DISTINCT 
    CONCAT(c.Imie, ' ', c.Nazwisko, ' - ', p.Imie, ' ', p.Nazwisko) AS Informacja
FROM Wypozyczenia w
JOIN Czytelnicy c ON w.Nr_czytelnika = c.Nr_czytelnika
JOIN Pracownicy p ON w.Id_pracownika = p.Id_pracownika
ORDER BY c.Nazwisko DESC;

-- Task 2: Display reader full name and the count of unique borrowed books
SELECT 
    CONCAT(c.Imie, ' ', c.Nazwisko, ': ', COUNT(DISTINCT w.Sygnatura)) AS Czytelnik_i_liczba_ksiazek
FROM Czytelnicy c
LEFT JOIN Wypozyczenia w ON c.Nr_czytelnika = w.Nr_czytelnika
GROUP BY c.Nr_czytelnika, c.Imie, c.Nazwisko;

-- Task 3: Book titles borrowed by reader ID=3 from specific employees (IDs: 1, 2, 3, 11, 13)
SELECT DISTINCT 
    k.Tytul
FROM Wypozyczenia w
JOIN Ksiazki k ON w.Sygnatura = k.Sygnatura
WHERE w.Nr_czytelnika = 3 
  AND w.Id_pracownika IN (1, 2, 3, 11, 13);

-- Task 4: Readers who borrowed books published by PWN (custom column header, ordered ASC)
SELECT DISTINCT 
    CONCAT(c.Imie, ' ', c.Nazwisko) AS `Lista osób, które wypożyczały książki PWN`
FROM Czytelnicy c
JOIN Wypozyczenia w ON c.Nr_czytelnika = w.Nr_czytelnika
JOIN Ksiazki k ON w.Sygnatura = k.Sygnatura
WHERE k.Wydawnictwo = 'PWN'
ORDER BY c.Nazwisko ASC;

-- Task 5: Book titles borrowed at least 5 times
SELECT 
    k.Tytul
FROM Ksiazki k
JOIN Wypozyczenia w ON k.Sygnatura = w.Sygnatura
GROUP BY k.Sygnatura, k.Tytul
HAVING COUNT(*) >= 5;

-- Task 6: Book titles that have never been borrowed
SELECT 
    k.Tytul
FROM Ksiazki k
LEFT JOIN Wypozyczenia w ON k.Sygnatura = w.Sygnatura
WHERE w.Nr_transakcji IS NULL;

-- Task 7: Readers currently holding overdue books (loan duration > 14 days)
SELECT 
    c.Nazwisko, 
    c.Imie, 
    k.Tytul
FROM Wypozyczenia w
JOIN Czytelnicy c ON w.Nr_czytelnika = c.Nr_czytelnika
JOIN Ksiazki k ON w.Sygnatura = k.Sygnatura
WHERE w.Data_zwrotu IS NULL 
  AND DATEDIFF(CURDATE(), w.Data_wypozyczenia) > 14;

-- Task 8: Readers who have ever held books overdue (> 14 days)
SELECT DISTINCT 
    c.Nazwisko, 
    c.Imie
FROM Wypozyczenia w
JOIN Czytelnicy c ON w.Nr_czytelnika = c.Nr_czytelnika
WHERE (w.Data_zwrotu IS NOT NULL AND DATEDIFF(w.Data_zwrotu, w.Data_wypozyczenia) > 14)
   OR (w.Data_zwrotu IS NULL AND DATEDIFF(CURDATE(), w.Data_wypozyczenia) > 14);

-- Task 9: Number of books per publisher published after 2000
SELECT 
    Wydawnictwo, 
    COUNT(*) AS ILE, 
    Rok_wyd
FROM Ksiazki
WHERE Rok_wyd > 2000
GROUP BY Wydawnictwo, Rok_wyd;

-- Task 10: List of all borrowed books for each reader
SELECT 
    c.Nazwisko, 
    c.Imie, 
    k.Tytul, 
    w.Data_wypozyczenia
FROM Czytelnicy c
JOIN Wypozyczenia w ON c.Nr_czytelnika = w.Nr_czytelnika
JOIN Ksiazki k ON w.Sygnatura = k.Sygnatura
ORDER BY c.Nazwisko, c.Imie, w.Data_wypozyczenia;

-- Task 11: Loans report for the first week of each month formatted as sentences
SELECT 
    CONCAT(
        c.Imie, ' ', c.Nazwisko, ' wypożyczył książkę '', 
        k.Tytul, ' (', k.Imie, ' ', k.Nazwisko, ')' dnia ', 
        w.Data_wypozyczenia
    ) AS Raport
FROM Wypozyczenia w
JOIN Czytelnicy c ON w.Nr_czytelnika = c.Nr_czytelnika
JOIN Ksiazki k ON w.Sygnatura = k.Sygnatura
WHERE DAY(w.Data_wypozyczenia) BETWEEN 1 AND 7
ORDER BY w.Data_wypozyczenia, c.Nazwisko;

-- Task 12: Employee with the highest salary
SELECT 
    CONCAT(Imie, ' ', Nazwisko, ' ma wynagrodzenie w kwocie: ', wynagrodzenie) AS Pracownik_z_najwyzsza_placa
FROM Pracownicy
WHERE wynagrodzenie = (SELECT MAX(wynagrodzenie) FROM Pracownicy);

-- Task 13: Average employee salary rounded up (CEIL)
SELECT 
    CONCAT('Średnie wynagrodzenie pracowników wynosi ', CEIL(AVG(wynagrodzenie))) AS WYNIK
FROM Pracownicy;

-- Task 14: Text formatting mix (first 2 letters uppercase, reverse first name, uppercase city)
SELECT 
    CONCAT(
        UPPER(SUBSTRING(Nazwisko, 1, 2)), 
        LOWER(SUBSTRING(Nazwisko, 3)), ' ', 
        REVERSE(Imie), ' ', 
        UPPER(Miasto)
    ) AS MIX
FROM Czytelnicy;

-- Task 15: Arithmetic expression computed via SELECT rounded to 2 decimal places
SELECT 
    CONCAT('q=', ROUND((32.67 * 6.78) / (7.8 - POW(14.23, 3)), 2)) AS Wynik;

-- Task 16: Book purchases summary grouped by publication year
SELECT 
    CONCAT(
        'W roku ', Rok_wyd, 
        ' zakupiono ', COUNT(*), 
        ' książki – łączna kwota: ', SUM(Cena), ' zł'
    ) AS ZAKUPY
FROM Ksiazki
GROUP BY Rok_wyd
ORDER BY Rok_wyd;

-- Task 17: Department with the most borrowed books
SELECT 
    d.Nazwa
FROM Dzialy d
JOIN Ksiazki k ON d.Id_dzial = k.Id_dzial
JOIN Wypozyczenia w ON k.Sygnatura = w.Sygnatura
GROUP BY d.Id_dzial, d.Nazwa
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 18: Employee salary difference from the department/position average
SELECT 
    p.Id_stanowisko,
    p.Nazwisko,
    p.wynagrodzenie AS Placa,
    ROUND(p.wynagrodzenie - s.Srednia_stanowiska, 2) AS Roznica_od_sredniej
FROM Pracownicy p
JOIN (
    SELECT Id_stanowisko, AVG(wynagrodzenie) AS Srednia_stanowiska
    FROM Pracownicy
    GROUP BY Id_stanowisko
) s ON p.Id_stanowisko = s.Id_stanowisko
ORDER BY p.Nazwisko;

-- Task 19: Employee with the shortest tenure
SELECT *
FROM Pracownicy
ORDER BY Data_zatrudnienia DESC
LIMIT 1;

-- Task 20: Number of females and males who returned all borrowed books
SELECT 
    c.Plec, 
    COUNT(DISTINCT c.Nr_czytelnika) AS Liczba_osob
FROM Czytelnicy c
WHERE c.Nr_czytelnika IN (
    SELECT Nr_czytelnika FROM Wypozyczenia WHERE Data_zwrotu IS NOT NULL
)
AND c.Nr_czytelnika NOT IN (
    SELECT Nr_czytelnika FROM Wypozyczenia WHERE Data_zwrotu IS NULL
)
GROUP BY c.Plec;
