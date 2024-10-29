use btl_restman;

DROP PROCEDURE IF EXISTS get_bandat_by_tenban;
DROP PROCEDURE IF EXISTS get_khachhang_by_id;
DROP PROCEDURE IF EXISTS get_banan_by_id;
DROP PROCEDURE IF EXISTS GetBandatMonAnAndComboInfoByBandatId;
DROP PROCEDURE IF EXISTS GetBandatMonAnInfoByBandatId;
DROP PROCEDURE IF EXISTS timBantheoTenBan;
DROP PROCEDURE IF EXISTS timkiemmonantheoten;
DROP PROCEDURE IF EXISTS CheckUserCredentials;
DROP PROCEDURE IF EXISTS sp_kiemtra_vitri_nhanvien232;
DROP PROCEDURE IF EXISTS get_khachhang_info_by_id;
DROP PROCEDURE IF EXISTS get_NVBH_info_by_id;

DELIMITER //

CREATE PROCEDURE get_bandat_by_tenban(IN tenban_input VARCHAR(255))
BEGIN
    SELECT b.id, b.thoigiandat, b.thoigianan, b.confirmdat, b.mota, 
           b.tblkhachhang232id, b.tblnhanvienbanhang232id, b.tblbanan232id
    FROM tblbandat232 b
    JOIN tblbanan232 ba ON b.tblbanan232id = ba.id
    WHERE ba.tenban LIKE CONCAT('%', tenban_input, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE get_khachhang_info_by_id(IN khachhang_id INT)
BEGIN
    SELECT nguoidung.id, nguoidung.username, nguoidung.password, nguoidung.hovaten, 
           nguoidung.diachi, nguoidung.sdt, nguoidung.ghichu, nguoidung.vaitro
    FROM tblnguoidung232 AS nguoidung
    JOIN tblkhachhang232 AS khachhang ON nguoidung.id = khachhang.tblnguoidung232id
    WHERE nguoidung.id = khachhang_id;
END //

DELIMITER //

CREATE PROCEDURE get_NVBH_info_by_id(IN nhanvienbanhang_id INT)
BEGIN
    SELECT 
        nguoidung.id AS nguoidung_id,
        nguoidung.username,
        nguoidung.password,
        nguoidung.hovaten,
        nguoidung.diachi,
        nguoidung.sdt,
        nguoidung.ghichu,
        nguoidung.vaitro,
        nhanvien.vitri
    FROM 
        tblnguoidung232 AS nguoidung
    JOIN 
        tblnhanvien232 AS nhanvien ON nguoidung.id = nhanvien.tblnguoidung232id
    JOIN 
        tblnhanvienbanhang232 AS nhanvienbanhang ON nhanvien.tblnguoidung232id = nhanvienbanhang.tblnhanvien232tblnguoidung232id
    WHERE 
        nguoidung.id = nhanvienbanhang_id;
END //

DELIMITER ;



DELIMITER ;

DELIMITER //

CREATE PROCEDURE get_banan_by_id(IN banan_id INT)
BEGIN
    SELECT * FROM tblbanan232
    WHERE id = banan_id;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE GetBandatMonAnAndComboInfoByBandatId(
    IN tblbandat232id INT
)
BEGIN
    SELECT 
        bdm.id AS bandatmonan_id,
        bdm.dongia AS dongia_mondat,
        bdm.soluong AS so_luong,
        c.id AS combo_id,
        c.ten AS ten_combo,
        c.mota AS mo_ta_combo
    FROM 
        tblbandatmonan232 bdm
    LEFT JOIN 
        tblbandatcombo232 bdcombo ON bdm.tblbandat232id = bdcombo.tblbandat232id
    LEFT JOIN 
        tblcombo232 c ON bdcombo.tblcombo232id = c.id
    WHERE 
        bdm.tblbandat232id = tblbandat232id;  -- Lọc theo tblbandat232id

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetBandatMonAnInfoByBandatId(
    IN tblbandat232id INT
)
BEGIN
    SELECT 
        bdm.id AS bandatmonan_id,
        bdm.dongia AS dongia_mondat,
        bdm.soluong AS so_luong,
        m.id AS monan_id,
        m.ten AS ten_mon,
        m.mota AS mo_ta,
        m.dongia AS dongia_monan
    FROM 
        tblbandatmonan232 bdm
    JOIN 
        tblmonan232 m ON bdm.tblmonan232id = m.id
    WHERE 
        bdm.tblbandat232id = tblbandat232id;  -- Lọc theo tblbandat232id

END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE timBantheoTenBan(
    IN tenBan VARCHAR(255)
)
BEGIN
    SELECT 
        kh.tblnguoidung232id AS ten_khach_hang,  -- Tên khách hàng từ bảng tblkhachhang232
        nv.tblnhanvien232tblnguoidung232id AS ten_nhan_vien, -- Tên nhân viên từ bảng tblnhanvienbanhang232
        ban.tenban AS ten_ban,
        bd.thoigiandat AS thoi_gian_dat,
        bd.id AS ma_ban_dat
    FROM 
        tblbandat232 bd
    JOIN 
        tblbanan232 ban ON bd.tblbanan232id = ban.id
    JOIN 
        tblkhachhang232 kh ON bd.tblkhachhang232id = kh.tblnguoidung232id
    JOIN 
        tblnhanvienbanhang232 nv ON bd.tblnhanvienbanhang232id = nv.tblnhanvien232tblnguoidung232id
    WHERE 
        ban.tenban LIKE CONCAT('%', tenBan, '%');  -- Sử dụng LIKE để tìm tên bàn gần giống

END //

DELIMITER ;
-- end 1-- 

DELIMITER //

CREATE PROCEDURE timkiemmonantheoten(IN ten_mon_an VARCHAR(255))
BEGIN
    SELECT * 
    FROM tblmonan232 
    WHERE ten LIKE CONCAT('%', ten_mon_an, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CheckUserCredentials(
    IN input_username VARCHAR(255),
    IN input_password VARCHAR(255)
)
BEGIN
    -- Kiểm tra xem người dùng có tồn tại với username và password đã nhập
    IF EXISTS (SELECT * FROM tblnguoidung232 WHERE username = input_username AND password = input_password) THEN
        -- Trả về thông tin người dùng nếu tồn tại
        SELECT id, username, password, hovaten, diachi, sdt, ghichu, vaitro
        FROM tblnguoidung232
        WHERE username = input_username AND password = input_password;
    ELSE
        -- Nếu không tìm thấy người dùng, báo lỗi
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sai tên đăng nhập hoặc mật khẩu.';
    END IF;
END //

CREATE PROCEDURE sp_kiemtra_vitri_nhanvien232(
    IN in_nhanvien_id INT,    -- Đầu vào là ID nhân viên--
    OUT out_vitri VARCHAR(255)  -- Đầu ra là vị trí của nhân viên
)
BEGIN
    -- Kiểm tra xem nhân viên có tồn tại không và trả về vị trí
    SELECT vitri
	INTO out_vitri
    FROM tblnhanvien232
     WHERE tblnguoidung232id = in_nhanvien_id;

     -- Nếu không có kết quả, trả về null
     IF out_vitri IS NULL THEN
         SET out_vitri = 'Không tìm thấy nhân viên';
     END IF;
END //


DELIMITER ;

