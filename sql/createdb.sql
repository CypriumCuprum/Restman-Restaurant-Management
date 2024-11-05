USE btl_restman;

-- Xóa các bảng nếu tồn tại
DROP TABLE IF EXISTS tblnccnguyenlieu232;
DROP TABLE IF EXISTS tblhoadonncc232;
DROP TABLE IF EXISTS tblnguyenlieu232;
DROP TABLE IF EXISTS tblnhacungcap232;
DROP TABLE IF EXISTS tblhoadon232;
DROP TABLE IF EXISTS tblbandatmonan232;
DROP TABLE IF EXISTS tblbandatcombo232;
DROP TABLE IF EXISTS tblbandat232;
DROP TABLE IF EXISTS tblcombomonan232;
DROP TABLE IF EXISTS tblmonan232;
DROP TABLE IF EXISTS tblcombo232;
DROP TABLE IF EXISTS tblbanan232;
DROP TABLE IF EXISTS tblthethanhvien232;
DROP TABLE IF EXISTS tblkhachhang232;
DROP TABLE IF EXISTS tblnhanvienkho232;
DROP TABLE IF EXISTS tblnhanvienbanhang232;
DROP TABLE IF EXISTS tblquanly232;
DROP TABLE IF EXISTS tblnhanvien232;
DROP TABLE IF EXISTS tblnguoidung232;

-- Tạo bảng tblnguoidung232
CREATE TABLE tblnguoidung232 (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    hovaten VARCHAR(255) NOT NULL,
    diachi VARCHAR(255) NOT NULL,
    sdt VARCHAR(15) NOT NULL,
    ghichu VARCHAR(255) NOT NULL,
    vaitro VARCHAR(255) NOT NULL
);

-- Tạo bảng tblnhanvien232
CREATE TABLE tblnhanvien232 (
    tblnguoidung232id INT PRIMARY KEY,
    vitri VARCHAR(255) NOT NULL,
    FOREIGN KEY (tblnguoidung232id) REFERENCES tblnguoidung232(id)
);

-- Tạo bảng tblquanly232
CREATE TABLE tblquanly232 (
    tblnhanvien232tblnguoidung232id INT PRIMARY KEY,
    FOREIGN KEY (tblnhanvien232tblnguoidung232id) REFERENCES tblnhanvien232(tblnguoidung232id)
);

-- Tạo bảng tblnhanvienbanhang232
CREATE TABLE tblnhanvienbanhang232 (
    tblnhanvien232tblnguoidung232id INT PRIMARY KEY,
    FOREIGN KEY (tblnhanvien232tblnguoidung232id) REFERENCES tblnhanvien232(tblnguoidung232id)
);

-- Tạo bảng tblnhanvienkho232
CREATE TABLE tblnhanvienkho232 (
    tblnhanvien232tblnguoidung232id INT PRIMARY KEY,
    FOREIGN KEY (tblnhanvien232tblnguoidung232id) REFERENCES tblnhanvien232(tblnguoidung232id)
);

-- Tạo bảng tblkhachhang232
CREATE TABLE tblkhachhang232 (
    tblnguoidung232id INT PRIMARY KEY,
    FOREIGN KEY (tblnguoidung232id) REFERENCES tblnguoidung232(id)
);

-- Tạo bảng tblthethanhvien232
CREATE TABLE tblthethanhvien232 (
    quyenloi VARCHAR(255) NOT NULL,
    thoigianlamthe DATE NOT NULL,
    tblkhachhang232id INT PRIMARY KEY,
    FOREIGN KEY (tblkhachhang232id) REFERENCES tblkhachhang232(tblnguoidung232id)
);

-- Tạo bảng tblbanan232
CREATE TABLE tblbanan232 (
    id INT PRIMARY KEY,
    tenban VARCHAR(255) NOT NULL,
    soban INT NOT NULL,
    mota VARCHAR(255) NOT NULL
);

-- Tạo bảng tblcombo232
CREATE TABLE tblcombo232 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    mota VARCHAR(255) NOT NULL,
    dongia FLOAT(10) NOT NULL CHECK (dongia >= 0)
);

-- Tạo bảng tblmonan232
CREATE TABLE tblmonan232 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    mota VARCHAR(255) NOT NULL,
    dongia FLOAT(10) NOT NULL CHECK (dongia >= 0)
);

-- Tạo bảng tblcombomonan232
CREATE TABLE tblcombomonan232 (
    id INT PRIMARY KEY,
    tblcombo232id INT NOT NULL,
    tblmonan232id INT NOT NULL,
    FOREIGN KEY (tblcombo232id) REFERENCES tblcombo232(id),
    FOREIGN KEY (tblmonan232id) REFERENCES tblmonan232(id)
);

-- Tạo bảng tblbandat232
CREATE TABLE tblbandat232 (
    id INT PRIMARY KEY,
    thoigiandat DATETIME NOT NULL,
    thoigianan varchar(255) NOT NULL,
    ngayan date NOT NULL,
    confirmdat BOOLEAN NOT NULL DEFAULT FALSE,
    mota VARCHAR(255) NOT NULL,
    tblkhachhang232id INT NOT NULL,
    tblnhanvienbanhang232id INT NOT NULL,
    tblbanan232id INT NOT NULL,
    is_onl BOOLEAN NOT NULL,
    FOREIGN KEY (tblkhachhang232id) REFERENCES tblkhachhang232(tblnguoidung232id),
    FOREIGN KEY (tblnhanvienbanhang232id) REFERENCES tblnhanvienbanhang232(tblnhanvien232tblnguoidung232id),
    FOREIGN KEY (tblbanan232id) REFERENCES tblbanan232(id),
    CHECK (thoigianan IN ('buổi sáng', 'buổi trưa', 'buổi tối'))
);

-- Tạo bảng tblbandatcombo232
CREATE TABLE tblbandatcombo232 (
    id INT PRIMARY KEY,
    soluong INT NOT NULL CHECK (soluong > 0),
    dongia FLOAT(10) NOT NULL CHECK (dongia >= 0),
    tblbandat232id INT NOT NULL,
    tblcombo232id INT NOT NULL,
    is_onl BOOLEAN NOT NULL,
    FOREIGN KEY (tblbandat232id) REFERENCES tblbandat232(id),
    FOREIGN KEY (tblcombo232id) REFERENCES tblcombo232(id)
);

-- Tạo bảng tblbandatmonan232
CREATE TABLE tblbandatmonan232 (
    id INT PRIMARY KEY,
    dongia FLOAT(10) NOT NULL CHECK (dongia >= 0),
    soluong INT NOT NULL CHECK (soluong > 0),
    tblbandat232id INT NOT NULL,
    tblmonan232id INT NOT NULL,
    is_onl BOOLEAN NOT NULL,
    FOREIGN KEY (tblbandat232id) REFERENCES tblbandat232(id),
    FOREIGN KEY (tblmonan232id) REFERENCES tblmonan232(id)
);

-- Tạo bảng tblhoadon232
CREATE TABLE tblhoadon232 (
	tblnhanvienbanhang232id INT NOT NULL,
    thoigian DATE NOT NULL,
    tblbandat232id INT NOT NULL key,
    FOREIGN KEY (tblbandat232id) REFERENCES tblbandat232(id),
    FOREIGN KEY (tblnhanvienbanhang232id) references tblnhanvienbanhang232(tblnhanvien232tblnguoidung232id)
);

-- Tạo bảng tblnhacungcap232
CREATE TABLE tblnhacungcap232 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    diachi VARCHAR(255) NOT NULL,
    mota TEXT NOT NULL,
    sdt VARCHAR(15) NOT NULL
);

-- Tạo bảng tblnguyenlieu232
CREATE TABLE tblnguyenlieu232 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    mota VARCHAR(255) NOT NULL
);

-- Tạo bảng tblhoadonncc232
CREATE TABLE tblhoadonncc232 (
    id INT PRIMARY KEY,
    tongtien FLOAT(10) NOT NULL CHECK (tongtien >= 0),
    thoigian DATE NOT NULL,
    tblnhanvienkho232id INT NOT NULL,
    tblnhacungcap232id INT NOT NULL,
    FOREIGN KEY (tblnhanvienkho232id) REFERENCES tblnhanvienkho232(tblnhanvien232tblnguoidung232id),
    FOREIGN KEY (tblnhacungcap232id) REFERENCES tblnhacungcap232(id)
);

-- Tạo bảng tblnccnguyenlieu232
CREATE TABLE tblnccnguyenlieu232 (
    id INT PRIMARY KEY,
    gianhap FLOAT(10) NOT NULL CHECK (gianhap >= 0),
    tblhoadonncc232id INT NOT NULL,
    tblnhacungcap232id INT NOT NULL,
    tblnguyenlieu232id INT NOT NULL,
    FOREIGN KEY (tblhoadonncc232id) REFERENCES tblhoadonncc232(id),
    FOREIGN KEY (tblnhacungcap232id) REFERENCES tblnhacungcap232(id),
    FOREIGN KEY (tblnguyenlieu232id) REFERENCES tblnguyenlieu232(id)
);

DELIMITER //

CREATE TRIGGER before_insert_khachhang
BEFORE INSERT ON tblkhachhang232
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM tblnhanvien232 WHERE tblnguoidung232id = NEW.tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là nhân viên, không thể thêm vào khách hàng.';
    END IF;
END; //

CREATE TRIGGER before_insert_nhanvien
BEFORE INSERT ON tblnhanvien232
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM tblkhachhang232 WHERE tblnguoidung232id = NEW.tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là khách hàng, không thể thêm vào nhân viên.';
    END IF;
END; //

DELIMITER ;

DELIMITER //

-- Trigger kiểm tra trước khi chèn vào bảng tblquanly232
CREATE TRIGGER before_insert_quanly
BEFORE INSERT ON tblquanly232
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM tblnhanvienbanhang232 WHERE tblnhanvien232tblnguoidung232id = NEW.tblnhanvien232tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là nhân viên bán hàng, không thể thêm vào quản lý.';
	END IF;
	IF EXISTS (SELECT * FROM tblnhanvienkho232 WHERE tblnhanvien232tblnguoidung232id = NEW.tblnhanvien232tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là nhân viên kho, không thể thêm vào quản lý.';
    END IF;
END; //

-- Trigger kiểm tra trước khi chèn vào bảng tblnhanvienbanhang232
CREATE TRIGGER before_insert_nhanvienbanhang
BEFORE INSERT ON tblnhanvienbanhang232
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM tblquanly232 WHERE tblnhanvien232tblnguoidung232id = NEW.tblnhanvien232tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là quản lý';
	END IF;
	IF EXISTS (SELECT * FROM tblnhanvienkho232 WHERE tblnhanvien232tblnguoidung232id = NEW.tblnhanvien232tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là nhân viên kho';
    END IF;
END; //

-- Trigger kiểm tra trước khi chèn vào bảng tblnhanvienkho232
CREATE TRIGGER before_insert_nhanvienkho
BEFORE INSERT ON tblnhanvienkho232
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM tblquanly232 WHERE tblnhanvien232tblnguoidung232id = NEW.tblnhanvien232tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là quản lý';
	END IF;
	IF EXISTS (SELECT * FROM tblnhanvienbanhang232 WHERE tblnhanvien232tblnguoidung232id = NEW.tblnhanvien232tblnguoidung232id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Người dùng đã là nhân viên bán hàng';
    END IF;
END; //

DELIMITER ;
