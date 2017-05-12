--create role ROLE_GIAMDOC
--connect as sys
create role ROLE_GIAMDOC;
--create view VIEW_DUAN
--connect ownerDBCONGTY
create view VIEW_DUAN as(
select DUAN_1412107.maDA as mada , DUAN_1412107.tenDA as tenda, DUAN_1412107.kinhPhi as kinhphi, PHONGBAN_1412107.TENPHG as phongchutri
, CHINHANH_1412107.tenCN as chinhanhchutri , NHANVIEN_1412107.HOTEN as truongduan, sum(DUAN_1412107.kinhPhi) as tongchi
from DUAN_1412107, PHONGBAN_1412107, CHINHANH_1412107, NHANVIEN_1412107
where DUAN_1412107.phongChuTri = PHONGBAN_1412107.MAPHG and PHONGBAN_1412107.chiNhanh = CHINHANH_1412107.maCN
and CHINHANH_1412107.maCN = NHANVIEN_1412107.chiNhanh
group by (mada, tenda, kinhphi, phongchutri, chinhanhchutri, truongduan)
);
--grant select on VIEW_DUAN to role ROLE_GIAMDOC
--connect ownerDBCONGTY
grant select on VIEW_DUAN to ROLE_GIAMDOC;
--grant role ROLE_GIAMDOC to GIAMDOC: GD001, GD002, GD003, GD004, GD005
--connect sys
grant ROLE_GIAMDOC to GD001, GD002, GD003, GD004, GD005;
--connect as GD001, GD002, GD003, GD004, GD005
select * from ownerDBCONGTY.VIEW_DUAN;
