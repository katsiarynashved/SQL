
-- CREATE TABLES (SEPARATE)

create table producty (
product_id int primary key auto_increment not null,
nazwa varchar(100) not null,
cena decimal(10,2) not null,
ilosc smallint not null,
kategoria varchar (200) not null,
data_dodania date not null,
producent varchar (200) not null,
czy_niebezpieczny Boolean not null
);


insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Mars', '7.5', '35', 'Slodycze', '2022-09-23', 'Mars Incorporated', false);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Snikers', '1.5', '87', 'Slodycze', '2012-03-18', 'Mars Incorporated', true);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Lays', '4.5', '45', 'Przekaski', '2020-04-02', 'Lays Company', false);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Orzeszki Adas', '2', '3', 'Przekaski', '2019-12-03', 'Adamed Company', false);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Lody Koral', '7.5', '1000', 'Lody', '2018-10-28', 'Bracia Sp. z.o.o.', false);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Czekolada Milka', '8.5', '20', 'Czekolady', '2002-04-21', 'Milka Company', false);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Czekolada Studencka', '10.5', '29', 'Czekolady', '2014-07-17', 'Milka Company', true);

insert into producty (nazwa, cena, ilosc, kategoria, data_dodania, producent, czy_niebezpieczny)
values ('Paluszki', '5.5', '32', 'Przekaski', '2016-03-19', 'Beskidzkie Company', true);





-- TASK
-- QUERIES

update producty
set ilosc=5000
where product_id=5;

update producty
set cena=10, ilosc=50
where product_id=3;

update producty
set producent='Milka'
where product_id=6;

alter table produkty
add stan_magazynowy int not null;

alter table produkty
drop column stan_magazynowy;

select * from produkty
where ilosc>25 and ilosc<60;

select * from produkty 
where ilosc between 30 and 70;

select nazwa, cena, producent from produkty
where nazwa like '%a%' and czy_niebezpieczny is false
order by cena desc;

select * from produkty limit 5;

select nazwa as name, cena as price, czy_niebezpieczny as is_unsafe 
from produkty
where czy_niebezpieczny is false
order by name; 

select avg(cena) from produkty;

select product_id, nazwa, kategoria, cena, producent
from produkty
where cena = (select max(cena) from produkty);

select product_id, nazwa, cena from produkty
where data_dodania IN (select max(data_dodania) from produkty);

select ilosc*cena as sum from produkty
where kategoria='Czekolady' and data_dodania='2014-07-17';


select data_dodania, sum(ilosc*cena) as sum from produkty
where kategoria='Czekolady'
group by data_dodania;

select producent from produkty
where lower(producent) like '%milka%';
















-- CREATE 3 CONNECTED TABLES

create table samochody (
    samochod_id int primary key auto_increment, 
    marka varchar (100) not null,
    model varchar (100) not null,
    rocznik smallint not null,
    kolor varchar (100) not null,
    klient_id int not null
    foreign key (klient_id) references klient (klient_id)
);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('Mercedes', 'GLC', 2022, 'grafit', 3);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('Mercedes', 'CLA', 2020, 'biay', 4);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('AUDI', 'A4', 2018, 'czerwony', 1);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('AUDI', 'A8', 2021, 'niebieski', 1);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('FIAT', 'Panda', 2016, 'srebrny', 5);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('AUDI', 'A5', 2017, 'czarny', 6);

insert into samochody (marka, model,rocznik, kolor, klient_id)
values ('Mercedes', 'GLE', 2024, 'czarny', 8);




create table klient (
    klient_id int primary key auto_increment,
    imie varchar (100) not null,
    nazwisko varchar (100) not null,
    adres varchar (200) not null,
    czy_firma bool not null,
    pracownik_id int not null,
    foreign key (pracownik_id) references pracownik (pracownik_id) 
);

insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Marcin', 'Kaczka', 'Sloneczna 13', true, 3);

insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Katarzyna', 'Gawlik', 'Nowa 7', 0, 2);


insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Justyna', 'Listopad', 'Florianska 44', 0, 2);

insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Maciej', 'Stec', 'Stroma 12', 1, 3);


insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Jacek', 'Kwiecien', 'Bliski 8', 1, 1);


insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Agata', 'Karolak', 'Spokojna 14', 0, 5);

insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Monika', 'Maj', 'Syta 19', 1, 7);


insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Tomasz', 'Mars', 'Jasna 22', 0, 8);


insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Grzegorz', 'Fila', 'Wodna 76', 0, 10);

insert into klient (imie, nazwisko, adres, czy_firma, pracownik_id)
values ('Krzysztof', 'Buczek', 'Fajansowa 12', 0, 10);




create table pracownik (
    pracownik_id int primary key auto_increment,
    imie varchar (100) not null,
    nazwisko varchar (100) not null,
    stanowisko varchar (100) not null,
    data_zatrudnienia date not null,
    wynagrodzenie decimal (10,2) not null
);

insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Michal', 'Maj', 'Sprzedawca', '2021-08-02', 3500);

insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Anna', 'Wisla', 'Marketingowiec', '2019-09-15', 4500);

insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Tomasz', 'Nowak', 'Kasier', '2017-12-22', 2650);

insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Monika', 'Luty', 'Sprzedawca', '2012-01-17', 5450);


insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Jacek', 'Mostowiak', 'Sprzedawca', '2021-03-12', 6350);

insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Karol', 'Krawczyk', 'Prawnik', '2022-04-17', 8250);

insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Justyna', 'Motyka', 'Prawnik', '2021-08-23', 8000);


insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Kamila', 'Mila', 'Kasier', '2018-04-28', 3500);


insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Tomasz', 'Kopa', 'Marketingowiec', '2022-01-15', 4500);


insert into pracownik (imie, nazwisko, stanowisko, data_zatrudnienia, wynagrodzenie)
values ('Maciej', 'Norek', 'Kasier', '2021-11-22', 4550);







-- QUERIES

update samochody
set kolor='czarny'
where marka='Mercedes';

select imie as name, nazwisko as surname from pracownik;

select data_zatrudnienia as data from pracownik;

select nazwa from produkty
where ilosc > 100;

select pracownik_id, imie, nazwisko, wynagrodzenie from pracownik
where wynagrodzenie > 4000 and stanowisko='Sprzedawca';

select pracownik_id, imie, nazwisko, wynagrodzenie from pracownik
where wynagrodzenie > 7000 OR stanowisko='Kasier';









-- TASK
-- Show pracownik who sold at least 2 different clients car Audi

select klient_id from samochody
where marka = 'AUDI';

-- ^
-- |

select pracownik_id from klient
where klient_id IN 
    (select klient_id from samochody where marka = 'AUDI')
group by imie, nazwisko, czy_firma, pracownik_id;

-- ^
-- |

select pracownik_id from 
    (select pracownik_id from klient
    where klient_id IN 
        (select klient_id from samochody where marka = 'AUDI')
    group by imie, nazwisko, czy_firma, pracownik_id)
group by pracownik_id
having count(pracownik_id) >=2;

-- ^
-- |

select * from pracownik
where pracownik_id in 
    (select a.pracownik_id from 
        -- We find pracownik_id (in klients) of a klients who bought 'AUDI' and make 
        --them unique (to see 1 person 1 time, not as if 1 person bought 2 cars and 
        --it's 2 rows, but as it's one person)
        (select pracownik_id from klient
        where klient_id IN
        -- We find klients who bought 'AUDI' 
            (select klient_id from samochody where marka = 'AUDI')
        group by imie, nazwisko, czy_firma, pracownik_id) a
    group by a.pracownik_id
    having count(a.pracownik_id) >=2);








-- TASK
-- Show klients who bought Marka that was bought more than 2 times (even by the same person)
-- join, subqueries in where and from

-- with Marka (join)
select a.imie, a.nazwisko, b.marka, count(b.marka) from klient a 
join samochody b on a.klient_id=b.klient_id
group by a.imie, a.nazwisko, b.marka
having count(b.marka) >=2;

-- without Marka (subqueries in where)
select imie, nazwisko from klient
where klient_id in 
    (select klient_id from samochody
    where marka in 
        (select marka from 
            (select marka, count(marka) from samochody 
            group by marka
            having count(marka) >=2) a)
    );

-- without Marka, but Optimized
select imie, nazwisko from klient
where klient_id in 
    (select klient_id from samochody
    where marka in  
            (select marka from samochody 
            group by marka
            having count(marka) >=2)
    );


-- without Marka (subqueries in from)
select * from pracownik
where pracownik_id in 
    (select a.klient_id from 
        (select klient_id from samochody 
            WHERE marka in 
                (select marka from samochody 
                group by marka
                having count(marka) >=2)) a
    );








-- TASK
-- Find klients who were served by more that 2 pacownik 


select imie, nazwisko, adres, czy_firma from klient
group by imie, nazwisko, adres, czy_firma
having count(pracownik_id) >=2;
