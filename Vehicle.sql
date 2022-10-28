
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT VehicleID NUMBER PROMPT 'Enter Vehicle ID: '


DECLARE
	
	X NUMBER := &VehicleID;
    A Customer.c_name%Type;
	C Customer.CB_time%Type;
	D Customer.CB_date%Type;
	E Customer.CP_place%Type;
	F Vehicle1.v_number%TYPE;
	no_of_rows INT;
	
BEGIN

    FOR S IN(SELECT v_number FROM Vehicle1 WHERE v_id = X) LOOP
	
		F:= S.v_number;
		
	    DBMS_OUTPUT.PUT_LINE('Vehicle Number: '|| F);
		
	END LOOP;
	
	
    SELECT COUNT(1) INTO no_of_rows FROM Booking where Booking.v_id= X and rownum=1;
	
	IF no_of_rows > 0 THEN
	
	    FOR R IN (SELECT c_name,CB_time,CB_date,CP_place FROM Customer C INNER JOIN Booking B ON C.c_phone=B.c_phone WHERE B.v_id = X) LOOP
		
			A:= R.c_name; 
		    C:= R.CB_time; 
		    D:= R.CB_date; 
		    E:= R.CP_place;
		
		
		DBMS_OUTPUT.PUT_LINE('Customer Details: '|| A || '     ' || C || '     ' || D || '     ' || E);
		    
	    
        END LOOP;
	
	  ELSE
	        
		DBMS_OUTPUT.PUT_LINE('No Record Found');
	
	END if;
	
END;
/

COMMIT;