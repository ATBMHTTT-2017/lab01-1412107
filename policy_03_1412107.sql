---------------------
--create procedure 
--connect as sysadmin

CREATE OR REPLACE PROCEDURE procedure_Update_PHONGBAN_1412107
    ( maphong IN varchar2, tenphong IN nvarchar2, matruongphong IN varchar2
    , ngaynhanchuc IN date, sonhanvien IN int, chinhanh IN varchar2) 
IS
BEGIN
  if tenphong!= null then update PHONGBAN_1412107 SET TENPHG = tenphong where maphong = MAPHG;
  end if;
  if matruongphong!= null then update PHONGBAN_1412107 SET  TRPHG =  matruongphong where maphong = MAPHG;
  end if;
  if ngaynhanchuc!= null then update PHONGBAN_1412107 SET NG_NHANCHUC = ngaynhanchuc where maphong = MAPHG;
  end if;
  if sonhanvien!= null then update PHONGBAN_1412107 SET soNhanVien = sonhanvien where maphong = MAPHG;
  end if;
  if chinhanh!= null then update PHONGBAN_1412107 SET chiNhanh = chinhanh where maphong = MAPHG;
  end if;
  EXCEPTION
  WHEN OTHERS THEN
     raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END procedure_Update_PHONGBAN_1412107;