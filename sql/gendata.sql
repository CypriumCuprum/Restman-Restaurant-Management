USE btl_restman;

-- Thêm dữ liệu cho bảng tblnguoidung232
INSERT INTO tblnguoidung232 (id, username, password, hovaten, diachi, sdt, ghichu, vaitro) VALUES
(1, 'user1', 'password1', 'Nguyễn Văn A', 'Hà Nội', '0123456789', 'Ghi chú 1', 'nhanvien'),
(2, 'user2', 'password2', 'Trần Thị B', 'Đà Nẵng', '0123456788', 'Ghi chú 2', 'khachhang'),
(3, 'user3', 'password3', 'Lê Văn C', 'Hồ Chí Minh', '0123456787', 'Ghi chú 3', 'nhanvien'),
(4, 'user4', 'password4', 'Phạm Thị D', 'Hà Nội', '0123456786', 'Ghi chú 4', 'nhanvien'),
(5, 'user5', 'password5', 'Nguyễn Văn E', 'Đà Nẵng', '0123456785', 'Ghi chú 5', 'nhanvien'),
(6, 'user6', 'password6', 'Nguyễn Thị F', 'Nha Trang', '0123456784', 'Ghi chú 6', 'khachhang'),
(7, 'user7', 'password7', 'Trần Văn G', 'Cần Thơ', '0123456783', 'Ghi chú 7', 'khachhang'),
(8, 'user8', 'password8', 'Lê Thị H', 'Đà Lạt', '0123456782', 'Ghi chú 8', 'khachhang'),
(9, 'user9', 'password9', 'Phạm Văn I', 'Hải Phòng', '0123456781', 'Ghi chú 9', 'khachhang'),
(10, 'user10', 'password10', 'Nguyễn Văn J', 'Quảng Ninh', '0123456780', 'Ghi chú 10', 'khachhang'),
(11, 'user11', 'password11', 'Nguyễn Văn K', 'Hà Nội', '0123456779', 'Ghi chú 11', 'nhanvien'),
(12, 'user12', 'password12', 'Trần Thị L', 'Đà Nẵng', '0123456778', 'Ghi chú 12', 'nhanvien');

-- Thêm dữ liệu cho bảng tblnhanvien232
INSERT INTO tblnhanvien232 (tblnguoidung232id, vitri) VALUES
(1, 'nhanvienkho'),
(3, 'nhanvienbanhang'),
(5, 'quanly'),
(11, 'nhanvienbanhang'),
(12,  'nhanvienbanhang');

-- Thêm dữ liệu cho bảng tblnhanvienbanhang232
INSERT INTO tblnhanvienbanhang232 (tblnhanvien232tblnguoidung232id) VALUES
(3),
(11),
(12);

-- Thêm dữ liệu cho bảng tblnhanvienkho232
INSERT INTO tblnhanvienkho232 (tblnhanvien232tblnguoidung232id) VALUES
(1);

-- Thêm dữ liệu cho bảng tblkhachhang232
INSERT INTO tblkhachhang232 (tblnguoidung232id) VALUES
(2),
(6),
(7),
(8),
(9),
(10);

-- Thêm dữ liệu cho bảng tblthethanhvien232
INSERT INTO tblthethanhvien232 (quyenloi, thoigianlamthe, tblkhachhang232id) VALUES
('Thành viên vàng', '2024-01-01', 2);

-- Thêm dữ liệu cho bảng tblbanan232
INSERT INTO tblbanan232 (id,tenban, soban, mota) VALUES
(1,"ban1", 1, 'Bàn gần cửa'),
(2,"ban2", 2, 'Bàn ở giữa'),
(3, "ban3", 3, 'Bàn ở góc'),
(4, "ban4", 4, 'Bàn ngoài trời');

-- Thêm dữ liệu cho bảng tblcombo232
INSERT INTO tblcombo232 (id, ten, mota, dongia) VALUES
(1, 'Combo Gia Đình', 'Combo gồm Phở, Gỏi Cuốn, Chả Giò và Trà Đá',500000),
(2, 'Combo Hẹn Hò', 'Combo gồm Sushi, Ramen, và Bánh Mì',500000),
(3, 'Combo Sinh Nhật', 'Combo gồm Pizza, Khoai Tây Chiên, và Nước Ngọt', 600000),
(4, 'Combo Tiệc Tùng', 'Combo gồm Mỳ Ý, Salad, và Bánh Tráng Miệng', 700000);

-- Thêm dữ liệu cho bảng tblmonan232
INSERT INTO tblmonan232 (id, ten, mota, dongia) VALUES
(1, 'Phở', 'Món ăn nổi tiếng của Việt Nam, gồm sợi bún phở, nước dùng thơm và thịt bò hoặc thịt gà.', 50000),
(2, 'Bánh mì', 'Bánh mì baguette nhồi với thịt, rau, và các loại gia vị.', 25000),
(3, 'Gỏi cuốn', 'Cuốn bánh tráng với tôm, thịt heo, rau sống và bún.', 30000),
(4, 'Chả giò', 'Món nem rán giòn, thường được làm từ thịt heo, tôm và rau củ.', 35000),
(5, 'Hủ tiếu', 'Món mì nước phổ biến ở miền Nam, thường đi kèm với tôm, mực, thịt và rau.', 45000),
(6, 'Sushi', 'Món ăn Nhật Bản gồm cơm và các loại hải sản.', 80000),
(7, 'Ramen', 'Món mì Nhật Bản với nước dùng đậm đà và nhiều loại topping.', 70000),
(8, 'Pizza', 'Bánh pizza với phô mai và các loại thịt.', 90000),
(9, 'Khoai tây chiên', 'Khoai tây cắt miếng chiên giòn.', 50000),
(10, 'Mỳ Ý', 'Món mì với sốt cà chua và thịt bò.', 70000),
(11, 'Salad', 'Món salad tươi ngon với rau củ và nước sốt.', 40000),
(12, 'Bánh tráng miệng', 'Món bánh ngọt trang trí đẹp mắt.', 60000);

-- Thêm dữ liệu cho bảng tblcombomonan232
INSERT INTO tblcombomonan232 (id, tblcombo232id, tblmonan232id) VALUES
(1, 1, 1),  -- Phở
(2, 1, 3),  -- Gỏi Cuốn
(3, 1, 4),  -- Chả Giò
(4, 2, 6),  -- Sushi
(5, 2, 7),  -- Ramen
(6, 2, 2),  -- Bánh Mì
(7, 2, 5),  -- Hủ Tiếu
(8, 3, 8),  -- Pizza
(9, 3, 9),  -- Khoai Tây Chiên
(10, 4, 10), -- Mỳ Ý
(11, 4, 11), -- Salad
(12, 4, 12); -- Bánh tráng miệng

-- Thêm dữ liệu cho bảng tblbandat232
INSERT INTO tblbandat232 (id, thoigiandat,thoigianan,ngayan, confirmdat, mota, tblkhachhang232id, tblnhanvienbanhang232id, tblbanan232id) VALUES
(1, '2024-10-20 15:30:00','buổi sáng','2024-10-21', TRUE, 'Đặt bàn cho khách hàng 2', 2, 3, 1),
(2, '2024-10-22 18:00:00', 'buổi tối', '2024-10-23', TRUE, 'Đặt bàn cho khách hàng 1', 6, 11, 2),
(3, '2024-10-23 12:30:00', 'buổi trưa', '2024-10-24', TRUE, 'Đặt bàn cho khách hàng 3', 7, 12, 3);

-- Thêm dữ liệu cho bảng tblbandatcombo232
INSERT INTO tblbandatcombo232 (id, soluong, dongia, tblbandat232id, tblcombo232id) VALUES
(1, 2, 300000, 1, 1),  -- Combo Gia Đình
(2, 1, 600000, 2, 3),  -- Combo Sinh Nhật
(3, 1, 700000, 3, 4);  -- Combo Tiệc Tùng

-- Thêm dữ liệu cho bảng tblbandatmonan232
INSERT INTO tblbandatmonan232 (id, dongia, soluong, tblbandat232id, tblmonan232id) VALUES
(1, 50000, 1, 1, 1),  -- Phở
(2, 30000, 1, 1, 3),  -- Gỏi Cuốn
(3, 35000, 2, 1, 4),  -- Chả Giò
(4, 90000, 1, 2, 8),   -- Pizza
(5, 50000, 2, 2, 9),    -- Khoai Tây Chiên
(6, 70000, 1, 3, 10),   -- Mỳ Ý
(7, 40000, 1, 3, 11),   -- Salad
(8, 60000, 1, 3, 12);   -- Bánh tráng miệng

-- Thêm dữ liệu cho bảng tblhoadon232
-- INSERT INTO tblhoadon232 (tblnhanvienbanhang232id, tongtien, thoigian, tblbandat232id) VALUES
-- (3, 130000, '2024-10-20', 1);  -- Tổng tiền của hóa đơn

-- Thêm dữ liệu cho bảng tblnhacungcap232
INSERT INTO tblnhacungcap232 (id, ten, diachi, mota, sdt) VALUES
(1, 'Nhà cung cấp A', 'Hà Nội', 'Mô tả NCC A', '0123456784');

-- Thêm dữ liệu cho bảng tblnguyenlieu232
INSERT INTO tblnguyenlieu232 (id, ten, mota) VALUES
(1, 'Nguyên liệu A', 'Mô tả nguyên liệu A'),
(2, 'Nguyên liệu B', 'Mô tả nguyên liệu B');

-- Thêm dữ liệu cho bảng tblhoadonncc232
INSERT INTO tblhoadonncc232 (id, tongtien, thoigian, tblnhanvienkho232id, tblnhacungcap232id) VALUES
(1, 1000, '2024-10-20', 1, 1);

-- Thêm dữ liệu cho bảng tblnccnguyenlieu232
INSERT INTO tblnccnguyenlieu232 (id, gianhap, tblhoadonncc232id, tblnhacungcap232id, tblnguyenlieu232id) VALUES
(1, 500, 1, 1, 1),
(2, 600, 1, 1, 2);
