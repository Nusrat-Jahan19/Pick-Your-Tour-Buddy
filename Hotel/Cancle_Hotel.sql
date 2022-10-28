
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A NUMBER PROMPT 'ENTER YOUR NUMBER: '
ACCEPT B NUMBER PROMPT 'ENTER HOTEL ID: '

CREATE OR REPLACE TRIGGER BookedCancle
AFTER DELETE
ON Booked
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Booking Cancelled.');
END;
/


CREATE OR REPLACE PROCEDURE Cancle_Booked(X IN Booked.c_phone%TYPE, Y in Booked.h_id%TYPE)
IS
flag int;
    BEGIN
	    flag:= ValidBooked(X,Y);
	    IF flag=1 THEN
	        DELETE FROM Booked WHERE c_phone=X and h_id=Y;
		ELSIF flag=0 THEN
		    DBMS_OUTPUT.PUT_LINE('No Such Booking');
	    END IF;
END Cancle_Booked;
/


CREATE OR REPLACE FUNCTION ValidBooked(X in Booked.c_phone%TYPE, Y in Booked.h_id%TYPE)
RETURN NUMBER
IS
Flag int;
    BEGIN
        Flag:=0;
	        FOR R IN(SELECT * FROM  Booked WHERE c_phone=X and h_id=Y) LOOP
		        Flag:=1;
	        END LOOP;
    RETURN Flag ;
END ValidBooked;
/



DECLARE

	hid int; 
	phone int;
	
	
BEGIN

	phone:=&A;
	hid:=&B;
	
	Cancle_Booked(phone,hid);
	

END;
/


create or replace view myview2(view_A, view_B) as
select d.c_phone, d.h_id
from Booked d;

select * from myview2;


commit;