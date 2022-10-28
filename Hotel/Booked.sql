
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT A NUMBER PROMPT 'ENTER YOUR NUMBER: '
ACCEPT B NUMBER PROMPT 'ENTER HOTEL ID: '

CREATE OR REPLACE TRIGGER BookHotel
AFTER INSERT
ON Booked
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Booking Confirmed.');
END;
/

CREATE OR REPLACE PROCEDURE Place_Booked(X IN Booked.c_phone%TYPE, Y in Booked.h_id%TYPE)
IS
Flag int;
	BEGIN
        Flag:= ValidBooked(X,Y);
		IF Flag=0 THEN
			INSERT INTO Booked(c_phone, h_id) VALUES (X,Y);
	    END IF;
END Place_Booked;
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
	Error1 EXCEPTION;
	Error2 EXCEPTION;
	Flag int;
	
	
BEGIN
	
	phone:=&A;
	hid:=&B;
	Flag:=0;
	

    FOR Q IN (SELECT c_phone FROM Client WHERE c_phone=phone ) LOOP
        FOR S IN (SELECT * FROM Booked) LOOP 
			IF S.c_phone=Q.c_phone THEN
			    FOR R IN (SELECT h_id FROM Hotel1 WHERE h_id=hid ) LOOP
                    FOR P IN (SELECT * FROM Booked) LOOP 
			            IF P.h_id=R.h_id THEN
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
    
			
    Place_Booked(phone,hid);	
   
	
    EXCEPTION
        WHEN Error1 THEN
	        DBMS_OUTPUT.PUT_LINE('Invalid Client Number or Vehicle ID!');
		

END;
/

select * from booked;

COMMIT;

