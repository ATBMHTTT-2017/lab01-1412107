--tao role ROEL_TRUONGDUAN, chua cac truong duan
--connect sys
create role ROLE_TRUONGDUAN;
--grant select, insert, update on DUAN to ROLE_TRUOONGDUAN
--connect sysadmin_lab01
grant select, insert, update on DUAN to ROLE_TRUONGDUAN;
--grant ROLE_TRUONGDUAN to cac truong du an
--connect sys
grant ROLE_TRUONGDUAN to DANS001TR, DAKH001TR, DADA001TR, DAKD001TR, DATT001TR;
--grant select, insert, update on DUAN to ROLE_TRUOONGDUAN
--connect sysadmin_lab01
grant select, insert, update on CHITIEU to ROLE_TRUONGDUAN;
--test
--connect as DANS001TR
select * from sysadmin_lab01.DUAN;
select * from sysadmin_lab01.CHITIEU;
--chua tao ham
--connect sysadmin_lab01
--truong duan an doc, ghi thong tin du an minh quan ly
CREATE OR REPLACE FUNCTION FUNCTION_CAPNHAT_CHITIEU(P_SCHEMA VARCHAR2,P_OBJ VARCHAR2)
RETURN VARCHAR2
AS
USER NVARCHAR2(15);
TEMP NVARCHAR2(200);
MADA_TRGDA VARCHAR2(15);
BEGIN
  USER := SYS_CONTEXT('USERENV','SESSION_USER');
  if USER in ('DANS001TR', 'DAKH001TR', 'DADA001TR', 'DAKD001TR', 'DATT001TR') then
    Select maDA into MADA_TRGDA from sysadmin_lab01.DUAN where truongDA = USER;
    TEMP := 'duAn = ''' || MADA_TRGDA || '''';
    RETURN TEMP;
    else return '';
  END IF;
END;
BEGIN
dbms_rls.add_policy(
object_schema => 'sysadmin_lab01',
object_name => 'CHITIEU',
policy_name => 'PO5',
function_schema => 'sysadmin_lab01',
policy_function => 'FUNCTION_CAPNHAT_CHITIEU',
statement_types => 'select, insert, update',
update_check => TRUE
);
END;
--connect as DANS001TR, DAKH001TR, DADA001TR, DAKD001TR, DATT001TR to test
select * from sysadmin_lab01.CHITIEU;
--select ok
update sysadmin_lab01.CHITIEU CHITIEU set CHITIEU.SOTIEN = 15;
--update ok
insert into sysadmin_lab01.CHITIEU values('CTDANS001002', 'dat chuan cong so nhu tren', 25, 'DANS001');
--update ok
--policy5: ok

