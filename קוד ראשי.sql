---------------------------------------------------
------------------tables---------------------------
--------------------------------------------------
CREATE TABLE Customers(
	Email VARCHAR(20) NOT NULL,
		CONSTRAINT ck_email CHECK ( Email like '%@%.%'),
		CONSTRAINT PK_Email PRIMARY KEY (Email),
	[First-Name] VARCHAR(10) NOT NULL,
	[Last-Name] VARCHAR(10) NOT NULL,
	[Phone-number] VarCHAR(20) NULL,
		CONSTRAINT CK_Phone2 CHECK ([Phone-number] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))

INSERT INTO Customers VALUES
	('omershiloh@gmail.com','omer','shiloh','050-786-5533'),
	('inbarelko@gmail.com','inbar','elkoubi','050-786-3355'),
	('nagadayan@gmail.com','naga','dayan','050-678-5533'),
	('noamsha@gmail.com','noam','shahar','050-786-5533'),
	('yuvalpeled@gmail.com','yuval','peled','050-678-3355'),
	('liavshabta@gmail.com','liav','shabtai','050-123-4567'),
	('iratokman@gmail.com','irit','tokman','050-765-4321')

CREATE TABLE Registered_Customer(
	[Email-Customer] VARCHAR(20) NOT NULL,
		CONSTRAINT ck_email6 CHECK ( [Email-Customer] like '%@%.%'),
		CONSTRAINT FR_Email6 FOREIGN KEY([Email-Customer]) REFERENCES Customers(Email),
		CONSTRAINT PR_Email6 PRIMARY KEY([Email-Customer]),
	Password VARCHAR(20) NOT NULL)


	CREATE TABLE Password_Archive(
	[Email-Customer] VARCHAR(20) NOT NULL,
		CONSTRAINT ck_email9 CHECK ( [Email-Customer] like '%@%.%'),
		CONSTRAINT FR_Email9 FOREIGN KEY([Email-Customer]) REFERENCES Registered_Customer([Email-Customer]),
	Password VARCHAR(20) NOT NULL,
	CONSTRAINT PR_Email9 PRIMARY KEY([Email-Customer],Password))

INSERT INTO Registered_Customer VALUES
	('omershiloh@gmail.com','1234'),
	('inbarelko@gmail.com','4321'),
	('nagadayan@gmail.com','1234567'),
	('noamsha@gmail.com','7654321'),
	('yuvalpeled@gmail.com','102938475')

CREATE TABLE Suppliers(
	[S-ID]	 Varchar(20)  NOT NULL ,
		CONSTRAINT PK_Suppliers PRIMARY KEY ([S-ID]),
	Name	 VARCHAR(20) NOT NULL,
	[Phone-number] VARCHAR(12) NOT NULL,
		CONSTRAINT CK_Phone CHECK ([Phone-number] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))

INSERT INTO Suppliers VALUES
	(34678369, 'Elvis Logsdail', '579-169-8018'),
	(11801572, 'Oren De Vaan', '781-386-0460'),
	(35781109, 'Katie Zaple', '614-415-2714'),
	(71247972, 'Gothart Stookes', '316-849-5689'),
	(27241214, 'Kaleena Beardsell', '498-262-0943'),
	(38505439, 'Abigale Grierson', '423-312-7933'),
	(51169843,	'Alonso Thorold', '518-954-5899'),
	(02802263, 'Andrej Auchterlony', '896-932-9710'),
	(27241213,	'Tobi Jina', '470-939-3938'),
	(49030448, 'Sollie Mousley', '692-790-4426')

CREATE TABLE Searches(
	DT DATETIME NOT NULL,
		CONSTRAINT PK_IP_DT PRIMARY KEY (DT,[IP Address]),
	[IP Address] Varchar(15) NOT NULL,
		CONSTRAINT CK_IP2 CHECK ([IP Address] LIKE '[0-9][0-9][0-9].[0-9][0-9][0-9].[0-9][0-9][0-9].[0-9][0-9][0-9]'),
	[Search word]	 VARCHAR(50)  NOT NULL,
	[Email-User] VARCHAR(20) NULL,
		CONSTRAINT ck_email2 check ( [Email-User] like '%@%.%'),
		CONSTRAINT FK_Email2 Foreign Key([Email-User]) REFERENCES Customers(Email))

INSERT INTO Searches VALUES
	('09/03/2016 3:36','123.123.123.123','whiskey','omershiloh@gmail.com'),
	('09/03/2016 3:36','234.234.234.234','taquila','noamsha@gmail.com'),
	('12/01/1995 10:12:14','345.345.345.345','gin', 'inbarelko@gmail.com'),
	('02/02/2000 10:09:18','456.456.456.456','tonik','nagadayan@gmail.com'),
	('10/10/2001 10:02:12','789.789.789.789','bsisei netunim','yuvalpeled@gmail.com')

CREATE TABLE Credit_Cards(
	Number	CHAR(16) NOT NULL,
		CONSTRAINT ck_cc_number CHECK(Number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		CONSTRAINT PR_CC_number PRIMARY KEY (Number),
	[Expiration Date] Varchar(5) NOT NULL,
	CONSTRAINT ck_ExpDAte check([Expiration Date] like '[0-9][0-9]/[0-9][0-9]'),
	CVV	    varchar(3) NOT NULL,
	CONSTRAINT ck_cVV CHECK(cvv<1000))

INSERT INTO Credit_Cards VALUES
	('3533474670501599','01/02', 131),
	('6022334864680102','04/13', 54),
	('5610664169931985','07/02', 776),
	('6390606729267509','05/03', 202),
	('3540235003324368','09/09', 456),
	('5602247725187823','05/05', 843),
	('3006480420169712','12/03', 557)

CREATE table Products(
	SKU		varchar(20)  NOT NULL ,
		CONSTRAINT PK_PRODUCTS PRIMARY KEY (SKU),
	Category VARCHAR(20) NOT NULL,
	Subcategory VARCHAR(20) NOT NULL,
	Brand	VARCHAR(20) NOT NULL,
	[Origin Country] VARCHAR(20) NOT NULL,
	Price	Real NOT NULL,
	Top_rated BIT NOT NULL,
	[Supply-ID]	Varchar(20) NOT NULL,
		CONSTRAINT FK_S_ID FOREIGN KEY([Supply-ID]) REFERENCES Suppliers([S-ID]),
	[Supply Quantity] INT NOT NULL default '0',
		CONSTRAINT ck__Supply_Quantity CHECK ([Supply Quantity]>-1),
	[Supply-DT]		Datetime NULL,
	[Search-DT] DATETIME  NULL,
	[IP Address-Searcher] VarCHAR(15) NULL,
		CONSTRAINT CK_IP CHECK ([IP Address-Searcher] LIKE '[0-9][0-9][0-9].[0-9][0-9][0-9].[0-9][0-9][0-9].[0-9][0-9][0-9]'),
		CONSTRAINT FK_IP FOREIGN KEY([Search-DT],[IP Address-Searcher]) REFERENCES Searches(DT,[IP Address]))
ALTER TABLE Products
	DROP COLUMN Top_Rated

INSERT INTO Products VALUES
	('33f9GQH', 'whiskey', 'Russian', 'abc', 'Russia', 54, 1, 34678369,12, '03/10/2015 23:23', '09/03/2016 3:36', '123.123.123.123'),
	('33f9GQI', 'whiskey', 'Russian', 'abc', 'Russia', 54, 1, 11801572, 54,'03/10/2015 23:23', '09/03/2016 3:36', '234.234.234.234'),
	('6hMLu51', 'taquila', 'chineese', 'fds', 'China', 14, 4, 34678369,72, '10/09/2014 20:55', '09/03/2016 3:36', '123.123.123.123'),
	('YgLksf4', 'vodka', 'chineese', 'bac', 'China', 25, 1, 27241214,51, '07/09/2013 14:11', '09/03/2016 3:36', '234.234.234.234'),
	('fiEfSVo', 'whiskey', 'chineese', 'dfsdsa', 'China',288, 1, 71247972,83, '06/05/2017 19:36', '09/03/2016 3:36', '234.234.234.234'),
	('922qS3W', 'rom', 'american', 'vdsscs', 'United States',267, 1, 38505439,100, '07/07/2011 11:28', '12/01/1995 10:12:14', '345.345.345.345'),
	('Wn9UP2y', 'gin', 'russian', 'fdsfs', 'Russia', 292, 1, 35781109,15, '02/10/2019 11:11', '09/03/2016 3:36', '123.123.123.123'),
	('Hmgpl0G', 'gin', 'chineese', 'fdfs', 'China', 184, 1, 51169843, 132,'03/23/2016 8:41', '10/10/2001 10:02:12', '789.789.789.789'),
	('0H1QBFO', 'beer', 'chineese', 'ngw', 'China', 275, 0, 02802263, 200,'03/30/2016 12:18', '10/10/2001 10:02:12', '789.789.789.789'),
	('vGXfD8I', 'whiskey', 'japaneese', 'fscs', 'Japan', 348, 0, 27241213,83, '06/28/2011 16:25', '10/10/2001 10:02:12', '789.789.789.789'),
	('pQ6hfCC', 'jaegermeister', 'chineese', 'vdsfdfs', 'China', 329, 1, 49030448,5, '12/11/2018 19:26', '10/10/2001 10:02:12', '789.789.789.789')

CREATE TABLE Shipping_Methods(
	[Shipping Method] VARCHAR(20) NOT NULL,
		CONSTRAINT PR_Shipping PRIMARY KEY([Shipping Method]))

INSERT INTO Shipping_Methods Values
	('Air'),
	('Water'),
	('Train'),
	('Xpress'),
	('Super_fast')


	alter table  Orders alter column [Address-Street] VARCHAR(50)
CREATE TABLE Orders(
	[Order-ID] INT NOT NULL,
		CONSTRAINT PR_Order_ID PRIMARY KEY([Order-ID]),
		CONSTRAINT CK_Positive check([Order-ID]>0),
	[Order-Date] DATE NOT NULL,
	[Arrival	Date] DATE NULL,
	[Total Price] Real NOT NULL,
	Email VARCHAR(20) NULL,
		CONSTRAINT ck_email7 check ( Email like '%@%.%'),
		CONSTRAINT FK_Email7 Foreign Key(Email) REFERENCES Customers(Email),
	[Shipping Method] VARCHAR(20) NOT NULL,
		CONSTRAINT FK_Shipping FOREIGN KEY ([Shipping Method]) REFERENCES Shipping_Methods([Shipping Method]),
	[Address-Street] VARCHAR(20) NOT NULL,
	City VARCHAR(20) NOT NULL,
	State VARCHAR(20) NULL,
	Country VARCHAR(20) NOT NULL,
	[CC-Number] char(16) NOT NULL,
		CONSTRAINT ck_CC_Number2 CHECK([CC-Number] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		Constraint FR_CC_Number FOREIGN KEY([CC-Number]) REFERENCES Credit_Cards(Number))

INSERT INTO Orders VALUES

	(1, '9/8/2019', '9/9/2019',213,'omershiloh@gmail.com', 'Train', 'vardia 23', 'Boston',Null,'Canada', 3533474670501599),
	(2, '2/1/2019', '5/14/2019',312,'inbarelko@gmail.com','Water', 'denia 32', 'dalas','alabama','USA', 3006480420169712),
	(3, '1/29/2019', '6/27/2019',423,'nagadayan@gmail.com' ,'Air', 'lamdan 15', 'boston','new mexico','USA', 5602247725187823),
	(4, '10/23/2018', '2/21/2019',124,'noamsha@gmail.com', 'Water', 'denia 32', 'dalas',NUll,'Brazil',3540235003324368),
	(5, '5/14/2019', '2/1/2019', 634,'liavshabta@gmail.com','Train', 'hantke 56', 'Toronto',NULL,'Canada',6390606729267509),
	(6, '12/22/2018', '8/7/2019', 723,'iratokman@gmail.com','Super_fast', 'vardia 23', 'Boston','Virgini','USA', 6390606729267509),
	(7, '7/8/2019', '1/9/2019',841,'yuvalpeled@gmail.com', 'Xpress', 'hantke 56', 'Toronto',NULL,'Argentina',6022334864680102)

CREATE TABLE Products_In_Orders(
	[Order-ID] INT NOT NULL,
		CONSTRAINT FK_Order_ID FOREIGN KEY([Order-ID]) REFERENCES Orders([Order-ID]),
	SKU		varchar(20)  NOT NULL ,
		CONSTRAINT FK_SKU FOREIGN KEY([SKU]) REFERENCES Products(SKU),
	CONSTRAINT PR_Order_ID_SKU PRIMARY KEY([Order-ID],SKU),
	Quantity int NOT NULL default '0',
		CONSTRAINT ck_Quantity CHECK (Quantity>-1))

INSERT INTO Products_In_Orders VALUES
	(1,'33f9GQH',32),
	(2,'fiEfSVo',62),
	(3,'922qS3W',23),
	(4,'33f9GQH',55),
	(5,'fiEfSVo',6),
	(6,'922qS3W',82),
	(1,'0H1QBFO',93)

CREATE TABLE Reviews(
	DT DATETIME NOT NULL,
	[Email-Reviewer]	VARCHAR(20) NOT NULL,
		CONSTRAINT ck_email4 CHECK ( [Email-Reviewer] LIKE '%@%.%'),
		CONSTRAINT FR_Email4 FOREIGN KEY ([Email-Reviewer]) REFERENCES Customers(Email),
	SKU		VARCHAR(20)  NOT NULL ,
		CONSTRAINT FR_SKU FOREIGN KEY (SKU) REFERENCES Products(SKU),
	CONSTRAINT PK_DT_EMAIL_SKU PRIMARY KEY(DT,[Email-Reviewer]),
	[Rank] TINYINT NULL,
	[Description] VARCHAR(300) NULL)

INSERT INTO Reviews VALUES
	('06/22/2009 13:34', 'omershiloh@gmail.com', '33f9GQH', 1, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'),
	('02/02/2007', 'noamsha@gmail.com', 'fiEfSVo', 5, 'Aenean sit amet justo. Morbi ut odio.'),
	('09/03/2018', 'nagadayan@gmail.com', '33f9GQH', 4, 'In sagittis dui vel nisl. Duis ac nibh.'),
	('10/30/2001','nagadayan@gmail.com', 'vGXfD8I', 5, 'Maecenas tincidunt lacus at velit.'),
	('03/29/2006 7:25','inbarelko@gmail.com', 'fiEfSVo', 5, 'Sed accumsan felis.'),
	('06/26/2015 7:31', 'iratokman@gmail.com', '0H1QBFO', 5, 'Nullam varius.'),
	('05/04/2009 0:12', 'liavshabta@gmail.com', 'vGXfD8I', 5, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.'),
	('07/22/2009 13:34', 'omershiloh@gmail.com', '6hMLu51', 4, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'),
	('08/22/2009 13:34', 'omershiloh@gmail.com', '33f9GQH', 1, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'),
	('09/22/2009 13:34', 'omershiloh@gmail.com', '33f9GQH', 1, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'),
	('010/22/2009 13:34', 'omershiloh@gmail.com', '33f9GQH', 1, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.')


CREATE TABLE Read_Reviews(
	DT		DATETIME NOT NULL,
	[Email-Reviwer]	VARCHAR(20) NOT NULL,
		CONSTRAINT ck_email8 CHECK ( [Email-Reviwer] LIKE '%@%.%'),
	[Email-Reader]	VARCHAR(20) NOT NULL,
		CONSTRAINT ck_email5 CHECK ( [Email-Reader] LIKE '%@%.%'),
		CONSTRAINT FR_Email FOREIGN KEY ([Email-Reader]) REFERENCES Customers(Email),
		CONSTRAINT FR_DT2 FOREIGN KEY (DT,[Email-Reviwer]) REFERENCES Reviews(DT,[Email-Reviewer]),
	CONSTRAINT PR_DT_Email PRIMARY KEY(DT,[Email-Reader]),
	[Read-DT] DATETIME NOT NULL)

INSERT into Read_Reviews VALUES
	('06/22/2009 13:34', 'omershiloh@gmail.com','omershiloh@gmail.com','7/1/2019 8:44'),
	('05/04/2009 0:12', 'liavshabta@gmail.com','liavshabta@gmail.com','5/16/2019 20:40'),
	('03/29/2006 7:25','inbarelko@gmail.com','inbarelko@gmail.com','3/16/2019 0:09'),
	('06/26/2015 7:31','iratokman@gmail.com', 'iratokman@gmail.com','7/9/2019 12:45'),
	('03/29/2006 7:25', 'inbarelko@gmail.com','noamsha@gmail.com','2/17/2019 9:59'),
	('02/02/2007', 'noamsha@gmail.com','noamsha@gmail.com','4/21/2019 20:32'),
	('02/02/2007', 'noamsha@gmail.com','omershiloh@gmail.com','11/21/2018 19:18')


create table Search_Archive (
	IP_Address varchar(20) not null,
	DT datetime not null,
	Search_Word varchar(50) not null,
	Search_Time real not null)
	drop table   Search_Archive
alter table Search_Archive
	ADD CONSTRAINT PK_SearchArc PRIMARY KEY (IP_Address,DT)


	---------------------------------queries---------------------------------------
	------------------------------regular queries----------------------------------
select  FullName = [First-Name]+' '+[Last-Name],Brand,Products.SKU
from Products join Reviews on Products.SKU=Reviews.SKU Join Customers on [Email-Reviewer]=Customers.Email
where Rank=5 and category ='Rum'
Order By FullName

select O.[Order-ID],FullName = [First-Name]+' '+[Last-Name],O.Email, [CC-Number],[Expiration Date],CVV, Total_Price=Round(Sum(Price),0)
from Products as P join Products_in_Orders  as PIN on P.SKU=PIN.SKU
join  Orders as O on PIN.[Order-ID]=O.[Order-ID]
join Credit_Cards as CC on O.[CC-Number]=CC.Number
join Customers as C on O.Email=C.Email
GROUP BY O.Email,[First-Name],[Last-Name],O.[Order-ID], [CC-Number],[Expiration Date],CVV
Having Sum(Price)>5000
ORDER BY Total_Price Desc
-------------------------------nested queries------------------------------------
select FullName = [First-Name]+' '+[Last-Name],O.Email,O.[Order-ID], O.[CC-Number],[Expiration Date],CVV, DayToReturn=14-abs(DATEDIFF(day,GETDATE(),O.[Order-Date]))
from ( select [Order-ID],Email,[Order-Date],[CC-Number]
		from  Orders
		where abs(DATEDIFF(day,GETDATE(),[Order-Date]))<14 ) as O
		join Customers as C on C.Email=O.Email
		join Credit_Cards as CC on O.[CC-Number]=CC.Number
		Order by DayToReturn

select Country, NumOfOrders = count ([Order-ID])
from Orders
where Country<>'Netherlands'
	group by Country
	having count ([Order-ID])>(SELECT  count ([Order-ID])
								FROM Orders
								WHERE Country='Netherlands')
	order by   NumOfOrders DESC

-----------------------advanced queries-----------------------------------------
alter table Products add  popularity varchar(30)
update Products
set popularity=(CASE
				when SKU in (select P.SKU
 							 from Reviews as R join Products as P on R.SKU=P.SKU
							 group by P.SKU
							 HAVING Avg(Rank)>4)
				then 'Extremely_Popular'

 				when SKU in (select P.SKU
 							 from Reviews as R join Products as P on  R.SKU=P.SKU
 							  group by P.SKU
							  HAVING Avg(Rank) between 2 AND 4)
				then   'midPopularity'

				 else  'NotPopular'

END)

select top 1 percent Country
from Orders as O join Customers as C on O.Email=C.Email
where C.Email in( SELECT [Email-Reviewer]
				  FROM Reviews as R join Customers as C on R.[Email-Reviewer]=C.Email
				  where [Email-Reviewer] not in (select [Email-Reviewer]
												 FROM Reviews
												 GROUP BY [Email-Reviewer]
											     HAVING COUNT(*)>2)
				  union

				  select Email
				  from Customers
			      where Email not in (select [Email-Reader]
									  FROM Read_Reviews
									  GROUP BY [Email-Reader]
								      HAVING COUNT(*)>2))
group by Country
order by Count(*) desc

---------------------------------------------- views----------------------
CREATE VIEW Customer_Service_VIEW AS
	SELECT 	FullName = [First-Name]+' '+[Last-Name],Orders.Email,Orders.[Order-ID],[Order-Date], [Arrival	Date],	[Shipping Method],[Address-Street],City,State,Country
	FROM 	Orders join Customers on Orders.Email=Customers.Email

CREATE VIEW Manager_VIEW AS
	SELECT 	FullName = [First-Name]+' '+[Last-Name],O.Email,O.[Order-ID],O.[CC-Number],CC.[Expiration Date],CC.CVV
	FROM 	Orders as O join Customers as C on O.Email=C.Email join Credit_Cards as CC on O.[CC-Number]=CC.Number

drop view Customer_Service_VIEW
drop view Manager_VIEW

select *
from Customer_Service_VIEW
where Email='05U5PJB5UB@gmail.com'

select *
from  Manager_VIEW
where Email='05U5PJB5UB@gmail.com'

---------------------------- functions ----------------------

	alter FUNCTION ProductAmount( @SKU VARCHAR(20),@year smallint)
RETURNS  int
AS 	BEGIN
		DECLARE 	@Amount		int
			SELECT 		@Amount = Sum(Quantity)
			FROM		 Orders join Products_In_Orders on Orders.[Order-ID]=Products_In_Orders.[Order-ID]
			where		Products_In_Orders.SKU=@SKU and year([Order-Date])=@year

		RETURN 		@Amount
		END

	select SKU, Quantity=dbo.ProductAmount(SKU,'2018')
from  Orders join Products_In_Orders on Orders.[Order-ID]=Products_In_Orders.[Order-ID]
order by SKU

select NumOrders = dbo.ProductAmount('07F44A','2018')




	drop function ProductAmount


CREATE Function suppliers_rating ( @S_ID VARCHAR(20))
RETURNS 	TABLE
AS			RETURN
	SELECT	P.SKU,AVG_Rating=AVG(Rank)
	FROM	Products as P join Reviews as R on P.SKU=R.SKU
	WHERE	[Supply-ID]=@S_ID
	group by P.SKU


select *
from dbo.suppliers_rating('243')

drop function suppliers_rating

--------------------triggers--------------------------
create  TRIGGER 	Products_Shortage
ON 			 Products_In_Orders
FOR 		INSERT
AS
	INSERT 	INTO 	Products_Shortages
	SELECT DT=getDAte() P.SKU, SP.Name ,SP.[S-ID],Shortage=Sum(I.Quantity)
	from inserted as I join Products as P on I.SKU=P.SKU join Suppliers as SP on P.[Supply-ID]=SP.[S-ID]
	group by DT ,P.SKU,SP.Name ,SP.[S-ID]

alter  TRIGGER 	Products_Shortage
ON 			 Products_In_Orders
FOR 		INSERT
AS
	INSERT 	INTO 	Products_Shortages
	SELECT DT=getDAte(), P.SKU, SP.Name ,SP.[S-ID],Shortage=Sum(I.Quantity)
	from inserted as I join Products as P on I.SKU=P.SKU join Suppliers as SP on P.[Supply-ID]=SP.[S-ID]
	group by P.SKU,SP.Name ,SP.[S-ID]


---------------------SP-------------------------------

alter PROCEDURE SP_Get_Products_Info @SKU varchar(20)
AS
	SELECT SKU,Brand,Category, Subcategory,[Origin Country],Price
	FROM 	Products
	WHERE 	(Products.SKU = @SKU)

EXECUTE SP_Get_Products_Info '016K9R8EGCAA'

alter PROCEDURE SP_search_by_SKU @search_word varchar(50)
	AS
		select SKU,Brand
		from	Products
		where	CHARINDEX(@search_word,SKU)>0

alter PROCEDURE SP_search_by_Brand @search_word varchar(50)
	AS
		select SKU,Brand
		from	Products
		where	CHARINDEX(@search_word,Brand)>0

create PROCEDURE SP_search_by_Category @search_word varchar(50)
	AS
		select SKU,Brand
		from	Products
		where	CHARINDEX(@search_word,Category)>0

Alter PROCEDURE SP_Details @search_word varchar(50)
AS
	select SKU,Brand,Category,Subcategory, [Origin Country],Price
	from Products
	where  @search_word=SKU or @search_word=Category or @search_word=Brand

Alter PROCEDURE SP_search @search_word varchar(50)
AS
	select SKU,Brand
	from Products
	where  CHARINDEX(@search_word,SKU)>0 or CHARINDEX(@search_word,Category)>0 or CHARINDEX(@search_word,Brand)>0


alter procedure SP_insert_search_archive @IP_Address varchar(20),@DT varchar(30), @Search_Word varchar(50), @Search_Time real
AS
	insert into Search_Archive
	values (@IP_Address, @DT, @search_word, @search_time);

------------------mixed query--------------
alter TRIGGER 	Password_archive_New --add the first password to the pass archive
	ON 			 Registered_Customer
	FOR 		INSERT,update
	AS
		INSERT 	INTO 	Password_Archive
		SELECT [Email-Customer], Password
		from inserted
drop trigger Password_archive_Update

CREATE FUNCTION dbo.checkCurrentPassword (@email varchar(50), @password varchar(15))
--check that the email and the corrent password are match
RETURNS  BIT
AS
BEGIN
DECLARE @match int
SELECT @match= COUNT([Email-Customer])
FROM	Registered_Customer
WHERE @email=[Email-Customer] AND @password=Password
RETURN @match
end
select dbo.checkArchivePassword('05U5PJB5UB@gmail.com','No2lvoVe81]')

CREATE FUNCTION dbo.checkArchivePassword (@email varchar(30), @newPass varchar(20))
--check that the new password never used before by the user
RETURNS  int
AS
BEGIN
DECLARE @match int
SELECT @match= COUNT([Email-Customer])
FROM	Password_Archive
WHERE @email=[Email-Customer] AND @newPass=Password
RETURN @match
end


alter PROCEDURE [dbo].Change_Password @email varchar(30),@password varchar(20), @newPass varchar(20)
as
 if(dbo.checkCurrentPassword(@email,@password)<>1)
	begin
		Print 'Wrong password, please put the correct password in order to change it'
	end
  else if(dbo.checkArchivePassword(@email,@newPass)<>0)
	begin
		Print 'You have already used this password before, please differnet other password'
	 end
	 else
		begin
			Update Registered_Customer
			Set Password =@newPass
			where [Email-Customer]=@email
		Print 'Password has changed!'
	 end
 	insert into Registered_Customer values
	('','')
execute Change_Password '7BP6VQ@gmail.com','r88jttwoyuj','1234568'



-----------------Drop The Bit --------------------------

drop table Read_reviews
drop table Reviews
drop table Products_in_orders
drop table Orders
drop table Shipping_methods
drop table Products
drop table Credit_cards
drop table Searches
drop table Suppliers
drop table Password_Archive
drop table Registered_Customer
drop table Customers
drop table Password_Archive
drop table Products_Shortages
