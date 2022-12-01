--CREATE DATABASE Bokhandel;
--USE Bokhandel;


------------------------| TABLE: F�rfattare |------------------------

--CREATE TABLE F�rfattareTbl (
--    [ID] int NOT NULL,
--    [F�rnamn] nvarchar(100) NOT NULL,
--    [Efternamn] nvarchar(100) NOT NULL,
--    [F�delsedatum] date NOT NULL,
--	PRIMARY KEY ([ID])
--);

--INSERT INTO 
--F�rfattareTbl ([ID], [F�rnamn], [Efternamn], [F�delsedatum])
--VALUES 
--(1, 'Johannes', 'Anyuru', '1979-03-23'),
--(2, 'Viveca', 'Sten', '1959-06-18'),
--(3, 'Ocean', 'Vuong', '1988-09-14'),
--(4, 'Fredrik', 'Backman', '1981-06-02'),
--(5, 'Lucinda', 'Riley', '1965-02-16');


------------------------| TABLE: B�cker |------------------------

--CREATE TABLE B�ckerTbl (
--    [ISBN] nchar(13) NOT NULL,
--    [Titel] nvarchar(100) NOT NULL,
--    [Spr�k] nvarchar(100) NOT NULL,
--    [Pris] decimal (10,2) NOT NULL,
--	[Utgivningsdatum] date NOT NULL,
--	[Sidor] int NOT NULL,
--	[F�rfattareID] int NOT NULL,
--	CHECK (LEN([ISBN]) = 13),
--	PRIMARY KEY ([ISBN]),
--	FOREIGN KEY ([F�rfattareID]) REFERENCES F�rfattareTbl([ID])
--);

--INSERT INTO 
--B�ckerTbl ([ISBN], [Titel], [Spr�k], [Pris], [Utgivningsdatum], [Sidor], [F�rfattareID])
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


------------------------| TABLE: Butiker |------------------------

--CREATE TABLE ButikerTbl (
--    [ButiksID] int NOT NULL,
--    [Namn] nvarchar(100) NOT NULL,
--    [Adress] nvarchar(100) NOT NULL,
--    [Postnummer] nchar(5) NOT NULL,
--	[Ort] nvarchar(100) NOT NULL,
--	CHECK (LEN([Postnummer]) = 5),
--	PRIMARY KEY ([ButiksID])
--);

--INSERT INTO 
--ButikerTbl ([ButiksID], [Namn], [Adress], [Postnummer], [Ort])
--VALUES 
--(1, 'Hallmans Bokhandel', 'Kungsgatan 8', 45130, 'Uddevalla'),
--(2, 'Akademibokhandeln', '�lvebacken 13', 44248, 'Kung�lv'),
--(3, 'Pocket Shop', 'Drottningtorget 5', 41103, 'G�teborg');


------------------------| TABLE: LagerSaldo |------------------------

--CREATE TABLE LagerSaldoTbl (
--	[ButiksID] int NOT NULL,
--	[ISBN] nchar(13) NOT NULL,
--	[Antal] int NOT NULL,
--	CHECK (LEN([ISBN]) = 13),
--	FOREIGN KEY ([ButiksID]) REFERENCES ButikerTbl([ButiksID]),
--	FOREIGN KEY ([ISBN]) REFERENCES B�ckerTbl([ISBN]),
--	CONSTRAINT CK_LagerSaldo PRIMARY KEY ([ButiksID], [ISBN])
--);

--INSERT INTO 
--LagerSaldoTbl ([ButiksID], [ISBN], [Antal])
--VALUES 
--(1, 9789113121741, 132),
--(1, 9789174693270, 16),
--(1, 9789137158679, 456),
--(1, 9789137151052, 45),
--(1, 9789127161023, 2),
--(1, 9781556595851, 786),
--(1, 9789137155524, 76),
--(1, 9789137158532, 345),
--(1, 9789180060547, 0),
--(1, 9789189057340, 567),
--(2, 9789113121741, 24),
--(2, 9789174693270, 3),
--(2, 9789137158679, 432),
--(2, 9789137151052, 89),
--(2, 9789127161023, 28),
--(2, 9781556595851, 146),
--(2, 9789137155524, 43),
--(2, 9789137158532, 78),
--(2, 9789180060547, 2),
--(2, 9789189057340, 478),
--(3, 9789113121741, 98),
--(3, 9789174693270, 12),
--(3, 9789137158679, 265),
--(3, 9789137151052, 110),
--(3, 9789127161023, 7),
--(3, 9781556595851, 624),
--(3, 9789137155524, 55),
--(3, 9789137158532, 423),
--(3, 9789180060547, 1),
--(3, 9789189057340, 698);


------------------------| TABLE: Kunder |------------------------

--CREATE TABLE KunderTbl (
--    [KundId] int NOT NULL,
--    [F�rnamn] nvarchar(100) NOT NULL,
--    [Efternamn] nvarchar(100) NOT NULL,
--    [Email] nvarchar(255) unique NOT NULL,
--	[Adress] nvarchar(100) NOT NULL,
--    [Postnummer] nchar(5) NOT NULL,
--	[Ort] nvarchar(100) NOT NULL,
--	CHECK (LEN([Postnummer]) = 5),
--	PRIMARY KEY ([KundId])
--);

--INSERT INTO 
--KunderTbl ([KundId], [F�rnamn], [Efternamn], [Email], [Adress], [Postnummer], [Ort])
--VALUES 
--(1, 'Magnus', 'Sandberg', 'magnus.sandberg@iths.se', 'Hasselv�gen 2', '44277', 'Romelanda'),
--(2, 'Jessica', 'Fletcher', 'murder.she@wrote.com', '698 Candlewood Lane', '12345', 'Maine'),
--(3, 'Phileas', 'Fogg', 'aroundtheworldin@eightydays.uk', '7 Savile Row', '36080', 'London'),
--(4, 'Peter', 'Petersson', 'bokmaleng@bok.se', 'Petergatan 5', '55433', 'Grums'),
--(5, 'Jan', 'Jansson', 'thereaderof@books.com', ' Jansv�gen 37', '45611', 'Karlskoga');


------------------------| TABLE: Order |------------------------

--CREATE TABLE OrderTbl (
--    [OrderId] int NOT NULL,
--    [OrderDatum] date NOT NULL,
--	[KundEmail] nvarchar(255) NOT NULL,
--	[ProductId] nchar(13) NOT NULL,
--	[Antal] int NOT NULL,
--	[Styckpris] decimal (10,2) NOT NULL,
--	CHECK (LEN([ProductID]) = 13),
--	CONSTRAINT PK_OrderId	PRIMARY KEY ([OrderId])
--);

--INSERT INTO 
--OrderTbl ([OrderId], [OrderDatum], [KundEmail], [ProductId], [Antal], [Styckpris])
--VALUES 
--(1, '1984-08-30', 'murder.she@wrote.com', '9781556595851', 1, 354.00),
--(2, '2000-01-01', 'aroundtheworldin@eightydays.uk', '9789137158679', 2, 219.00),
--(3, '2022-03-12', 'magnus.sandberg@iths.se', '9789127161023', 4, 232.00),
--(4, '2022-03-12', 'bokmaleng@bok.se', '9789137155524', 3, 210.00),
--(5, '2022-03-12', 'thereaderof@books.com', '9781556595851', 2, 354.00),
--(6, '2022-04-07', 'murder.she@wrote.com', '9781556595851', 1, 354.00),
--(7, '2022-04-26', 'aroundtheworldin@eightydays.uk', '9789137158679', 2, 219.00),
--(8, '2022-05-12', 'magnus.sandberg@iths.se', '9789127161023', 4, 232.00),
--(9, '2022-06-02', 'murder.she@wrote.com', '9781556595851', 2, 354.00);


------------------------| VIEW: TitlarPerF�rfattare |------------------------

--CREATE VIEW vTitlarPerF�rfattare AS
--SELECT 
--CONCAT([F�rnamn], ' ', [Efternamn]) AS Namn,
--CONCAT(DATEDIFF(hour, [F�delsedatum], GETDATE())/8766, + ' �r') AS �lder,
--CONCAT(COUNT(DISTINCT B�ckerTbl.Titel), ' st') AS AntalTitlar,
--CONCAT(SUM(LagerSaldoTbl.Antal * B�ckerTbl.Pris), ' kr') AS Lagerv�rde
--FROM 
--F�rfattareTbl
--JOIN B�ckerTbl ON F�rfattareTbl.ID = B�ckerTbl.F�rfattareID
--JOIN LagerSaldoTbl ON B�ckerTbl.ISBN = LagerSaldoTbl.ISBN
--GROUP BY
--F�rfattareID, F�rnamn, Efternamn, F�delsedatum;


------------------------| VIEW: TopSeller |------------------------

-- Vyn visar vilka deras popul�raste b�cker �r och boken de tj�nar b�st p�.
-- Detta underl�ttar vilka b�cker de m�ste h�lla extra koll p� i lagersaldot
-- och �ven vilka b�cker de kan g�ra mer/mindre reklam f�r

--CREATE VIEW vTopSeller AS
--SELECT
--[ProductId],
--SUM([Antal]) AS AntalS�lda,
--SUM([Antal] * [Pris]) AS Best�llningsv�rde
--FROM
--OrderTbl
--JOIN B�ckerTbl ON OrderTbl.ProductId = B�ckerTbl.ISBN
--GROUP BY [ProductId], [Pris];

--SELECT TOP 3 * FROM vTopSeller
--ORDER BY Best�llningsv�rde DESC;

------------------------| VIEW: TopCustomer |------------------------

-- Vy f�r att se vilka kunder som best�ller mest b�cker och f�r h�gst orderv�rde.
-- H�r delar vi in kunderna i olika kategorier f�r att dela ut olika rabatter eller rikta kampanjer.

--CREATE VIEW vB�staKunderna AS
--SELECT
--[KundId],
--COUNT(DISTINCT [OrderTbl].OrderId) AS AntalBest�llningar,
--SUM(DISTINCT [Antal] * [Styckpris]) AS TotaltSpenderat,
--CASE
--	WHEN SUM(DISTINCT [Antal] * [Styckpris]) > 200 AND SUM(DISTINCT [Antal] * [Styckpris]) < 699  THEN 'Brons'
--	WHEN SUM(DISTINCT [Antal] * [Styckpris]) > 700 AND SUM(DISTINCT [Antal] * [Styckpris]) < 999 THEN 'Silver'
--	WHEN SUM(DISTINCT [Antal] * [Styckpris]) > 1000 THEN 'Guld'
--	ELSE 'Inga ordrar'
--END AS KundNiv�
--FROM
--KunderTbl
--JOIN OrderTbl ON OrderTbl.KundEmail = KunderTbl.Email
--GROUP BY [KundId];

--SELECT TOP 1 * FROM vB�staKunderna
--ORDER BY TotaltSpenderat DESC;