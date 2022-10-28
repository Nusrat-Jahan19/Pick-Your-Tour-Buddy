
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT HotelID NUMBER PROMPT 'Enter Hotel ID: '


DECLARE
	
	X NUMBER := &HotelID;
    no_of_rows INT;

	A Client.c_name%Type;
	D Client.CB_date%Type;
	F Hotel.h_name%TYPE;
	
BEGIN

    FOR S IN(SELECT h_name FROM Hotel WHERE h_id = X) LOOP
	
		F:= S.h_name;
		
	    DBMS_OUTPUT.PUT_LINE('Hotel Name: '|| F);
		
	END LOOP;
	
	
    SELECT COUNT(1) INTO no_of_rows FROM Booked where Booked.h_id= X and rownum=1;
	
	IF no_of_rows > 0 THEN
	
	    FOR R IN (SELECT c_name,CB_date FROM Client C INNER JOIN Booked B ON C.c_phone=B.c_phone WHERE B.h_id = X) LOOP
		
			A:= R.c_name;  
		    D:= R.CB_date; 
		
		
		DBMS_OUTPUT.PUT_LINE('Customer Details: '|| A || '     ' || D);
		    
	    
        END LOOP;
	
	  ELSE
	        
		DBMS_OUTPUT.PUT_LINE('No Record Found');
	
	END if;
	
END;
/

COMMIT;