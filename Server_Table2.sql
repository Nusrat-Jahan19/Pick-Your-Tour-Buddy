CLEAR SCREEN;

-- DROP TABLE

DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Hotel CASCADE CONSTRAINTS;
DROP TABLE Booked CASCADE CONSTRAINTS;


-- CLIENT TABLE
CREATE TABLE Client(
	c_name varchar2(15),
	c_phone int,
	CB_date date,
	PRIMARY KEY (c_phone)
);


-- HOTEL TABLE
CREATE TABLE Hotel(
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
	FOREIGN KEY(h_id) REFERENCES Hotel(h_id)
);
	
	
insert into Client values('Nahin', 1234567, '01-MAR-2022');
insert into Client values('Joti', 1237895, '03-APR-2022');
insert into Client values('Lamia', 0191432, '17-MAR-2022');
insert into Client values('Priota', 0171682, '19-MAR-2022');
insert into Client values('Samia', 0181425, '27-APR-2022');
insert into Client values('Mustafa', 1239875, '30-MAR-2022');
insert into Client values('Panda', 5678942, '14-APR-2022');


insert into Hotel values(101, 'Hotel Sea In', 'Double', , 30000);
insert into Hotel values(102, 'Porjothon Motel', 'Single', 50000);
insert into Hotel values(103, 'Hotel Sea View', 'Double', 45000);
insert into Hotel values(104, 'Rojonigondha', 'Double', 25000);
insert into Hotel values(105, 'Grand Sultan', 'Single', 25000);
insert into Hotel values(106, 'Hotel Srigal', 'Double', 37000);
insert into Hotel values(107, 'Hotel Sea Side', 'Single', 25000);


insert into Booked values (1234567,103);
insert into Booked values (1234567,106);
insert into Booked values (1237895,107);
insert into Booked values (0181425,101);
insert into Booked values (0191432,102);
insert into Booked values (5678942,104);
insert into Booked values (0191432,101);
insert into Booked values (0181425,104);
insert into Booked values (0171682,104);



select * from Client;
select * from Hotel;
select * from Booked;
	

	
COMMIT;