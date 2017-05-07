--connect as ownerDBCONGTY

----------------------------------1. create tables------------------------------------
--1. PHONGBAN
Create table PHONGBAN_1412107(
	MAPHG varchar2(15) not null,
	TENPHG nvarchar2(30),
	TRPHG varchar2(15),
  NG_NHANCHUC date,
	soNhanVien int,
  chiNhanh int,
	constraint PK_PHONGBAN_1412107 primary key (MAPHG)
);
--2. NHANVIEN
Create table NHANVIEN_1412107(
	MANV varchar2(15) not null,
	HOTEN nvarchar2(50),
  diaChi varchar2(50),
  dienThoai varchar2(15),
  email nvarchar2(50),
  MAPHG varchar2(15),
  chiNhanh int,
	LUONG float,
  MATKHAU varchar2(15),
	constraint PK_NHANVIEN_1412107 primary key (MANV)
);
--3. CHINHANH
Create table CHINHANH_1412107(
  maCN int not null,
  tenCN nvarchar2(50),
  truongChiNhanh varchar2(15),
  constraint PK_CHINHANH_1412107 primary key (maCN)
);
--4. DUAN
Create table DUAN_1412107(
  maDA varchar2(15) not null,
  tenDA nvarchar2(50),
  kinhPhi float,
  phongChuTri varchar2(15),
  truongDA varchar2(15),
  constraint PK_DUAN_1412107 primary key (maDA)
);
--5. CHITIEU
Create table CHITIEU_1412107(
  maChiTieu varchar2(15) not null,
  tenChiTieu nvarchar2(50),
  soTien float,
  duAn varchar2(15),
  constraint PK_CHITIEU_1412107 primary key (maChiTieu)
);
--6. PHANCONG
Create table PHANCONG_1412107(
  MANV varchar2(15) not null,
  maDA varchar2(15) not null,
  vaiTro nvarchar2(50),
  phuCap float,
  constraint PK_PHANCONG_1412107 primary key (MANV, maDA)
);

-------------------------------2. create foreign key------------------------------------------
--1. PHONGBAN
Alter table PHONGBAN_1412107 add(
constraint FK_PHONGBAN_NHANVIEN_1412107 foreign key(TRPHG) references NHANVIEN_1412107(MANV),
constraint FK_PHONGBAN_CHINHANH_1412107 foreign key(chiNhanh) references CHINHANH_1412107(maCN)
);
--2. NHANVIEN
Alter table NHANVIEN_1412107 add(
constraint FK_NHANVIEN_PHONGBAN_1412107 foreign key(MAPHG) references PHONGBAN_1412107(MAPHG),
constraint FK_NHANVIEN_CHINHANH_1412107 foreign key(chiNhanh) references CHINHANH_1412107(maCN)
);
--3. CHINHANH
Alter table CHINHANH_1412107 add(
constraint FK_CHINHANH_NHANVIEN_1412107 foreign key(truongChiNhanh) references NHANVIEN_1412107(MANV)
);
--4. DUAN
Alter table DUAN_1412107 add(
constraint FK_DUAN_PHONGBAN_1412107 foreign key (phongChuTri) references PHONGBAN_1412107(MAPHG),
constraint FK_DUAN_NHANVIEN_1412107 foreign key (truongDA) references NHANVIEN_1412107(MANV)
);
--5. CHITIEU
Alter table CHITIEU_1412107 add(
constraint FK_CHITIEU_DUAN_1412107 foreign key(duAn) references DUAN_1412107(maDA)
);
--6. PHANCONG
Alter table PHANCONG_1412107 add(
constraint FK_PHANCONG_DUAN_1412107 foreign key(maDA) references DUAN_1412107(maDA),
constraint FK_PHANCONG_NHANVIEN_1412107 foreign key(MANV) references NHANVIEN_1412107(MANV)
);

-------------------------------------3. insert data-------------------------------------------
--1. PHONGBAN_1412107
Insert into PHONGBAN_1412107 values ('PNS', N'Nhân S?', null, '22/May/1978', null, null);
Insert into PHONGBAN_1412107 values ('PKH', N'K? Ho?ch', null, '01/Jan/1985', null, null);
Insert into PHONGBAN_1412107 values ('PDA', N'?? Án', null, '19/Jun/1971', null, null);
Insert into PHONGBAN_1412107 values ('PKD', N'Kinh Doanh', null, '23/Jul/1972', null, null);
Insert into PHONGBAN_1412107 values ('PTT', N'Thông Tin', null, '23/Jul/1972', null, null);



