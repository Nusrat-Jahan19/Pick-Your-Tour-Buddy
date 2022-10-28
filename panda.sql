DROP PROCEDURE Customer_Info;

CREATE OR REPLACE PROCEDURE Customer_Info( Y in Customer.c_id%TYPE,Z in Customer.c_phone%Type, L in Customer.CB_time%Type, M in Customer.CB_date%Type, N in Customer.CP_place%Type)
IS
ID_Found int:=0;

BEGIN

	FOR R IN(select * from  Customer WHERE c_name=Y and c_phone=Z and CB_time=L and CB_date=M and CP_place=N) loop
		ID_Found:=1;
	end loop;

  

END Customer_Info;
/
