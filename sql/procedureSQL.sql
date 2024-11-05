use btl_restman;

DROP PROCEDURE IF EXISTS get_bandat_by_tenban;
DROP PROCEDURE IF EXISTS get_khachhang_by_id;
DROP PROCEDURE IF EXISTS get_banan_by_id;
DROP PROCEDURE IF EXISTS timBantheoTenBan;
DROP PROCEDURE IF EXISTS timkiemmonantheoten;
DROP PROCEDURE IF EXISTS timkiemcombotheoten;
DROP PROCEDURE IF EXISTS CheckUserCredentials;
DROP PROCEDURE IF EXISTS sp_kiemtra_vitri_nhanvien232;
DROP PROCEDURE IF EXISTS get_khachhang_info_by_id;
DROP PROCEDURE IF EXISTS get_NVBH_info_by_id;
DROP PROCEDURE IF EXISTS getinforbandatcombo_by_bandatid;
DROP PROCEDURE IF EXISTS getinforbandatmonan_by_bandatid;
DROP PROCEDURE IF EXISTS getCombobyId;
DROP PROCEDURE IF EXISTS getMonanbyId;
DROP PROCEDURE IF EXISTS savehoadon232;
DROP PROCEDURE IF EXISTS timhoadonbyid;
DROP PROCEDURE IF EXISTS getbandatbyid;
DELIMITER //

CREATE PROCEDURE getbandatbyid(IN bandat_id INT)
BEGIN
    SELECT 
        id,
        thoigiandat,
        thoigianan,
        ngayan,
        confirmdat,
        mota,
        tblkhachhang232id,
        tblnhanvienbanhang232id,
        tblbanan232id,
        is_onl
    FROM 
        tblbandat232
    WHERE 
        id = bandat_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE timhoadonbyid(
    IN bandat_id INT
)
BEGIN
    SELECT tblnhanvienbanhang232id, thoigian, tblbandat232id
    FROM tblhoadon232
    WHERE tblbandat232id = bandat_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE savehoadon232(
    IN nhanvienbanhang_id INT,
    IN thoi_gian DATE,
    IN bandat_id INT
)
BEGIN
    INSERT INTO tblhoadon232 (tblnhanvienbanhang232id, thoigian, tblbandat232id)
    VALUES (nhanvienbanhang_id, thoi_gian, bandat_id);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE getCombobyId (
    IN comboID INT
)
BEGIN
    SELECT 
        id,
        ten,
        mota,
        dongia
    FROM 
        tblcombo232
    WHERE 
        id = comboID;
END //

CREATE PROCEDURE getMonanbyId (
    IN monanID INT
)
BEGIN
    SELECT 
        id,
        ten,
        mota,
        dongia
    FROM 
        tblmonan232
    WHERE 
        id = monanID;
END //


CREATE PROCEDURE getinforbandatcombo_by_bandatid (
    IN bandatID INT
)
BEGIN
    SELECT 
        id,
        soluong,
        dongia,
        tblbandat232id,
        tblcombo232id,
        is_onl
    FROM 
        tblbandatcombo232
    WHERE 
        tblbandat232id = bandatID;
END //

CREATE PROCEDURE getinforbandatmonan_by_bandatid (
    IN bandatID INT
)
BEGIN
    SELECT 
        id,
        soluong,
        dongia,
        tblbandat232id,
        tblmonan232id,
        is_onl
    FROM 
        tblbandatmonan232
    WHERE 
        tblbandat232id = bandatID;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE get_bandat_by_tenban(IN tenban_input VARCHAR(255))
BEGIN
    SELECT b.id, b.thoigiandat, b.thoigianan,b.ngayan, b.confirmdat, b.mota, 
           b.tblkhachhang232id, b.tblnhanvienbanhang232id, b.tblbanan232id, b.is_onl
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


CREATE PROCEDURE timkiemcombotheoten(IN ten_combo VARCHAR(255))
BEGIN
    SELECT * 
    FROM tblcombo232 
    WHERE ten LIKE CONCAT('%', ten_combo, '%');
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

