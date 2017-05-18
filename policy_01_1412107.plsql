--Chi truong phong duoc phep cap nhat va them thong tin vao du an
--create role TRUONGPHONG
--connect as sys
create role ROLE_TRUONGPHONG;
--connect as sysadmin_lab01
grant select, insert, update on DUAN to ROLE_TRUONGPHONG;
--connect sys
grant ROLE_TRUONGPHONG to NSTR, KHTR, DATR, KDTR, TTTR;
--connect NSTR to test
select * from sysadmin_lab01.DUAN;
