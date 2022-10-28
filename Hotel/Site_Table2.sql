CLEAR SCREEN;

-- DROP TABLE

DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Hotel1 CASCADE CONSTRAINTS;
DROP TABLE Booked CASCADE CONSTRAINTS;


-- CLIENT TABLE
CREATE TABLE Client(
	c_name varchar2(15),
	c_phone int,
	CB_date date,
	PRIMARY KEY (c_phone)
);


-- HOTEL TABLE
CREATE TABLE Hotel1(
	h_id int,
	h_name varchar2(15),
	h_room varchar2(10),
	h_cost int,
	PRIMARY KEY (h_id )
);


-- BOOKING TABLE
CREATE TABLE Booked(
	c_phone int,
	h_id int,
	FOREIGN KEY(c_phone) REFERENCES Client(c_phone),
	FOREIGN KEY(h_id) REFERENCES Hotel1(h_id)
);
	
	
	
insert into Client values('Nahin', 1234567, '01-MAR-2022');
insert into Client values('Joti', 1237895, '03-APR-2022');
insert into Client values('Lamia', 1914321, '17-MAR-2022');
insert into Client values('Priota', 1716821, '19-MAR-2022');
insert into Client values('Samia', 1814251, '27-APR-2022');
insert into Client values('Mustafa', 1239875, '30-MAR-2022');
insert into Client values('Panda', 5678942, '14-APR-2022');



insert into Hotel1 values(102, 'Porjothon Motel', 'Single', 50000);
insert into Hotel1 values(104, 'Rojonigondha', 'Double', 25000);
insert into Hotel1 values(106, 'Hotel Srigal', 'Double', 37000);



insert into Booked values(1814251,104);
insert into Booked values(1234567,106);
insert into Booked values(1716821,104);
insert into Booked values(1914321,102);
insert into Booked values(5678942,104);


select * from Client;
select * from Hotel1;
select * from Booked;
	
	

	
COMMIT;


---select * from Hotel1 union
---select * from Hotel@site2;