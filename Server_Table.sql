CLEAR SCREEN;

-- DROP TABLE

DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Vehicle CASCADE CONSTRAINTS;
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
CREATE TABLE Vehicle(
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
	FOREIGN KEY(v_id) REFERENCES Vehicle(v_id)
);
	
	
insert into Customer values('Nahin', 1234567, '10AM-8PM', '01-MAR-2022', 'Hotel Sea In');
insert into Customer values('Joti', 1237895, '8AM-5PM', '03-APR-2022', 'Porjothon Motel');
insert into Customer values('Lamia', 0191432, '11AM-7PM', '17-MAR-2022', 'Hotel Sea View');
insert into Customer values('Priota', 0171682, '9AM-6PM', '19-MAR-2022', 'Rojonigondha');
insert into Customer values('Samia', 0181425, '8AM-3PM', '27-APR-2022', 'Grand Sultan');
insert into Customer values('Mustafa', 1239875, '7AM-6PM', '30-MAR-2022', 'Hotel Srigal');
insert into Customer values('Panda', 5678942, '6AM-6PM', '14-APR-2022', 'Hotel Sea Side');


insert into Vehicle values(101, 'DHA-203-13', 'Alien', 4 , 30000);
insert into Vehicle values(102, 'RAJ-113-11', 'Toyota', 7 , 50000);
insert into Vehicle values(103, 'SHI-109-07', 'Alien', 5 , 45000);
insert into Vehicle values(104, 'RAJ-007-09', 'Toyota', 11 , 25000);
insert into Vehicle values(105, 'CHI-020-18', 'Alien', 4 , 25000);
insert into Vehicle values(106, 'RAJ-020-09', 'Alien', 4 , 37000);
insert into Vehicle values(107, 'KHU-020-18', 'Alien', 4 , 25000);


insert into Booking values (1234567,103);
insert into Booking values (1234567,106);
insert into Booking values (1237895,107);
insert into Booking values (0181425,101);
insert into Booking values (0191432,102);
insert into Booking values (5678942,104);
insert into Booking values (0191432,101);
insert into Booking values (0181425,104);
insert into Booking values (0171682,104);



select * from Customer@site1;
select * from Vehicle;
select * from Booking;
	

	
COMMIT;