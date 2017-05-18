--Chi truong phong duoc phep cap nhat va them thong tin vao du an
--create role TRUONGPHONG
--connect as sys
create role ROLE_TRUONGPHONG;
--connect as sysadmin
grant select, insert, update on DUAN_1412107 to ROLE_TRUONGPHONG;
--connect sys
grant ROLE_TRUONGPHONG to NSTR, KHTR, DATR, KDTR, TTTR;
--connect NSTR to test
select * from sysadmin.DUAN_1412107;
