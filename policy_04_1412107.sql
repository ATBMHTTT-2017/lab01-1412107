--policy4
--create role tat ca cac nhan vien binh thuong
--connect sys
create role ROLE_NHANVIEN_THUONG;
--grant select to role ROLE_NHANVIEN_THUONG;
--connect sysadmin
grant select on NHANVIEN_1412107 to ROLE_NHANVIEN_THUONG;
--grant role to cac nhanvien
--connect sysadmin
grant ROLE_NHANVIEN_THUONG to NS001, KH001, DA001, KD001, TT001;
--connect NS001 to test
select * from sysadmin.NHANVIEN_1412107;
