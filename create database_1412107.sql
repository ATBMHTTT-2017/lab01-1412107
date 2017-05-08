--connect as ownerDBCONGTY

----------------------------------1. create tables------------------------------------
--1. PHONGBAN
Create table PHONGBAN_1412107(
	MAPHG varchar2(15) not null,
	TENPHG nvarchar2(30),
	TRPHG varchar2(15),
  NG_NHANCHUC date,
	soNhanVien int,
  chiNhanh varchar2(15),
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
  chiNhanh varchar2(15),
	LUONG float,
  MATKHAU varchar2(15),
	constraint PK_NHANVIEN_1412107 primary key (MANV)
);
--3. CHINHANH
Create table CHINHANH_1412107(
  maCN varchar2(15) null,
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
Insert into PHONGBAN_1412107 values ('PNS', N'Nh�n S?', null, '22/May/1978', null, null);
Insert into PHONGBAN_1412107 values ('PKH', N'K? Ho?ch', null, '01/Jan/1985', null, null);
Insert into PHONGBAN_1412107 values ('PDA', N'?? �n', null, '19/Jun/1971', null, null);
Insert into PHONGBAN_1412107 values ('PKD', N'Kinh Doanh', null, '23/Jul/1972', null, null);
Insert into PHONGBAN_1412107 values ('PTT', N'Th�ng Tin', null, '23/Jul/1972', null, null);

----2. NHANVIEN_1412107
--------------1. truong duan
Insert into NHANVIEN_1412107 values ('DANS001TR', N'?inh B� Ti�n', N'119 C?ng Qu?nh, Tp HCM', '0123456789', N't@g', null, null, 30000,  'DANS001TR');
Insert into NHANVIEN_1412107 values ('DAKH001TR', N'Nguy?n Thanh T�ng', N'222 Nguy?n V?n C?, Tp HCM', '01343456789', N'tt@g', null, null, 23000,  'DAKH001TR');
Insert into NHANVIEN_1412107 values ('DADA001TR', N'Tr?n Ng?c H?ng ', N'332 Nguy?n Th�i H?c, Tp HCM', '01333456789', N'nh@g', null, null, 67000,  'DADA001TR');
Insert into NHANVIEN_1412107 values ('DAKD001TR', N'L� Qu?nh Nh?', N'291 H? V?n Hu�, Tp HCM', '01333456679', N'n@g', null, null, 12000,  'DAKD001TR');
Insert into NHANVIEN_1412107 values ('DATT001TR', N'Nguy?n Minh H�ng', N'95 B� R?a, V?ng T�u', '01333456129', N'mh@g', null, null, 55000,  'DATT001TR');
--------------2. truong phong
Insert into NHANVIEN_1412107 values ('NSTR', N'?inh B� Quy�n', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'bq@g', null, null, 52000,  'NSTR');
Insert into NHANVIEN_1412107 values ('KHTR', N'Nguy?n Th�i Vinh', N'222 Nguy?n Tr�i, Tp HCM', '01673456789', N'tv@g', null, null, 41000,  'KHTR');
Insert into NHANVIEN_1412107 values ('DATR', N'Tr?n H?i Xinh', N'332 L� Lai, Tp HCM', '06423456789', N'hx@g', null, null, 36000,  'DATR');
Insert into NHANVIEN_1412107 values ('KDTR', N'L� H?i Tri?u', N'291 H? Hu?, Tp HCM', '0133347869', N'ht@g', null, null, 43000,  'KDTR');
Insert into NHANVIEN_1412107 values ('TTTR', N'Nguy?n Ch??ng Ho�ng', N'95 B� R?a, V?ng T�u', '01333434529', N'ch@g', null, null, 47000,  'TTTR');
-------------3. truong chinhanh
Insert into NHANVIEN_1412107 values ('CN001TR', N'Tr?n Cao V�n', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'cv@g', null, null, 52000,  'CN001TR');
Insert into NHANVIEN_1412107 values ('CN002TR', N'Nguy?n Quy?n Linh', N'222 Nguy?n Tr�i, Tp HCM', '01673456789', N'ql@g', null, null, 41000,  'CN002TR');
Insert into NHANVIEN_1412107 values ('CN003TR', N'Tr?n Vi Linh', N'332 L� Lai, Tp HCM', '06423456789', N'vl@g', null, null, 36000,  'CN003TR');
Insert into NHANVIEN_1412107 values ('CN004TR', N'V� Tr??ng Giang', N'291 H? Hu?, Tp HCM', '0133347869', N'tg@g', null, null, 43000,  'CN004TR');
Insert into NHANVIEN_1412107 values ('CN005TR', N'Ho�ng V?n Th?nh', N'95 B� R?a, V?ng T�u', '01333434529', N'vt@g', null, null, 47000,  'CN005TR');
-------------4. nhanvien
Insert into NHANVIEN_1412107 values ('NS001', N'Ho�ng Th�i Th�nh', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'tt@g', null, null, 52000,  'NS001');
Insert into NHANVIEN_1412107 values ('KH001', N'Nguy?n V?n Linh', N'222 Nguy?n Tr�i, Tp HCM', '01673456789', N'vl@g', null, null, 41000,  'KH001');
Insert into NHANVIEN_1412107 values ('DA001', N'Tr?n Linh', N'332 L� Lai, Tp HCM', '06423456789', N'tl@g', null, null, 36000,  'DA001');
Insert into NHANVIEN_1412107 values ('KD001', N'V� Tr??ng', N'291 H? Hu?, Tp HCM', '0133347869', N'vg@g', null, null, 43000,  'KD001');
Insert into NHANVIEN_1412107 values ('TT001', N'Ho�ng Th?nh', N'95 B� R?a, V?ng T�u', '01333434529', N'ht@g', null, null, 47000,  'TT001');
--------------5. giam doc
Insert into NHANVIEN_1412107 values ('GD001', N'Ho�ng Th�i', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'tt@g', null, null, 52000,  'GD001');
Insert into NHANVIEN_1412107 values ('GD002', N'Nguy?n Xinh', N'222 Nguy?n Tr�i, Tp HCM', '01673456789', N'nx@g', null, null, 41000,  'GD002');
Insert into NHANVIEN_1412107 values ('GD003', N'Tr?n Phi', N'332 L� Lai, Tp HCM', '06423456789', N'tp@g', null, null, 36000,  'GD003');
Insert into NHANVIEN_1412107 values ('GD004', N'V� H?i', N'291 H? Hu?, Tp HCM', '0133347869', N'vh@g', null, null, 43000,  'GD004');
Insert into NHANVIEN_1412107 values ('GD005', N'Ho�ng Ch�', N'95 B� R?a, V?ng T�u', '01333434529', N'hc@g', null, null, 47000,  'GD005');



--3. CHINHANH_1412107
--4. DUAN_1412107
Insert into DUAN_1412107 values ('DANS001', N'Nh�n S?', null, '22/May/1978', null, null);
Insert into PHONGBAN_1412107 values ('PKH', N'K? Ho?ch', null, '01/Jan/1985', null, null);
Insert into PHONGBAN_1412107 values ('PDA', N'?? �n', null, '19/Jun/1971', null, null);
Insert into PHONGBAN_1412107 values ('PKD', N'Kinh Doanh', null, '23/Jul/1972', null, null);
Insert into PHONGBAN_1412107 values ('PTT', N'Th�ng Tin', null, '23/Jul/1972', null, null);
--5. CHITIEU
--6. PHANCONG


