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
