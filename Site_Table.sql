CLEAR SCREEN;

-- DROP TABLE

DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Vehicle1 CASCADE CONSTRAINTS;
DROP TABLE Booking CASCADE CONSTRAINTS;


-- CUSTOMER TABLE
CREATE TABLE Customer(
	c_name varchar2(15),
	c_phone int,
	CB_time varchar2(10),
	CB_date date,
	CP_place varchar2(15),
	PRIMARY KEY (c_phone)
);


-- VEHICLE TABLE
CREATE TABLE Vehicle1(
	v_id int,
	v_number varchar2(10),
	v_model varchar2(10),
	v_seats int,
	v_cost int,
	PRIMARY KEY (v_id)
);


-- BOOKING TABLE
CREATE TABLE Booking(
	c_phone int,
	v_id int,
	FOREIGN KEY(c_phone) REFERENCES Customer(c_phone),
	FOREIGN KEY(v_id) REFERENCES Vehicle1(v_id)
);
	
	
insert into Customer values('Nahin', 1234567, '10AM-8PM', '01-MAR-2022', 'Hotel Sea In');
insert into Customer values('Joti', 1237895, '8AM-5PM', '03-APR-2022', 'Porjothon Motel');
insert into Customer values('Lamia', 0191432, '11AM-7PM', '17-MAR-2022', 'Hotel Sea View');
insert into Customer values('Priota', 0171682, '9AM-6PM', '19-MAR-2022', 'Rojonigondha');
insert into Customer values('Samia', 0181425, '8AM-3PM', '27-APR-2022', 'Grand Sultan');
insert into Customer values('Mustafa', 1239875, '7AM-6PM', '30-MAR-2022', 'Hotel Srigal');
insert into Customer values('Panda', 5678942, '6AM-6PM', '14-APR-2022', 'Hotel Sea Side');


insert into Vehicle1 values(102, 'RAJ-113-11', 'Toyota', 7 , 50000);
insert into Vehicle1 values(104, 'RAJ-007-09', 'Toyota', 11 , 25000);
insert into Vehicle1 values(106, 'RAJ-020-09', 'Alien', 4 , 37000);


insert into Booking values (0181425,104);
insert into Booking values (1234567,106);
insert into Booking values (0171682,104);
insert into Booking values (0191432,102);
insert into Booking values (5678942,104);


select * from Customer;
select * from Vehicle1;
select * from Booking;
	
	
COMMIT;


--UNION--
--select * from Vehicle1 union
--select * from Vehicle@site2;