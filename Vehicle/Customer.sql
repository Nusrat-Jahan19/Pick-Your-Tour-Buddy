

SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT B CHAR PROMPT 'ENTER YOUR NAME: '
ACCEPT C CHAR PROMPT 'ENTER YOUR NUMBER: '
ACCEPT D CHAR PROMPT 'ENTER BOOKING TIME: '
ACCEPT E DATE FORMAT 'dd/mm/yyyy' PROMPT 'ENTER PICKUP DATE: '
ACCEPT F CHAR PROMPT 'ENTER PICKUP PLACE: '

CREATE OR REPLACE TRIGGER Registration
AFTER INSERT
ON Customer
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Customer info inserted.');
END;
/


CREATE OR REPLACE PACKAGE Customer_P AS

    PROCEDURE Customer_Info(Y IN Customer.c_name%Type, Z IN Customer.c_phone%Type, 
    L IN Customer.CB_time%Type, M IN Customer.CB_date%Type, N IN Customer.CP_place%Type );
	
	FUNCTION Valid_Customer( Y IN Customer.c_name%Type, Z IN Customer.c_phone%Type, 
    L IN Customer.CB_time%Type, M IN Customer.CB_date%Type, N IN Customer.CP_place%Type )
    RETURN NUMBER;
	
END Customer_P;
/


CREATE OR REPLACE PACKAGE BODY Customer_P  AS

    PROCEDURE Customer_Info(Y IN Customer.c_name%Type, Z IN Customer.c_phone%Type, 
    L IN Customer.CB_time%Type, M IN Customer.CB_date%Type, N IN Customer.CP_place%Type )
    IS
    Flag int;

        BEGIN
            Flag:= Valid_Customer(Y,Z,L,M,N);
	        IF Flag=0 THEN
		        INSERT INTO Customer(c_name, c_phone, CB_time, CB_date, CP_place) VALUES (Y,Z,L,M,N);
	        ELSIF Flag=1 THEN
		        DBMS_OUTPUT.PUT_LINE('Customer info is not valid.');
	        END IF;
    END Customer_Info;



    FUNCTION Valid_Customer( Y IN Customer.c_name%Type, Z IN Customer.c_phone%Type, 
    L IN Customer.CB_time%Type, M IN Customer.CB_date%Type, N IN Customer.CP_place%Type )
    RETURN NUMBER
    IS
    Flag int;

        BEGIN
            Flag:=0;
	            FOR R IN(SELECT * FROM  Customer WHERE c_name=Y and c_phone=Z and CB_time=L and CB_date=M and CP_place=N) LOOP
		            Flag:=1;
	            END LOOP;
            RETURN Flag ;
    END Valid_Customer;
	
END Customer_P ;
/


DECLARE

	name varchar2(20);
	phone int;
	ptime varchar2(20);
	pdate date;
	place varchar2(20);
	flag int;	
	Error Exception; 
	

BEGIN

   	name:='&B';
	phone:= &C;
	ptime:='&D';
	pdate:= '&E';
	place:= '&F';
	
	
    FOR R IN (SELECT c_phone FROM Customer WHERE c_phone=phone ) LOOP
        FOR P IN (SELECT * FROM Booking) LOOP 
			IF P.c_phone=R.c_phone THEN
			RAISE Error; 
            END IF;
		END LOOP;
	END LOOP;
    Customer_P.Customer_Info(name,phone,ptime,pdate,place);
	
    EXCEPTION
        WHEN Error THEN
	        DBMS_OUTPUT.PUT_LINE('Phone number is already exits.Not allowed using same number twice for booking!');
	
	
END;
/


select * from Customer;


COMMIT;