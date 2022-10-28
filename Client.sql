SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT B CHAR PROMPT 'ENTER YOUR NAME: '
ACCEPT C CHAR PROMPT 'ENTER YOUR NUMBER: '
ACCEPT E DATE FORMAT 'dd/mm/yyyy' PROMPT 'ENTER BOOKING DATE: '


CREATE OR REPLACE TRIGGER RegClient
AFTER INSERT
ON Client
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Client info inserted.');
END;
/


CREATE OR REPLACE PACKAGE Client_P AS

    PROCEDURE Client_Info(Y IN Client.c_name%Type, Z IN Client.c_phone%Type, M IN Client.CB_date%Type);
	
	FUNCTION Valid_Client(Y IN Client.c_name%Type, Z IN Client.c_phone%Type, M IN Client.CB_date%Type)
    RETURN NUMBER;
	
END Client_P;
/


CREATE OR REPLACE PACKAGE BODY Client_P  AS

    PROCEDURE Client_Info(Y IN Client.c_name%Type, Z IN Client.c_phone%Type, M IN Client.CB_date%Type)
    IS
    Flag int;

        BEGIN
            Flag:= Valid_Client(Y,Z,M);
	        IF Flag=0 THEN
		        INSERT INTO Client(c_name, c_phone,CB_date) VALUES (Y,Z,M);
	        ELSIF Flag=1 THEN
		        DBMS_OUTPUT.PUT_LINE('Client info is not valid.');
	        END IF;
    END Client_Info;



    FUNCTION Valid_Client(Y IN Client.c_name%Type, Z IN Client.c_phone%Type, M IN Client.CB_date%Type)
    RETURN NUMBER
    IS
    Flag int;

        BEGIN
            Flag:=0;
	            FOR R IN(SELECT * FROM  Client WHERE c_name=Y and c_phone=Z and CB_date=M ) LOOP
		            Flag:=1;
	            END LOOP;
            RETURN Flag ;
    END Valid_Client;
	
END Client_P ;
/


DECLARE

	name varchar2(20);
	phone int;
	pdate date;
	flag int;	
	Error Exception; 
	

BEGIN

   	name:='&B';
	phone:= &C;
	pdate:= '&E';

	
	
    FOR R IN (SELECT c_phone FROM Client WHERE c_phone=phone ) LOOP
        FOR P IN (SELECT * FROM Booked) LOOP 
			IF P.c_phone=R.c_phone THEN
			RAISE Error; 
            END IF;
		END LOOP;
	END LOOP;
    Client_P.Client_Info(name,phone,pdate);
	
    EXCEPTION
        WHEN Error THEN
	        DBMS_OUTPUT.PUT_LINE('Phone number is already exits.Not allowed using same number twice for booking!');
	
	
END;
/


select * from Client;



COMMIT;

--select * from Client@site1;

--create or replace view view_client as
--select * from Client@site1;

--select * from view_client;
--commit;
