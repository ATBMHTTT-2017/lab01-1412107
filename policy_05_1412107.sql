--tao role ROEL_TRUONGDUAN, chua cac truong duan
--connect sys
create role ROLE_TRUONGDUAN;
--grant select, insert, update on DUAN_1412107 to ROLE_TRUOONGDUAN
--connect ownerDBCONGTY
grant select, insert, update to ROLE_TRUONGDUAN;
--grant ROLE_TRUONGDUAN to cac truong du an
--connect sys
grant ROLE_TRUONGDUAN to DANS001TR, DAKH001TR, DADA001TR, DAKD001TR, DATT001TR;

--Create a PL/SQL Package to Set the Application Context
--connect sysadmin
CREATE OR REPLACE CONTEXT chitieu_ctx USING chitieu_ctx_pkg;
CREATE OR REPLACE PACKAGE chitieu_ctx_pkg IS 
  PROCEDURE set_Po5;
 END;
/
CREATE OR REPLACE PACKAGE BODY chitieu_ctx_pkg IS
  PROCEDURE set_Po5
  AS
    maDA_Var varchar2(15);
    dangnhap varchar2(15);    
  BEGIN
  dangnhap := SYS_CONTEXT('USERENV', 'SESSION_USER');
  if dangnhap in(select truongDUAN from ownerDBCONGTY.DUAN_1412107 ) then 
     SELECT ownerDBCONGTY.DUAN_1412107.maDA INTO maDA_Var FROM ownerDBCONGTY.DUAN_1412107, ownerDBCONGTY.CHITIEU_1412107
        WHERE ownerDBCONGTY.DUAN_1412107.truongDA = dangnhap;
     DBMS_SESSION.SET_CONTEXT('chitieu_ctx', 'maDA', maDA_Var);
  end if;
  EXCEPTION
   WHEN NO_DATA_FOUND THEN NULL;
  END set_Po5;
END;
/

--Create a Logon Trigger to Run the Application Context PL/SQL Package
--connect sysadmin
CREATE TRIGGER set_Po5_ctx_trig AFTER LOGON ON DATABASE
 BEGIN
  sysadmin.chitieu_ctx_pkg.set_Po5;
 END;
 /
drop trigger set_Po5_ctx_trig;
 --test the logon trigger should set the application context for the user
 --connect NS001, KH001 or any account to test
 SELECT SYS_CONTEXT('chitieu_ctx', 'maDA') maDA FROM DUAL;
 
 --connect sysadmin
 --create a PL/SQL function
 CREATE OR REPLACE FUNCTION get_set_chitieu_infor(
  schema_p   IN VARCHAR2,
  table_p    IN VARCHAR2)
 RETURN VARCHAR2
 AS
  chitieu_pred VARCHAR2 (400);
 BEGIN
  chitieu_pred := ' maDA = SYS_CONTEXT("chitieu_ctx", "maDA")'; 
 RETURN chitieu_pred;
END;
/
--connect DANS001TR, DAKH001TR t0 test
select * from OWNERDBCONGTY.CHITIEU_1412107;

 --connect sysadmin
--Create the New Security Policy
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'ownerDBCONGTY', 
  object_name      => 'CHITIEU_1412107', 
  policy_name      => 'Polic5', 
  function_schema  => 'sysadmin',
  policy_function  => 'get_set_chitieu_infor', 
  statement_types  => 'select, insert, update'
  );
END;
/