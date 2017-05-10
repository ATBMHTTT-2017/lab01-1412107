--Ch? tr??ng phòng ???c phép c?p nh?t và thêm thông tin vào d? án (DAC).
--tao role TRUONGPHONG
--connect sys
create role TRUONGPHONG;
--connect account owner database of congty
grant insert, update on DUAN to TRUONGPHONG;
--connect sys
grant TRUONGPHONG to NSTR, KHTR, DATR, KDTR, TTTR;