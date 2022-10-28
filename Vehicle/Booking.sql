
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A NUMBER PROMPT 'ENTER YOUR NUMBER: '
ACCEPT B NUMBER PROMPT 'ENTER VEHICLE ID: '

CREATE OR REPLACE TRIGGER Book
AFTER INSERT
ON Booking
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Booking Confirmed.');
END;
/

CREATE OR REPLACE PROCEDURE Place_Booking(X IN Booking.c_phone%TYPE, Y in Booking.v_id%TYPE)
IS
Flag int;
	BEGIN
        Flag:= ValidBooking(X,Y);
		IF Flag=0 THEN
			INSERT INTO Booking(c_phone, v_id) VALUES (X,Y);
	    END IF;
END Place_Booking;
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
	Error1 EXCEPTION;
	Error2 EXCEPTION;
	Flag int;
	
	
BEGIN
	
	phone:=&A;
	vid:=&B;
	Flag:=0;
	

    FOR Q IN (SELECT c_phone FROM Customer WHERE c_phone=phone ) LOOP
        FOR S IN (SELECT * FROM Booking) LOOP 
			IF S.c_phone=Q.c_phone THEN
			    FOR R IN (SELECT v_id FROM Vehicle WHERE v_id=vid ) LOOP
                    FOR P IN (SELECT * FROM Booking) LOOP 
			            IF P.v_id=R.v_id THEN
			                Flag:=1;
			                
                        END IF;
				    END LOOP;
	            END LOOP;
			END IF;
		END LOOP;
	END LOOP;
	
	IF Flag=0 THEN
	RAISE Error1;
	END IF;
    
			
    Place_Booking(phone,vid);	
   
	
    EXCEPTION
        WHEN Error1 THEN
	        DBMS_OUTPUT.PUT_LINE('Invalid Customer number or Vehicle ID!');
		

END;
/

select * from Booking;


COMMIT;