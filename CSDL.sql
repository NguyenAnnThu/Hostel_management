drop database cs_property_management;
CREATE DATABASE cs_property_management;
USE cs_property_management;

/* ================= NGƯỜI DÙNG ================= */
CREATE TABLE nguoi_dung (
    ma_nguoi_dung CHAR(6) PRIMARY KEY,
    ho_ten VARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    trang_thai VARCHAR(20),
    cccd VARCHAR(20) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL,
    ngay_sinh DATE NOT NULL
);

/* ================= TÀI KHOẢN ================= */
CREATE TABLE tai_khoan (
    so_dien_thoai VARCHAR(20) PRIMARY KEY,
    mat_khau VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
    FOREIGN KEY (so_dien_thoai) REFERENCES nguoi_dung(so_dien_thoai)
);

/* ================= PHÒNG ================= */
CREATE TABLE phong (
    ma_phong VARCHAR(6) PRIMARY KEY,
    tang INT NOT NULL CHECK (tang >= 0),
    dien_tich FLOAT NOT NULL CHECK (dien_tich > 0),
    gia_phong DECIMAL(12,2) NOT NULL CHECK (gia_phong > 0),
    so_nguoi_o INT NOT NULL CHECK (so_nguoi_o > 0),
    mo_ta TEXT,
    trang_thai VARCHAR(20) NOT NULL 
        CHECK (trang_thai IN ('trong', 'thue', 'bao_tri')),
    ngay_tao DATETIME DEFAULT CURRENT_TIMESTAMP,
    ngay_cap_nhat DATETIME
);

/* ================= DỊCH VỤ ================= */
CREATE TABLE dich_vu (
    ma_dich_vu VARCHAR(20) PRIMARY KEY,
    ten_dich_vu VARCHAR(100) NOT NULL,
    loai_dich_vu VARCHAR(20) NOT NULL, -- dien, nuoc, co_dinh
    don_vi_tinh VARCHAR(50),
    don_gia DECIMAL(12,2) NOT NULL,
    trang_thai VARCHAR(20)
);

/* ================= TÀI SẢN PHÒNG ================= */
CREATE TABLE tai_san (
    ma_tai_san VARCHAR(10) PRIMARY KEY,
    ten_tai_san VARCHAR(100) NOT NULL,
    loai_tai_san VARCHAR(50), -- giường, quạt, điều hòa...
    tong_so_luong INT NOT NULL CHECK (tong_so_luong >= 0),
    so_luong_con INT NOT NULL CHECK (so_luong_con >= 0),
    tinh_trang VARCHAR(20) NOT NULL 
        CHECK (tinh_trang IN ('con_hang', 'het_hang', 'ngung_su_dung')),
    ghi_chu VARCHAR(255)
);
CREATE TABLE tai_san_theo_phong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phong_id VARCHAR(6) NOT NULL,
    ma_tai_san VARCHAR(10) NOT NULL,
    so_luong INT NOT NULL CHECK (so_luong > 0),
    FOREIGN KEY (phong_id) REFERENCES phong(ma_phong),
    FOREIGN KEY (ma_tai_san) REFERENCES tai_san(ma_tai_san),
    UNIQUE (phong_id, ma_tai_san)
);


/* ================= ĐẶT PHÒNG ================= */
CREATE TABLE dat_phong (
    ma_dat_phong INT AUTO_INCREMENT,
    ma_phong VARCHAR(6) NOT NULL,
    ma_khach CHAR(6) NOT NULL,
    ngay_dat DATETIME,
    ngay_het_han DATETIME,
    trang_thai VARCHAR(20),
    PRIMARY KEY (ma_dat_phong),
    FOREIGN KEY (ma_phong) REFERENCES phong(ma_phong),
    FOREIGN KEY (ma_khach) REFERENCES nguoi_dung(ma_nguoi_dung)
) AUTO_INCREMENT = 1;


/* ================= HỢP ĐỒNG ================= */
CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT,
    ma_phong VARCHAR(6) NOT NULL,
    ma_khach CHAR(6) NOT NULL,
    ngay_bat_dau DATE NOT NULL,
    ngay_ket_thuc DATE NOT NULL,
    tien_coc DECIMAL(12,2) NOT NULL,
    trang_thai VARCHAR(20),
    ngay_tao DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ma_hop_dong),
    FOREIGN KEY (ma_phong) REFERENCES phong(ma_phong),
    FOREIGN KEY (ma_khach) REFERENCES nguoi_dung(ma_nguoi_dung)
) AUTO_INCREMENT = 1;


/* ================= CHỈ SỐ ĐIỆN NƯỚC ================= */
CREATE TABLE chi_so_dich_vu (
    ma_chi_so INT AUTO_INCREMENT PRIMARY KEY,
    ma_phong VARCHAR(6) NOT NULL,
    ma_dich_vu VARCHAR(20) NOT NULL,
    thang INT CHECK (thang BETWEEN 1 AND 12),
    nam INT,
    chi_so_cu INT NOT NULL,
    chi_so_moi INT NOT NULL,
    ngay_ghi DATETIME,
    CHECK (chi_so_moi >= chi_so_cu),
    FOREIGN KEY (ma_phong) REFERENCES phong(ma_phong),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

/* ================= HÓA ĐƠN ================= */
CREATE TABLE hoa_don (
    ma_hoa_don INT AUTO_INCREMENT,
    ma_hop_dong INT NOT NULL,
    ma_phong VARCHAR(6) NOT NULL,
    ma_khach CHAR(6) NOT NULL,
    thang INT,
    nam INT,
    tong_tien DECIMAL(12,2),
    ma_qr VARCHAR(255),
    trang_thai VARCHAR(20),
    ngay_tao DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ma_hoa_don),
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_phong) REFERENCES phong(ma_phong),
    FOREIGN KEY (ma_khach) REFERENCES nguoi_dung(ma_nguoi_dung)
) AUTO_INCREMENT = 1;


/* ================= HÓA ĐƠN CHI TIẾT ================= */
CREATE TABLE hoa_don_chi_tiet (
    ma_hoa_don_ct INT AUTO_INCREMENT,
    ma_hoa_don INT NOT NULL,
    ma_dich_vu VARCHAR(20) NOT NULL,
    so_luong INT,
    don_gia DECIMAL(12,2),
    thanh_tien DECIMAL(12,2),
    PRIMARY KEY (ma_hoa_don_ct),
    FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
) AUTO_INCREMENT = 1;


/* ================= XÁC NHẬN THU TIỀN ================= */
CREATE TABLE xac_nhan_thu_tien (
    ma_xac_nhan INT AUTO_INCREMENT,
    ma_hoa_don INT UNIQUE,
    ma_nguoi_xac_nhan CHAR(6),
    ngay_xac_nhan DATETIME,
    ghi_chu VARCHAR(255),
    PRIMARY KEY (ma_xac_nhan),
    FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
    FOREIGN KEY (ma_nguoi_xac_nhan) REFERENCES nguoi_dung(ma_nguoi_dung)
) AUTO_INCREMENT = 1;



/* ================= INSERT DỮ LIỆU ================= */
	/* 1 ================= NGƯỜI DÙNG ================= */

	INSERT INTO nguoi_dung VALUES
	('AD0001','Trần Minh Quân','0901234567','quan.tran@nhatro.vn','active','012345678901','Quận Cầu Giấy, Hà Nội','1985-01-01'),

	('CUS001','Nguyễn Văn An','0901111111','an.nguyen@gmail.com','active','012345678902','Quận Đống Đa, Hà Nội','2000-01-01'),
	('CUS002','Nguyễn Thị Bình','0901111112','binh.nguyen@gmail.com','active','012345678903','Quận Hai Bà Trưng, Hà Nội','1999-02-01'),
	('CUS003','Trần Văn Cường','0901111113','cuong.tran@gmail.com','active','012345678904','Quận Thanh Xuân, Hà Nội','2001-03-01'),
	('CUS004','Phạm Thị Dung','0901111114','dung.pham@gmail.com','active','012345678905','Quận Hoàng Mai, Hà Nội','2000-04-01'),
	('CUS005','Lê Văn Đức','0901111115','duc.le@gmail.com','active','012345678906','Quận Long Biên, Hà Nội','1998-05-01'),
	('CUS006','Hoàng Thị Hạnh','0901111116','hanh.hoang@gmail.com','active','012345678907','Quận Nam Từ Liêm, Hà Nội','1997-06-01'),
	('CUS007','Vũ Văn Giang','0901111117','giang.vu@gmail.com','active','012345678908','Quận Bắc Từ Liêm, Hà Nội','1996-07-01'),
	('CUS008','Đặng Thị Hương','0901111118','huong.dang@gmail.com','active','012345678909','Quận Hà Đông, Hà Nội','1995-08-01'),
	('CUS009','Bùi Văn Khánh','0901111119','khanh.bui@gmail.com','active','012345678910','Quận Tây Hồ, Hà Nội','1994-09-01'),
	('CUS010','Ngô Thị Lan','0901111120','lan.ngo@gmail.com','active','012345678911','Quận Ba Đình, Hà Nội','1993-10-01');
	
    /* 2 ================= TÀI KHOẢN================= */
	INSERT INTO tai_khoan VALUES
	('0901234567','Admin@2025','owner'),

	('0901111111','An@2000','cus'),
	('0901111112','Binh@1999','cus'),
	('0901111113','Cuong@2001','cus'),
	('0901111114','Dung@2000','cus'),
	('0901111115','Duc@1998','cus'),
	('0901111116','Hanh@1997','cus'),
	('0901111117','Giang@1996','cus'),
	('0901111118','Huong@1995','cus'),
	('0901111119','Khanh@1994','cus'),
	('0901111120','Lan@1993','cus');
    
    /* 3 ================= PHÒNG================= */
    INSERT INTO phong VALUES
	('P101',1,18,2200000,1,'Phòng đơn','thue',NOW(),NULL),
	('P102',1,22,2600000,2,'Phòng đôi','thue',NOW(),NULL),
	('P103',1,30,3500000,3,'Phòng gia đình','thue',NOW(),NULL),

	('P201',2,35,4200000,4,'Phòng lớn','thue',NOW(),NULL),
	('P202',2,18,2300000,1,'Phòng đơn','trong',NOW(),NULL),
	('P203',2,22,2700000,2,'Phòng đôi','trong',NOW(),NULL),

	('P301',3,30,3600000,3,'Phòng gia đình','trong',NOW(),NULL),
	('P302',3,35,4300000,4,'Phòng lớn','bao_tri',NOW(),NULL),

	('P401',4,18,2400000,1,'Phòng đơn','trong',NOW(),NULL),
	('P402',4,22,2800000,2,'Phòng đôi','trong',NOW(),NULL);

    /* 4 ================= DỊCH VỤ ================= */
    INSERT INTO dich_vu VALUES
	('DV001','Điện','chi_so','kWh',3500,'dang_dung'),
	('DV002','Nước','chi_so','m3',15000,'dang_dung'),
	('DV003','Wifi','co_dinh','tháng',100000,'dang_dung'),
	('DV004','Rác','co_dinh','tháng',30000,'dang_dung'),
	('DV005','Gửi xe','co_dinh','tháng',120000,'dang_dung');

    /* 5 ================= TÀI SẢN================= */
    INSERT INTO tai_san VALUES
	('TS001','Giường','giuong',20,10,'con_hang',NULL),
	('TS002','Quạt','quat',15,5,'con_hang',NULL),
	('TS003','Điều hòa','dieu_hoa',8,0,'het_hang',NULL),
	('TS004','Bàn học','ban',12,7,'con_hang',NULL);

    /* 6 ================= TÀI SẢN THEO PHÒNG ================= */
    INSERT INTO tai_san_theo_phong (phong_id, ma_tai_san, so_luong) VALUES
	('P101','TS001',1),
	('P101','TS002',1),

	('P102','TS001',2),
	('P102','TS002',2),

	('P103','TS001',3),
	('P103','TS003',1),

	('P201','TS001',4),
	('P201','TS003',2);


    /* 7 ================= ĐẶT PHÒNG================= */
    INSERT INTO dat_phong VALUES
	(NULL,'P202','CUS001',NOW(),DATE_ADD(NOW(),INTERVAL 3 DAY),'cho'),
	(NULL,'P203','CUS002',NOW(),DATE_ADD(NOW(),INTERVAL 3 DAY),'cho'),
	(NULL,'P301','CUS003',NOW(),DATE_ADD(NOW(),INTERVAL 3 DAY),'huy');

    /* 8 ================= HỢP ĐỒNG ================= */
    INSERT INTO hop_dong VALUES
	(NULL,'P101','CUS001','2024-01-01','2024-12-31',2000000,'hieu_luc',NOW()),
	(NULL,'P102','CUS002','2024-02-01','2025-01-31',2500000,'hieu_luc',NOW()),
	(NULL,'P103','CUS003','2024-03-01','2025-02-28',3000000,'hieu_luc',NOW()),
	(NULL,'P201','CUS004','2024-01-15','2024-12-14',3500000,'hieu_luc',NOW());

    /* 9 ================= CHI PHÍ CỐ ĐỊNH ================= */
    INSERT INTO chi_so_dich_vu VALUES
	(NULL,'P101','DV001',1,2025,120,150,NOW()),
	(NULL,'P101','DV002',1,2025,30,35,NOW()),
	(NULL,'P102','DV001',1,2025,200,240,NOW()),
	(NULL,'P102','DV002',1,2025,40,50,NOW());

    /* 10 ================= HÓA ĐƠN ================= */
    INSERT INTO hoa_don
(ma_hoa_don, ma_hop_dong, ma_phong, ma_khach, thang, nam, tong_tien, ma_qr, trang_thai, ngay_tao)
VALUES
-- Hợp đồng 1
(1,1,'P101','CUS001',1,2024,280000,'QR001','da_thu','2024-01-31 18:00:00'),
(2,1,'P101','CUS001',2,2024,300000,'QR002','da_thu','2024-02-29 18:10:00'),
(3,1,'P101','CUS001',3,2024,260000,'QR003','da_thu','2024-03-31 18:05:00'),
(4,1,'P101','CUS001',4,2024,310000,'QR004','da_thu','2024-04-30 18:20:00'),
(5,1,'P101','CUS001',5,2024,290000,'QR005','da_thu','2024-05-31 18:00:00'),
(6,1,'P101','CUS001',6,2024,330000,'QR006','da_thu','2024-06-30 18:15:00'),
(7,1,'P101','CUS001',7,2024,350000,'QR007','da_thu','2024-07-31 18:10:00'),
(8,1,'P101','CUS001',8,2024,320000,'QR008','da_thu','2024-08-31 18:00:00'),
(9,1,'P101','CUS001',9,2024,340000,'QR009','da_thu','2024-09-30 18:20:00'),
(10,1,'P101','CUS001',10,2024,360000,'QR010','da_thu','2024-10-31 18:00:00'),

-- Hợp đồng 2
(11,2,'P102','CUS002',1,2024,420000,'QR011','da_thu','2024-01-31 19:00:00'),
(12,2,'P102','CUS002',2,2024,430000,'QR012','da_thu','2024-02-29 19:10:00'),
(13,2,'P102','CUS002',3,2024,410000,'QR013','da_thu','2024-03-31 19:00:00'),
(14,2,'P102','CUS002',4,2024,450000,'QR014','da_thu','2024-04-30 19:15:00'),
(15,2,'P102','CUS002',5,2024,460000,'QR015','da_thu','2024-05-31 19:00:00'),
(16,2,'P102','CUS002',6,2024,480000,'QR016','da_thu','2024-06-30 19:20:00'),
(17,2,'P102','CUS002',7,2024,500000,'QR017','da_thu','2024-07-31 19:10:00'),
(18,2,'P102','CUS002',8,2024,470000,'QR018','da_thu','2024-08-31 19:00:00'),
(19,2,'P102','CUS002',9,2024,490000,'QR019','da_thu','2024-09-30 19:20:00'),
(20,2,'P102','CUS002',10,2024,520000,'QR020','da_thu','2024-10-31 19:00:00'),

-- Hợp đồng 3
(21,3,'P103','CUS003',1,2024,550000,'QR021','da_thu','2024-01-31 20:00:00'),
(22,3,'P103','CUS003',2,2024,560000,'QR022','da_thu','2024-02-29 20:10:00'),
(23,3,'P103','CUS003',3,2024,540000,'QR023','da_thu','2024-03-31 20:00:00'),
(24,3,'P103','CUS003',4,2024,580000,'QR024','da_thu','2024-04-30 20:15:00'),
(25,3,'P103','CUS003',5,2024,600000,'QR025','da_thu','2024-05-31 20:00:00'),
(26,3,'P103','CUS003',6,2024,620000,'QR026','da_thu','2024-06-30 20:20:00'),
(27,3,'P103','CUS003',7,2024,650000,'QR027','da_thu','2024-07-31 20:10:00'),
(28,3,'P103','CUS003',8,2024,630000,'QR028','da_thu','2024-08-31 20:00:00'),
(29,3,'P103','CUS003',9,2024,640000,'QR029','da_thu','2024-09-30 20:20:00'),
(30,3,'P103','CUS003',10,2024,670000,'QR030','da_thu','2024-10-31 20:00:00'),

-- Hợp đồng 4
(31,4,'P201','CUS004',1,2024,700000,'QR031','da_thu','2024-01-31 21:00:00'),
(32,4,'P201','CUS004',2,2024,720000,'QR032','da_thu','2024-02-29 21:10:00'),
(33,4,'P201','CUS004',3,2024,710000,'QR033','da_thu','2024-03-31 21:00:00'),
(34,4,'P201','CUS004',4,2024,740000,'QR034','da_thu','2024-04-30 21:15:00'),
(35,4,'P201','CUS004',5,2024,760000,'QR035','da_thu','2024-05-31 21:00:00'),
(36,4,'P201','CUS004',6,2024,780000,'QR036','da_thu','2024-06-30 21:20:00'),
(37,4,'P201','CUS004',7,2024,800000,'QR037','da_thu','2024-07-31 21:10:00'),
(38,4,'P201','CUS004',8,2024,790000,'QR038','da_thu','2024-08-31 21:00:00'),
(39,4,'P201','CUS004',9,2024,820000,'QR039','da_thu','2024-09-30 21:20:00'),
(40,4,'P201','CUS004',10,2024,850000,'QR040','da_thu','2024-10-31 21:00:00');

-- 	  INSERT INTO hoa_don
-- 	(ma_hop_dong, ma_phong, ma_khach, thang, nam, trang_thai)
-- 	SELECT
-- 		hd.ma_hop_dong,
-- 		hd.ma_phong,
-- 		hd.ma_khach,
-- 		MONTH(CURDATE()),
-- 		YEAR(CURDATE()),
-- 		'chua_thu'
-- 	FROM hop_dong hd
-- 	WHERE hd.trang_thai = 'hieu_luc'
-- 	AND NOT EXISTS (
-- 		SELECT 1
-- 		FROM hoa_don h
-- 		WHERE h.ma_phong = hd.ma_phong
-- 		  AND h.thang = MONTH(CURDATE())
-- 		  AND h.nam   = YEAR(CURDATE())
-- 	);


    /* 11 ================= HÓA ĐƠN CHI TIẾT ================= */
INSERT INTO hoa_don_chi_tiet
(ma_hoa_don, ma_dich_vu, so_luong, don_gia, thanh_tien)
VALUES
-- HD 1 (280000)
(1,'DV003',1,100000,100000),
(1,'DV004',1,30000,30000),
(1,'DV001',30,3500,105000),
(1,'DV002',3,15000,45000),

-- HD 2 (300000)
(2,'DV003',1,100000,100000),
(2,'DV004',1,30000,30000),
(2,'DV001',35,3500,122500),
(2,'DV002',3,15000,45000),

-- HD 3 (260000)
(3,'DV003',1,100000,100000),
(3,'DV004',1,30000,30000),
(3,'DV001',25,3500,87500),
(3,'DV002',3,15000,45000),

-- HD 4 (310000)
(4,'DV003',1,100000,100000),
(4,'DV004',1,30000,30000),
(4,'DV001',40,3500,140000),
(4,'DV002',3,15000,45000),

-- HD 5 (290000)
(5,'DV003',1,100000,100000),
(5,'DV004',1,30000,30000),
(5,'DV001',35,3500,122500),
(5,'DV002',2,15000,30000),

-- HD 6 (330000)
(6,'DV003',1,100000,100000),
(6,'DV004',1,30000,30000),
(6,'DV001',45,3500,157500),
(6,'DV002',3,15000,45000),

-- HD 7 (350000)
(7,'DV003',1,100000,100000),
(7,'DV004',1,30000,30000),
(7,'DV001',50,3500,175000),
(7,'DV002',3,15000,45000),

-- HD 8 (320000)
(8,'DV003',1,100000,100000),
(8,'DV004',1,30000,30000),
(8,'DV001',42,3500,147000),
(8,'DV002',3,15000,45000),

-- HD 9 (340000)
(9,'DV003',1,100000,100000),
(9,'DV004',1,30000,30000),
(9,'DV001',47,3500,164500),
(9,'DV002',3,15000,45000),

-- HD 10 (360000)
(10,'DV003',1,100000,100000),
(10,'DV004',1,30000,30000),
(10,'DV001',52,3500,182000),
(10,'DV002',3,15000,45000),

-- HD 11 (420000)
(11,'DV003',1,100000,100000),
(11,'DV004',1,30000,30000),
(11,'DV001',70,3500,245000),
(11,'DV002',3,15000,45000),

-- HD 12 (430000)
(12,'DV003',1,100000,100000),
(12,'DV004',1,30000,30000),
(12,'DV001',73,3500,255500),
(12,'DV002',3,15000,45000),

-- HD 13 (410000)
(13,'DV003',1,100000,100000),
(13,'DV004',1,30000,30000),
(13,'DV001',68,3500,238000),
(13,'DV002',3,15000,45000),

-- HD 14 (450000)
(14,'DV003',1,100000,100000),
(14,'DV004',1,30000,30000),
(14,'DV001',80,3500,280000),
(14,'DV002',3,15000,45000),

-- HD 15 (460000)
(15,'DV003',1,100000,100000),
(15,'DV004',1,30000,30000),
(15,'DV001',83,3500,290500),
(15,'DV002',3,15000,45000),

-- HD 16 (480000)
(16,'DV003',1,100000,100000),
(16,'DV004',1,30000,30000),
(16,'DV001',89,3500,311500),
(16,'DV002',3,15000,45000),

-- HD 17 (500000)
(17,'DV003',1,100000,100000),
(17,'DV004',1,30000,30000),
(17,'DV001',95,3500,332500),
(17,'DV002',3,15000,45000),

-- HD 18 (470000)
(18,'DV003',1,100000,100000),
(18,'DV004',1,30000,30000),
(18,'DV001',86,3500,301000),
(18,'DV002',3,15000,45000),

-- HD 19 (490000)
(19,'DV003',1,100000,100000),
(19,'DV004',1,30000,30000),
(19,'DV001',92,3500,322000),
(19,'DV002',3,15000,45000),

-- HD 20 (520000)
(20,'DV003',1,100000,100000),
(20,'DV004',1,30000,30000),
(20,'DV001',101,3500,353500),
(20,'DV002',3,15000,45000),

-- HD 21 (550000)
(21,'DV003',1,100000,100000),
(21,'DV004',1,30000,30000),
(21,'DV001',110,3500,385000),
(21,'DV002',3,15000,45000),

-- HD 22 (560000)
(22,'DV003',1,100000,100000),
(22,'DV004',1,30000,30000),
(22,'DV001',113,3500,395500),
(22,'DV002',3,15000,45000),

-- HD 23 (540000)
(23,'DV003',1,100000,100000),
(23,'DV004',1,30000,30000),
(23,'DV001',107,3500,374500),
(23,'DV002',3,15000,45000),

-- HD 24 (580000)
(24,'DV003',1,100000,100000),
(24,'DV004',1,30000,30000),
(24,'DV001',118,3500,413000),
(24,'DV002',3,15000,45000),

-- HD 25 (600000)
(25,'DV003',1,100000,100000),
(25,'DV004',1,30000,30000),
(25,'DV001',124,3500,434000),
(25,'DV002',3,15000,45000),

-- HD 26 (620000)
(26,'DV003',1,100000,100000),
(26,'DV004',1,30000,30000),
(26,'DV001',130,3500,455000),
(26,'DV002',3,15000,45000),

-- HD 27 (650000)
(27,'DV003',1,100000,100000),
(27,'DV004',1,30000,30000),
(27,'DV001',139,3500,486500),
(27,'DV002',3,15000,45000),

-- HD 28 (630000)
(28,'DV003',1,100000,100000),
(28,'DV004',1,30000,30000),
(28,'DV001',133,3500,465500),
(28,'DV002',3,15000,45000),

-- HD 29 (640000)
(29,'DV003',1,100000,100000),
(29,'DV004',1,30000,30000),
(29,'DV001',136,3500,476000),
(29,'DV002',3,15000,45000),

-- HD 30 (670000)
(30,'DV003',1,100000,100000),
(30,'DV004',1,30000,30000),
(30,'DV001',145,3500,507500),
(30,'DV002',3,15000,45000),

-- HD 31 (700000)
(31,'DV003',1,100000,100000),
(31,'DV004',1,30000,30000),
(31,'DV001',154,3500,539000),
(31,'DV002',3,15000,45000),

-- HD 32 (720000)
(32,'DV003',1,100000,100000),
(32,'DV004',1,30000,30000),
(32,'DV001',160,3500,560000),
(32,'DV002',2,15000,30000),

-- HD 33 (710000)
(33,'DV003',1,100000,100000),
(33,'DV004',1,30000,30000),
(33,'DV001',157,3500,549500),
(33,'DV002',2,15000,30000),

-- HD 34 (740000)
(34,'DV003',1,100000,100000),
(34,'DV004',1,30000,30000),
(34,'DV001',165,3500,577500),
(34,'DV002',2,15000,30000),

-- HD 35 (760000)
(35,'DV003',1,100000,100000),
(35,'DV004',1,30000,30000),
(35,'DV001',171,3500,598500),
(35,'DV002',2,15000,30000),

-- HD 36 (780000)
(36,'DV003',1,100000,100000),
(36,'DV004',1,30000,30000),
(36,'DV001',177,3500,619500),
(36,'DV002',2,15000,30000),

-- HD 37 (800000)
(37,'DV003',1,100000,100000),
(37,'DV004',1,30000,30000),
(37,'DV001',183,3500,640500),
(37,'DV002',2,15000,30000),

-- HD 38 (790000)
(38,'DV003',1,100000,100000),
(38,'DV004',1,30000,30000),
(38,'DV001',180,3500,630000),
(38,'DV002',2,15000,30000),

-- HD 39 (820000)
(39,'DV003',1,100000,100000),
(39,'DV004',1,30000,30000),
(39,'DV001',188,3500,658000),
(39,'DV002',2,15000,30000),

-- HD 40 (850000)
(40,'DV003',1,100000,100000),
(40,'DV004',1,30000,30000),
(40,'DV001',197,3500,689500),
(40,'DV002',2,15000,30000);


    
--     INSERT INTO hoa_don_chi_tiet
-- 	(ma_hoa_don, ma_dich_vu, so_luong, don_gia, thanh_tien)
-- 	SELECT
-- 		h.ma_hoa_don,
-- 		cs.ma_dich_vu,
-- 		(cs.chi_so_moi - cs.chi_so_cu) AS so_luong,
-- 		dv.don_gia,
-- 		(cs.chi_so_moi - cs.chi_so_cu) * dv.don_gia AS thanh_tien
-- 	FROM hoa_don h
-- 	JOIN chi_so_dich_vu cs
-- 		ON cs.ma_phong = h.ma_phong
-- 	   AND cs.thang = h.thang
-- 	   AND cs.nam = h.nam
-- 	JOIN dich_vu dv
-- 		ON dv.ma_dich_vu = cs.ma_dich_vu
-- 	WHERE dv.loai_dich_vu = 'chi_so';
--     
/* 11b  ================= HÓA ĐƠN CHI TIẾT  cố định ================= */
-- 	INSERT INTO hoa_don_chi_tiet
-- 	(ma_hoa_don, ma_dich_vu, so_luong, don_gia, thanh_tien)
-- 	SELECT
-- 		h.ma_hoa_don,
-- 		dv.ma_dich_vu,
-- 		1,
-- 		dv.don_gia,
-- 		dv.don_gia
-- 	FROM hoa_don h
-- 	JOIN dich_vu dv
-- 		ON dv.loai_dich_vu = 'co_dinh';
--         
-- -- cập nhật tổng tiền
-- 	DELIMITER $$

-- 	CREATE TRIGGER trg_after_insert_hdct
-- 	AFTER INSERT ON hoa_don_chi_tiet
-- 	FOR EACH ROW
-- 	BEGIN
-- 		UPDATE hoa_don
-- 		SET tong_tien = (
-- 			SELECT IFNULL(SUM(thanh_tien), 0)
-- 			FROM hoa_don_chi_tiet
-- 			WHERE ma_hoa_don = NEW.ma_hoa_don
-- 		)
-- 		WHERE ma_hoa_don = NEW.ma_hoa_don;
-- 	END$$

-- 	DELIMITER ;


select * from hoa_don;
-- select * from hoa_don_chi_tiet;
-- select * from xac_nhan_thu_tien;
-- 	/* 12 ================= XÁC NHẬN THU TIỀN ================= */
INSERT INTO xac_nhan_thu_tien
(ma_hoa_don, ma_nguoi_xac_nhan, ngay_xac_nhan, ghi_chu)
VALUES
-- Hợp đồng 1 - CUS001
(1,'CUS001','2024-01-31 18:00:00','Khách thanh toán đủ'),
(2,'CUS001','2024-02-29 18:10:00','Khách thanh toán đủ'),
(3,'CUS001','2024-03-31 18:05:00','Khách thanh toán đủ'),
(4,'CUS001','2024-04-30 18:20:00','Khách thanh toán đủ'),
(5,'CUS001','2024-05-31 18:00:00','Khách thanh toán đủ'),
(6,'CUS001','2024-06-30 18:15:00','Khách thanh toán đủ'),
(7,'CUS001','2024-07-31 18:10:00','Khách thanh toán đủ'),
(8,'CUS001','2024-08-31 18:00:00','Khách thanh toán đủ'),
(9,'CUS001','2024-09-30 18:20:00','Khách thanh toán đủ'),
(10,'CUS001','2024-10-31 18:00:00','Khách thanh toán đủ'),

-- Hợp đồng 2 - CUS002
(11,'CUS002','2024-01-31 19:00:00','Khách thanh toán đủ'),
(12,'CUS002','2024-02-29 19:10:00','Khách thanh toán đủ'),
(13,'CUS002','2024-03-31 19:00:00','Khách thanh toán đủ'),
(14,'CUS002','2024-04-30 19:15:00','Khách thanh toán đủ'),
(15,'CUS002','2024-05-31 19:00:00','Khách thanh toán đủ'),
(16,'CUS002','2024-06-30 19:20:00','Khách thanh toán đủ'),
(17,'CUS002','2024-07-31 19:10:00','Khách thanh toán đủ'),
(18,'CUS002','2024-08-31 19:00:00','Khách thanh toán đủ'),
(19,'CUS002','2024-09-30 19:20:00','Khách thanh toán đủ'),
(20,'CUS002','2024-10-31 19:00:00','Khách thanh toán đủ'),

-- Hợp đồng 3 - CUS003
(21,'CUS003','2024-01-31 20:00:00','Khách thanh toán đủ'),
(22,'CUS003','2024-02-29 20:10:00','Khách thanh toán đủ'),
(23,'CUS003','2024-03-31 20:00:00','Khách thanh toán đủ'),
(24,'CUS003','2024-04-30 20:15:00','Khách thanh toán đủ'),
(25,'CUS003','2024-05-31 20:00:00','Khách thanh toán đủ'),
(26,'CUS003','2024-06-30 20:20:00','Khách thanh toán đủ'),
(27,'CUS003','2024-07-31 20:10:00','Khách thanh toán đủ'),
(28,'CUS003','2024-08-31 20:00:00','Khách thanh toán đủ'),
(29,'CUS003','2024-09-30 20:20:00','Khách thanh toán đủ'),
(30,'CUS003','2024-10-31 20:00:00','Khách thanh toán đủ'),

-- Hợp đồng 4 - CUS004
(31,'CUS004','2024-01-31 21:00:00','Khách thanh toán đủ'),
(32,'CUS004','2024-02-29 21:10:00','Khách thanh toán đủ'),
(33,'CUS004','2024-03-31 21:00:00','Khách thanh toán đủ'),
(34,'CUS00
4','2024-04-30 21:15:00','Khách thanh toán đủ'),
(35,'CUS004','2024-05-31 21:00:00','Khách thanh toán đủ'),
(36,'CUS004','2024-06-30 21:20:00','Khách thanh toán đủ'),
(37,'CUS004','2024-07-31 21:10:00','Khách thanh toán đủ'),
(38,'CUS004','2024-08-31 21:00:00','Khách thanh toán đủ'),
(39,'CUS004','2024-09-30 21:20:00','Khách thanh toán đủ'),
(40,'CUS004','2024-10-31 21:00:00','Khách thanh toán đủ');

-- 	INSERT INTO xac_nhan_thu_tien
-- 	(ma_hoa_don, ma_nguoi_xac_nhan, ngay_xac_nhan, ghi_chu)
-- 	VALUES
-- 	(1, 'AD0001', NOW(), 'Đã thu tiền');

-- 	UPDATE hoa_don
-- 	SET trang_thai = 'da_thu'
-- 	WHERE ma_hoa_don = 1;

select * from hoa_don;
SELECT hd.ma_hoa_don, hd.trang_thai
FROM hoa_don hd
LEFT JOIN xac_nhan_thu_tien xntt 
       ON hd.ma_hoa_don = xntt.ma_hoa_don
WHERE hd.trang_thai = 'da_thu'
  AND xntt.ma_hoa_don IS NULL;
SELECT 
    hd.ma_hoa_don,
    hd.tong_tien,
    SUM(ct.thanh_tien) AS tong_chi_tiet
FROM hoa_don hd
JOIN hoa_don_chi_tiet ct 
     ON hd.ma_hoa_don = ct.ma_hoa_don
GROUP BY hd.ma_hoa_don, hd.tong_tien
HAVING hd.tong_tien <> SUM(ct.thanh_tien);

UPDATE hoa_don hd
JOIN (
    SELECT 
        ma_hoa_don,
        SUM(thanh_tien) AS tong_chi_tiet
    FROM hoa_don_chi_tiet
    GROUP BY ma_hoa_don
) ct ON hd.ma_hoa_don = ct.ma_hoa_don
SET hd.tong_tien = ct.tong_chi_tiet
WHERE hd.tong_tien <> ct.tong_chi_tiet;
SELECT 
    hd.ma_hoa_don,
    hd.ngay_tao,
    xntt.ngay_xac_nhan
FROM hoa_don hd
JOIN xac_nhan_thu_tien xntt 
     ON hd.ma_hoa_don = xntt.ma_hoa_don
WHERE xntt.ngay_xac_nhan < hd.ngay_tao;
SELECT
    (SELECT COUNT(*) FROM hoa_don WHERE trang_thai = 'da_thu') AS so_hd_da_thu,
    (SELECT COUNT(*) FROM xac_nhan_thu_tien) AS so_xac_nhan,
    (SELECT COUNT(*) FROM hoa_don hd 
        LEFT JOIN xac_nhan_thu_tien xntt 
        ON hd.ma_hoa_don = xntt.ma_hoa_don
        WHERE hd.trang_thai = 'da_thu'
        AND xntt.ma_hoa_don IS NULL) AS hd_da_thu_thieu_xac_nhan;
