--tao role ROEL_TRUONGDUAN, chua cac truong duan
--connect sys
create role ROLE_TRUONGDUAN;
--grant select, insert, update on DUAN_1412107 to ROLE_TRUOONGDUAN
--connect sysadmin
grant select, insert, update to ROLE_TRUONGDUAN;
--grant ROLE_TRUONGDUAN to cac truong du an
--connect sys
grant ROLE_TRUONGDUAN to DANS001TR, DAKH001TR, DADA001TR, DAKD001TR, DATT001TR;
