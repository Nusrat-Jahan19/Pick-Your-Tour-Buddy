
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A NUMBER PROMPT 'ENTER YOUR NUMBER: '
ACCEPT B NUMBER PROMPT 'ENTER VEHICLE ID: '

CREATE OR REPLACE TRIGGER BookingCancle
AFTER DELETE
ON Booking
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Booking Cancelled.');
END;
/


CREATE OR REPLACE PROCEDURE Cancle_Book(X IN Booking.c_phone%TYPE, Y in Booking.v_id%TYPE)
IS
flag int;
    BEGIN
	    flag:= ValidBooking(X,Y);
	    IF flag=1 THEN
	        DELETE FROM Booking WHERE c_phone=X and v_id=Y;
		ELSIF flag=0 THEN
		    DBMS_OUTPUT.PUT_LINE('No Such Booking');
	    END IF;
END Cancle_Book;
/


CREATE OR REPLACE FUNCTION ValidBooking(X in Booking.c_phone%TYPE, Y in Booking.v_id%TYPE)
RETURN NUMBER
IS
Flag int;
    BEGIN
        Flag:=0;
	        FOR R IN(SELECT * FROM  Booking WHERE c_phone=X and v_id=Y) LOOP
		        Flag:=1;
	        END LOOP;
    RETURN Flag ;
END ValidBooking;
/



DECLARE

	vid int; 
	phone int;
	
	
BEGIN

	phone:=&A;
	vid:=&B;
	
	Cancle_Book(phone,vid);
	

END;
/
commit;


select * from Booking;

--create or replace view view_Appointment as
--select * from Appointment@site1;

--select * from view_Appointment;
--commit;