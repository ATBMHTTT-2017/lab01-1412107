--policy4
--create role tat ca cac nhan vien binh thuong
--connect sys
create role ROLE_NHANVIEN_THUONG;
--grant select to role ROLE_NHANVIEN_THUONG;
--connect sysadmin_lab01
grant select on NHANVIEN to ROLE_NHANVIEN_THUONG;
--grant role to cac nhanvien
--connect sysadmin_lab01
grant ROLE_NHANVIEN_THUONG to NS001, KH001, DA001, KD001, TT001;
--connect NS001 to test
select * from sysadmin_lab01.NHANVIEN;
----------sau khi tao chinh sach, thi nhan vien se bi gioi han quyen
--connect sysadmin_lab01
CREATE OR REPLACE FUNCTION FUNCTION_XEM_THONGTIN_CANHAN(P_SCHEMA VARCHAR2,P_OBJ VARCHAR2)
RETURN VARCHAR2
AS
USER NVARCHAR2(15);
TEMP NVARCHAR2(200);
BEGIN
  USER := SYS_CONTEXT('USERENV','SESSION_USER');
  if USER in ('NS001', 'KH001', 'DA001', 'KD001', 'TT001') then
    TEMP := 'MANV = ''' || SYS_CONTEXT('USERENV','SESSION_USER')||'''';
      RETURN TEMP;
  ELSE
    RETURN ''; 
  END IF;
END;
--connect sys
GRANT EXECUTE ON DBMS_RLS TO sysadmin_lab01;
--connect sysadmin_lab01
BEGIN
dbms_rls.add_policy(
object_schema => 'sysadmin_lab01',
object_name => 'NHANVIEN',
policy_name => 'PO4',
function_schema => 'sysadmin_lab01',
policy_function => 'FUNCTION_XEM_THONGTIN_CANHAN',
statement_types => 'SELECT',
sec_relevant_cols => 'LUONG',
update_check => TRUE
);
END;
--connect NS001 to test
select * from sysadmin_lab01.NHANVIEN;
select MANV, HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHG, CHINHANH, MATKHAU from sysadmin_lab01.NHANVIEN; 
