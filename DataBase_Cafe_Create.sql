





drop table if exists orders, SeasonalMenuChanges, Menu, OrderItems, 
HistoryOfPrices, PaymentType, Payment, Employee, Reservation, OrderReservation, TablesInRest, OrdersTable;








create table if not exists Employee
(
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	FullName varchar (300) not null,
	BirthDate date not null,
	Telephone varchar (20) not null,
	Email varchar (200),
	IsActiveEmployee boolean
);

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Vania Smith Rojer', '1993-08-07', '+48333664489', 'vaniasmith@mail.com', 'yes');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('James Bond Grey', '1977-06-22', '+1222444666253', 'bondjamesbond@gmail.com', 'yes');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Agata Kristy She', '1979-11-12', '+124576583574847', 'bookread@mail.com', 'no');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Mary Jane Steve', '1988-04-07', '+6874335675', 'spidergirl@gmail.com', 'yes');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Mark Hue Jim', '1996-02-25', '+6665505333', 'justman@mail.com', 'no');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Jim Kerry Maik', '1997-12-15', '+33355583757', 'kerry@gmail.com', 'no');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Kim', '1959-03-04', '+48754375457', 'kim@mail.com', 'no');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Tom', '1999-05-28', '+4885453466', 'tom@gmail.com', 'no');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Liy', '2000-08-18', '+4665657953', 'liy@gmail.com', 'yes');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Rim', '1987-10-03', '+123578900', 'rim@gmail.com', 'yes');

insert into Employee (FullName, BirthDate, Telephone, Email, IsActiveEmployee)
values ('Pommy', '1996-11-29', '+988666111', 'pommy@gmail.com', 'yes');










CREATE TABLE IF NOT EXISTS orders
(
	Id int4 NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	order_date timestamp without time zone NOT NULL,
	EmployeeId int4 NOT NULL,
	IsReservation bool NOT NULL,
	foreign key (EmployeeId) references Employee (id)
);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('1999-01-08 04:05:06', 1, true);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2019-11-26 13:15:09', 2, true);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2019-11-26 13:16:55', 4, true);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2023-12-10 17:14:43', 1, true);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2023-01-17 14:18:47', 2, false);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2023-09-23 12:49:55', 2, false);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2023-05-02 19:04:34', 9, false);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2024-01-01 11:04:09', 10, true);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2024-01-02 10:34:29', 11, true);

INSERT INTO orders (order_date, EmployeeId, IsReservation)
VALUES ('2024-01-03 20:12:33', 10, true);









create table if not exists SeasonalMenuChanges
(
	Id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	StartDate date not null,
	EndDate date not null
);

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2023-11-26', '2023-12-27');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2023-07-01', '2023-08-31');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2023-12-25', '2023-12-31');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2023-12-26', '2023-12-27');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2023-12-01', '2023-12-31');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2024-01-01', '2024-12-31');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2024-01-01', '2024-02-29');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2024-01-12', '2024-02-12');

insert into SeasonalMenuChanges (StartDate, EndDate)
values ('2024-02-01', '2024-05-31');












create table if not exists Menu
(
	Id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	NameMenu varchar (250) Not null,
	SeasonalMenuChangesId int4 null,
	IsActive bool null,
foreign key (SeasonalMenuChangesId) references SeasonalMenuChanges (Id)
);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Latte', null, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('espresso', null, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('puncake latte', 3, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('santa latte', 4, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('espresso^s mistery', 5, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('donat', null, false);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Matte', null, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Cherry coffee', null, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('C-C-Coffee', null, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('BonAqua', null, false);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Gingerbread', 6, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Big gingerbread', 7, true);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Milk Shake', 8, false);

insert into Menu (NameMenu, SeasonalMenuChangesId, IsActive)
values ('Grand Butter', 9, false);










CREATE TABLE IF NOT EXISTS OrderItems
(
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	MenuId int4 not NULL, 
	OrderId int4 not null,
	primary key (id),
foreign key (OrderId) references orders (id),
foreign key (MenuId) references Menu (Id)
);

insert into OrderItems (MenuId, OrderId)
values (1, 1);

insert into OrderItems (MenuId, OrderId)
values (2, 2);

insert into OrderItems (MenuId, OrderId)
values (3, 3);

insert into OrderItems (MenuId, OrderId)
values (4, 3);

insert into OrderItems (MenuId, OrderId)
values (7, 4);

insert into OrderItems (MenuId, OrderId)
values (8, 5);

insert into OrderItems (MenuId, OrderId)
values (9, 6);

insert into OrderItems (MenuId, OrderId)
values (8, 6);

insert into OrderItems (MenuId, OrderId)
values (6, 7);

insert into OrderItems (MenuId, OrderId)
values (7, 8);

insert into OrderItems (MenuId, OrderId)
values (6, 9);

insert into OrderItems (MenuId, OrderId)
values (7, 10);







create table if not EXISTS HistoryOfPrices
( 
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	StartDate date not null,
	Price decimal (16,2) not null,
	MenuId int4 not null,
	primary key (id),
foreign key (MenuId) references Menu (id)
);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2023-07-26', '5.2', 3);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2023-12-01', '3.5', 3);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2023-01-01', '7.0', 1);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2023-11-01', '4.5', 2);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2023-12-26', '3.5', 4);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2023-12-01', '3.5', 5);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2021-05-16', '2.0', 6);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2021-02-08', '3.79', 7);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2021-03-01', '2.99', 8);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2021-01-06', '5.23', 9);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2021-01-01', '0.99', 10);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2024-01-01', '3.44', 11);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2024-01-01', '6.13', 12);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2024-01-12', '4.99', 13);

insert into HistoryOfPrices (StartDate, Price, MenuId)
values ('2024-02-01', '6.99', 14);











create table if not exists PaymentType
(
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	primary key (id),
	PaymentName varchar (200) not null,
	IsTip boolean not null
);

insert into PaymentType (PaymentName, IsTip)
values ('card', 'yes');

insert into PaymentType (PaymentName, IsTip)
values ('card', 'no');

insert into PaymentType (PaymentName, IsTip)
values ('cash', 'no');

insert into PaymentType (PaymentName, IsTip)
values ('cash', 'yes');









create table if not exists Payment
( 
	Id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	Amount decimal (16,2) not null,
	PaymentDate timestamp without time zone NOT NULL,
	PaymentTypeId int4 not null,
	OrderId int4 not null,
foreign key (PaymentTypeId) references PaymentType (id),
foreign key (OrderId) references orders (Id)
);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('33.19', '1999-01-08 17:11:23.233', 1, 1);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('17.99', '2019-11-26 13:25:54.432', 2, 2);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('17.99', '2019-11-26 13:27:54.432', 3, 2);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('109.03', '2023-12-10 19:15:55.330', 4, 3);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('109.03', '2023-01-17 16:45:01.126', 1, 4);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('15.69', '2023-09-23 13:45:01.126', 3, 5);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('10.13', '2024-01-03 18:15:44.546', 2, 6);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('200.59', '2024-01-02 12:22:16.532', 3, 7);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('3.65', '2024-01-04 09:15:51.332', 4, 8);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('7.99', '2023-12-31 21:05:16.238', 1, 9);

insert into Payment (Amount, PaymentDate, PaymentTypeId, OrderId)
values ('4.99', '2023-12-23 14:46:18.541', 1, 10);











create table if not exists TablesInRest
(
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	TableName varchar (500) not null,
	Sits smallint not null
);

insert into TablesInRest (TableName, Sits)
values (1, 2);

insert into TablesInRest (TableName, Sits)
values (2, 2);

insert into TablesInRest (TableName, Sits)
values (3, 3);

insert into TablesInRest (TableName, Sits)
values ('4 big', 5);

insert into TablesInRest (TableName, Sits)
values ('5 small', 3);

insert into TablesInRest (TableName, Sits)
values ('6 couple', 2);

insert into TablesInRest (TableName, Sits)
values ('Special', 3);

insert into TablesInRest (TableName, Sits)
values ('Mistery', 4);

insert into TablesInRest (TableName, Sits)
values ('Independence', 1);

insert into TablesInRest (TableName, Sits)
values ('Flow', 1);

insert into TablesInRest (TableName, Sits)
values ('Love', 2);













create table if not exists Reservation 
(
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	TableId smallint not null,
	NameOfReserver varchar (200) not null,
	Persons smallint not null,
	PhoneNumber varchar (20) not null,
	DateReservation timestamp not null,
	IsResActiv boolean not null,
	foreign key (TableId) references TablesInRest (Id)
);

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (1, 'Kate', 2, '+48333557765', '2023-12-25', 'yes');

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (3, 'Poule', 1, '+2346638347754', '2024-01-07', 'yes');

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (2, 'Jolie', 3, '+13456335635', '2023-12-31', 'yes');

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (4, 'Jolie', 4, '+13456335635', '2023-12-31', 'yes');

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (7, 'Timmy', 2, '+67555676895', '2024-01-01', 'yes');

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (8, 'Bob', 4, '+8945456345', '2024-01-02', 'yes');

insert into Reservation (TableId, NameOfReserver, Persons, PhoneNumber, DateReservation, IsResActiv)
values (9, 'Ale', 1, '+37536373363', '2024-01-03', 'yes');










create table if not exists OrderReservation
( 
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	OrderId int4 not null,
	ReservationId int4 not null,
foreign key (OrderId) references orders (id),
foreign key (ReservationId) references Reservation (id)
);

insert into OrderReservation (OrderId, ReservationId)
values (1, 1);

insert into OrderReservation (OrderId, ReservationId)
values (2, 2);

insert into OrderReservation (OrderId, ReservationId)
values (3, 3);

insert into OrderReservation (OrderId, ReservationId)
values (3, 4);

insert into OrderReservation (OrderId, ReservationId)
values (8, 5);

insert into OrderReservation (OrderId, ReservationId)
values (9, 6);

insert into OrderReservation (OrderId, ReservationId)
values (10, 7);









create table if not exists OrdersTable
(
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY primary key,
	TableId smallint not null,
	OrderId int4 not null,
foreign key (TableId) references TablesInRest (id),
foreign key (OrderId) references orders (id)
);

insert into OrdersTable (TableId, OrderId)
values (1, 1);

insert into OrdersTable (TableId, OrderId)
values (2, 2);

insert into OrdersTable (TableId, OrderId)
values (3, 3);

insert into OrdersTable (TableId, OrderId)
values (4, 4);

insert into OrdersTable (TableId, OrderId)
values (7, 8);

insert into OrdersTable (TableId, OrderId)
values (8, 9);

insert into OrdersTable (TableId, OrderId)
values (9, 10);

