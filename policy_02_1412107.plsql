--create role ROLE_GIAMDOC
--connect as sys
create role ROLE_GIAMDOC;
--create view VIEW_DUAN
--connect as sysadmin_lab01
create view VIEW_DUAN as(
select DUAN.maDA as mada , DUAN.tenDA as tenda, DUAN.kinhPhi as kinhphi, PHONGBAN.TENPHG as phongchutri
, CHINHANH.tenCN as chinhanhchutri , NHANVIEN.HOTEN as tentruongduan, sum(DUAN.kinhPhi) as tongchi from DUAN, PHONGBAN, CHINHANH, NHANVIEN
where DUAN.phongChuTri = PHONGBAN.MAPHG and PHONGBAN.chiNhanh = CHINHANH.maCN
and CHINHANH.maCN = NHANVIEN.chiNhanh
);
--view not ok
--grant select on VIEW_DUAN to role ROLE_GIAMDOC
--connect as sysadmin
grant select on VIEW_DUAN to ROLE_GIAMDOC;
--grant role ROLE_GIAMDOC to GIAMDOC: GD001, GD002, GD003, GD004, GD005
--connect as sys
grant ROLE_GIAMDOC to GD001, GD002, GD003, GD004, GD005;
--connect as GD001, GD002, GD003, GD004, GD005 to test
select * from sysadmin.VIEW_DUAN;
