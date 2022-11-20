--CREATE DATABASE Bokhandel;
--USE Bokhandel;

--CREATE TABLE F�rfattare (
--    [ID] int NOT NULL,
--    [F�rnamn] nvarchar(max) NOT NULL,
--    [Efternamn] nvarchar(max) NOT NULL,
--    [F�delsedatum] date NOT NULL,
--	PRIMARY KEY ([ID])
--);

--INSERT INTO 
--F�rfattare ([ID], [F�rnamn], [Efternamn], [F�delsedatum])
--VALUES 
--(1, 'Johannes', 'Anyuru', '1979-03-23'),
--(2, 'Viveca', 'Sten', '1959-06-18'),
--(3, 'Ocean', 'Vuong', '1988-09-14'),
--(4, 'Fredrik', 'Backman', '1981-06-02'),
--(5, 'Lucinda', 'Riley', '1965-02-16');

--CREATE TABLE B�cker (
--    [ISBN] nchar(13) NOT NULL,
--    [Titel] nvarchar(max) NOT NULL,
--    [Spr�k] nvarchar(max) NOT NULL,
--    [Pris] float NOT NULL,
--	[Utgivningsdatum] date NOT NULL,
--	[Sidor] int NOT NULL,
--	[F�rfattareID] int NOT NULL,
--	PRIMARY KEY ([ISBN]),
--	FOREIGN KEY ([F�rfattareID]) REFERENCES F�rfattare([ID])
--);

--INSERT INTO 
--B�cker ([ISBN], [Titel], [Spr�k], [Pris], [Utgivningsdatum], [Sidor], [F�rfattareID])
--VALUES 
--(9789113121741, 'Ixelles', 'Svenska', 219.00, '2022-09-16', 422, 1),
--(9789174693270, 'Dikter f�r unga', 'Svenska', 180.00, '2021-03-10', 143, 1),
--(9789137158679, 'Botg�raren', 'Svenska', 219.00, '2022-10-04', 480, 2),
--(9789137151052, 'Offermakaren', 'Svenska', 226.00, '2020-10-14', 469, 2),
--(9789127161023, 'En stund �r vi vackra p� jorden', 'Svenska', 232.00, '2020-04-03', 267, 3),
--(9781556595851, 'Night Sky with Exit Wounds', 'Engelska', 354.00, '2019-06-07', 106, 3),
--(9789137155524, 'Vinnarna', 'Svenska', 210.00, '2021-10-06', 750, 4),
--(9789137158532, 'Bj�rnstad', 'Svenska', 75.00, '2020-10-08', 472, 4),
--(9789180060547, '�nglatr�det', 'Svenska', 216.00, '2021-10-25', 592, 5),
--(9789189057340, 'Fj�rilsrummet', 'Svenska', 218.00, '2020-04-17', 616, 5);

--SELECT * FROM B�cker;

--CREATE TABLE Butiker (
--    [ButiksID] int NOT NULL,
--    [Namn] nvarchar(max) NOT NULL,
--    [Adress] nvarchar(max) NOT NULL,
--    [Postnummer] nchar(5) NOT NULL,
--	[Ort] nvarchar(max) NOT NULL,
--	PRIMARY KEY ([ButiksID])
--);

--INSERT INTO 
--Butiker ([ButiksID], [Namn], [Adress], [Postnummer], [Ort])
--VALUES 
--(1, 'Hallmans Bokhandel', 'Kungsgatan 8', 45130, 'Uddevalla'),
--(2, 'Akademibokhandeln', '�lvebacken 13', 44248, 'Kung�lv'),
--(3, 'Pocket Shop', 'Drottningtorget 5', 41103, 'G�teborg')

--SELECT * FROM Butiker;

--Tabell: �LagerSaldo�
--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot b�cker, 
--samt Antal som s�ger hur m�nga exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel p� kolumnerna ButikID och ISBN.

CREATE TABLE LagerSaldo (
	[ButiksID] int NOT NULL,
	[ISBN] nchar(13) NOT NULL,
	[Antal] int NOT NULL,
	FOREIGN KEY ([ButiksID]) REFERENCES Butiker([ButiksID]),
	FOREIGN KEY ([ISBN]) REFERENCES B�cker([ISBN]),
	CONSTRAINT COMPOSITE_KEY_LagerSaldo PRIMARY KEY ([ButiksID], [ISBN])
);

SELECT * FROM LagerSaldo;