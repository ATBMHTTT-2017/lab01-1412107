--policy4
--create role tat ca cac nhan vien binh thuong
--connect sys
create role ROLE_NHANVIEN_THUONG;
--grant select to role ROLE_NHANVIEN_THUONG;
--connect ownerDBCONGTY
grant select on NHANVIEN_1412107 to ROLE_NHANVIEN_THUONG;
--grant role to cac nhanvien
--connect ownerDBCONGTY
grant ROLE_NHANVIEN_THUONG to NS001, KH001, DA001, KD001, TT001;
--connect NS001 to test
--select * from ownerDBCONGTY.NHANVIEN_1412107;
--grant select to sysadmin
--connect ownerDBCONGTY
grant select on NHANVIEN_1412107 TO sysadmin;
--connect sysadmin to test
select * from ownerDBCONGTY.NHANVIEN_1412107 ;


--Create a PL/SQL Package to Set the Application Context
--connect sysadmin
CREATE OR REPLACE CONTEXT nhanvien_ctx USING nhanvien_ctx_pkg;
CREATE OR REPLACE PACKAGE nhanvien_ctx_pkg IS 
  PROCEDURE set_Po4;
 END;
/
CREATE OR REPLACE PACKAGE BODY nhanvien_ctx_pkg IS
  PROCEDURE set_Po4
  AS
    nhanvienMANV varchar2(15);
  BEGIN
     SELECT MANV INTO nhanvienMANV FROM ownerDBCONGTY.NHANVIEN_1412107
        WHERE MANV = SYS_CONTEXT('USERENV', 'SESSION_USER');
     DBMS_SESSION.SET_CONTEXT('nhanvien_ctx', 'MANV', nhanvienMANV);
  EXCEPTION
   WHEN NO_DATA_FOUND THEN NULL;
  END set_Po4;
END;
/
--Create a Logon Trigger to Run the Application Context PL/SQL Package
--connect sysadmin
CREATE TRIGGER set_Po4_ctx_trig AFTER LOGON ON DATABASE
 BEGIN
  sysadmin.nhanvien_ctx_pkg.set_Po4;
 END;
 /
--drop trigger set_Po4_ctx_trig;
 --test the logon trigger should set the application context for the user
 --connect NS001, KH001 or any account to test
 SELECT SYS_CONTEXT('nhanvien_ctx', 'MANV') nhanvienMANV FROM DUAL;
 
 --connect sysadmin
 --create a PL/SQL function
 CREATE OR REPLACE FUNCTION get_nhanvien_infor(
  schema_p   IN VARCHAR2,
  table_p    IN VARCHAR2)
 RETURN VARCHAR2
 AS
  nhanvien_pred VARCHAR2 (400);
 BEGIN
  nhanvien_pred := 'MANV = SYS_CONTEXT("nhanvien_ctx", "MANV")'; 
 RETURN nhanvien_pred;
END;
/
--connect NS001 t0 test
select * from OWNERDBCONGTY.NHANVIEN_1412107;
--ok

--Create the New Security Policy
BEGIN
 DBMS_RLS.ADD_POLICY (
  object_schema    => 'ownerDBCONGTY', 
  object_name      => 'NHANVIEN_1412107', 
  policy_name      => 'Policy4', 
  function_schema  => 'sysadmin',
  policy_function  => 'get_nhanvien_infor', 
  statement_types  => 'select',
  sec_relevant_cols => 'LUONG');
END;
/
--connect NS001 t0 test
select * from OWNERDBCONGTY.NHANVIEN_1412107;
--not ok