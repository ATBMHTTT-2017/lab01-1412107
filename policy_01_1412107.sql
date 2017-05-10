--Chi truong phong duoc phep cap nhat va them thong tin vao du an
--create role TRUONGPHONG
--connect sys
create role ROLE_TRUONGPHONG;
--drop role ROLE_TRUONGPHONG;
--connect account: ownerDBCONGTY
grant select, insert, update on DUAN_1412107 to ROLE_TRUONGPHONG;
--connect sys
grant ROLE_TRUONGPHONG to NSTR, KHTR, DATR, KDTR, TTTR;
--connect NSTR to test
select * from ownerDBCONGTY.DUAN_1412107;
