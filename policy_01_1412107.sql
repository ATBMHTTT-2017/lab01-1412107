--Ch? tr??ng ph�ng ???c ph�p c?p nh?t v� th�m th�ng tin v�o d? �n (DAC).
--tao role TRUONGPHONG
--connect sys
create role TRUONGPHONG;
--connect account owner database of congty
grant insert, update on DUAN to TRUONGPHONG;
--connect sys
grant TRUONGPHONG to NSTR, KHTR, DATR, KDTR, TTTR;