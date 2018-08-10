-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.18-0ubuntu0.16.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5164
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for tttp
DROP DATABASE IF EXISTS `tttp`;
CREATE DATABASE IF NOT EXISTS `tttp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_vietnamese_ci */;
USE `tttp`;

-- Dumping structure for table tttp.capcoquanquanly

CREATE TABLE "IF NOT EXISTS `CAPCOQUANQUANLY`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CHA_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.capcoquanquanly: 16 rows
/*!40000 ALTER TABLE `capcoquanquanly` DISABLE KEYS */;
INSERT INTO `capcoquanquanly` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ma`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`, `cha_id`) VALUES
	(1, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '001', 'Cấp Chính phủ', 'Cấp Chính phủ', 1, 1, NULL),
	(2, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '002', 'UBND Tỉnh, TP', 'UBND Tỉnh, TP', 1, 1, 1),
	(3, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '003', 'UBND Quận, Huyện', 'UBND Quận, Huyện', 1, 1, 2),
	(4, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '004', 'UBND Phường, Xã, Thị trấn', 'UBND Phường, Xã, Thị trấn', 1, 1, 3),
	(5, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '005', 'Sở ban ngành', 'Sở ban ngành', 1, 1, 2),
	(6, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '006', 'Phòng ban', 'Phòng ban', 1, 1, 5),
	(7, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '007', 'Chi cục', 'Chi cục', 1, 1, 5),
	(8, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '008', 'Cấp Bộ, Ngành', 'Cấp Bộ, Ngành', 1, 1, 1),
	(9, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '009', 'Tổng cục', 'Tổng cục', 1, 1, 8),
	(10, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '010', 'Cục', 'Cục', 1, 1, 8),
	(11, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '011', 'Vụ', 'Vụ', 1, 1, 8),
	(12, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '012', 'Trung tâm', 'Trung tâm', 1, 1, 8),
	(13, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '013', 'Cục thuộc Tổng cục', 'Cục thuộc Tổng cục', 1, 1, 9),
	(14, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '014', 'Vụ thuộc Tổng cục', 'Vụ thuộc Tổng cục', 1, 1, 9),
	(15, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '015', 'Trung tâm thuộc Tổng cục', 'Trung tâm thuộc Tổng cục', 1, 1, 9),
	(16, b'0', '2017-04-23 13:55:52', '2017-04-23 13:55:52', '016', 'Cơ quan hành chính sự nghiệp', 'Cơ quan hành chính sự nghiệp', 1, 1, 5);
/*!40000 ALTER TABLE `capcoquanquanly` ENABLE KEYS */;

-- Dumping structure for table tttp.capdonvihanhchinh

CREATE TABLE "IF NOT EXISTS `CAPDONVIHANHCHINH`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.capdonvihanhchinh: 9 rows
/*!40000 ALTER TABLE `capdonvihanhchinh` DISABLE KEYS */;
INSERT INTO `capdonvihanhchinh` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ma`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-04-23 11:06:20', '2017-04-23 11:06:22', '001', 'Tỉnh', 'Cấp tỉnh', 1, 1),
	(2, b'0', '2017-04-23 11:06:20', '2017-04-23 11:06:22', '002', 'Huyện', 'Cấp Huyện', 1, 1),
	(3, b'0', '2017-04-23 11:06:20', '2017-04-23 11:06:22', '003', 'Xã', 'Cấp Xã', 1, 1),
	(4, b'0', '2017-04-23 11:06:20', '2017-04-23 11:06:22', '004', 'TP', 'TP trực thuộc TW', 1, 1),
	(5, b'0', '2017-04-23 11:06:20', '2017-04-23 11:06:22', '005', 'Quận', 'Cấp Quận', 1, 1),
	(6, b'0', '2017-04-23 11:06:20', '2017-04-23 11:06:22', '006', 'Phường', 'Cấp Phường', 1, 1),
	(7, b'0', '2017-04-23 11:06:22', '2017-04-23 11:06:22', '007', 'Thị trấn', 'Thị trấn', 1, 1),
	(8, b'0', '2017-04-23 11:06:22', '2017-04-23 11:06:22', '008', 'Thị xã', 'Thị xã', 1, 1),
	(9, b'0', '2017-04-23 11:06:22', '2017-04-23 11:06:22', '009', 'TP trực thuộc tỉnh', 'TP trực thuộc tỉnh', 1, 1);
/*!40000 ALTER TABLE `capdonvihanhchinh` ENABLE KEYS */;

-- Dumping structure for table tttp.chucvu

CREATE TABLE "IF NOT EXISTS `CHUCVU`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.chucvu: 4 rows
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-06-05 10:37:34', '2017-04-24 10:38:09', 'Lãnh đạo', 'Lãnh đạo', 1, 1),
	(2, b'0', '2017-06-05 10:35:56', '2017-04-24 10:38:15', 'Trưởng phòng', 'Trưởng phòng', 1, 1),
	(3, b'0', '2017-06-05 10:36:09', '2017-05-03 15:56:59', 'Chuyên viên', 'Chuyên viên', 1, 1),
	(4, b'0', '2017-06-05 10:37:27', '2017-05-03 15:59:46', 'Chuyên viên nhập liệu', 'Chuyên viên nhập liệu', 1, 1);
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;

-- Dumping structure for table tttp.chungchihanhnghe

CREATE TABLE "IF NOT EXISTS `CHUNGCHIHANHNGHE`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DUONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CONGDAN_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.chungchihanhnghe: 0 rows
/*!40000 ALTER TABLE `chungchihanhnghe` DISABLE KEYS */;
/*!40000 ALTER TABLE `chungchihanhnghe` ENABLE KEYS */;

-- Dumping structure for table tttp.congchuc

CREATE TABLE "IF NOT EXISTS `CONGCHUC`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DIENTHOAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`GIOITINH`" bit(1) NOT NULL,
  "`HOVATEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CHUCVU_ID`" bigint(20) DEFAULT NULL,
  "`COQUANQUANLY_ID`" bigint(20) DEFAULT NULL,
  "`NGUOIDUNG_ID`" bigint(20) NOT NULL,
  PRIMARY KEY (`id`)





) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.congchuc: 93 rows
/*!40000 ALTER TABLE `congchuc` DISABLE KEYS */;
INSERT INTO `congchuc` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `dienThoai`, `gioiTinh`, `hoVaTen`, `nguoiSua_id`, `nguoiTao_id`, `chucVu_id`, `coQuanQuanLy_id`, `nguoiDung_id`) VALUES
	(1, b'0', '2017-06-10 16:06:31', '2017-04-24 10:49:48', '01206189116', b'1', 'Administrator', 1, 1, 1, 2, 1),
	(2, b'0', '2017-06-10 16:07:05', '2017-05-03 15:30:58', '01206189116', b'1', 'Tran Vo Dinh Nam', 1, 1, 2, 90, 2),
	(3, b'0', '2017-06-10 16:07:10', '2017-05-03 15:51:28', '01206189116', b'1', 'Phạm Xuân Thành', 1, 1, 3, 90, 4),
	(4, b'0', '2017-06-10 16:07:01', '2017-05-03 15:52:46', '01206189116', b'1', 'Võ Tiến An', 1, 1, 4, 2, 5),
	(5, b'0', '2017-06-10 16:07:07', '2017-05-17 19:06:57', '01206189445', b'1', 'Lý Văn Vinh', 1, 1, 2, 90, 6),
	(6, b'0', '2017-06-10 16:07:13', '2017-05-17 19:42:57', '01206185446', b'1', 'Huỳnh Quang Thắng', 1, 1, 3, 90, 7),
	(7, b'0', '2017-06-10 16:07:27', '2017-05-17 19:43:49', '01204548796', b'1', 'Tôn Thất Toàn', 1, 1, 3, 90, 8),
	(8, b'0', '2017-06-10 16:06:34', '2017-05-17 19:44:59', '01206132554', b'1', 'Thanh Tra Thành Phố', 1, 1, 1, 2, 9),
	(9, b'0', '2017-06-10 16:06:40', '2017-05-17 19:47:34', '01206541254', b'1', 'Hà Xuân Thành', 1, 1, 1, 2, 10),
	(10, b'0', '2017-06-10 16:06:43', '2017-05-17 19:52:42', '01206523664', b'1', 'Phùng Duy Thiện', 1, 1, 1, 2, 11),
	(11, b'0', '2017-06-10 16:06:37', '2017-05-17 19:53:38', '01206214552', b'1', 'Trần Xuân Vũ', 1, 1, 1, 2, 12),
	(12, b'0', '2017-06-11 08:58:45', '2017-05-31 16:37:56', '01204512665', b'1', 'Sở Tài Nguyên Môi Trường', 1, 1, 1, 14, 13),
	(13, b'0', '2017-06-11 08:58:42', '2017-05-31 16:39:46', '0905463253', b'1', 'Nguyễn Văn Mỹ', 1, 1, 3, 91, 14),
	(14, b'0', '2017-06-10 16:15:31', '2017-05-31 16:44:22', '01206154221', b'1', 'Trần Tiến Hùng', 1, 1, 2, 91, 15),
	(15, b'0', '2017-06-10 16:15:19', '2017-05-31 16:46:51', '01206125441', b'1', 'Lê Thị Nhàn', 1, 1, 2, 91, 16),
	(16, b'0', '2017-06-11 08:57:54', '2017-06-10 17:23:12', '01206189116', b'1', 'Nguyễn Văn Nam', 1, 1, 3, 91, 18),
	(17, b'0', '2017-06-11 08:58:27', '2017-06-10 17:24:09', '01206189116', b'1', 'Nguyễn Phạm Xuân Hùng', 1, 1, 3, 91, 19),
	(18, b'0', '2017-06-11 08:59:18', '2017-06-10 17:24:53', '01206189116', b'1', 'Vũ Ngọc Bằng', 1, 1, 1, 14, 20),
	(19, b'0', '2017-06-11 09:02:49', '2017-06-10 17:25:33', '01206189116', b'1', 'Võ Thị Huyền Trân', 1, 1, 1, 14, 21),
	(20, b'0', '2017-06-11 09:31:43', '2017-06-11 09:31:43', '01206189116', b'1', 'Hoàng Anh Vũ', 1, 1, 1, 14, 22),
	(21, b'0', '2017-06-11 09:34:12', '2017-06-11 09:34:12', '01206189116', b'1', 'Trần Thị Thu Thùy', 1, 1, 4, 14, 23),
	(22, b'0', '2017-06-11 09:35:23', '2017-06-11 09:35:23', '01206189116', b'1', 'Nguyễn Đại Đồng', 1, 1, 2, 123, 24),
	(23, b'0', '2017-06-11 09:36:09', '2017-06-11 09:36:09', '01206189116', b'1', 'Bùi Văn Vượng', 1, 1, 2, 93, 25),
	(24, b'0', '2017-06-11 09:37:52', '2017-06-11 09:37:52', '01206189116', b'1', 'Phạm Nguyên Phong', 1, 1, 3, 93, 26),
	(25, b'0', '2017-06-11 09:38:33', '2017-06-11 09:38:33', '01206189116', b'1', 'Quán Đức Bình', 1, 1, 3, 93, 27),
	(26, b'0', '2017-06-11 09:39:01', '2017-06-11 09:39:01', '01206189116', b'1', 'Đinh Đức Trọng', 1, 1, 3, 93, 28),
	(27, b'0', '2017-06-11 09:39:50', '2017-06-11 09:39:50', '01206189116', b'1', 'Tạ Bá Thành Huy', 1, 1, 2, 94, 29),
	(28, b'0', '2017-06-11 09:41:36', '2017-06-11 09:40:27', '01206189116', b'1', 'Phạm Công Toàn', 1, 1, 2, 94, 30),
	(29, b'0', '2017-06-11 09:41:39', '2017-06-11 09:41:17', '01206189116', b'1', 'Nguyễn Trường Thành', 1, 1, 3, 94, 31),
	(30, b'0', '2017-06-11 09:42:06', '2017-06-11 09:42:06', '01206189116', b'1', 'Hoàng Nhât Trường', 1, 1, 3, 94, 32),
	(31, b'0', '2017-06-11 09:42:33', '2017-06-11 09:42:33', '01206189116', b'1', 'Phan Quốc Việt', 1, 1, 3, 94, 33),
	(32, b'0', '2017-06-11 09:48:07', '2017-06-11 09:48:07', '01206189116', b'1', 'Sở Giao Thông Vận Tải', 1, 1, 1, 4, 34),
	(33, b'0', '2017-06-11 09:48:41', '2017-06-11 09:48:41', '01206189116', b'1', 'Nguyễn Quốc Bão', 1, 1, 1, 4, 35),
	(34, b'0', '2017-06-11 09:49:10', '2017-06-11 09:49:10', '01206189116', b'1', 'Lê Văn Vĩnh Tín', 1, 1, 1, 4, 36),
	(35, b'0', '2017-06-11 09:49:34', '2017-06-11 09:49:34', '01206189116', b'1', 'Nguyễn Đăng Hòa', 1, 1, 1, 4, 37),
	(36, b'0', '2017-06-11 09:50:01', '2017-06-11 09:50:01', '01206189116', b'1', 'Phạm Ngọc Thao', 1, 1, 4, 4, 38),
	(37, b'0', '2017-06-11 09:51:24', '2017-06-11 09:51:11', '01206189116', b'1', 'Võ Hoàng Phương Dung', 1, 1, 2, 96, 39),
	(38, b'0', '2017-06-11 09:51:49', '2017-06-11 09:51:49', '01206189116', b'1', 'Nguyễn Lê Ngọc Vỹ', 1, 1, 2, 96, 40),
	(39, b'0', '2017-06-11 09:52:11', '2017-06-11 09:52:11', '01206189116', b'1', 'Nguyễn Hữu Hiếu', 1, 1, 3, 96, 41),
	(40, b'0', '2017-06-11 09:52:51', '2017-06-11 09:52:51', '01206189116', b'1', 'Võ An Ninh', 1, 1, 3, 96, 42),
	(41, b'0', '2017-06-11 09:53:16', '2017-06-11 09:53:16', '01206189116', b'1', 'Nguyễn Văn Minh', 1, 1, 3, 96, 43),
	(42, b'0', '2017-06-11 09:53:43', '2017-06-11 09:53:43', '01206189116', b'1', 'Võ Văn Thành', 1, 1, 2, 97, 44),
	(43, b'0', '2017-06-11 09:54:16', '2017-06-11 09:54:16', '01206189116', b'1', 'Nguyễn Tri Thành', 1, 1, 2, 97, 45),
	(44, b'0', '2017-06-11 09:54:38', '2017-06-11 09:54:38', '01206189116', b'1', 'Lê Đức', 1, 1, 3, 97, 46),
	(45, b'0', '2017-06-11 09:55:05', '2017-06-11 09:55:05', '01206189116', b'1', 'Trương Ngọc Âu', 1, 1, 3, 97, 47),
	(46, b'0', '2017-06-11 09:55:25', '2017-06-11 09:55:25', '01206189116', b'1', 'Nguyễn Hoàng Vũ', 1, 1, 3, 97, 48),
	(47, b'0', '2017-06-11 09:58:10', '2017-06-11 09:58:10', '01206189116', b'1', 'Sở Xây Dựng', 1, 1, 1, 17, 49),
	(48, b'0', '2017-06-11 09:59:49', '2017-06-11 09:59:49', '01206189116', b'1', 'Nguyễn Thị Thanh Hòa', 1, 1, 1, 17, 50),
	(49, b'0', '2017-06-11 10:00:17', '2017-06-11 10:00:17', '01206189116', b'1', 'Trần Văn Lành', 1, 1, 1, 17, 51),
	(50, b'0', '2017-06-11 10:00:46', '2017-06-11 10:00:46', '01206189116', b'1', 'Nguyễn Tri Giảng', 1, 1, 1, 17, 52),
	(51, b'0', '2017-06-11 10:01:12', '2017-06-11 10:01:12', '01206189116', b'1', 'Lê Phước Khanh', 1, 1, 4, 17, 53),
	(52, b'0', '2017-06-11 10:01:44', '2017-06-11 10:01:44', '01206189116', b'1', 'Thân Vĩnh Minh', 1, 1, 2, 135, 54),
	(53, b'0', '2017-06-11 10:02:06', '2017-06-11 10:02:06', '01206189116', b'1', 'Hồ Minh Tuấn', 1, 1, 2, 135, 55),
	(54, b'0', '2017-06-11 10:02:30', '2017-06-11 10:02:30', '01206189116', b'1', 'Trương Ngọc Tiến', 1, 1, 3, 135, 56),
	(55, b'0', '2017-06-11 10:02:51', '2017-06-11 10:02:51', '01206189116', b'1', 'Hồ Chí Thành', 1, 1, 3, 135, 57),
	(56, b'0', '2017-06-11 10:03:23', '2017-06-11 10:03:23', '01206189116', b'1', 'Đỗ Quang Thắng', 1, 1, 3, 135, 58),
	(57, b'0', '2017-06-11 10:03:54', '2017-06-11 10:03:46', '01206189116', b'1', 'Lê Duy Tân', 1, 1, 2, 136, 59),
	(58, b'0', '2017-06-11 10:04:18', '2017-06-11 10:04:18', '01206189116', b'1', 'Đặng Trần Chí Toàn', 1, 1, 2, 136, 60),
	(59, b'0', '2017-06-11 10:04:44', '2017-06-11 10:04:44', '01206189116', b'1', 'Lưu Trọng Nghĩa', 1, 1, 3, 136, 61),
	(60, b'0', '2017-06-11 10:05:07', '2017-06-11 10:05:07', '01206189116', b'1', 'Lê Kim Tuấn', 1, 1, 3, 136, 62),
	(61, b'0', '2017-06-11 10:05:33', '2017-06-11 10:05:33', '01206189116', b'1', 'Trần Lê Quang Phú', 1, 1, 3, 136, 63),
	(62, b'0', '2017-06-11 10:08:28', '2017-06-11 10:08:28', '01206189116', b'1', 'UBND quận Thanh Khê', 1, 1, 1, 20, 64),
	(63, b'0', '2017-06-11 10:08:57', '2017-06-11 10:08:57', '01206189116', b'1', 'Trần Thị Thu Huyền', 1, 1, 1, 20, 65),
	(64, b'0', '2017-06-11 10:09:27', '2017-06-11 10:09:27', '01206189116', b'1', 'Thôi Hiển Chính', 1, 1, 1, 20, 66),
	(65, b'0', '2017-06-11 10:11:56', '2017-06-11 10:11:42', '01206189116', b'1', 'Dương Anh Hào', 1, 1, 1, 20, 67),
	(66, b'0', '2017-06-11 10:12:19', '2017-06-11 10:12:19', '01206189116', b'1', 'Bùi Thị Hoài Thương', 1, 1, 4, 20, 68),
	(67, b'0', '2017-06-11 10:14:07', '2017-06-11 10:14:07', '01206189116', b'1', 'Bùi Thị Thu Thủy', 1, 1, 2, 144, 69),
	(68, b'0', '2017-06-11 10:14:39', '2017-06-11 10:14:39', '01206189116', b'1', 'Trần Thanh Hoài', 1, 1, 2, 144, 70),
	(69, b'0', '2017-06-11 10:15:20', '2017-06-11 10:15:20', '01206189116', b'1', 'Trần Xuân Sang', 1, 1, 3, 144, 71),
	(70, b'0', '2017-06-11 10:16:13', '2017-06-11 10:16:13', '01206189116', b'1', 'Lê Văn Tình', 1, 1, 3, 144, 72),
	(71, b'0', '2017-06-11 10:16:36', '2017-06-11 10:16:36', '01206189116', b'1', 'Trương Công Nguyên Thanh', 1, 1, 3, 144, 73),
	(72, b'0', '2017-06-11 10:17:49', '2017-06-11 10:17:49', '01206189116', b'1', 'Kpă Hương', 1, 1, 2, 145, 74),
	(73, b'0', '2017-06-11 10:18:28', '2017-06-11 10:18:28', '01206189116', b'1', 'Đỗ Thị Trang Thương', 1, 1, 2, 145, 75),
	(74, b'0', '2017-06-11 10:18:48', '2017-06-11 10:18:48', '01206189116', b'1', 'Nguyễn Thị Hồng', 1, 1, 3, 145, 76),
	(75, b'0', '2017-06-11 10:19:26', '2017-06-11 10:19:26', '01206189116', b'1', 'Nguyễn Xuân Hoàn', 1, 1, 3, 145, 77),
	(76, b'0', '2017-06-11 10:20:01', '2017-06-11 10:20:01', '01206189116', b'1', 'Đinh Hải Nam', 1, 1, 3, 145, 78),
	(77, b'0', '2017-06-11 10:24:55', '2017-06-11 10:24:55', '01206189116', b'1', 'UBND quận Hải Châu', 1, 1, 1, 21, 79),
	(78, b'0', '2017-06-11 10:25:23', '2017-06-11 10:25:23', '01206189116', b'1', 'Lê Văn Cương', 1, 1, 1, 21, 80),
	(79, b'0', '2017-06-11 10:25:48', '2017-06-11 10:25:48', '01206189116', b'1', 'Võ Trần Chí', 1, 1, 1, 21, 81),
	(80, b'0', '2017-06-11 10:26:14', '2017-06-11 10:26:14', '01206189116', b'1', 'Nguyễn Cao Tuấn', 1, 1, 1, 21, 82),
	(81, b'0', '2017-06-11 10:26:38', '2017-06-11 10:26:38', '01206189116', b'1', 'Nguyễn Thị Yến Vy', 1, 1, 4, 21, 83),
	(82, b'0', '2017-06-11 10:26:59', '2017-06-11 10:26:59', '01206189116', b'1', 'Thái Thị Hương', 1, 1, 2, 147, 84),
	(83, b'0', '2017-06-11 10:27:22', '2017-06-11 10:27:22', '01206189116', b'1', 'Trần Thị Uyên Trang', 1, 1, 2, 147, 85),
	(84, b'0', '2017-06-11 10:27:42', '2017-06-11 10:27:42', '01206189116', b'1', 'Hoàng Thị Thu', 1, 1, 3, 147, 86),
	(85, b'0', '2017-06-11 10:28:07', '2017-06-11 10:28:07', '01206189116', b'1', 'Nguyễn Đặng Khiêm An', 1, 1, 3, 147, 87),
	(86, b'0', '2017-06-11 10:30:01', '2017-06-11 10:30:01', '01206189116', b'1', 'Nguyễn Đình Huy', 1, 1, 3, 147, 88),
	(87, b'0', '2017-06-11 10:30:29', '2017-06-11 10:30:29', '01206189116', b'1', 'Nguyễn Hoàng Gia', 1, 1, 2, 148, 89),
	(88, b'0', '2017-06-11 10:30:56', '2017-06-11 10:30:56', '01206189116', b'1', 'Phạm Trúc Mai', 1, 1, 2, 148, 90),
	(89, b'0', '2017-06-11 10:31:28', '2017-06-11 10:31:28', '01206189116', b'1', 'Huỳnh Cao Huyền Trâm', 1, 1, 3, 148, 91),
	(90, b'0', '2017-06-11 10:31:56', '2017-06-11 10:31:56', '01206189116', b'1', 'Nguyễn Thị Bích Vân', 1, 1, 3, 148, 92),
	(91, b'0', '2017-06-11 10:32:17', '2017-06-11 10:32:17', '01206189116', b'1', 'Nguyễn Thị Ánh Nga', 1, 1, 3, 148, 93),
	(92, b'0', '2017-06-11 10:33:59', '2017-06-11 10:33:59', '01206189116', b'1', 'UBND phường Tân Chính', 1, 1, 1, 36, 94),
	(93, b'0', '2017-06-11 10:36:42', '2017-06-11 10:36:42', '01206189116', b'1', 'UBND phường Thanh Bình', 1, 1, 1, 42, 95);
/*!40000 ALTER TABLE `congchuc` ENABLE KEYS */;

-- Dumping structure for table tttp.congdan

CREATE TABLE "IF NOT EXISTS `CONGDAN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DIACHI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`GIOITINH`" bit(1) NOT NULL,
  "`HOVATEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGAYCAP`" datetime DEFAULT NULL,
  "`NGAYSINH`" datetime DEFAULT NULL,
  "`SOCMNDHOCHIEU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SODIENTHOAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DANTOC_ID`" bigint(20) DEFAULT NULL,
  "`NOICAPCMND_ID`" bigint(20) DEFAULT NULL,
  "`PHUONGXA_ID`" bigint(20) DEFAULT NULL,
  "`QUANHUYEN_ID`" bigint(20) DEFAULT NULL,
  "`QUOCTICH_ID`" bigint(20) DEFAULT NULL,
  "`TINHTHANH_ID`" bigint(20) DEFAULT NULL,
  "`TODANPHO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)









) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.congdan: 22 rows
/*!40000 ALTER TABLE `congdan` DISABLE KEYS */;
INSERT INTO `congdan` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `diaChi`, `gioiTinh`, `hoVaTen`, `ngayCap`, `ngaySinh`, `soCMNDHoChieu`, `soDienThoai`, `nguoiSua_id`, `nguoiTao_id`, `danToc_id`, `noiCapCMND_id`, `phuongXa_id`, `quanHuyen_id`, `quocTich_id`, `tinhThanh_id`, `toDanPho_id`) VALUES
	(17, b'0', '2017-06-13 18:05:50', '2017-05-17 09:45:37', '221 Hà Huy Tập nối dài', b'0', 'Huỳnh Bảo Ngọc', '2011-10-21 00:00:00', '1989-09-02 00:00:00', '201574408', '0932110442', 3, 1, 1, 86, 31, 15, 1, 9, 116),
	(16, b'0', '2017-05-16 20:44:33', '2017-05-16 20:44:21', 'K377/34 Hải Phòng', b'1', 'Trần Võ Đình Nam', '2010-11-19 17:00:00', '1994-01-06 17:00:00', '201702275', '01206189116', 1, 1, 1, 86, 31, 15, 1, 9, 107),
	(18, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '20 Nguyễn Huy Tưởng', b'1', 'Lê Văn Quý', NULL, '1975-09-29 00:00:00', '201425632', '01206116305', 3, 1, NULL, 86, 26, 14, NULL, 9, 61),
	(19, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '35 Phan Chu Trinh', b'1', 'Võ Hoài Nam', '2010-12-22 00:00:00', '1983-10-05 00:00:00', '201356214', '0982137146', 3, 1, 1, 86, 40, 16, 1, 9, 197),
	(20, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '12 Cù Chính Lan', b'0', 'Đỗ Bảo Trân', NULL, NULL, '201356214', '0982137146', 3, 1, 1, 86, 35, 15, 1, 9, 147),
	(21, b'0', '2017-05-17 11:23:07', '2017-05-17 10:05:05', '15 Tản Đà', b'1', 'Trần Bá Hòa', NULL, '1975-09-29 00:00:00', '201115642', '01206116305', 1, 1, NULL, 86, 34, 15, NULL, 9, 140),
	(22, b'0', '2017-05-17 12:36:17', '2017-05-17 10:05:05', '23 Phan Tứ', b'1', 'Đặng Đình Cường', NULL, NULL, '201575538', '0932110442', 1, 1, NULL, 86, 57, 18, NULL, 9, 375),
	(23, b'0', '2017-05-17 11:23:07', '2017-05-17 10:05:05', '30 Quang Trung', b'0', 'Nguyễn Thị Kim', NULL, '1983-10-05 00:00:00', '201245578', '0982137146', 1, 1, NULL, 86, 40, 16, NULL, 9, 197),
	(24, b'0', '2017-06-13 17:57:09', '2017-05-17 10:14:19', '20 Nguyễn Huy Tưởng', b'1', 'Nguyễn Văn Khải', NULL, NULL, '201426632', '01206116305', 3, 1, 1, 86, 26, 14, 1, 9, 61),
	(25, b'0', '2017-06-13 17:56:52', '2017-05-17 10:40:57', '88 Cần Giuộc', b'0', 'Nguyễn Thị Trung Chinh', '2012-01-24 00:00:00', '1970-02-10 00:00:00', '201052987', '01206116305', 3, 1, 1, 86, 36, 15, 1, 9, 165),
	(26, b'0', '2017-06-13 18:06:26', '2017-05-17 11:13:00', '221 Trường Chinh', b'0', 'Phạm Thị Cẩm Nhung', NULL, '1993-09-02 00:00:00', '201648215', '01214645823', 3, 1, 1, 86, 35, 15, 1, 9, 155),
	(27, b'0', '2017-06-13 18:06:12', '2017-05-17 11:23:07', '70 Nguyễn Lương Bằng', b'1', 'Đinh Nguyễn Anh Khuê', NULL, '1993-10-05 00:00:00', '201357214', '0982137146', 3, 1, 1, 86, 24, 14, 1, 9, 40),
	(28, b'0', '2017-06-13 17:54:12', '2017-05-17 11:36:30', '70 Nguyễn Lương Bằng', b'0', 'Dương Thanh Ái Quyên', '2010-12-23 00:00:00', '1993-09-29 00:00:00', '201225632', '01206116305', 3, 1, 1, 86, 24, 14, 1, 9, 40),
	(29, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', '534 Trần Cao Vân', b'1', 'Huỳnh Quốc Đạt', '2011-10-21 00:00:00', '1987-09-23 00:00:00', '201537408', '0906345210', 3, 1, 1, 86, 34, 15, 1, 9, 145),
	(30, b'0', '2017-05-17 12:48:49', '2017-05-17 12:48:49', '30 Bà Huyện Thanh Quan', b'1', 'Lê Quang Tuấn', '2015-12-21 00:00:00', '1987-09-20 00:00:00', '201575786', '01202052973', 1, 1, NULL, 86, 57, 18, NULL, 9, 371),
	(31, b'0', '2017-06-13 18:07:32', '2017-05-17 12:48:49', '24 Quang Trung', b'1', 'Nguyễn Tiến Bá', '2010-12-02 00:00:00', '1983-10-05 00:00:00', '205356214', '0905234123', 3, 1, 1, 86, 40, 16, 1, 9, 197),
	(32, b'0', '2017-05-17 12:48:49', '2017-05-17 12:48:49', '50 Hà Huy Tập', b'0', 'Nguyễn Hồng Quyên', '2013-12-22 00:00:00', '1981-06-05 00:00:00', '201356467', '0903300143', 1, 1, NULL, 86, 35, 15, NULL, 9, 147),
	(33, b'0', '2017-05-17 12:48:49', '2017-05-17 12:48:49', '43 Hồ Tùng Mậu', b'1', 'Nguyễn Bá Quang', '1999-12-23 00:00:00', '1970-08-19 00:00:00', '201422432', '0973389168', 1, 1, NULL, 86, 26, 14, NULL, 9, 61),
	(34, b'0', '2017-05-17 12:48:49', '2017-05-17 12:48:49', '30 Quang Trung', b'0', 'Trần Thị Nguyệt', '1998-12-22 00:00:00', '1976-10-05 00:00:00', '201245523', '0987371772', 1, 1, NULL, 86, 40, 16, NULL, 9, 197),
	(35, b'0', '2017-05-17 12:48:49', '2017-05-17 12:48:49', '15 Tản Đà', b'1', 'Huỳnh Văn Chương', '1991-12-23 00:00:00', '1965-08-29 00:00:00', '200213224', '01636629861', 1, 1, NULL, 86, 34, 15, NULL, 9, 140),
	(36, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', '23 Ngô Thì Nhậm', b'1', 'Trần Quang Diệu', '2014-03-09 00:00:00', '1978-09-29 00:00:00', '204025632', '01261246721', 3, 1, 1, 86, 26, 14, 1, 9, 61),
	(37, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:24', '12 Hàm Nghi', b'0', 'Nguyễn Thị Nụ', '2012-01-24 00:00:00', '1970-02-10 00:00:00', '201052966', '01201090931', 3, 1, 1, 86, 34, 15, 1, 9, 138);
/*!40000 ALTER TABLE `congdan` ENABLE KEYS */;

-- Dumping structure for table tttp.coquanquanly

CREATE TABLE "IF NOT EXISTS `COQUANQUANLY`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CAPCOQUANQUANLY_ID`" bigint(20) NOT NULL,
  "`CHA_ID`" bigint(20) DEFAULT NULL,
  "`DONVIHANHCHINH_ID`" bigint(20) NOT NULL,
  "`LOAICOQUANQUANLY_ID`" bigint(20) DEFAULT NULL,
  "`DONVI_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)







) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.coquanquanly: 164 rows
/*!40000 ALTER TABLE `coquanquanly` DISABLE KEYS */;
INSERT INTO `coquanquanly` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ma`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`, `capCoQuanQuanLy_id`, `cha_id`, `donViHanhChinh_id`, `loaiCoQuanQuanLy_id`, `donVi_id`) VALUES
	(1, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '001', 'UBND Thành phố Đà Nẵng', 'UBND Thành phố Đà Nẵng', 1, 1, 2, NULL, 9, NULL, 1),
	(2, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '002', 'Thanh tra thành phố', 'Thanh tra thành phố', 1, 1, 5, 1, 9, NULL, 2),
	(3, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '003', 'Sở Công Thương', 'Sở Công Thương', 1, 1, 5, 1, 9, NULL, 3),
	(4, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '004', 'Sở Giao thông Vận tải', 'Sở Giao thông Vận tải', 1, 1, 5, 1, 9, NULL, 4),
	(5, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '005', 'Sở Giáo dục và Đào tạo', 'Sở Giáo dục và Đào tạo', 1, 1, 5, 1, 9, NULL, 5),
	(6, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '006', 'Sở Khoa học và Công nghệ', 'Sở Khoa học và Công nghệ', 1, 1, 5, 1, 9, NULL, 6),
	(7, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '007', 'Sở Kế hoạch và Đầu tư', 'Sở Kế hoạch và Đầu tư', 1, 1, 5, 1, 9, NULL, 7),
	(8, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '008', 'Sở Lao động, Thương binh và Xã hội', 'Sở Lao động, Thương binh và Xã hội', 1, 1, 5, 1, 9, NULL, 8),
	(9, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '009', 'Sở Ngoại vụ', 'Sở Ngoại vụ', 1, 1, 5, 1, 9, NULL, 9),
	(10, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '010', 'Sở Nông nghiệp và Phát triển nông thôn', 'Sở Nông nghiệp và Phát triển nông thôn', 1, 1, 5, 1, 9, NULL, 10),
	(11, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '011', 'Sở Nội vụ', 'Sở Nội vụ', 1, 1, 5, 1, 9, NULL, 11),
	(12, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '012', 'Sở Thông tin và Truyền thông', 'Sở Thông tin và Truyền thông', 1, 1, 5, 1, 9, NULL, 12),
	(13, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '013', 'Sở Tài chính', 'Sở Tài chính', 1, 1, 5, 1, 9, NULL, 13),
	(14, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '014', 'Sở Tài nguyên và Môi trường', 'Sở Tài nguyên và Môi trường', 1, 1, 5, 1, 9, NULL, 14),
	(15, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '015', 'Sở Tư pháp', 'Sở Tư pháp', 1, 1, 5, 1, 9, NULL, 15),
	(16, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '016', 'Sở Văn hóa, Thể thao và Du lịch', 'Sở Văn hóa, Thể thao và Du lịch', 1, 1, 5, 1, 9, NULL, 16),
	(17, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '017', 'Sở Xây dựng', 'Sở Xây dựng', 1, 1, 5, 1, 9, NULL, 17),
	(18, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '018', 'Sở Y tế', 'Sở Y tế', 1, 1, 5, 1, 9, NULL, 18),
	(19, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '019', 'UBND quận Liên Chiểu', 'UBND quận Liên Chiểu', 1, 1, 3, 1, 14, NULL, 19),
	(20, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '020', 'UBND quận Thanh Khê', 'UBND quận Thanh Khê', 1, 1, 3, 1, 15, NULL, 20),
	(21, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '021', 'UBND quận Hải Châu', 'UBND quận Hải Châu', 1, 1, 3, 1, 16, NULL, 21),
	(22, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '022', 'UBND quận Sơn Trà', 'UBND quận Sơn Trà', 1, 1, 3, 1, 17, NULL, 22),
	(23, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '023', 'UBND quận Ngũ Hành Sơn', 'UBND quận Ngũ Hành Sơn', 1, 1, 3, 1, 18, NULL, 23),
	(24, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '024', 'UBND quận Cẩm Lệ', 'UBND quận Cẩm Lệ', 1, 1, 3, 1, 19, NULL, 24),
	(25, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '025', 'UBND huyện Hòa Vang', 'UBND huyện Hòa Vang', 1, 1, 3, 1, 20, NULL, 25),
	(26, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '026', 'UBND huyện Hoàng Sa', 'UBND huyện Hoàng Sa', 1, 1, 3, 1, 21, NULL, 26),
	(27, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '027', 'UBND phường Hòa Hiệp Bắc', 'UBND phường Hòa Hiệp Bắc', 1, 1, 4, 19, 22, NULL, 27),
	(28, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '028', 'UBND phường Hòa Hiệp Nam', 'UBND phường Hòa Hiệp Nam', 1, 1, 4, 19, 23, NULL, 28),
	(29, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '029', 'UBND Phường Hòa Khánh Bắc', 'UBND Phường Hòa Khánh Bắc', 1, 1, 4, 19, 24, NULL, 29),
	(30, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '030', 'UBND phường Hòa Khánh Nam', 'UBND phường Hòa Khánh Nam', 1, 1, 4, 19, 25, NULL, 30),
	(31, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '031', 'UBND phường Hòa Minh', 'UBND phường Hòa Minh', 1, 1, 4, 19, 26, NULL, 31),
	(32, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '032', 'UBND phường Tam Thuận', 'UBND phường Tam Thuận', 1, 1, 4, 20, 27, NULL, 32),
	(33, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '033', 'UBND phường Thanh Khê Tây', 'UBND phường Thanh Khê Tây', 1, 1, 4, 20, 28, NULL, 33),
	(34, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '034', 'UBND phường Thanh Khê Đông', 'UBND phường Thanh Khê Đông', 1, 1, 4, 20, 29, NULL, 34),
	(35, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '035', 'UBND phường Xuân Hà', 'UBND phường Xuân Hà', 1, 1, 4, 20, 30, NULL, 35),
	(36, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '036', 'UBND phường Tân Chính', 'UBND phường Tân Chính', 1, 1, 4, 20, 31, NULL, 36),
	(37, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '037', 'UBND phường Chính Gián', 'UBND phường Chính Gián', 1, 1, 4, 20, 32, NULL, 37),
	(38, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '038', 'UBND phường Vĩnh Trung', 'UBND phường Vĩnh Trung', 1, 1, 4, 20, 33, NULL, 38),
	(39, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '039', 'UBND phường Thạc Gián', 'UBND phường Thạc Gián', 1, 1, 4, 20, 34, NULL, 39),
	(40, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '040', 'UBND phường An Khê', 'UBND phường An Khê', 1, 1, 4, 20, 35, NULL, 40),
	(41, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '041', 'UBND phường Hòa Khê', 'UBND phường Hòa Khê', 1, 1, 4, 20, 36, NULL, 41),
	(42, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '042', 'UBND phường Thanh Bình', 'UBND phường Thanh Bình', 1, 1, 4, 21, 37, NULL, 42),
	(43, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '043', 'UBND phường Thuận Phước', 'UBND phường Thuận Phước', 1, 1, 4, 21, 38, NULL, 43),
	(44, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '044', 'UBND phường Thạch Thang', 'UBND phường Thạch Thang', 1, 1, 4, 21, 39, NULL, 44),
	(45, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '045', 'UBND phường Hải Châu I', 'UBND phường Hải Châu I', 1, 1, 4, 21, 40, NULL, 45),
	(46, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '046', 'UBND phường Hải Châu II', 'UBND phường Hải Châu II', 1, 1, 4, 21, 41, NULL, 46),
	(47, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '047', 'UBND phường Phước Ninh', 'UBND phường Phước Ninh', 1, 1, 4, 21, 42, NULL, 47),
	(48, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '048', 'UBND phường Hòa Thuận Tây', 'UBND phường Hòa Thuận Tây', 1, 1, 4, 21, 43, NULL, 48),
	(49, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '049', 'UBND phường Hòa Thuận Đông', 'UBND phường Hòa Thuận Đông', 1, 1, 4, 21, 44, NULL, 49),
	(50, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '050', 'UBND phường Nam Dương', 'UBND phường Nam Dương', 1, 1, 4, 21, 45, NULL, 50),
	(51, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '051', 'UBND phường Bình Hiên', 'UBND phường Bình Hiên', 1, 1, 4, 21, 46, NULL, 51),
	(52, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '052', 'UBND phường Bình Thuận', 'UBND phường Bình Thuận', 1, 1, 4, 21, 47, NULL, 52),
	(53, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '053', 'UBND phường Hòa Cường Bắc', 'UBND phường Hòa Cường Bắc', 1, 1, 4, 21, 48, NULL, 53),
	(54, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '054', 'UBND phường Hòa Cường Nam', 'UBND phường Hòa Cường Nam', 1, 1, 4, 21, 49, NULL, 54),
	(55, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '055', 'UBND phường Thọ Quang', 'UBND phường Thọ Quang', 1, 1, 4, 22, 50, NULL, 55),
	(56, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '056', 'UBND phường Nại Hiên Đông', 'UBND phường Nại Hiên Đông', 1, 1, 4, 22, 51, NULL, 56),
	(57, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '057', 'UBND phường Mân Thái', 'UBND phường Mân Thái', 1, 1, 4, 22, 52, NULL, 57),
	(58, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '058', 'UBND phường An Hải Bắc', 'UBND phường An Hải Bắc', 1, 1, 4, 22, 53, NULL, 58),
	(59, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '059', 'UBND phường Phước Mỹ', 'UBND phường Phước Mỹ', 1, 1, 4, 22, 54, NULL, 59),
	(60, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '060', 'UBND phường An Hải Tây', 'UBND phường An Hải Tây', 1, 1, 4, 22, 55, NULL, 60),
	(61, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '061', 'UBND phường An Hải Đông', 'UBND phường An Hải Đông', 1, 1, 4, 22, 56, NULL, 61),
	(62, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '062', 'UBND phường Mỹ An', 'UBND phường Mỹ An', 1, 1, 4, 23, 57, NULL, 62),
	(63, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '063', 'UBND phường Khuê Mỹ', 'UBND phường Khuê Mỹ', 1, 1, 4, 23, 58, NULL, 63),
	(64, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '064', 'UBND phường Hòa Quý', 'UBND phường Hòa Quý', 1, 1, 4, 23, 59, NULL, 64),
	(65, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '065', 'UBND phường Hòa Hải', 'UBND phường Hòa Hải', 1, 1, 4, 23, 60, NULL, 65),
	(66, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '066', 'UBND phường Khuê Trung', 'UBND phường Khuê Trung', 1, 1, 4, 24, 61, NULL, 66),
	(67, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '067', 'UBND phường Hòa Phát', 'UBND phường Hòa Phát', 1, 1, 4, 24, 67, NULL, 67),
	(68, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '068', 'UBND phường Hòa An', 'UBND phường Hòa An', 1, 1, 4, 24, 68, NULL, 68),
	(69, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '069', 'UBND phường Hòa Thọ Tây', 'UBND phường Hòa Thọ Tây', 1, 1, 4, 24, 69, NULL, 69),
	(70, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '070', 'UBND phường Hòa Thọ Đông', 'UBND phường Hòa Thọ Đông', 1, 1, 4, 24, 70, NULL, 70),
	(71, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '071', 'UBND phường Hòa Xuân', 'UBND phường Hòa Xuân', 1, 1, 4, 24, 71, NULL, 71),
	(72, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '072', 'UBND xã Hòa Bắc', 'UBND xã Hòa Bắc', 1, 1, 4, 25, 72, NULL, 72),
	(73, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '073', 'UBND xã Hòa Liên', 'UBND xã Hòa Liên', 1, 1, 4, 25, 73, NULL, 73),
	(74, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '074', 'UBND xã Hòa Ninh', 'UBND xã Hòa Ninh', 1, 1, 4, 25, 74, NULL, 74),
	(75, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '075', 'UBND xã Hòa Sơn', 'UBND xã Hòa Sơn', 1, 1, 4, 25, 75, NULL, 75),
	(76, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '076', 'UBND xã Hòa Nhơn', 'UBND xã Hòa Nhơn', 1, 1, 4, 25, 76, NULL, 76),
	(77, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '077', 'UBND xã Hòa Phú', 'UBND xã Hòa Phú', 1, 1, 4, 25, 77, NULL, 77),
	(78, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '078', 'UBND xã Hòa Phong', 'UBND xã Hòa Phong', 1, 1, 4, 25, 78, NULL, 78),
	(79, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '079', 'UBND xã Hòa Châu', 'UBND xã Hòa Châu', 1, 1, 4, 25, 79, NULL, 79),
	(80, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '080', 'UBND xã Hòa Tiến', 'UBND xã Hòa Tiến', 1, 1, 4, 25, 80, NULL, 80),
	(81, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '081', 'UBND xã Hòa Phước', 'UBND xã Hòa Phước', 1, 1, 4, 25, 81, NULL, 81),
	(82, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '082', 'UBND xã Hòa Khương', 'UBND xã Hòa Khương', 1, 1, 4, 25, 82, NULL, 82),
	(83, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '083', 'UBND Thành phố Hồ Chí Minh', 'UBND Thành phố Hồ Chí Minh', 1, 1, 2, NULL, 10, NULL, 83),
	(84, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '084', 'UBND Thành phố Hà Nội', 'UBND Thành phố Hà Nội', 1, 1, 2, NULL, 12, NULL, 84),
	(85, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '085', 'UBND Thành phố Hải Phòng', 'UBND Thành phố Hải Phòng', 1, 1, 2, NULL, 11, NULL, 85),
	(86, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '086', 'Công an Đà Nẵng', 'Công an Đà Nẵng', 1, 1, 5, 1, 9, 2, 86),
	(87, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '087', 'Công an Hồ Chí Minh', 'Công an Hồ Chí Minh', 1, 1, 5, 83, 10, 2, 87),
	(88, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '088', 'Công an Hà Nội', 'Công an Hà Nội', 1, 1, 5, 84, 12, 2, 88),
	(89, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '089', 'Công an Hải Phòng', 'Công an Hải Phòng', 1, 1, 5, 85, 11, NULL, 89),
	(90, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '090', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 2, 9, NULL, 2),
	(91, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '091', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 2, 9, NULL, 2),
	(92, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '092', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 2, 9, NULL, 2),
	(93, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '093', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 14, 9, NULL, 14),
	(94, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '094', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 14, 9, NULL, 14),
	(95, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '095', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 14, 9, NULL, 14),
	(96, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '096', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 4, 9, NULL, 4),
	(99, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '099', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 3, 9, NULL, 3),
	(97, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '097', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 4, 9, NULL, 4),
	(98, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '098', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 4, 9, NULL, 4),
	(100, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '100', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 3, 9, NULL, 3),
	(101, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '101', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 3, 9, NULL, 3),
	(102, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '102', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 5, 9, NULL, 5),
	(103, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '103', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 5, 9, NULL, 5),
	(104, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '104', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 5, 9, NULL, 5),
	(105, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '105', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 6, 9, NULL, 6),
	(106, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '106', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 6, 9, NULL, 6),
	(107, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '107', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 6, 9, NULL, 6),
	(108, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '108', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 7, 9, NULL, 7),
	(109, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '109', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 7, 9, NULL, 7),
	(110, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '110', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 7, 9, NULL, 7),
	(111, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '111', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 8, 9, NULL, 8),
	(112, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '112', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 8, 9, NULL, 8),
	(113, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '113', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 8, 9, NULL, 8),
	(114, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '114', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 9, 9, NULL, 9),
	(115, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '115', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 9, 9, NULL, 9),
	(116, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '116', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 9, 9, NULL, 9),
	(117, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '117', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 10, 9, NULL, 10),
	(118, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '118', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 10, 9, NULL, 10),
	(119, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '119', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 10, 9, NULL, 10),
	(120, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '120', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 11, 9, NULL, 11),
	(121, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '121', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 11, 9, NULL, 11),
	(122, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '122', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 11, 9, NULL, 11),
	(123, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '123', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 12, 9, NULL, 12),
	(124, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '124', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 12, 9, NULL, 12),
	(125, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '125', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 12, 9, NULL, 12),
	(126, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '126', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 13, 9, NULL, 13),
	(127, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '127', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 13, 9, NULL, 13),
	(128, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '128', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 13, 9, NULL, 13),
	(129, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '129', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 15, 9, NULL, 15),
	(130, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '130', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 15, 9, NULL, 15),
	(131, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '131', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 15, 9, NULL, 15),
	(132, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '132', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 16, 9, NULL, 16),
	(133, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '133', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 16, 9, NULL, 16),
	(134, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '134', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 16, 9, NULL, 16),
	(135, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '135', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 17, 9, NULL, 17),
	(136, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '136', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 17, 9, NULL, 17),
	(137, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '137', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 17, 9, NULL, 17),
	(138, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '138', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 18, 9, NULL, 18),
	(139, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '139', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 18, 9, NULL, 18),
	(140, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '140', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 18, 9, NULL, 18),
	(141, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '141', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 19, 9, NULL, 19),
	(142, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '142', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 19, 9, NULL, 19),
	(143, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '143', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 19, 9, NULL, 19),
	(144, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '144', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 20, 9, NULL, 20),
	(145, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '145', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 20, 9, NULL, 20),
	(146, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '146', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 20, 9, NULL, 20),
	(147, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '147', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 21, 9, NULL, 21),
	(148, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '148', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 21, 9, NULL, 21),
	(149, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '149', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 21, 9, NULL, 21),
	(150, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '150', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 22, 9, NULL, 22),
	(151, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '151', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 22, 9, NULL, 22),
	(152, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '152', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 22, 9, NULL, 22),
	(153, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '153', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 23, 9, NULL, 23),
	(154, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '154', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 23, 9, NULL, 23),
	(155, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '155', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 23, 9, NULL, 23),
	(156, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '156', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 24, 9, NULL, 24),
	(157, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '157', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 24, 9, NULL, 24),
	(158, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '158', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 24, 9, NULL, 24),
	(159, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '159', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 25, 9, NULL, 25),
	(160, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '160', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 25, 9, NULL, 25),
	(161, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '161', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 25, 9, NULL, 25),
	(162, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '162', 'Phòng xử lý đơn', 'Phòng xử lý đơn', 1, 1, 6, 26, 9, NULL, 26),
	(163, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '163', 'Phòng giải quyết đơn', 'Phòng giải quyết đơn', 1, 1, 6, 26, 9, NULL, 26),
	(164, b'0', '2017-04-23 14:05:20', '2017-04-23 14:05:20', '164', 'Phòng Thanh tra phòng chống tham nhũng', 'Phòng Thanh tra phòng chống tham nhũng', 1, 1, 6, 26, 9, NULL, 26);
/*!40000 ALTER TABLE `coquanquanly` ENABLE KEYS */;

-- Dumping structure for table tttp.coquantochuctiepdan

CREATE TABLE "IF NOT EXISTS `COQUANTOCHUCTIEPDAN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CHUCVU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOIDAIDIEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.coquantochuctiepdan: 15 rows
/*!40000 ALTER TABLE `coquantochuctiepdan` DISABLE KEYS */;
INSERT INTO `coquantochuctiepdan` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `chucVu`, `nguoiDaiDien`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(8, b'0', '2017-06-13 18:06:26', '2017-05-17 12:34:41', 'Chủ tịch', 'Nguyễn Trường Thành', 'UBND quận Hải Châu', 3, 1),
	(9, b'0', '2017-06-13 18:06:26', '2017-05-17 12:34:41', 'Chủ tịch', 'Phan Công Minh', 'UBND quận Thanh Khê', 3, 1),
	(10, b'0', '2017-06-13 18:06:12', '2017-05-17 12:34:41', 'Chủ tịch', 'Nguyễn Trường Thành', 'UBND quận Hải Châu', 3, 1),
	(11, b'0', '2017-06-13 18:06:12', '2017-05-17 12:34:41', 'Chủ tịch', 'Phan Công Minh', 'UBND quận Thanh Khê', 3, 1),
	(12, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', 'Chủ tịch', 'Nguyễn Quốc Đạt', 'UBND phường Hòa Minh', 3, 1),
	(13, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', 'Chủ tịch', 'Trần Đinh Lực', 'UBND Phường Hải Châu 1', 3, 1),
	(14, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', 'Tổ trưởng', 'Trần Bá Nam', 'Tổ dân phố 5', 3, 1),
	(15, b'0', '2017-06-13 18:07:32', '2017-05-17 12:48:49', 'Chủ tịch', 'Nguyễn Quốc Đạt', 'UBND phường Hòa Minh', 3, 1),
	(16, b'0', '2017-06-13 18:07:32', '2017-05-17 12:48:49', 'Chủ tịch', 'Trần Đinh Lực', 'UBND Phường Hải Châu 1', 3, 1),
	(17, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', 'Chủ tịch', 'Nguyễn Quốc Đạt', 'UBND phường Hòa Minh', 3, 1),
	(18, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', 'Chủ tịch', 'Trần Đinh Lực', 'UBND Phường Hải Châu 1', 3, 1),
	(19, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', 'Tổ trưởng', 'Trần Bá Nam', 'Tổ dân phố 5', 3, 1),
	(20, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:24', 'Chủ tịch', 'Nguyễn Quốc Đạt', 'UBND phường Hòa Minh', 3, 1),
	(21, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:24', 'Chủ tịch', 'Trần Đinh Lực', 'UBND Phường Hải Châu 1', 3, 1),
	(22, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:24', 'Tổ trưởng', 'Trần Bá Nam', 'Tổ dân phố 5', 3, 1);
/*!40000 ALTER TABLE `coquantochuctiepdan` ENABLE KEYS */;

-- Dumping structure for table tttp.coquantochuctiepdan_has_sotiepcongdan

CREATE TABLE "IF NOT EXISTS `COQUANTOCHUCTIEPDAN_HAS_SOTIEPCONGDAN`" (
  "`SOTIEPCONGDAN_ID`" bigint(20) NOT NULL,
  "`COQUANTOCHUCTIEPDAN_ID`" bigint(20) NOT NULL


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.coquantochuctiepdan_has_sotiepcongdan: 15 rows
/*!40000 ALTER TABLE `coquantochuctiepdan_has_sotiepcongdan` DISABLE KEYS */;
INSERT INTO `coquantochuctiepdan_has_sotiepcongdan` (`soTiepCongDan_id`, `coQuanToChucTiepDan_id`) VALUES
	(42, 8),
	(42, 9),
	(43, 10),
	(43, 11),
	(44, 14),
	(44, 13),
	(44, 12),
	(45, 16),
	(45, 15),
	(46, 19),
	(46, 18),
	(46, 17),
	(47, 22),
	(47, 21),
	(47, 20);
/*!40000 ALTER TABLE `coquantochuctiepdan_has_sotiepcongdan` ENABLE KEYS */;

-- Dumping structure for table tttp.dantoc

CREATE TABLE "IF NOT EXISTS `DANTOC`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`TENKHAC`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.dantoc: 61 rows
/*!40000 ALTER TABLE `dantoc` DISABLE KEYS */;
INSERT INTO `dantoc` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ma`, `moTa`, `ten`, `tenKhac`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '001', 'Kinh', 'Kinh', 'Việt', 1, 1),
	(2, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '002', 'Tày', 'Tày', 'Thổ, Ngạn, Phén, Thù Lao, Pa Dí', 1, 1),
	(3, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '003', 'Thái', 'Thái', 'Tày, Tày Khao (Thái trắng), Tày Dăm (Thái đen), Tày Mười Tây Thanh, Màn Thanh, Hang Ông, Tày Mường, Pi Thay, Thổ Đà Bắc', 1, 1),
	(4, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '004', 'Hoa', 'Hoa', 'Hán, Triều Châu, Phúc Kiến, Quảng Đông, Hải Nam, Hạ, Xạ Phạng', 1, 1),
	(5, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '005', 'Khơ Me', 'Khơ Me', 'Cur, Cul, Cu, Thổ, Việt gốc Miên, Khơ-me Krôm', 1, 1),
	(6, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '006', 'Mường', 'Mường', 'Mol, Mual, Mọi, Mọi Bi, Ao Tá (Ậu Tá)', 1, 1),
	(7, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '007', 'Nùng', 'Nùng', 'Xuồng, Giang, Nùng An, Phàn Sinh, Nùng Cháo, Nùng Lòi, Quý Rim, Khèn Lài, ...', 1, 1),
	(8, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '008', 'HMông', 'HMông', 'Mèo, Mẹo, Hoa, Mèo Xanh, Mèo Đỏ, Mèo Đen, Ná Mẻo, Mán Trắng', 1, 1),
	(9, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '009', 'Dao', 'Dao', 'Mán, Động, Trại, Xá, Dìu Miền, Kiềm, Miền, Quần Trắng, Dao Đỏ, Quần Chẹt, Lô Gang, Dao Tiền, Thanh Y,Lan Tẻn, Đại Bản,Tiểu Bản, Cóc Ngáng, Cóc Mùn, Sơn Đầu, ...  Mán, Động, Trại, Xá, Dìu Miền, Kiềm, Miền, Quần Trắng, Dao Đỏ, Quần Chẹt, Lô Gang, Dao Tiền', 1, 1),
	(10, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '010', 'Gia Rai', 'Gia Rai', 'Giơ-rai, Tơ-buăn, Chơ-rai, Hơ-bau, Hđrung, Chor, ...', 1, 1),
	(11, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '011', 'Ngái', 'Ngái', 'Xín, Lê, Đản, Khách Gia', 1, 1),
	(12, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '012', 'Ê - Đê', 'Ê - Đê', 'Ra-đê, Đê, Kpạ, A-đham, Krung, Ktul, Đliê Ruê, Blô, E-pan, Mđhur, Bih, ...', 1, 1),
	(13, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '013', 'Ba na', 'Ba na', 'Gơ-lar, Tơ-lô, Giơ-lâng (Y-Lăng), Rơ-ngao, Krem, Roh, ConKđê, A-la Công, Kpăng Công, Bơ-nâm', 1, 1),
	(14, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '014', 'Xơ Đăng', 'Xơ Đăng', 'Xơ-teng, Hđang, Tơ-đra, Mơ-nâm, Ha-lăng, Ca-dông, Kmrăng, Con Lan, Bri-la, Tang', 1, 1),
	(15, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '015', 'Sán Chay', 'Sán Chay', 'Cao Lan-Sán chỉ, Cao Lan, Mán Cao Lan, Hờn Bạn, Sán Chỉ (Sơn Tử)', 1, 1),
	(16, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '016', 'Cơ Ho', 'Cơ Ho', 'Xrê, Nôp (Tu Lốp), Cơ-don, Chil, Lat (Lach), Trinh', 1, 1),
	(17, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '017', 'Chăm', 'Chăm', 'Chàm, Chiêm Thành, Hroi', 1, 1),
	(18, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '018', 'SánDìu', 'SánDìu', 'Sán Dẻo, Trại, Trại Đất, Mán Quần Cộc', 1, 1),
	(19, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '019', 'HRê', 'HRê', 'Chăm Rê, Chom, Krẹ Lũy', 1, 1),
	(20, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '020', 'MNông', 'MNông', 'Pnông, Nông, Pré, Bu-đâng, ĐiPri, Biat, Gar, Rơ-lam, Chil', 1, 1),
	(21, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '021', 'RagLai', 'RagLai', 'Ra-clây, Rai, Noang, La Oang', 1, 1),
	(22, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '022', 'XTiêng', 'XTiêng', 'Xa Điêng', 1, 1),
	(23, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '023', 'Bru', 'Bru', 'Bru, Vân Kiều, Măng Coong, Tri Khùa', 1, 1),
	(24, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '024', 'Thổ', 'Thổ', 'Kẹo, Mọn, Cuối, Họ, Đan Lai, Ly Hà, Tày Pọng, Con Kha, Xá Lá Vàng', 1, 1),
	(25, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '025', 'Giáy', 'Giáy', 'Nhắng, Dẩng, Pầu Thìn Pu Nà, Cùi Chu, Xa', 1, 1),
	(26, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '026', 'Cơ Tu', 'Cơ Tu', 'Ca-tu, Cao, Hạ, Phương, Ca-tang', 1, 1),
	(27, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '027', 'Gié', 'Gié', 'Đgiéh, Tareh, Giang Rẫy Pin, Triêng, Treng, Ta Riêng, Ve (Veh), La-ve, Ca-tang', 1, 1),
	(28, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '028', 'Mạ', 'Mạ', 'Châu Mạ, Mạ Ngăn, Mạ Xốp, Mạ Tô, Mạ Krung, ...', 1, 1),
	(29, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '029', 'Khơ Mú', 'Khơ Mú', 'Xá Cẩu, Mứn Xen, Pu Thênh Tềnh, Tày Hay', 1, 1),
	(30, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '030', 'Co', 'Co', 'Cor, Col, Cùa, Trầu', 1, 1),
	(31, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '031', 'Ta Ôi', 'Ta Ôi', 'Tôi-ôi, Pa-co, Pa-hi (Ba-hi)', 1, 1),
	(32, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '032', 'Chơ Ro', 'Chơ Ro', 'Dơ-ro, Châu-ro', 1, 1),
	(33, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '033', 'Kháng', 'Kháng', 'Xá Khao, Xá Súa, Xá Dón, Xá Dẩng, Xá Hốc, Xá Ái, Xá Bung, Quảng Lâm', 1, 1),
	(34, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '034', 'Xing Mun', 'Xing Mun', 'Puộc, Pụa', 1, 1),
	(35, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '035', 'Ha Nhì', 'Ha Nhì', 'U Ni, Xá U Ni', 1, 1),
	(36, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '036', 'Chu Ru', 'Chu Ru', 'Chơ-ru, Chu', 1, 1),
	(37, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '037', 'Lào', 'Lào', 'Lào Bốc, Lào Nọi', 1, 1),
	(38, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '038', 'La Chi', 'La Chi', 'Cù Tê, La Quả', 1, 1),
	(39, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '039', 'La Ha', 'La Ha', 'Xá Khao, Khlá Phlạo', 1, 1),
	(40, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '040', 'Phù Lá', 'Phù Lá', 'Bồ Khô Pạ, Mu Di, Pạ Xá, Phó, Phổ, VaXơ', 1, 1),
	(41, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '041', 'La Hủ', 'La Hủ', 'Lao, Pu Đang, Khù Xung, Cò Xung, Khả Quy', 1, 1),
	(42, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '042', 'Lự', 'Lự', 'Lừ, Nhuồn Duôn, Mun Di', 1, 1),
	(43, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '043', 'Lô Lô', 'Lô Lô', 'Lô Lô', 1, 1),
	(44, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '044', 'Chứt', 'Chứt', 'Sách, May, Rục, Mã-liêng, A-rem, Tu Vang, Pa-leng, Xơ-lang, Tơ-hung, Chà-củi, Tắc-củi, U-mo, Xá Lá Vàng', 1, 1),
	(45, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '045', 'Mảng', 'Mảng', 'Mảng Ư, Xá Lá Vàng', 1, 1),
	(46, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '046', 'Pà Thẻn', 'Pà Thẻn', 'Pà Hưng, Tống', 1, 1),
	(47, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '047', 'Cơ Lao', 'Cơ Lao', 'Cơ Lao', 1, 1),
	(48, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '048', 'Cống', 'Cống', 'Xắm Khống, Mấng Nhé, Xá Xeng', 1, 1),
	(49, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '049', 'Bố Y', 'Bố Y', 'Chủng Chá, Trọng Gia, Tu Dí, Tu Dìn', 1, 1),
	(50, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '050', 'Xi La', 'Xi La', 'Cù Dề Xừ, Khả pẻ', 1, 1),
	(51, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '051', 'Pu Péo', 'Pu Péo', 'Ka Bèo, Pen Ti Lô Lô', 1, 1),
	(52, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '052', 'Brâu', 'Brâu', 'Brao', 1, 1),
	(53, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '053', 'Ơ Đu', 'Ơ Đu', 'Tày Hạt', 1, 1),
	(54, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '054', 'Rơ Măm', 'Rơ Măm', 'Rơ Măm', 1, 1),
	(55, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '055', 'Hán', 'Hán', 'Hán', 1, 1),
	(56, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '056', 'Cà Dong', 'Cà Dong', 'Cà Dong', 1, 1),
	(57, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '057', 'Chiêng', 'Chiêng', 'Chiêng', 1, 1),
	(58, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '058', 'Tà Riềng', 'Tà Riềng', 'Tà Riềng', 1, 1),
	(59, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '059', 'Dẻ', 'Dẻ', 'Dẻ', 1, 1),
	(60, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '060', 'Nước Ngoài', 'Nước Ngoài', 'Nước Ngoài', 1, 1),
	(61, b'0', '2017-04-23 15:25:00', '2017-04-23 15:25:02', '061', 'Không xác định', 'Không xác định', 'Không xác định', 1, 1);
/*!40000 ALTER TABLE `dantoc` ENABLE KEYS */;

-- Dumping structure for table tttp.doandicung

CREATE TABLE "IF NOT EXISTS `DOANDICUNG`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CMNDHOCHIEU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DIACHI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`HOVATEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SODIENTHOAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) NOT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.doandicung: 13 rows
/*!40000 ALTER TABLE `doandicung` DISABLE KEYS */;
INSERT INTO `doandicung` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `cmndHoChieu`, `diaChi`, `hoVaTen`, `soDienThoai`, `nguoiSua_id`, `nguoiTao_id`, `don_id`) VALUES
	(1, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201575538', '23 Phan Tứ', 'Đặng Đình Cường', '0932110442', 1, 1, 19),
	(2, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201115642', '15 Tản Đà', 'Trần Bá Hòa', '01206116305', 1, 1, 19),
	(3, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201245578', '30 Quang Trung', 'Nguyễn Thị Kim', '0982137146', 1, 1, 19),
	(4, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201425632', '20 Nguyễn Huy Tưởng', 'Lê Văn Quý', '01206116305', 1, 1, 23),
	(5, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201356214', '12 Cù Chính Lan', 'Đỗ Bảo Trân', '0982137146', 1, 1, 23),
	(6, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201115642', '15 Tản Đà', 'Trần Bá Hòa', '01206116305', 1, 1, 23),
	(7, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201575538', '23 Phan Tứ', 'Đặng Đình Cường', '0932110442', 1, 1, 23),
	(8, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201245578', '30 Quang Trung', 'Nguyễn Thị Kim', '0982137146', 1, 1, 23),
	(9, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201575786', '30 Bà Huyện Thanh Quan', 'Lê Quang Tuấn', '01202052973', 1, 1, 26),
	(10, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201422432', '43 Hồ Tùng Mậu', 'Nguyễn Bá Quang', '0973389168', 1, 1, 26),
	(11, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201245523', '30 Quang Trung', 'Trần Thị Nguyệt', '0987371772', 1, 1, 26),
	(12, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '200213224', '15 Tản Đà', 'Huỳnh Văn Chương', '01636629861', 1, 1, 26),
	(13, b'0', '2017-06-06 14:58:44', '2017-06-06 14:58:44', '201356467', '50 Hà Huy Tập', 'Nguyễn Hồng Quyên', '0903300143', 1, 1, 26);
/*!40000 ALTER TABLE `doandicung` ENABLE KEYS */;

-- Dumping structure for table tttp.documentmetadata

CREATE TABLE "IF NOT EXISTS `DOCUMENTMETADATA`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`FILELOCATION`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`KEYFILE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NAME`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`SALKEY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.documentmetadata: 0 rows
/*!40000 ALTER TABLE `documentmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentmetadata` ENABLE KEYS */;

-- Dumping structure for table tttp.don

CREATE TABLE "IF NOT EXISTS `DON`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`COTHONGTINCOQUANDAGIAIQUYET`" bit(1) NOT NULL,
  "`COUYQUYEN`" bit(1) NOT NULL,
  "`DAGIAIQUYET`" bit(1) NOT NULL,
  "`DAXULY`" bit(1) NOT NULL,
  "`GHICHUXULYDON`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`HINHTHUCDAGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`HUONGGIAIQUYETDATHUCHIEN`" longtext COLLATE utf8_vietnamese_ci,
  "`HUONGXULYXLD`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LOAIDOITUONG`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`LOAIDON`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`LOAINGUOIBIKHIEUTO`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LOAINGUOIDUNGDON`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`LYDODINHCHI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGAYLAPDONGAPLANHDAOTMP`" datetime DEFAULT NULL,
  "`NGAYQUYETDINHDINHCHI`" datetime DEFAULT NULL,
  "`NGAYTIEPNHAN`" datetime NOT NULL,
  "`NGUONTIEPNHANDON`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NOIDUNG`" longtext COLLATE utf8_vietnamese_ci NOT NULL,
  "`QUYTRINHXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SOLANKHIEUNAITOCAO`" int(11) NOT NULL,
  "`SONGUOI`" int(11) NOT NULL,
  "`SOQUYETDINHDINHCHI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`THANHLAPDON`" bit(1) NOT NULL,
  "`THANHLAPTIEPDANGAPLANHDAO`" bit(1) NOT NULL,
  "`TONGSOLUOTTCD`" int(11) NOT NULL,
  "`TRANGTHAIDON`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`YKIENXULYDON`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`YEUCAUCUACONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`YEUCAUGAPTRUCTIEPLANHDAO`" bit(1) NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CANBOXULY_ID`" bigint(20) DEFAULT NULL,
  "`CHITIETLINHVUCDONTHUCHITIET_ID`" bigint(20) DEFAULT NULL,
  "`COQUANDAGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`DONLANTRUOC_ID`" bigint(20) DEFAULT NULL,
  "`LINHVUCDONTHU_ID`" bigint(20) NOT NULL,
  "`LINHVUCDONTHUCHITIET_ID`" bigint(20) DEFAULT NULL,
  "`PHONGBANGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`THAMQUYENGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`PROCESSTYPE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`CURRENTSTATE_ID`" bigint(20) DEFAULT NULL,
  "`CANBOXULYPHANHEXLD_ID`" bigint(20) DEFAULT NULL,
  "`NGAYBATDAUXLD`" datetime DEFAULT NULL,
  "`NGAYKETTHUCXLD`" datetime DEFAULT NULL,
  "`THOIHANXULYXLD`" datetime DEFAULT NULL,
  "`FILEUYQUYEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`URLFILEUYQUYEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`FILECHUNGCHIHANHNGHE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`URLCHUNGCHIHANHNGHE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LANHDAODUYET`" bit(1) NOT NULL,
  "`NGAYBANHANHVANBANDAGIAIQUYET`" datetime DEFAULT NULL,
  "`SOVANBANDAGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`FILEVANBANDAGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`URLVANBANDAGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DONVITHAMTRAXACMINH_ID`" bigint(20) DEFAULT NULL,
  "`COQUANDANGGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`NOIDUNGTHONGTINTRINHLANHDAO`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)














) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.don: 11 rows
/*!40000 ALTER TABLE `don` DISABLE KEYS */;
INSERT INTO `don` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `coThongTinCoQuanDaGiaiQuyet`, `coUyQuyen`, `daGiaiQuyet`, `daXuLy`, `ghiChuXuLyDon`, `hinhThucDaGiaiQuyet`, `huongGiaiQuyetDaThucHien`, `huongXuLyXLD`, `loaiDoiTuong`, `loaiDon`, `loaiNguoiBiKhieuTo`, `loaiNguoiDungDon`, `lyDoDinhChi`, `ma`, `ngayLapDonGapLanhDaoTmp`, `ngayQuyetDinhDinhChi`, `ngayTiepNhan`, `nguonTiepNhanDon`, `noiDung`, `quyTrinhXuLy`, `soLanKhieuNaiToCao`, `soNguoi`, `soQuyetDinhDinhChi`, `thanhLapDon`, `thanhLapTiepDanGapLanhDao`, `tongSoLuotTCD`, `trangThaiDon`, `yKienXuLyDon`, `yeuCauCuaCongDan`, `yeuCauGapTrucTiepLanhDao`, `nguoiSua_id`, `nguoiTao_id`, `canBoXuLy_id`, `chiTietLinhVucDonThuChiTiet_id`, `coQuanDaGiaiQuyet_id`, `donLanTruoc_id`, `linhVucDonThu_id`, `linhVucDonThuChiTiet_id`, `phongBanGiaiQuyet_id`, `thamQuyenGiaiQuyet_id`, `processType`, `currentState_id`, `canBoXuLyPhanHeXLD_id`, `ngayBatDauXLD`, `ngayKetThucXLD`, `thoiHanXuLyXLD`, `fileUyQuyen`, `urlFileUyQuyen`, `fileChungChiHanhNghe`, `urlChungChiHanhNghe`, `lanhDaoDuyet`, `ngayBanHanhVanBanDaGiaiQuyet`, `soVanBanDaGiaiQuyet`, `fileVanBanDaGiaiQuyet`, `urlVanBanDaGiaiQuyet`, `donViThamTraXacMinh_id`, `coQuanDangGiaiQuyet_id`, `noiDungThongTinTrinhLanhDao`) VALUES
	(18, b'0', '2017-06-13 18:05:50', '2017-05-17 09:45:36', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'QUYET_DINH_HANH_CHINH', 'DON_KHIEU_NAI', NULL, 'CA_NHAN', '', '', '2017-05-17 09:45:36', NULL, '2017-05-17 09:39:35', 'TRUC_TIEP', 'Khiếu nại 2 cán bộ Công an kiểm soát trật tự tại khu công nghiệp An Đồn đối với hành vi yêu cầu tôi dừng xe lại nhưng lại không xuất trình những giấy tờ chứng minh việc đang thi hành công vụ, không đeo biển hiệu.					', NULL, 0, 1, '', b'0', b'0', 1, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(19, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:04', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_TO_CAO', NULL, 'DOAN_DONG_NGUOI', '', '', '2017-05-17 10:05:04', NULL, '2017-05-17 09:48:57', 'TRUC_TIEP', 'Tố cáo ông Trần Văn X, cán bộ địa chính - xây dựng Quận Hải Châu nhận hối lộ số tiền 100.000.000 triệu đồng để không gây khó dễ trong việc cấp giấy phép xây dựng 					', NULL, 0, 4, '', b'0', b'0', 1, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 15, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(20, b'0', '2017-06-13 17:57:09', '2017-05-17 10:14:18', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_KIEN_NGHI_PHAN_ANH', NULL, 'CO_QUAN_TO_CHUC', '', '', '2017-05-17 10:14:18', NULL, '2017-05-17 10:06:27', 'TRUC_TIEP', 'Chúng tôi là tập thể nhân dân sinh sống tại tổ 5- Hòa Minh - Liên Chiểu - Đà Nẵng, xin được phản ánh về tình hình ô nhiễm môi trường trong thời gian qua tại nơi chúng tôi sống.\nCụ thể như sau: mấy năm gần đây cạnh nhà chúng tôi ở mọc lên hai trạm trộn bêtông nhựa đường nóng hoạt động suất ngày đêm, gây ô nhiễm nghiêm trọng tại nơi chung tôi sinh sống. Nhà máy hoạt động gây ra những ảnh hưởng đến đời sống sinh hoạt của người dân :\nGây khói bụi đến ngạt thở.\nTiếng ồn của nhà máy, của máy xúc làm đầu chúng tôi như nổ tung không ăn ngủ gì được.\nTiếng rung của nhà máy gầm lên làm nứt nhà chúng tôi.\nTiếng còi, tiếng đật thùng xe ben kêu vang trời.		', NULL, 0, 1, '', b'0', b'0', 1, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 50, 3, NULL, NULL, 'XU_LY_DON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(21, b'0', '2017-06-13 17:56:52', '2017-05-17 10:40:57', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'QUYET_DINH_HANH_CHINH', 'DON_KIEN_NGHI_PHAN_ANH', NULL, 'CO_QUAN_TO_CHUC', '', '', '2017-05-17 10:40:57', NULL, '2017-05-17 10:37:16', 'TRUC_TIEP', 'Chúng tôi là tập thể giáo viên trường tiểu học Điện Biên Phủ, nay chúng tôi xin kiến nghị về việc không đồng ý sự quyết định bổ nhiệm bà Vương Thị Vân về làm hiệu trưởng trường tiểu học Điện Biên Phủ vì theo thông tin chính xác thì năm học 2013-2014 bà Vương Thị Vân đã bị kỷ luật và lên làm việc tại Phòng Giáo Dục.', NULL, 0, 1, '', b'0', b'0', 1, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 52, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(22, b'0', '2017-06-13 18:06:26', '2017-05-17 11:13:00', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_KHIEU_NAI', NULL, 'CA_NHAN', '', '', '2017-05-17 11:13:00', NULL, '2017-05-17 05:33:58', 'TRUC_TIEP', 'Ông nội tôi có 06 người con (04 nam 02 nữ) trong đó bố tôi là người con trai thứ hai trong nhà. ông nội tôi có hai mảnh đất. Một mảnh đã cho người con trai thứ ba trong nhà (em bố tôi) sở hữu. Mảnh đất còn lại hiện nay gia đình đang ở được chia làm 2, bố tôi được hưởng 1/2 mảnh đất trên và đã được tách tên sở hữu đứng tên bố tôi (được vẽ trong bản đồ địa chính 299 của xã vẽ năm 1996) nhưng chưa có sổ đỏ (do địa phương chưa cấp sổ đỏ từ trước đến nay)', NULL, 0, 1, '', b'0', b'1', 1, NULL, '', '', b'1', 3, 1, 3, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(23, b'0', '2017-06-13 18:06:12', '2017-05-17 11:23:06', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_TO_CAO', NULL, 'DOAN_DONG_NGUOI', '', '', '2017-05-17 11:23:06', NULL, '2017-05-17 05:33:58', 'TRUC_TIEP', 'Anh Trần Võ Đình Nam có hành vi lừa đảo, chiếm đoạt tài sản của bà Khuê là một chiếc nhẫn vàng 18k trị giá 1,8 chỉ.	', NULL, 0, 6, '', b'0', b'1', 1, NULL, '', '', b'1', 3, 1, 3, NULL, NULL, NULL, 15, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(24, b'0', '2017-06-13 17:54:12', '2017-05-17 11:36:30', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_KIEN_NGHI_PHAN_ANH', NULL, 'CO_QUAN_TO_CHUC', '', '', '2017-05-17 11:36:30', NULL, '2017-05-17 11:23:16', 'TRUC_TIEP', 'Chúng tôi là tập thể nhân dân sinh sống tại tổ 5- Hòa Khánh Bắc - Liên Chiểu - Đà Nẵng, xin được phản ánh về tình hình ô nhiễm môi trường trong thời gian qua tại nơi chúng tôi sống.\nCụ thể như sau: mấy năm gần đây cạnh nhà chúng tôi ở mọc lên hai trạm trộn bêtông nhựa đường nóng hoạt động suất ngày đêm, gây ô nhiễm nghiêm trọng tại nơi chung tôi sinh sống. Nhà máy hoạt động gây ra những ảnh hưởng đến đời sống sinh hoạt của người dân :\nGây khói bụi đến ngạt thở.\nTiếng ồn của nhà máy, của máy xúc làm đầu chúng tôi như nổ tung không ăn ngủ gì được.\nTiếng rung của nhà máy gầm lên làm nứt nhà chúng tôi.\nTiếng còi, tiếng đật thùng xe ben kêu vang trời.', NULL, 0, 1, '', b'0', b'0', 1, NULL, '', '', b'1', 3, 1, 3, NULL, NULL, NULL, 19, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(25, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'QUYET_DINH_HANH_CHINH', 'DON_KIEN_NGHI_PHAN_ANH', NULL, 'CA_NHAN', '', '', '2017-05-17 12:40:20', NULL, '2017-05-17 12:37:12', 'TRUC_TIEP', 'Khiếu nại công ty TNHH A trong quá trình sản xuất đã lấn chiếm trái phép diện tích đất công', NULL, 0, 1, '', b'0', b'0', 0, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(26, b'0', '2017-06-13 18:07:32', '2017-05-17 12:48:49', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_TO_CAO', NULL, 'DOAN_DONG_NGUOI', '', '', '2017-05-17 12:48:49', NULL, '2017-05-17 12:40:53', 'TRUC_TIEP', 'Tố cáo ông Nguyễn Văn B nhận hối lộ của công ty C 1 tỷ đồng và làm ngơ cho việc công ty C trong quá trình sản xuất đã xả chất thải chưa qua xử lý ra môi trường gây ô nhiễm môi trường', NULL, 0, 6, '', b'0', b'0', 0, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 17, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(27, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'HANH_VI_HANH_CHINH', 'DON_KIEN_NGHI_PHAN_ANH', NULL, 'CO_QUAN_TO_CHUC', '', '', '2017-05-17 13:01:05', NULL, '2017-05-17 12:57:33', 'TRUC_TIEP', 'Phản ánh công ty VinGrow trong quá trình sản xuất đã xả chất thải chưa qua xử lý gây ô nhiễm môi trường gây ảnh hưởng đến sức khỏe của các khu dân cư lân cận', NULL, 0, 1, '', b'0', b'0', 0, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 50, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(28, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:23', b'0', b'0', b'0', b'0', '', NULL, ' ', NULL, 'QUYET_DINH_HANH_CHINH', 'DON_KIEN_NGHI_PHAN_ANH', NULL, 'CO_QUAN_TO_CHUC', '', '', '2017-05-17 14:03:23', NULL, '2017-05-17 13:59:59', 'TRUC_TIEP', 'Cơ sở sản xuất gia công cơ khí, sản xuất ốc vít của hộ kinh doanh Tường Vinh hoạt động liên tục từ thứ Hai đến thứ Bảy hàng tuần, từ 07h15 đến 17,18giờ00 (chỉ nghỉ khoản 1,5 giờ vào buổi trưa). Cơ sở sản xuất này gây nên tiếng ồn rất lớn, tiếng máy dập kim loại, tiếng khoan cắt kim loại làm ảnh hưởng nghiêm trọng và gây khó khăn cho sinh hoạt của các hộ dân xung quanh.					', NULL, 0, 1, '', b'0', b'0', 0, NULL, '', '', b'0', 3, 1, 3, NULL, NULL, NULL, 24, 4, NULL, NULL, 'GIAI_QUYET_DON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `don` ENABLE KEYS */;

-- Dumping structure for table tttp.donvihanhchinh

CREATE TABLE "IF NOT EXISTS `DONVIHANHCHINH`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CAPDONVIHANHCHINH_ID`" bigint(20) NOT NULL,
  "`CHA_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)




) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.donvihanhchinh: 69 rows
/*!40000 ALTER TABLE `donvihanhchinh` DISABLE KEYS */;
INSERT INTO `donvihanhchinh` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ma`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`, `capDonViHanhChinh_id`, `cha_id`) VALUES
	(24, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '016', 'phường Hòa Khánh Bắc', 'phường Hòa Khánh Bắc', 1, 1, 6, 14),
	(25, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '017', 'phường Hòa Khánh Nam', 'phường Hòa Khánh Nam', 1, 1, 6, 14),
	(23, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '015', 'phường Hòa Hiệp Nam', 'phường Hòa Hiệp Nam', 1, 1, 6, 14),
	(22, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '014', 'phường Hòa Hiệp Bắc', 'phường Hòa Hiệp Bắc', 1, 1, 6, 14),
	(9, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '001', 'thành phố Đà Nẵng', 'thành phố Đà Nẵng', 1, 1, 4, NULL),
	(10, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '002', 'thành phố Hồ Chí Minh', 'thành phố Hồ Chí Minh', 1, 1, 4, NULL),
	(11, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '003', 'thành phố Hải Phòng', 'thành phố Hải Phòng', 1, 1, 4, NULL),
	(12, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '004', 'thành phố Hà Nội', 'thành phố Hà Nội', 1, 1, 4, NULL),
	(13, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '005', 'thành phố Cần Thơ', 'thành phố Cần Thơ', 1, 1, 4, NULL),
	(14, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '006', 'quận Liên Chiểu', 'quận Liên Chiểu', 1, 1, 5, 9),
	(15, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '007', 'quận Thanh Khê', 'quận Thanh Khê', 1, 1, 5, 9),
	(16, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '008', 'quận Hải Châu', 'quận Hải Châu', 1, 1, 5, 9),
	(17, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '009', 'quận Sơn Trà', 'quận Sơn Trà', 1, 1, 5, 9),
	(18, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '010', 'quận Ngũ Hành Sơn', 'quận Ngũ Hành Sơn', 1, 1, 5, 9),
	(19, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '011', 'quận Cẩm Lệ', 'quận Cẩm Lệ', 1, 1, 5, 9),
	(20, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '012', 'huyện Hòa Vang', 'huyện Hòa Vang', 1, 1, 5, 9),
	(21, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '013', 'huyện Hoàng Sa', 'huyện Hoàng Sa', 1, 1, 5, 9),
	(26, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '018', 'phường Hòa Minh', 'phường Hòa Minh', 1, 1, 6, 14),
	(27, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '019', 'phường Tam Thuận', 'phường Tam Thuận', 1, 1, 6, 15),
	(28, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '020', 'phường Thanh Khê Tây', 'phường Thanh Khê Tây', 1, 1, 6, 15),
	(29, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '021', 'phường Thanh Khê Đông', 'phường Thanh Khê Đông', 1, 1, 6, 15),
	(30, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '022', 'phường Xuân Hà', 'phường Xuân Hà', 1, 1, 6, 15),
	(31, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '023', 'phường Tân Chính', 'phường Tân Chính', 1, 1, 6, 15),
	(32, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '024', 'phường Chính Gián', 'phường Chính Gián', 1, 1, 6, 15),
	(33, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '025', 'phường Vĩnh Trung', 'phường Vĩnh Trung', 1, 1, 6, 15),
	(34, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '026', 'phường Thạc Gián', 'phường Thạc Gián', 1, 1, 6, 15),
	(35, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '027', 'phường An Khê', 'phường An Khê', 1, 1, 6, 15),
	(36, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '028', 'phường Hòa Khê', 'phường Hòa Khê', 1, 1, 6, 15),
	(37, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '029', 'phường Thanh Bình', 'phường Thanh Bình', 1, 1, 6, 16),
	(38, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '030', 'phường Thuận Phước', 'phường Thuận Phước', 1, 1, 6, 16),
	(39, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '031', 'phường Thạch Thang', 'phường Thạch Thang', 1, 1, 6, 16),
	(40, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '032', 'phường Hải Châu  I', 'phường Hải Châu  I', 1, 1, 6, 16),
	(41, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '033', 'phường Hải Châu II', 'phường Hải Châu II', 1, 1, 6, 16),
	(42, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '034', 'phường Phước Ninh', 'phường Phước Ninh', 1, 1, 6, 16),
	(43, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '035', 'phường Hòa Thuận Tây', 'phường Hòa Thuận Tây', 1, 1, 6, 16),
	(44, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '036', 'phường Hòa Thuận Đông', 'phường Hòa Thuận Đông', 1, 1, 6, 16),
	(45, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '037', 'phường Nam Dương', 'phường Nam Dương', 1, 1, 6, 16),
	(46, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '038', 'phường Bình Hiên', 'phường Bình Hiên', 1, 1, 6, 16),
	(47, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '039', 'phường Bình Thuận', 'phường Bình Thuận', 1, 1, 6, 16),
	(48, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '040', 'phường Hòa Cường Bắc', 'phường Hòa Cường Bắc', 1, 1, 6, 16),
	(49, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '041', 'phường Hòa Cường Nam', 'phường Hòa Cường Nam', 1, 1, 6, 16),
	(50, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '042', 'phường Thọ Quang', 'phường Thọ Quang', 1, 1, 6, 17),
	(51, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '043', 'phường Nại Hiên Đông', 'phường Nại Hiên Đông', 1, 1, 6, 17),
	(52, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '044', 'phường Mân Thái', 'phường Mân Thái', 1, 1, 6, 17),
	(53, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '045', 'phường An Hải Bắc', 'phường An Hải Bắc', 1, 1, 6, 17),
	(54, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '046', 'phường Phước Mỹ', 'phường Phước Mỹ', 1, 1, 6, 17),
	(55, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '047', 'phường An Hải Tây', 'phường An Hải Tây', 1, 1, 6, 17),
	(56, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '048', 'phường An Hải Đông', 'phường An Hải Đông', 1, 1, 6, 17),
	(57, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '049', 'phường Mỹ An', 'phường Mỹ An', 1, 1, 6, 18),
	(58, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '050', 'phường Khuê Mỹ', 'phường Khuê Mỹ', 1, 1, 6, 18),
	(59, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '051', 'phường Hoà Quý', 'phường Hoà Quý', 1, 1, 6, 18),
	(60, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '052', 'phường Hoà Hải', 'phường Hoà Hải', 1, 1, 6, 18),
	(61, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '053', 'phường Khuê Trung', 'phường Khuê Trung', 1, 1, 6, 19),
	(70, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '057', 'phường Hòa Thọ Đông', 'phường Hòa Thọ Đông', 1, 1, 6, 19),
	(69, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '056', 'phường Hòa Thọ Tây', 'phường Hòa Thọ Tây', 1, 1, 6, 19),
	(68, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '055', 'phường Hòa An', 'phường Hòa An', 1, 1, 6, 19),
	(67, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '054', 'phường Hòa Phát', 'phường Hòa Phát', 1, 1, 6, 19),
	(71, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '058', 'phường Hòa Xuân', 'phường Hòa Xuân', 1, 1, 6, 19),
	(72, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '059', 'xã Hòa Bắc', 'xã Hòa Bắc', 1, 1, 3, 20),
	(73, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '060', 'xã Hòa Liên', 'xã Hòa Liên', 1, 1, 3, 20),
	(74, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '061', 'xã Hòa Ninh', 'xã Hòa Ninh', 1, 1, 3, 20),
	(75, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '062', 'xã Hòa Sơn', 'xã Hòa Sơn', 1, 1, 3, 20),
	(76, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '063', 'xã Hòa Nhơn', 'xã Hòa Nhơn', 1, 1, 3, 20),
	(77, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '064', 'xã Hòa Phú', 'xã Hòa Phú', 1, 1, 3, 20),
	(78, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '065', 'xã Hòa Phong', 'xã Hòa Phong', 1, 1, 3, 20),
	(79, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '066', 'xã Hòa Châu', 'xã Hòa Châu', 1, 1, 3, 20),
	(80, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '067', 'xã Hòa Tiến', 'xã Hòa Tiến', 1, 1, 3, 20),
	(81, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '068', 'xã Hòa Phước', 'xã Hòa Phước', 1, 1, 3, 20),
	(82, b'0', '2017-04-23 11:18:40', '2017-04-23 11:18:40', '069', 'xã Hòa Khương', 'xã Hòa Khương', 1, 1, 3, 20);
/*!40000 ALTER TABLE `donvihanhchinh` ENABLE KEYS */;

-- Dumping structure for table tttp.don_congdan

CREATE TABLE "IF NOT EXISTS `DON_CONGDAN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CHUCVU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DIACHICOQUAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DONVI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LUATSU`" bit(1) NOT NULL,
  "`NGAYCAPTHELUATSU`" datetime DEFAULT NULL,
  "`NOICAPTHELUATSU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`PHANLOAICONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`SODIENTHOAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SOTHELUATSU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TENCOQUAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`THONGTINGIOITHIEU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CONGDAN_ID`" bigint(20) NOT NULL,
  "`DON_ID`" bigint(20) NOT NULL,
  "`DIACHI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`GIOITINH`" bit(1) NOT NULL,
  "`HOVATEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGAYCAP`" datetime DEFAULT NULL,
  "`NGAYSINH`" datetime DEFAULT NULL,
  "`SOCMNDHOCHIEU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SODIENTHOAICOQUAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DANTOC_ID`" bigint(20) DEFAULT NULL,
  "`NOICAPCMND_ID`" bigint(20) DEFAULT NULL,
  "`PHUONGXA_ID`" bigint(20) DEFAULT NULL,
  "`QUANHUYEN_ID`" bigint(20) DEFAULT NULL,
  "`QUOCTICH_ID`" bigint(20) DEFAULT NULL,
  "`TINHTHANH_ID`" bigint(20) DEFAULT NULL,
  "`TODANPHO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)











) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.don_congdan: 13 rows
/*!40000 ALTER TABLE `don_congdan` DISABLE KEYS */;
INSERT INTO `don_congdan` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `chucVu`, `diaChiCoQuan`, `donVi`, `luatSu`, `ngayCapTheLuatSu`, `noiCapTheLuatSu`, `phanLoaiCongDan`, `soDienThoai`, `soTheLuatSu`, `tenCoQuan`, `thongTinGioiThieu`, `nguoiSua_id`, `nguoiTao_id`, `congDan_id`, `don_id`, `diaChi`, `gioiTinh`, `hoVaTen`, `ngayCap`, `ngaySinh`, `soCMNDHoChieu`, `soDienThoaiCoQuan`, `danToc_id`, `noiCapCMND_id`, `phuongXa_id`, `quanHuyen_id`, `quocTich_id`, `tinhThanh_id`, `toDanPho_id`) VALUES
	(32, b'0', '2017-06-13 18:05:50', '2017-05-17 09:45:37', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '0932110442', '', '', '', 3, 1, 17, 18, '221 Hà Huy Tập nối dài', b'0', 'Huỳnh Bảo Ngọc', '2011-10-21 00:00:00', '1989-09-02 00:00:00', '201574408', '', 1, 86, 31, 15, 1, 9, 116),
	(33, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '0982137146', '', '', '', 3, 1, 20, 19, '12 Cù Chính Lan', b'0', 'Đỗ Bảo Trân', NULL, NULL, '201356214', '', 1, 86, 35, 15, 1, 9, 147),
	(34, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01206116305', '', '', '', 3, 1, 18, 19, '20 Nguyễn Huy Tưởng', b'1', 'Lê Văn Quý', NULL, '1975-09-29 00:00:00', '201425632', '', NULL, 86, 26, 14, NULL, 9, 61),
	(35, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '0982137146', '', '', '', 3, 1, 19, 19, '35 Phan Chu Trinh', b'1', 'Võ Hoài Nam', '2010-12-22 00:00:00', '1983-10-05 00:00:00', '201356214', '', 1, 86, 40, 16, 1, 9, 197),
	(39, b'0', '2017-06-13 17:57:09', '2017-05-17 10:14:19', '', '47 Hòa Minh - Liên Chiểu - Đà Nẵng', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01206116305', '', 'Công ty Vin Group', '', 3, 1, 24, 20, '20 Nguyễn Huy Tưởng', b'1', 'Nguyễn Văn Khải', NULL, NULL, '201426632', '', 1, 86, 26, 14, 1, 9, 61),
	(40, b'0', '2017-06-13 17:56:52', '2017-05-17 10:40:57', '', '26 Trường Chinh', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01206116305', '', 'Trường tiểu học Điện Biên Phủ', '', 3, 1, 25, 21, '88 Cần Giuộc', b'0', 'Nguyễn Thị Trung Chinh', '2012-01-24 00:00:00', '1970-02-10 00:00:00', '201052987', '', 1, 86, 36, 15, 1, 9, 165),
	(41, b'0', '2017-06-13 18:06:26', '2017-05-17 11:13:00', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01214645823', '', '', '', 3, 1, 26, 22, '221 Trường Chinh', b'0', 'Phạm Thị Cẩm Nhung', NULL, '1993-09-02 00:00:00', '201648215', '', 1, 86, 35, 15, 1, 9, 155),
	(42, b'0', '2017-06-13 18:06:12', '2017-05-17 11:23:07', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '0982137146', '', '', '', 3, 1, 27, 23, '70 Nguyễn Lương Bằng', b'1', 'Đinh Nguyễn Anh Khuê', NULL, '1993-10-05 00:00:00', '201357214', '', 1, 86, 24, 14, 1, 9, 40),
	(48, b'0', '2017-06-13 17:54:12', '2017-05-17 11:36:30', '', '76 Hòa Khánh Bắc - Liên Chiểu - Đà Nẵng', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01206116305', '', 'Vin Group', '', 3, 1, 28, 24, '70 Nguyễn Lương Bằng', b'0', 'Dương Thanh Ái Quyên', '2010-12-23 00:00:00', '1993-09-29 00:00:00', '201225632', '', 1, 86, 24, 14, 1, 9, 40),
	(49, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '0906345210', '', '', '', 3, 1, 29, 25, '534 Trần Cao Vân', b'1', 'Huỳnh Quốc Đạt', '2011-10-21 00:00:00', '1987-09-23 00:00:00', '201537408', '', 1, 86, 34, 15, 1, 9, 145),
	(51, b'0', '2017-06-13 18:07:32', '2017-05-17 12:48:49', '', '', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '0905234123', '', '', '', 3, 1, 31, 26, '24 Quang Trung', b'1', 'Nguyễn Tiến Bá', '2010-12-02 00:00:00', '1983-10-05 00:00:00', '205356214', '', 1, 86, 40, 16, 1, 9, 197),
	(56, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', '', 'Hải Phòng', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01261246721', '', 'Vina Group', '', 3, 1, 36, 27, '23 Ngô Thì Nhậm', b'1', 'Trần Quang Diệu', '2014-03-09 00:00:00', '1978-09-29 00:00:00', '204025632', '', 1, 86, 26, 14, 1, 9, 61),
	(57, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:24', '', '346 Tôn Đức Thắng', '', b'0', NULL, '', 'NGUOI_DUNG_DON', '01201090931', '', 'Hòa Bình', '', 3, 1, 37, 28, '12 Hàm Nghi', b'0', 'Nguyễn Thị Nụ', '2012-01-24 00:00:00', '1970-02-10 00:00:00', '201052966', '', 1, 86, 34, 15, 1, 9, 138);
/*!40000 ALTER TABLE `don_congdan` ENABLE KEYS */;

-- Dumping structure for table tttp.giaiquyetdon

CREATE TABLE "IF NOT EXISTS `GIAIQUYETDON`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CHUCVU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LATTXM`" bit(1) NOT NULL,
  "`OLD`" bit(1) NOT NULL,
  "`THUTUTHUCHIEN`" int(11) NOT NULL,
  "`TINHTRANGGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`YKIENGIAIQUYET`" longtext COLLATE utf8_vietnamese_ci,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CANBOXULYCHIDINH_ID`" bigint(20) DEFAULT NULL,
  "`CONGCHUC_ID`" bigint(20) DEFAULT NULL,
  "`NEXTFORM_ID`" bigint(20) DEFAULT NULL,
  "`NEXTSTATE_ID`" bigint(20) DEFAULT NULL,
  "`THONGTINGIAIQUYETDON_ID`" bigint(20) DEFAULT NULL,
  "`PHONGBANGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`SOTIEPCONGDAN_ID`" bigint(20) DEFAULT NULL,
  "`DONVICHUYENDON_ID`" bigint(20) DEFAULT NULL,
  "`DONVIGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`DONCHUYEN`" bit(1) NOT NULL,
  PRIMARY KEY (`id`)











) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.giaiquyetdon: 0 rows
/*!40000 ALTER TABLE `giaiquyetdon` DISABLE KEYS */;
/*!40000 ALTER TABLE `giaiquyetdon` ENABLE KEYS */;

-- Dumping structure for table tttp.giayuyquyen

CREATE TABLE "IF NOT EXISTS `GIAYUYQUYEN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DUONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CONGDAN_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.giayuyquyen: 0 rows
/*!40000 ALTER TABLE `giayuyquyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `giayuyquyen` ENABLE KEYS */;

-- Dumping structure for table tttp.invalidtoken

CREATE TABLE "IF NOT EXISTS `INVALIDTOKEN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`TOKEN`" longtext COLLATE utf8_vietnamese_ci,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.invalidtoken: 1 rows
/*!40000 ALTER TABLE `invalidtoken` DISABLE KEYS */;
INSERT INTO `invalidtoken` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `token`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-06-06 08:29:02', '2017-06-06 08:29:02', 'eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..IEBdJVFwcCNPc2pp.fFdYiTqPX7Rb2wAQJm_e_Wh4J4l3h7RVMKOLpfrp4e4scjaJPTeWaryUqU6ZHYyfn3QQB9bURT7anSXfbVcgp4hq0nvzc4CX3EFKi9lWvLu8u2PNHYRdrqRasyb-79p66HQ83S8WdaK9JzhjrJfxldinbweVVYve04OL-qjeZonfZ5NsTbjf_EIDAAhm-51sXNfUWR2GTCOFanio0QV4EuqZNs4-s__nTO5uFVCxAWcJKFt-kbQjVki5tqgD3Vl5afQmkpJwke2unZbgyrc8dtuW5JtigKXbCteen6HPMV-FHh-ZEQ6JPA6roUAU11xGSv4RcVQ5VVa6hXkbroQc36nDOeGdfteKgjCNCbuEqsEOM5NAAhskqCWW5TPdgL3dDRbUIyAUe7Dr0VjAhRd4sLrLxoGltERyZMxewZ483Y93OmjA8yuZEg279ydLIz8.yamFNa7tE38si6Ar8UgWTg', NULL, NULL);
/*!40000 ALTER TABLE `invalidtoken` ENABLE KEYS */;

-- Dumping structure for table tttp.lichsuquatrinhxuly

CREATE TABLE "IF NOT EXISTS `LICHSUQUATRINHXULY`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGAYXULY`" datetime DEFAULT NULL,
  "`NOIDUNG`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`THUTUTHUCHIEN`" int(11) NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) DEFAULT NULL,
  "`NGUOIXULY_ID`" bigint(20) DEFAULT NULL,
  "`DONVIXULY_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)





) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.lichsuquatrinhxuly: 0 rows
/*!40000 ALTER TABLE `lichsuquatrinhxuly` DISABLE KEYS */;
/*!40000 ALTER TABLE `lichsuquatrinhxuly` ENABLE KEYS */;

-- Dumping structure for table tttp.lichsuthaydoi

CREATE TABLE "IF NOT EXISTS `LICHSUTHAYDOI`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CHITIETTHAYDOI`" longtext COLLATE utf8_vietnamese_ci,
  "`DOITUONGTHAYDOI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`IDDOITUONG`" bigint(20) DEFAULT NULL,
  "`NOIDUNG`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.lichsuthaydoi: 18 rows
/*!40000 ALTER TABLE `lichsuthaydoi` DISABLE KEYS */;
INSERT INTO `lichsuthaydoi` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `chiTietThayDoi`, `doiTuongThayDoi`, `idDoiTuong`, `noiDung`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(4, b'0', '2017-05-16 20:44:33', '2017-05-16 20:44:33', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Thanh Khê\',\'newValue\': \'quận Thanh Khê\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Tân Chính\',\'newValue\': \'phường Tân Chính\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 01\',\'newValue\': \'Tổ 01\'}]', 'CONG_DAN', 16, 'Cập nhật thông tin công dân Trần Võ Đình Nam', 1, 1),
	(5, b'0', '2017-05-17 10:15:01', '2017-05-17 10:15:01', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Minh\',\'newValue\': \'phường Hòa Minh\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 24, 'Cập nhật thông tin công dân Nguyễn Văn Khải', 1, 1),
	(6, b'0', '2017-05-17 10:16:44', '2017-05-17 10:16:44', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Minh\',\'newValue\': \'phường Hòa Minh\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 24, 'Cập nhật thông tin công dân Nguyễn Văn Khải', 1, 1),
	(7, b'0', '2017-05-17 10:24:00', '2017-05-17 10:24:00', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Minh\',\'newValue\': \'phường Hòa Minh\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 24, 'Cập nhật thông tin công dân Nguyễn Văn Khải', 1, 1),
	(8, b'0', '2017-05-17 10:25:14', '2017-05-17 10:25:14', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Minh\',\'newValue\': \'phường Hòa Minh\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 24, 'Cập nhật thông tin công dân Nguyễn Văn Khải', 1, 1),
	(9, b'0', '2017-05-17 11:13:27', '2017-05-17 11:13:27', '[{\'propertyName\': \'Ngày sinh\',\'oldValue\': \'02-09-1993\',\'newValue\': \'09-02-1993\'},{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Thanh Khê\',\'newValue\': \'quận Thanh Khê\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường An Khê\',\'newValue\': \'phường An Khê\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 10\',\'newValue\': \'Tổ 10\'}]', 'CONG_DAN', 26, 'Cập nhật thông tin công dân Phạm Thị Cẩm Nhung', 1, 1),
	(10, b'0', '2017-05-17 11:23:07', '2017-05-17 11:23:07', '[{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Thanh Khê\',\'newValue\': \'quận Thanh Khê\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Thạc Gián\',\'newValue\': \'phường Thạc Gián\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 21, 'Cập nhật thông tin công dân Trần Bá Hòa', 1, 1),
	(11, b'0', '2017-05-17 11:23:07', '2017-05-17 11:23:07', '[{\'propertyName\': \'Ngày sinh\',\'oldValue\': \'02-09-1989\',\'newValue\': \'29-09-1989\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Ngũ Hành Sơn\',\'newValue\': \'quận Ngũ Hành Sơn\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Mỹ An\',\'newValue\': \'phường Mỹ An\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 10\',\'newValue\': \'Tổ 10\'}]', 'CONG_DAN', 22, 'Cập nhật thông tin công dân Đặng Đình Cường', 1, 1),
	(12, b'0', '2017-05-17 11:23:07', '2017-05-17 11:23:07', '[{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Thanh Khê\',\'newValue\': \'quận Thanh Khê\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường An Khê\',\'newValue\': \'phường An Khê\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 02\',\'newValue\': \'Tổ 02\'}]', 'CONG_DAN', 20, 'Cập nhật thông tin công dân Đỗ Bảo Trân', 1, 1),
	(13, b'0', '2017-05-17 11:23:07', '2017-05-17 11:23:07', '[{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Hải Châu\',\'newValue\': \'quận Hải Châu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hải Châu  I\',\'newValue\': \'phường Hải Châu  I\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 02\',\'newValue\': \'Tổ 02\'}]', 'CONG_DAN', 23, 'Cập nhật thông tin công dân Nguyễn Thị Kim', 1, 1),
	(14, b'0', '2017-05-17 11:23:07', '2017-05-17 11:23:07', '[{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Minh\',\'newValue\': \'phường Hòa Minh\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 18, 'Cập nhật thông tin công dân Lê Văn Quý', 1, 1),
	(15, b'0', '2017-05-17 11:53:56', '2017-05-17 11:53:56', '[{\'propertyName\': \'Ngày sinh\',\'oldValue\': \'05-10-1993\',\'newValue\': \'10-05-1993\'},{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Khánh Bắc\',\'newValue\': \'phường Hòa Khánh Bắc\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 27, 'Cập nhật thông tin công dân Đinh Nguyễn Anh Khuê', 1, 1),
	(16, b'0', '2017-05-17 11:53:56', '2017-05-17 11:53:56', '[{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Ngũ Hành Sơn\',\'newValue\': \'quận Ngũ Hành Sơn\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Mỹ An\',\'newValue\': \'phường Mỹ An\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 10\',\'newValue\': \'Tổ 10\'}]', 'CONG_DAN', 22, 'Cập nhật thông tin công dân Đặng Đình Cường', 1, 1),
	(17, b'0', '2017-05-17 12:35:12', '2017-05-17 12:35:12', '[{\'propertyName\': \'Ngày sinh\',\'oldValue\': \'09-02-1993\',\'newValue\': \'02-09-1993\'},{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Thanh Khê\',\'newValue\': \'quận Thanh Khê\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường An Khê\',\'newValue\': \'phường An Khê\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 10\',\'newValue\': \'Tổ 10\'}]', 'CONG_DAN', 26, 'Cập nhật thông tin công dân Phạm Thị Cẩm Nhung', 1, 1),
	(18, b'0', '2017-05-17 12:36:17', '2017-05-17 12:36:17', '[{\'propertyName\': \'Ngày sinh\',\'oldValue\': \'10-05-1993\',\'newValue\': \'05-10-1993\'},{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Khánh Bắc\',\'newValue\': \'phường Hòa Khánh Bắc\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 27, 'Cập nhật thông tin công dân Đinh Nguyễn Anh Khuê', 1, 1),
	(19, b'0', '2017-05-17 12:36:17', '2017-05-17 12:36:17', '[{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Ngũ Hành Sơn\',\'newValue\': \'quận Ngũ Hành Sơn\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Mỹ An\',\'newValue\': \'phường Mỹ An\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 10\',\'newValue\': \'Tổ 10\'}]', 'CONG_DAN', 22, 'Cập nhật thông tin công dân Đặng Đình Cường', 1, 1),
	(20, b'0', '2017-05-17 19:38:44', '2017-05-17 19:38:44', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Thanh Khê\',\'newValue\': \'quận Thanh Khê\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường An Khê\',\'newValue\': \'phường An Khê\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 02\',\'newValue\': \'Tổ 02\'}]', 'CONG_DAN', 20, 'Cập nhật thông tin công dân Đỗ Bảo Trân', 1, 1),
	(21, b'0', '2017-05-17 20:16:43', '2017-05-17 20:16:43', '[{\'propertyName\': \'Dân tộc\',\'oldValue\': \'Kinh\',\'newValue\': \'Kinh\'},{\'propertyName\': \'Quốc tịch\',\'oldValue\': \'Việt Nam\',\'newValue\': \'Việt Nam\'},{\'propertyName\': \'Tỉnh thành\',\'oldValue\': \'thành phố Đà Nẵng\',\'newValue\': \'thành phố Đà Nẵng\'},{\'propertyName\': \'Quận huyện\',\'oldValue\': \'quận Liên Chiểu\',\'newValue\': \'quận Liên Chiểu\'},{\'propertyName\': \'Phường xã\',\'oldValue\': \'phường Hòa Minh\',\'newValue\': \'phường Hòa Minh\'},{\'propertyName\': \'Thôn tổ\',\'oldValue\': \'Tổ 05\',\'newValue\': \'Tổ 05\'}]', 'CONG_DAN', 24, 'Cập nhật thông tin công dân Nguyễn Văn Khải', 1, 1);
/*!40000 ALTER TABLE `lichsuthaydoi` ENABLE KEYS */;

-- Dumping structure for table tttp.linhvucdonthu

CREATE TABLE "IF NOT EXISTS `LINHVUCDONTHU`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`LINHVUCKHAC`" bit(1) NOT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CHA_ID`" bigint(20) DEFAULT NULL,
  "`LOAIDON`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.linhvucdonthu: 51 rows
/*!40000 ALTER TABLE `linhvucdonthu` DISABLE KEYS */;
INSERT INTO `linhvucdonthu` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `linhVucKhac`, `ma`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`, `cha_id`, `loaiDon`) VALUES
	(1, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '001', 'Hành chính', 'Hành chính', 1, 1, NULL, 'DON_KHIEU_NAI'),
	(2, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '002', 'Tôn giáo, tín ngưỡng', 'Tôn giáo, tín ngưỡng', 1, 1, 1, 'DON_KHIEU_NAI'),
	(3, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '003', 'Chế độ, chính sách', 'Chế độ, chính sách', 1, 1, 1, 'DON_KHIEU_NAI'),
	(4, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '004', 'Đất đai, nhà cửa', 'Đất đai, nhà cửa', 1, 1, 1, 'DON_KHIEU_NAI'),
	(5, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '005', 'Khác', 'Khác', 1, 1, 1, 'DON_KHIEU_NAI'),
	(6, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '006', 'Tư pháp', 'Tư pháp', 1, 1, NULL, 'DON_KHIEU_NAI'),
	(7, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '007', 'Điều tra', 'Điều tra', 1, 1, 6, 'DON_KHIEU_NAI'),
	(8, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '008', 'Truy tố', 'Truy tố', 1, 1, 6, 'DON_KHIEU_NAI'),
	(9, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '009', 'Xét xử', 'Xét xử', 1, 1, 6, 'DON_KHIEU_NAI'),
	(10, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '010', 'Thi hành án', 'Thi hành án', 1, 1, 6, 'DON_KHIEU_NAI'),
	(11, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '011', 'Đảng, Đoàn thể', 'Đảng, Đoàn thể', 1, 1, NULL, 'DON_KHIEU_NAI'),
	(12, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '012', 'Vi phạm điều lệ, kỉ luật Đảng', 'Vi phạm điều lệ, kỉ luật Đảng', 1, 1, 11, 'DON_KHIEU_NAI'),
	(13, b'0', '2017-04-24 10:32:37', '2017-04-24 10:32:37', b'0', '013', 'Khác', 'Khác', 1, 1, NULL, 'DON_KHIEU_NAI'),
	(14, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '014', 'Đối với người lao động', 'Đối với người lao động', 1, 1, 3, 'DON_KHIEU_NAI'),
	(15, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '015', 'Hành chính', 'Hành chính', 1, 1, NULL, 'DON_TO_CAO'),
	(16, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '016', 'Tư pháp', 'Tư pháp', 1, 1, NULL, 'DON_TO_CAO'),
	(20, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '020', 'Môi trường', 'Môi trường', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(17, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '017', 'Đảng, Đoàn thể', 'Đảng, Đoàn thể', 1, 1, NULL, 'DON_TO_CAO'),
	(18, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '018', 'Vi phạm pháp luật trong các lĩnh vực', 'Vi phạm pháp luật trong các lĩnh vực', 1, 1, 15, 'DON_TO_CAO'),
	(19, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '019', 'Đất đai', 'Đất đai', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(21, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '021', 'Tư pháp', 'Tư pháp', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(22, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '022', 'Quy hoạch, xây dựng, quản lý đô thị', 'Quy hoạch, xây dựng, quản lý đô thị', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(23, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '023', 'Giáo dục, đào tạo, y tế', 'Giáo dục, đào tạo, y tế', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(24, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '024', 'Giao thông, vận tải', 'Giao thông, vận tải', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(25, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '025', 'Thông tin, truyền thông', 'Thông tin, truyền thông', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(26, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '026', 'Hành chính', 'Hành chính', 1, 1, NULL, 'DON_TRANH_CHAP_DAT'),
	(27, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '027', 'Đất đai', 'Đất đai', 1, 1, 26, 'DON_TRANH_CHAP_DAT'),
	(41, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '041', 'Kinh tế', 'Kinh tế', 1, 1, 18, 'DON_TO_CAO'),
	(28, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '028', 'Đối với người có công', 'Đối với người có công', 1, 1, 3, 'DON_KHIEU_NAI'),
	(29, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '029', 'Thu hồi', 'Thu hồi', 1, 1, 4, 'DON_KHIEU_NAI'),
	(30, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '030', 'Bồi thường, hỗ trợ, tái', 'Bồi thường, hỗ trợ, tái', 1, 1, 4, 'DON_KHIEU_NAI'),
	(31, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '031', 'Tranh chấp', 'Tranh chấp', 1, 1, 4, 'DON_KHIEU_NAI'),
	(32, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '032', 'Đòi nhà', 'Đòi nhà', 1, 1, 4, 'DON_KHIEU_NAI'),
	(34, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '034', 'Cấp giấy chứng nhận', 'Cấp giấy chứng nhận', 1, 1, 4, 'DON_KHIEU_NAI'),
	(33, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '033', 'Đòi đất', 'Đòi đất', 1, 1, 4, 'DON_KHIEU_NAI'),
	(35, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '035', 'Khác', 'Khác', 1, 1, 4, 'DON_KHIEU_NAI'),
	(36, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '036', 'Vi phạm hoạt động công vụ', 'Vi phạm hoạt động công vụ', 1, 1, 15, 'DON_TO_CAO'),
	(37, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '037', 'Tham nhũng', 'Tham nhũng', 1, 1, 16, 'DON_TO_CAO'),
	(38, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '038', 'Vi phạm luật hình sự', 'Vi phạm luật hình sự', 1, 1, 16, 'DON_TO_CAO'),
	(39, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '039', 'Khác', 'Khác', 1, 1, NULL, 'DON_TO_CAO'),
	(40, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '040', 'Vi phạm điều lệ, kỉ luật Đảng', 'Vi phạm điều lệ, kỉ luật Đảng', 1, 1, 17, 'DON_TO_CAO'),
	(42, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '042', 'Văn hóa Xã hội', 'Văn hóa Xã hội', 1, 1, 18, 'DON_TO_CAO'),
	(43, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '043', 'Đất đai', 'Đất đai', 1, 1, 18, 'DON_TO_CAO'),
	(44, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '044', 'Tài nguyên mội trường', 'Tài nguyên mội trường', 1, 1, 18, 'DON_TO_CAO'),
	(45, b'0', '2017-04-24 10:31:04', '2017-04-24 10:32:37', b'0', '045', 'Tôn giáo, tín ngưỡng', 'Tôn giáo, tín ngưỡng', 1, 1, 18, 'DON_TO_CAO'),
	(47, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '047', 'Văn hóa, thể thao, du lịch', 'Văn hóa, thể thao, du lịch', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(48, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '048', 'Thuế, tài chính', 'Thuế, tài chính', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(49, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '049', 'Nông nghiệp và phát triển nông thôn', 'Nông nghiệp và phát triển nông thôn', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(50, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '050', 'Kế hoạch và đầu tư', 'Kế hoạch và đầu tư', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(51, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '051', 'Khoa học công nghệ', 'Khoa học công nghệ', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH'),
	(52, b'0', '2017-04-24 10:32:30', '2017-04-24 10:32:37', b'0', '052', 'Khác', 'Khác', 1, 1, NULL, 'DON_KIEN_NGHI_PHAN_ANH');
/*!40000 ALTER TABLE `linhvucdonthu` ENABLE KEYS */;

-- Dumping structure for table tttp.loaicoquanquanly

CREATE TABLE "IF NOT EXISTS `LOAICOQUANQUANLY`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.loaicoquanquanly: 2 rows
/*!40000 ALTER TABLE `loaicoquanquanly` DISABLE KEYS */;
INSERT INTO `loaicoquanquanly` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(2, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:41', 'Bộ Công An', 'Bộ Công An', 1, 1),
	(1, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:41', 'Sở Y Tế', 'Sở Y Tế', 1, 1);
/*!40000 ALTER TABLE `loaicoquanquanly` ENABLE KEYS */;

-- Dumping structure for table tttp.loaitailieu

CREATE TABLE "IF NOT EXISTS `LOAITAILIEU`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.loaitailieu: 4 rows
/*!40000 ALTER TABLE `loaitailieu` DISABLE KEYS */;
INSERT INTO `loaitailieu` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-05-03 15:47:23', '2017-04-27 08:29:07', 'Văn bản', 'Văn bản', 1, 1),
	(2, b'0', '2017-05-03 15:53:34', '2017-05-03 15:47:36', 'Video', 'Video', 1, 1),
	(3, b'0', '2017-05-03 15:53:31', '2017-05-03 15:50:26', 'Hình ảnh', 'Hình ảnh', 1, 1),
	(4, b'0', '2017-05-03 15:53:45', '2017-05-03 15:53:45', 'File ghi âm', 'File ghi âm', 1, 1);
/*!40000 ALTER TABLE `loaitailieu` ENABLE KEYS */;

-- Dumping structure for table tttp.medial_doandicung

CREATE TABLE "IF NOT EXISTS `MEDIAL_DOANDICUNG`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.medial_doandicung: 0 rows
/*!40000 ALTER TABLE `medial_doandicung` DISABLE KEYS */;
/*!40000 ALTER TABLE `medial_doandicung` ENABLE KEYS */;

-- Dumping structure for table tttp.medial_doncongdan

CREATE TABLE "IF NOT EXISTS `MEDIAL_DONCONGDAN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.medial_doncongdan: 0 rows
/*!40000 ALTER TABLE `medial_doncongdan` DISABLE KEYS */;
/*!40000 ALTER TABLE `medial_doncongdan` ENABLE KEYS */;

-- Dumping structure for table tttp.medial_form_state

CREATE TABLE "IF NOT EXISTS `MEDIAL_FORM_STATE`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CURRENTFORM`" tinyblob,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.medial_form_state: 0 rows
/*!40000 ALTER TABLE `medial_form_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `medial_form_state` ENABLE KEYS */;

-- Dumping structure for table tttp.medial_tailieubangchung

CREATE TABLE "IF NOT EXISTS `MEDIAL_TAILIEUBANGCHUNG`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.medial_tailieubangchung: 0 rows
/*!40000 ALTER TABLE `medial_tailieubangchung` DISABLE KEYS */;
/*!40000 ALTER TABLE `medial_tailieubangchung` ENABLE KEYS */;

-- Dumping structure for table tttp.medial_tailieuvanthu

CREATE TABLE "IF NOT EXISTS `MEDIAL_TAILIEUVANTHU`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.medial_tailieuvanthu: 0 rows
/*!40000 ALTER TABLE `medial_tailieuvanthu` DISABLE KEYS */;
/*!40000 ALTER TABLE `medial_tailieuvanthu` ENABLE KEYS */;

-- Dumping structure for table tttp.medial_tepdinhkem

CREATE TABLE "IF NOT EXISTS `MEDIAL_TEPDINHKEM`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.medial_tepdinhkem: 0 rows
/*!40000 ALTER TABLE `medial_tepdinhkem` DISABLE KEYS */;
/*!40000 ALTER TABLE `medial_tepdinhkem` ENABLE KEYS */;

-- Dumping structure for table tttp.nguoidung

CREATE TABLE "IF NOT EXISTS `NGUOIDUNG`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`ACTIVE`" bit(1) NOT NULL,
  "`MATKHAU`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`SALKEY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`VAITROMACDINH_ID`" bigint(20) NOT NULL,
  "`EMAIL`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.nguoidung: 93 rows
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `active`, `matKhau`, `salkey`, `nguoiSua_id`, `nguoiTao_id`, `vaiTroMacDinh_id`, `email`) VALUES
	(1, b'0', '2017-06-10 16:06:31', '2017-04-24 10:49:48', b'1', '8dc12f49943d3305e49bd87d26e4c4bf', 'L8LWQ8eZFMpu1+AsqxRb/seH166G/iRY', 1, 1, 1, 'admin@danang.gov.vn'),
	(2, b'0', '2017-06-10 16:07:05', '2017-05-03 15:30:58', b'1', '47617de8848cb3031d008b180a4dd82e', '/qSJ1OEet4MprtKovK9xXEMO6wBfN21c', 1, 1, 2, 'namtvd@danang.gov.vn'),
	(4, b'0', '2017-06-10 16:07:10', '2017-05-03 15:51:28', b'1', 'fb1c742480899b0de56aed55bcd44d55', '7JTAQTtxge2xdA+E7ZZNyzw/r31fowVa', 1, 1, 3, 'thanhpx@danang.gov.vn'),
	(5, b'0', '2017-06-10 16:07:01', '2017-05-03 15:52:46', b'1', 'a58ef10f165afc02728b7dcbf32a137e', '+Jgigb9UOPv1J1BrSEnw/u8g+pis8y23', 1, 1, 4, 'anvt@danang.gov.vn'),
	(6, b'0', '2017-06-10 16:07:07', '2017-05-17 19:06:57', b'1', '56b567c66a1ecd5342406c798abeac25', 'NuUeBrHmYkITYXaEFe9v2xE5wB7rGuBP', 1, 1, 2, 'vinhlv@danang.gov.vn'),
	(11, b'0', '2017-06-10 16:06:43', '2017-05-17 19:52:42', b'1', '0500a1398a85c343998479bf08b26ccb', '6aETrNWR/p8YdRVu7Q/78MC6kZlH3Q1S', 1, 1, 1, 'thienpd@danang.gov.vn'),
	(7, b'0', '2017-06-10 16:07:13', '2017-05-17 19:42:57', b'1', '463421a070dc0eb15cca3f45720a5ebd', 'CzUDm7/rIsUgR7aG5B41QnKayrSS0n+J', 1, 1, 3, 'thanghq@danang.gov.vn'),
	(8, b'0', '2017-06-10 16:07:27', '2017-05-17 19:43:49', b'1', '729b6d4e79f57fdca83dc95e72082f1b', 'RvwQ6tD1TOZPwZFYuGtQkCFoGhGSvkXM', 1, 1, 3, 'toantt@danang.gov.vn'),
	(9, b'0', '2017-06-10 16:06:34', '2017-05-17 19:44:59', b'1', '97ba5a976aada33b83d2592815b5ea4a', 'LEqhvXoSp0lp+sciRAPA8HYXwTYUu52D', 1, 1, 1, 'tttp@danang.gov.vn'),
	(10, b'0', '2017-06-10 16:06:40', '2017-05-17 19:47:34', b'1', '48d605e2dc607c5fc553c86b2bd6a9bd', 'fLoCuw1jfOIIoH5RYhP8tF1EC7tD9zYC', 1, 1, 1, 'thanhhx@danang.gov.vn'),
	(12, b'0', '2017-06-10 16:06:37', '2017-05-17 19:53:38', b'1', '69979180716cd53a419c2321dfe151aa', '0ld8Lj9q0A0JeGhV2Qw3egzWH+2CXrpr', 1, 1, 1, 'vutx@danang.gov.vn'),
	(13, b'0', '2017-06-11 08:58:45', '2017-05-31 16:37:56', b'1', 'b9932b995e33df7dce392d0769be9992', 'Tyx2DAAWpYwqL22EcfmRTvNjS4zDMaLE', 1, 1, 1, 'stnmt@danang.gov.vn'),
	(14, b'0', '2017-06-11 08:58:42', '2017-05-31 16:39:46', b'1', '31f11998e09f02f53cfe83d073a69c62', 'g5lwGMk4SQYey9b1hqbpFAhJ+sP2nq6S', 1, 1, 3, 'mynv@danang.gov.vn'),
	(15, b'0', '2017-06-10 16:15:31', '2017-05-31 16:44:22', b'1', '0ec8753739d3e69bee00a704371b37ce', 'L9ANeK9DLrOLdN9huMZZtNfo5bIcGsTh', 1, 1, 2, 'hungtt@danang.gov.vn'),
	(16, b'0', '2017-06-10 16:15:19', '2017-05-31 16:46:51', b'1', '6deabdbe62203b9f7b59c25790611404', 'Bk1P2AGzY3K2J0IUlccN/YhkzSGwICbx', 1, 1, 2, 'nhanlt@danang.gov.vn'),
	(18, b'0', '2017-06-11 08:57:54', '2017-06-10 17:23:12', b'1', '912db0a51102d956c1fac222f25712ce', '9Nw5bkQc4akmCvcvd1ZOLxmeVRikj7H8', 1, 1, 3, 'namnv@danang.gov.vn'),
	(19, b'0', '2017-06-11 08:58:27', '2017-06-10 17:24:09', b'1', '79e4cf18cac91f6dc998803359827178', 'yVEB9JSFOSGlLul0FmROhco9DeWG0YEK', 1, 1, 3, 'hungnpx@danang.gov.vn'),
	(20, b'0', '2017-06-11 08:59:18', '2017-06-10 17:24:53', b'1', '734120eb250992af711f25eccdaf85f8', 'sd3ByGEMF7MDLuBH6RfK4VyuPcoaekYp', 1, 1, 1, 'bangvn@danang.gov.vn'),
	(21, b'0', '2017-06-11 09:02:49', '2017-06-10 17:25:33', b'1', 'ea481521b112a570056927ec366c7282', '8C7j/PbcSD3G5/7jkrOSu+EnrkW2fySf', 1, 1, 1, 'tranvth@danang.gov.vn'),
	(22, b'0', '2017-06-11 09:31:43', '2017-06-11 09:31:43', b'1', 'b18cf42d94319a1c976367b88bd7509c', 'G2k+BCBazGkmRDDyUgK3TYFGyN01T1S1', 1, 1, 1, 'vuha@danang.gov.vn'),
	(23, b'0', '2017-06-11 09:34:12', '2017-06-11 09:34:12', b'1', 'b834d9de01a9fe0dd6d3d51b016dbfe5', 'zAP3tMUWVKTiRcdGhSRTQW/Q7qivYyps', 1, 1, 4, 'thuyttt@danang.gov.vn'),
	(24, b'0', '2017-06-11 09:35:23', '2017-06-11 09:35:23', b'1', '76f4e50f0cd6e55b07db99159c7919e6', 'xrBx0COmH8C2KmWzV0ruX3MtZo0HYgkS', 1, 1, 2, 'dongnd@danang.gov.vn'),
	(25, b'0', '2017-06-11 09:36:09', '2017-06-11 09:36:09', b'1', '2fd61f998350ad35caedb68556a455dc', 'K8yt37FyUO/KQfM7ELeu3ZKjuSLcomIV', 1, 1, 2, 'vuongbv@danang.gov.vn'),
	(26, b'0', '2017-06-11 09:37:52', '2017-06-11 09:37:52', b'1', '0b76c81864d3f977f0f62a6ffc5d08be', '4FPeIAIy7bXU3GwzY4eh+IKYMCPrBMRp', 1, 1, 3, 'phongpn@danang.gov.vn'),
	(27, b'0', '2017-06-11 09:38:33', '2017-06-11 09:38:33', b'1', '337a354eae5c25de5fe1b6d18551eaf9', '4eIOuuW3EsdGHi/sIzY6GWfxW+aCs7DP', 1, 1, 3, 'binhqd@danang.gov.vn'),
	(28, b'0', '2017-06-11 09:39:01', '2017-06-11 09:39:01', b'1', 'fdfcc75afefeb2ca6fa7e7beb913f196', 'TdcSpNvuB/n0hDEGGpTdkjRTWQ3Krpj1', 1, 1, 3, 'trongdd@danang.gov.vn'),
	(29, b'0', '2017-06-11 09:39:50', '2017-06-11 09:39:50', b'1', 'c47c944871bf05be9aa079460cb925d0', 'MXFj9Sgq0Wb/Yvkvq/e9XoDDkIP0uzPD', 1, 1, 2, 'huytbt@danang.gov.vn'),
	(30, b'0', '2017-06-11 09:41:36', '2017-06-11 09:40:27', b'1', '4b2fce70470ee8f4b958b3f740fff049', 'HxTDZ+xXZw+YSqt9/rJOG2UeAaxAdDpT', 1, 1, 2, 'toanpc@danang.gov.vn'),
	(31, b'0', '2017-06-11 09:41:39', '2017-06-11 09:41:17', b'1', '0fdf6c9e4d883c3085d531cbc6319d96', '/Kie4vmPMz29YhO1qIZh+OU31xDdCP5R', 1, 1, 3, 'thanhnt@danang.gov.vn'),
	(32, b'0', '2017-06-11 09:42:06', '2017-06-11 09:42:06', b'1', 'ab9ff3bb217a0d73d1c33243b8ec9448', 'Q8uW8JWx6fCEuTntK4j92O0Oz8/ZSdSL', 1, 1, 3, 'truonghn@danang.gov.vn'),
	(33, b'0', '2017-06-11 09:42:33', '2017-06-11 09:42:33', b'1', 'bdca3963fa36a59823dfa55446c940c2', '4P7JxuvNaWlD8a/md2ht5FuEvuxn6pKO', 1, 1, 3, 'vietpq@danang.gov.vn'),
	(34, b'0', '2017-06-11 09:48:07', '2017-06-11 09:48:07', b'1', '3e280ecc641199c71c912a612fdc1dc1', '7xFMBtKLHz+zQgb7E49vw50WDQ1wmmA6', 1, 1, 1, 'sgtvt@danang.gov.vn'),
	(35, b'0', '2017-06-11 09:48:41', '2017-06-11 09:48:41', b'1', '515e0b9e42ca3871beee499a7eb40477', 'CNyPcKdkKnZtYtvZ0ioXcswj+za2Ybue', 1, 1, 1, 'baonq@danang.gov.vn'),
	(36, b'0', '2017-06-11 09:49:10', '2017-06-11 09:49:10', b'1', 'c64218be054c347bcff19545b57758af', 'UHwYploNw/iNlLe7OFtjIL3sLhH211b4', 1, 1, 1, 'tinlvv@danang.gov.vn'),
	(37, b'0', '2017-06-11 09:49:34', '2017-06-11 09:49:34', b'1', '7c70703baad32f6b4251febcbf89481f', 'OQNokVY9FjPGTuxQiNiW4Ju40TJqbq6q', 1, 1, 1, 'hoand@danang.gov.vn'),
	(38, b'0', '2017-06-11 09:50:01', '2017-06-11 09:50:01', b'1', '79d01327e490daea163c7b3a665b3564', 'aiJxVb+nKveAPz+exVq1vjiWJrobG3mU', 1, 1, 4, 'thaopn@danang.gov.vn'),
	(39, b'0', '2017-06-11 09:51:24', '2017-06-11 09:51:11', b'1', '5b79ebb39e4e613c5bec046c315e153c', '6ayWct0I6rRfDhVWDgPBNyUBMQHl2b/Q', 1, 1, 2, 'dungvhp@danang.gov.vn'),
	(40, b'0', '2017-06-11 09:51:49', '2017-06-11 09:51:49', b'1', 'e6c0dc07c9ba686d588f4ca7520194af', 'HVbFGSi23jCnxV0+L2/jHsHcHT26EgKS', 1, 1, 2, 'vynln@danang.gov.vn'),
	(41, b'0', '2017-06-11 09:52:11', '2017-06-11 09:52:11', b'1', 'b8bf4cfc8e2cff95cd2630f09c46dea7', 'QoYJKKmYk6ddGqUDk6a4/YJg/lEA4eWM', 1, 1, 3, 'hieunh@danang.gov.vn'),
	(42, b'0', '2017-06-11 09:52:51', '2017-06-11 09:52:51', b'1', '7c8d7398bdda04adc17895e581d2a9f4', 'Lk2xCcjxVavINyJHrXR7dM9L+fCP//W8', 1, 1, 3, 'ninhva@danang.gov.vn'),
	(43, b'0', '2017-06-11 09:53:16', '2017-06-11 09:53:16', b'1', '3e9737281251151917dc14c7a5969224', 'tiN+5Hpv4ZIEwk7VKLtQYjx5xDUvoVuL', 1, 1, 3, 'minhnv@danang.gov.vn'),
	(44, b'0', '2017-06-11 09:53:43', '2017-06-11 09:53:43', b'1', '5c0db98c6b69e5ad171e45b22b8ed18e', '0ujb0DK0jzgiqRgXkSnenlXaoQz5YPOR', 1, 1, 2, 'thanhvv@danang.gov.vn'),
	(45, b'0', '2017-06-11 09:54:16', '2017-06-11 09:54:16', b'1', '9f6ff4717f70c5e815368cba297e9f33', '0IHdasE8UhAe0ZLJWiZkRHog6D4WCROE', 1, 1, 2, 'thanhnt1@danang.gov.vn'),
	(46, b'0', '2017-06-11 09:54:38', '2017-06-11 09:54:38', b'1', 'f51d1f17615299806ebcfd4cb7c1f8cf', 'GDbWL55V/6YL2Gpa7vhiP+17aKVNKi/8', 1, 1, 3, 'ducl@danang.gov.vn'),
	(47, b'0', '2017-06-11 09:55:05', '2017-06-11 09:55:05', b'1', '98fcaef7d84d5118939c9007bc011c57', 'T7jlw07SjotT0+3sCKC0d0AEZK9MgS01', 1, 1, 3, 'autn@danang.gov.vn'),
	(48, b'0', '2017-06-11 09:55:25', '2017-06-11 09:55:25', b'1', '8f2ddd72af341ccac16f40cc60cc66f9', 'OmN8aU2gQhGtPFH2bssSYf154x+9frLL', 1, 1, 3, 'vuhn@danang.gov.vn'),
	(49, b'0', '2017-06-11 09:58:10', '2017-06-11 09:58:10', b'1', '11dd2fa46d0078a93d72a83a323afd45', 'qNnV81cSBZMwQ19DTM5Cf7ZX6mMKNLLL', 1, 1, 1, 'sxd@danang.gov.vn'),
	(50, b'0', '2017-06-11 09:59:49', '2017-06-11 09:59:49', b'1', 'b022c7b75a8078a5398e176c149c24fa', 'MoQgEQMNBMD/fS3rYdvh07KQc20f/ThZ', 1, 1, 1, 'hoantt@danang.gov.vn'),
	(51, b'0', '2017-06-11 10:00:17', '2017-06-11 10:00:17', b'1', 'c59e751e8a6b2e20d27fed8564d8cdf8', 'X0+iVet6VoA+hLDMUQCmxoDx4HrNS3oc', 1, 1, 1, 'lanhtv@danang.gov.vn'),
	(52, b'0', '2017-06-11 10:00:46', '2017-06-11 10:00:46', b'1', 'cc9e04f72009b5638461c2e8139e7176', 'z0av+zG9NRQyPJF0+tLmmW2pDPeom56d', 1, 1, 1, 'giangnt@danang.gov.vn'),
	(53, b'0', '2017-06-11 10:01:12', '2017-06-11 10:01:12', b'1', '42b9c54a6e4c816223f214bda84dc771', '3vlfmp8qprb6jfTGPIlXyq/RbEm2xSM9', 1, 1, 4, 'khanhtp@danang.gov.vn'),
	(54, b'0', '2017-06-11 10:01:44', '2017-06-11 10:01:44', b'1', '30a76e954bcd0ddf617a0a6b62c4ac10', 'zztG9sXIALqW/v1W2jkMxM5wR4CuwhrK', 1, 1, 2, 'minhtv@danang.gov.vn'),
	(55, b'0', '2017-06-11 10:02:06', '2017-06-11 10:02:06', b'1', '6662f786e70ce96306de4ba46aea36a6', 'Z3mhcwQ/1kCcdMiyIgvjWc4ASiP0BG9q', 1, 1, 2, 'tuanhm@danang.gov.vn'),
	(56, b'0', '2017-06-11 10:02:30', '2017-06-11 10:02:30', b'1', '899c2e01b0afab40eaccbfff527c6ecc', 'X3Fklh6JopoAdYBSUm+cvHq3uFgzhj/9', 1, 1, 3, 'tientn@danang.gov.vn'),
	(57, b'0', '2017-06-11 10:02:51', '2017-06-11 10:02:51', b'1', '21f81ed014ac5d025283e2f7fcfcf7c7', 'VpZZU6s8Igz5zigKMVLYecEQzlt2RqbW', 1, 1, 3, 'thanhhc@danang.gov.vn'),
	(58, b'0', '2017-06-11 10:03:23', '2017-06-11 10:03:23', b'1', 'c96908d4d5bc7bb67c89c870d0feb812', 'Hqplv+Ra0ZqCtqoVgq8zWyoBtKezW8WY', 1, 1, 3, 'thangdq@danang.gov.vn'),
	(59, b'0', '2017-06-11 10:03:54', '2017-06-11 10:03:46', b'1', 'b6767511551b916ed1dcbfd1a7b3e32b', 'prGHdfEpjMpJk/I/78IuJRBkYMRoU/3o', 1, 1, 2, 'tanld@danang.gov.vn'),
	(60, b'0', '2017-06-11 10:04:18', '2017-06-11 10:04:18', b'1', '93de04d41db8fc4def8a8eceda9377ed', '+Z05hVGp27w7lryZjLTq7Zr9X1zi8nNu', 1, 1, 2, 'toandtc@danang.gov.vn'),
	(61, b'0', '2017-06-11 10:04:44', '2017-06-11 10:04:44', b'1', '6941e2514ec8e370c880a27a94325b70', 'DEjugO8HBf4Vzk5kN3zHXNFV+Bsv88xU', 1, 1, 3, 'nghialt@danang.gov.vn'),
	(62, b'0', '2017-06-11 10:05:07', '2017-06-11 10:05:07', b'1', '9d8deef2c669125500ec10446a18916b', 'rIgvKX3cmVilvroSH+JuhN+rkkU898+U', 1, 1, 3, 'tuanlk@danang.gov.vn'),
	(63, b'0', '2017-06-11 10:05:33', '2017-06-11 10:05:33', b'1', 'd66b2fc4a7df66d5093592404e1a5565', '4OeosYmVAj+TRgug+RumIfCkfruJEb51', 1, 1, 3, 'phutlq@danang.gov.vn'),
	(64, b'0', '2017-06-11 10:08:28', '2017-06-11 10:08:28', b'1', 'aaa299a6b9bd629e8883de56d2e6f016', 'c+H+KJnay0+gK63562t0V6tnQIWAF7Ly', 1, 1, 1, 'quanthanhkhe@danang.gov.vn'),
	(65, b'0', '2017-06-11 10:08:57', '2017-06-11 10:08:57', b'1', '66bdade57e00ef3b88faa49661005c55', 'MUMFv9qHd/0WzF+1FxXxKvYJA3izF0tZ', 1, 1, 1, 'huyenttt@danang.gov.vn'),
	(66, b'0', '2017-06-11 10:09:27', '2017-06-11 10:09:27', b'1', 'd0006b47744bd4838d9d88999df83562', 'kNJ4ECNqx7sMiwloumaxRYjbjt7RwBCZ', 1, 1, 1, 'chinhth@danang.gov.vn'),
	(67, b'0', '2017-06-11 10:11:56', '2017-06-11 10:11:42', b'1', 'f32d01d28b026ed151ddc238e05c4f03', 'fmOAXdaR2RF2QtLEBBN9eUlPPQ3kUbPw', 1, 1, 1, 'haoda@danang.gov.vn'),
	(68, b'0', '2017-06-11 10:12:19', '2017-06-11 10:12:19', b'1', 'fd7fd6300f152d2a2611732463b1d92a', 'O/0kqfZgfiXQXTBOYQbOCBLwPn8HhrPy', 1, 1, 4, 'thuongbth@danang.gov.vn'),
	(69, b'0', '2017-06-11 10:14:07', '2017-06-11 10:14:07', b'1', '88e7406630c628a130b5f9fc1edc6bbf', 'F6B2KOPZMvTZAo52NsoCv9XKZoMhrmxB', 1, 1, 2, 'thuybtt@danang.gov.vn'),
	(70, b'0', '2017-06-11 10:14:39', '2017-06-11 10:14:39', b'1', 'e2f1f9dbe7c797142224ace4832c3c91', 'Jr3E5he3Bw8zhVxJS7hmgQE7PBiRIaa6', 1, 1, 2, 'hoaitt@danang.gov.vn'),
	(71, b'0', '2017-06-11 10:15:20', '2017-06-11 10:15:20', b'1', '444ffbcc54fc93465c85eedecb65a53b', 'R0aQRq8daCiqfGZ53N7TG9HvR5lFzi3s', 1, 1, 3, 'sangtx@danang.gov.vn'),
	(72, b'0', '2017-06-11 10:16:13', '2017-06-11 10:16:13', b'1', '18975727fc1858c4765a4e8b2afec313', 'jAQDQp54qY7C6o+aIJmIEwZdJVX+23Np', 1, 1, 3, 'tinhlv@danang.gov.vn'),
	(73, b'0', '2017-06-11 10:16:36', '2017-06-11 10:16:36', b'1', '4fd0fa80a6fd644aa5cd1b1747a64abb', 'JNBHMyoWRpanykYc8Kj8zbaF52ysMoNR', 1, 1, 3, 'thanhtcn@danang.gov.vn'),
	(74, b'0', '2017-06-11 10:17:49', '2017-06-11 10:17:49', b'1', '6f988f6ae9ff80416e9b098bd1a848a0', 'H2HcDQMp8WgqaZX87bDEbAXz7sWjx+aq', 1, 1, 2, 'huongkpa@danang.gov.vn'),
	(75, b'0', '2017-06-11 10:18:28', '2017-06-11 10:18:28', b'1', '7694af1a0d7591f484af645abf35ccae', 'KLUzs5su1BvQ1ybVL9vSaKrcULBTT84t', 1, 1, 2, 'thuongdtt@danang.gov.vn'),
	(76, b'0', '2017-06-11 10:18:48', '2017-06-11 10:18:48', b'1', 'ebba5c78c7209d43664fb5b74be11afc', '5V/4sKUpZUQzBiQEdGmywUkCCG7grrIK', 1, 1, 3, 'hongnt@danang.gov.vn'),
	(77, b'0', '2017-06-11 10:19:26', '2017-06-11 10:19:26', b'1', '1f83f844168df33e83568431cae6771a', 'i9x/qrkTU0ks3ydxtc/QVZhG9Xrz1//2', 1, 1, 3, 'hoannx@danang.gov.vn'),
	(78, b'0', '2017-06-11 10:20:01', '2017-06-11 10:20:01', b'1', '54d6e664560b8493de0d0ccd5c8e5dbc', 'usRvCA7CyB+1PnjLsU+7WWxgoLSinqR/', 1, 1, 3, 'namdh@danang.gov.vn'),
	(79, b'0', '2017-06-11 10:24:55', '2017-06-11 10:24:55', b'1', '4d0448015df0b585a81ce85ab171a49c', 'l5SsI268owfX/SclpISBpuTJ1BqFWACs', 1, 1, 1, 'quanhaichau@danang.gov.vn'),
	(80, b'0', '2017-06-11 10:25:23', '2017-06-11 10:25:23', b'1', 'e3c917d7ead856de4431eac303fec915', '4gINqV+3SIq7SEsA7nsnPedvgKxwCtSK', 1, 1, 1, 'cuonglv@danang.gov.vn'),
	(81, b'0', '2017-06-11 10:25:48', '2017-06-11 10:25:48', b'1', 'bb8f7125e51588b999686fbfa047ff47', 'aGxE0LRcQzRAdF0Ro3Jn7CNMsvljWxfB', 1, 1, 1, 'chivt@danang.gov.vn'),
	(82, b'0', '2017-06-11 10:26:14', '2017-06-11 10:26:14', b'1', '3c83b8ceaaff84e22f74db40fd4c037f', 'tLYknYn6E2xTTe4hq8eFrsJlAcuXeaAL', 1, 1, 1, 'tuannc@danang.gov.vn'),
	(83, b'0', '2017-06-11 10:26:38', '2017-06-11 10:26:38', b'1', '187ac28b84bc922c0d5ef3fccd974874', '9Bg7iVPA1Z4RQClSu3dW3CgxuxHHypfv', 1, 1, 4, 'vynty@danang.gov.vn'),
	(84, b'0', '2017-06-11 10:26:59', '2017-06-11 10:26:59', b'1', 'fd9183c926e7c1baae9330e47e411dbc', '1DrFY/C5w64BiOxt20BcfFBvAcbkNg9m', 1, 1, 2, 'huongtt@danang.gov.vn'),
	(85, b'0', '2017-06-11 10:27:22', '2017-06-11 10:27:22', b'1', '7e71b1409257864d751fd8a934f5eb4e', 'xiNUCG/5lrrHTlgQh4OJteZ39PVDtfIV', 1, 1, 2, 'trangttu@danang.gov.vn'),
	(86, b'0', '2017-06-11 10:27:42', '2017-06-11 10:27:42', b'1', '132114e1f2e00b957b45a2e93a357a7a', '+qYlfcfUpUIfpnAuXXpzNDMNESPQIbZ9', 1, 1, 3, 'thuht@danang.gov.vn'),
	(87, b'0', '2017-06-11 10:28:07', '2017-06-11 10:28:07', b'1', '1e09e66d45ce5e122189f41b4bbe85e4', 'YFuEri+BU8ZQgMjzFQxpHoDefzHFecoq', 1, 1, 3, 'anndk@danang.gov.vn'),
	(88, b'0', '2017-06-11 10:30:01', '2017-06-11 10:30:01', b'1', 'a6cb24600462b4c57d912bc7d885f280', 'BLolEh6LAo1ANGP2R6a9SUCwrsyq1LVD', 1, 1, 3, 'huynd@danang.gov.vn'),
	(89, b'0', '2017-06-11 10:30:29', '2017-06-11 10:30:29', b'1', '4586d131409f128dd9f02b5b8f0b991c', 'sqNwv8+YRHSkZHjRAi1FySxS5U6vh9W9', 1, 1, 2, 'gianh@danang.gov.vn'),
	(90, b'0', '2017-06-11 10:30:56', '2017-06-11 10:30:56', b'1', '4dbc57412f92e3fce5fa8412d314e729', 'ARiPOGvuTHf5i/qtak8koEsoD9BePclD', 1, 1, 2, 'maipt@danang.gov.vn'),
	(91, b'0', '2017-06-11 10:31:28', '2017-06-11 10:31:28', b'1', '9be55946a68546d93e56cd4fb64f9b67', 'RnYj8zvLYl25EpvUHzdmgPeRudLOzKeU', 1, 1, 3, 'tramhch@danang.gov.vn'),
	(92, b'0', '2017-06-11 10:31:56', '2017-06-11 10:31:56', b'1', 'b52b26caabdb6c072e11506fe091661b', 'u7HkGwwpzS02JmMMWD5RRqufHVaKVqY1', 1, 1, 3, 'vanntb@danang.gov.vn'),
	(93, b'0', '2017-06-11 10:32:17', '2017-06-11 10:32:17', b'1', '4c37bc3046e4c4dc61f68a90f7e15615', 'ZlBijUxybHhEdfAwv8yfqVO07GJqorMM', 1, 1, 3, 'nganta@danang.gov.vn'),
	(94, b'0', '2017-06-11 10:33:59', '2017-06-11 10:33:59', b'1', 'bdf13e58c742b6204db38222506f6d96', 'gXCeuO52SwhuhRkAHKZZcNtuuJszJIdz', 1, 1, 1, 'tanchinh@danang.gov.vn'),
	(95, b'0', '2017-06-11 10:36:42', '2017-06-11 10:36:42', b'1', '95ffdc9246e4d12d773aa9314da05533', '6f3OvUi1BH+cNdALjLV8JSHTXXE2eP1v', 1, 1, 1, 'thanhbinh@danang.gov.vn');
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;

-- Dumping structure for table tttp.nguoidung_quyen

CREATE TABLE "IF NOT EXISTS `NGUOIDUNG_QUYEN`" (
  "`NGUOIDUNG_ID`" bigint(20) NOT NULL,
  "`QUYENS`" longtext COLLATE utf8_vietnamese_ci

) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.nguoidung_quyen: 0 rows
/*!40000 ALTER TABLE `nguoidung_quyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoidung_quyen` ENABLE KEYS */;

-- Dumping structure for table tttp.nguoidung_vaitro

CREATE TABLE "IF NOT EXISTS `NGUOIDUNG_VAITRO`" (
  "`NGUOIDUNG_ID`" bigint(20) NOT NULL,
  "`VAITRO_ID`" bigint(20) NOT NULL,
  PRIMARY KEY (`nguoidung_id`,`vaitro_id`)

) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.nguoidung_vaitro: 93 rows
/*!40000 ALTER TABLE `nguoidung_vaitro` DISABLE KEYS */;
INSERT INTO `nguoidung_vaitro` (`nguoidung_id`, `vaitro_id`) VALUES
	(1, 1),
	(2, 2),
	(4, 3),
	(5, 4),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 3),
	(15, 2),
	(16, 2),
	(18, 3),
	(19, 3),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 4),
	(24, 2),
	(25, 2),
	(26, 3),
	(27, 3),
	(28, 3),
	(29, 2),
	(30, 2),
	(31, 3),
	(32, 3),
	(33, 3),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 4),
	(39, 2),
	(40, 2),
	(41, 3),
	(42, 3),
	(43, 3),
	(44, 2),
	(45, 2),
	(46, 3),
	(47, 3),
	(48, 3),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 4),
	(54, 2),
	(55, 2),
	(56, 3),
	(57, 3),
	(58, 3),
	(59, 2),
	(60, 2),
	(61, 3),
	(62, 3),
	(63, 3),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 4),
	(69, 2),
	(70, 2),
	(71, 3),
	(72, 3),
	(73, 3),
	(74, 2),
	(75, 2),
	(76, 3),
	(77, 3),
	(78, 3),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 4),
	(84, 2),
	(85, 2),
	(86, 3),
	(87, 3),
	(88, 3),
	(89, 2),
	(90, 2),
	(91, 3),
	(92, 3),
	(93, 3),
	(94, 1),
	(95, 1);
/*!40000 ALTER TABLE `nguoidung_vaitro` ENABLE KEYS */;

-- Dumping structure for table tttp.quoctich

CREATE TABLE "IF NOT EXISTS `QUOCTICH`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.quoctich: 250 rows
/*!40000 ALTER TABLE `quoctich` DISABLE KEYS */;
INSERT INTO `quoctich` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ma`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(106, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IT', 'Italia', 'Italia', 1, 1),
	(107, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'JM', 'Gia-mai-ca', 'Gia-mai-ca', 1, 1),
	(108, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'JP', 'Nhật', 'Nhật', 1, 1),
	(109, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'JO', 'Gioóc-đa-ni', 'Gioóc-đa-ni', 1, 1),
	(110, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KZ', 'Ca-dắc-xtan', 'Ca-dắc-xtan', 1, 1),
	(111, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KE', 'Cộng hòa Kenya', 'Cộng hòa Kenya', 1, 1),
	(112, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KI', 'Cộng hòa Kiribati', 'Cộng hòa Kiribati', 1, 1),
	(113, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KP', 'Cộng hòa Dân chủ Nhân dân Triều Tiên', 'Cộng hòa Dân chủ Nhân dân Triều Tiên', 1, 1),
	(114, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KR', 'Hàn Quốc', 'Hàn Quốc', 1, 1),
	(115, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KW', 'Cô-oét', 'Cô-oét', 1, 1),
	(116, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KG', 'Cư-rơ-gư-dơ-xtan', 'Cư-rơ-gư-dơ-xtan', 1, 1),
	(117, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LA', 'Lào', 'Lào', 1, 1),
	(118, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LV', 'Lát-vi-a', 'Lát-vi-a', 1, 1),
	(119, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LB', 'Li-băng', 'Li-băng', 1, 1),
	(120, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LS', 'Vương quốc Lesotho', 'Vương quốc Lesotho', 1, 1),
	(121, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LR', 'Cộng hòa Liberia', 'Cộng hòa Liberia', 1, 1),
	(122, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LY', 'Li-bi', 'Li-bi', 1, 1),
	(123, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LI', 'Thân vương quốc Liechtenstein', 'Thân vương quốc Liechtenstein', 1, 1),
	(124, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LT', 'Lít-va', 'Lít-va', 1, 1),
	(125, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LU', 'Lúc-xăm-bua', 'Lúc-xăm-bua', 1, 1),
	(126, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MO', 'Ma Cao', 'Ma Cao', 1, 1),
	(127, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MK', 'Cộng hòa Macedonia', 'Cộng hòa Macedonia', 1, 1),
	(128, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MG', 'Cộng hòa Madagascar', 'Cộng hòa Madagascar', 1, 1),
	(129, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MW', 'Ma-la-uy', 'Ma-la-uy', 1, 1),
	(130, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MY', 'Malaysia', 'Malaysia', 1, 1),
	(131, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MV', 'Man-đi-vơ', 'Man-đi-vơ', 1, 1),
	(132, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ML', 'Cộng hòa Mali', 'Cộng hòa Mali', 1, 1),
	(133, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MT', 'Cộng hòa Malta', 'Cộng hòa Malta', 1, 1),
	(134, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MH', 'Quần đảo Marshall', 'Quần đảo Marshall', 1, 1),
	(135, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MQ', 'Martinique', 'Martinique', 1, 1),
	(136, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MR', 'Mô-ri-ta-ni', 'Mô-ri-ta-ni', 1, 1),
	(137, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MU', 'Mô-ri-xơ', 'Mô-ri-xơ', 1, 1),
	(138, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'YT', 'Tỉnh Mayotte', 'Tỉnh Mayotte', 1, 1),
	(139, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MX', 'Mê-xi-cô', 'Mê-xi-cô', 1, 1),
	(140, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'FM', 'Liên bang Micronesia', 'Liên bang Micronesia', 1, 1),
	(141, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MD', 'Moldova', 'Moldova', 1, 1),
	(142, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MC', 'Công quốc Monaco', 'Công quốc Monaco', 1, 1),
	(143, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MN', 'Mông Cổ', 'Mông Cổ', 1, 1),
	(144, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MS', 'Montserrat', 'Montserrat', 1, 1),
	(145, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MA', 'Vương quốc Maroc', 'Vương quốc Maroc', 1, 1),
	(146, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MZ', 'Cộng hòa Mozambique', 'Cộng hòa Mozambique', 1, 1),
	(147, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MM', 'Mi-an-ma', 'Mi-an-ma', 1, 1),
	(148, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NA', 'Cộng hòa Namibia', 'Cộng hòa Namibia', 1, 1),
	(149, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NR', 'Cộng hòa Nauru', 'Cộng hòa Nauru', 1, 1),
	(150, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NP', 'Nê-pan', 'Nê-pan', 1, 1),
	(151, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NL', 'Hà Lan', 'Hà Lan', 1, 1),
	(152, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AN', 'Antille thuộc Hà Lan', 'Antille thuộc Hà Lan', 1, 1),
	(153, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NC', 'Kanaky và Le caillou', 'Kanaky và Le caillou', 1, 1),
	(154, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NZ', 'Niu Di-lân', 'Niu Di-lân', 1, 1),
	(155, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NI', 'Nicaragua', 'Nicaragua', 1, 1),
	(156, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NE', 'Cộng hoà Niger', 'Cộng hoà Niger', 1, 1),
	(157, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NG', 'Cộng hòa Liên bang Nigeria', 'Cộng hòa Liên bang Nigeria', 1, 1),
	(158, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NU', 'Niue', 'Niue', 1, 1),
	(159, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NF', 'Đảo Norfolk', 'Đảo Norfolk', 1, 1),
	(160, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MP', 'Quần đảo Bắc Mariana', 'Quần đảo Bắc Mariana', 1, 1),
	(161, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'NO', 'Na Uy', 'Na Uy', 1, 1),
	(162, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'OM', 'Ô-man', 'Ô-man', 1, 1),
	(163, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PK', 'Pa-ki-xtan', 'Pa-ki-xtan', 1, 1),
	(164, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PW', 'Cộng hòa Palau', 'Cộng hòa Palau', 1, 1),
	(165, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PS', 'Chính quyền Quốc gia Palestine', 'Chính quyền Quốc gia Palestine', 1, 1),
	(166, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PA', 'Cộng hòa Panama', 'Cộng hòa Panama', 1, 1),
	(167, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PG', 'Pa-pu-a Niu Ghi-nê', 'Pa-pu-a Niu Ghi-nê', 1, 1),
	(168, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PY', 'Cộng hòa Paraguay', 'Cộng hòa Paraguay', 1, 1),
	(169, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PE', 'Cộng hòa Peru', 'Cộng hòa Peru', 1, 1),
	(170, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PH', 'Philippines', 'Philippines', 1, 1),
	(171, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PN', 'Quần đảo Pitcairn', 'Quần đảo Pitcairn', 1, 1),
	(172, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PL', 'Ba Lan', 'Ba Lan', 1, 1),
	(173, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PT', 'Bồ Đào Nha', 'Bồ Đào Nha', 1, 1),
	(174, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PR', 'Pu-éc-tô Ri-cô', 'Pu-éc-tô Ri-cô', 1, 1),
	(175, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'QA', 'Ca-ta', 'Ca-ta', 1, 1),
	(176, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'RE', 'Đảo Réunion', 'Đảo Réunion', 1, 1),
	(177, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'RO', 'Rumani', 'Rumani', 1, 1),
	(178, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'RU', 'Nga', 'Nga', 1, 1),
	(179, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'RW', 'Cộng hòa Ru-an-đa', 'Cộng hòa Ru-an-đa', 1, 1),
	(180, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SH', 'Xanh hê-li-na', 'Xanh hê-li-na', 1, 1),
	(181, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KN', 'Liên bang Saint Kitts và Nevis ', 'Liên bang Saint Kitts và Nevis ', 1, 1),
	(182, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LC', 'Saint Lucia', 'Saint Lucia', 1, 1),
	(183, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PM', 'Saint-Pierre và Miquelon', 'Saint-Pierre và Miquelon', 1, 1),
	(184, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VC', 'Saint Vincent và Grenadines', 'Saint Vincent và Grenadines', 1, 1),
	(185, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'WS', 'Nhà nước Độc lập Samoa', 'Nhà nước Độc lập Samoa', 1, 1),
	(186, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SM', 'Cộng hòa Đại bình yên San Marino', 'Cộng hòa Đại bình yên San Marino', 1, 1),
	(187, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ST', 'Cộng hòa Dân chủ São Tomé và Príncipe', 'Cộng hòa Dân chủ São Tomé và Príncipe', 1, 1),
	(188, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SA', 'Ả-rập Xê-út', 'Ả-rập Xê-út', 1, 1),
	(189, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SN', 'Cộng hoà Sénégal', 'Cộng hoà Sénégal', 1, 1),
	(190, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CS', 'Serbia và Montenegro', 'Serbia và Montenegro', 1, 1),
	(191, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SC', 'Xây-sen', 'Xây-sen', 1, 1),
	(192, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SL', 'Xi-ê-ra Lê-ôn', 'Xi-ê-ra Lê-ôn', 1, 1),
	(193, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SG', 'Singapore ', 'Singapore ', 1, 1),
	(194, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SK', 'Cộng hoà Slovak', 'Cộng hoà Slovak', 1, 1),
	(195, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SI', 'Cộng hòa Slovenia', 'Cộng hòa Slovenia', 1, 1),
	(196, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SB', 'Quần đảo Solomon', 'Quần đảo Solomon', 1, 1),
	(197, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SO', 'Cộng hoà Liên bang Somalia', 'Cộng hoà Liên bang Somalia', 1, 1),
	(198, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ZA', 'Cộng hòa Nam Phi', 'Cộng hòa Nam Phi', 1, 1),
	(199, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GS', 'Nam Georgia và Quần đảo Nam Sandwich', 'Nam Georgia và Quần đảo Nam Sandwich', 1, 1),
	(200, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ES', 'Tây Ban Nha', 'Tây Ban Nha', 1, 1),
	(201, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'LK', 'Sri Lanka', 'Sri Lanka', 1, 1),
	(202, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SD', 'Xu-đăng', 'Xu-đăng', 1, 1),
	(203, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SR', 'Xu-ri-nam', 'Xu-ri-nam', 1, 1),
	(204, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SJ', 'Svalbard và Jan Mayen', 'Svalbard và Jan Mayen', 1, 1),
	(205, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SZ', 'Xoa-di-len', 'Xoa-di-len', 1, 1),
	(206, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SE', 'Thụy Điển', 'Thụy Điển', 1, 1),
	(207, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CH', 'Thụy Sĩ', 'Thụy Sĩ', 1, 1),
	(208, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SY', 'Syria', 'Syria', 1, 1),
	(209, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TW', 'Trung quốc (Đài Loan)', 'Trung quốc (Đài Loan)', 1, 1),
	(210, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TJ', 'Ta-gi-ki-xtan', 'Ta-gi-ki-xtan', 1, 1),
	(211, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TZ', 'Tanzania', 'Tanzania', 1, 1),
	(212, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TH', 'Thái Lan', 'Thái Lan', 1, 1),
	(213, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TL', 'Đông Ti-mo', 'Đông Ti-mo', 1, 1),
	(214, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TG', 'Cộng hòa Togo', 'Cộng hòa Togo', 1, 1),
	(215, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TK', 'Tokelau', 'Tokelau', 1, 1),
	(216, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TO', 'Tonga', 'Tonga', 1, 1),
	(217, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TT', 'Trinidad và Tobago', 'Trinidad và Tobago', 1, 1),
	(218, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TN', 'Tunisia', 'Tunisia', 1, 1),
	(219, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TR', 'Turkey', 'Turkey', 1, 1),
	(220, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TM', 'Tuốc-mê-ni-xtan', 'Tuốc-mê-ni-xtan', 1, 1),
	(221, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TC', 'Quần đảo Turks và Caicos', 'Quần đảo Turks và Caicos', 1, 1),
	(222, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TV', 'Tuvalu', 'Tuvalu', 1, 1),
	(223, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'UG', 'Cộng hòa Uganda', 'Cộng hòa Uganda', 1, 1),
	(224, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'UA', 'Ukraina', 'Ukraina', 1, 1),
	(225, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AE', 'Các Tiểu Vương quốc Ả Rập Thống nhất', 'Các Tiểu Vương quốc Ả Rập Thống nhất', 1, 1),
	(226, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GB', 'Vương quốc Liên hiệp Anh và Bắc Ireland', 'Vương quốc Liên hiệp Anh và Bắc Ireland', 1, 1),
	(227, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'US', 'Hoa Kỳ', 'Hoa Kỳ', 1, 1),
	(228, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'UM', 'Các tiểu đảo xa của Hoa Kỳ', 'Các tiểu đảo xa của Hoa Kỳ', 1, 1),
	(229, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'UY', 'Uruguay', 'Uruguay', 1, 1),
	(230, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'UZ', 'U-dơ-bê-ki-xtan', 'U-dơ-bê-ki-xtan', 1, 1),
	(231, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VU', 'Cộng hòa Vanuatu', 'Cộng hòa Vanuatu', 1, 1),
	(233, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VE', 'Cộng hòa Bolivar Venezuela', 'Cộng hòa Bolivar Venezuela', 1, 1),
	(234, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AF', 'Cộng hòa Hồi giáo Afghanistan', 'Cộng hòa Hồi giáo Afghanistan', 1, 1),
	(235, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VG', 'Quần đảo Virgin thuộc Anh', 'Quần đảo Virgin thuộc Anh', 1, 1),
	(236, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VI', 'Quần đảo Virgin thuộc Mỹ', 'Quần đảo Virgin thuộc Mỹ', 1, 1),
	(237, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'WF', 'Wallis và Futuna', 'Wallis và Futuna', 1, 1),
	(238, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'EH', 'Tây Sahara', 'Tây Sahara', 1, 1),
	(239, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'YE', 'Y-ê-men', 'Y-ê-men', 1, 1),
	(240, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ZM', 'Zambia ', 'Zambia ', 1, 1),
	(241, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ZW', 'Cộng hòa Zimbabwe', 'Cộng hòa Zimbabwe', 1, 1),
	(242, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BIH', 'Bosna và Hercegovina', 'Bosna và Hercegovina', 1, 1),
	(243, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CUW', 'Curaçao', 'Curaçao', 1, 1),
	(244, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GGY', 'Địa hạt Guernsey', 'Địa hạt Guernsey', 1, 1),
	(245, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IMN', 'Đảo Man', 'Đảo Man', 1, 1),
	(246, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'JEY', 'Jersey', 'Jersey', 1, 1),
	(247, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MNE', 'Cộng hòa Montenegro', 'Cộng hòa Montenegro', 1, 1),
	(248, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BLM', 'Saint-Barthélemy', 'Saint-Barthélemy', 1, 1),
	(249, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'MAF', 'Saint Martin (French part)', 'Saint Martin (French part)', 1, 1),
	(250, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SXM', 'Sint Maarten (Dutch part)', 'Sint Maarten (Dutch part)', 1, 1),
	(251, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SSD', 'South Sudan', 'South Sudan', 1, 1),
	(1, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VIE', 'Việt Nam', 'Việt Nam', 1, 1),
	(2, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AX', 'And Islands', 'And Islands', 1, 1),
	(3, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AL', 'An-ba-ni', 'An-ba-ni', 1, 1),
	(4, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'DZ', 'An-giê-ri', 'An-giê-ri', 1, 1),
	(5, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AS', 'Samoa thuộc Mỹ', 'Samoa thuộc Mỹ', 1, 1),
	(6, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AD', 'An-đô-ra', 'An-đô-ra', 1, 1),
	(7, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AO', 'Ăng-gô-la', 'Ăng-gô-la', 1, 1),
	(8, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AI', 'Anguilla', 'Anguilla', 1, 1),
	(9, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AQ', 'Nam cực', 'Nam cực', 1, 1),
	(10, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AG', 'An-ti-goa và Bác-bu-đa', 'An-ti-goa và Bác-bu-đa', 1, 1),
	(11, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AR', 'Ác-hen-ti-na', 'Ác-hen-ti-na', 1, 1),
	(12, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AM', 'Ác-mê-ni-a', 'Ác-mê-ni-a', 1, 1),
	(13, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AW', 'Aruba', 'Aruba', 1, 1),
	(14, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AU', 'Úc', 'Úc', 1, 1),
	(15, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AT', 'Áo', 'Áo', 1, 1),
	(16, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'AZ', 'A-déc-bai-gian', 'A-déc-bai-gian', 1, 1),
	(17, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BS', 'Ba-ha-mát', 'Ba-ha-mát', 1, 1),
	(18, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BH', 'Vương quốc Ba-ranh', 'Vương quốc Ba-ranh', 1, 1),
	(19, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BD', 'Băng-la-đét', 'Băng-la-đét', 1, 1),
	(20, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BB', 'Bác-ba-đốt', 'Bác-ba-đốt', 1, 1),
	(21, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BY', 'Bê-la-rút', 'Bê-la-rút', 1, 1),
	(22, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BE', 'Bỉ', 'Bỉ', 1, 1),
	(23, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BZ', 'Bê-li-xê', 'Bê-li-xê', 1, 1),
	(24, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BJ', 'Bê-nanh', 'Bê-nanh', 1, 1),
	(25, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BM', 'Quần đảo Bermuda', 'Quần đảo Bermuda', 1, 1),
	(26, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BT', 'Bu-tan', 'Bu-tan', 1, 1),
	(27, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BO', 'Bô-li-vi-a', 'Bô-li-vi-a', 1, 1),
	(28, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BA', 'Bosnia và herzegovina', 'Bosnia và herzegovina', 1, 1),
	(29, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BW', 'Bốt-xoa-na', 'Bốt-xoa-na', 1, 1),
	(30, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BV', 'Đảo Bouvet', 'Đảo Bouvet', 1, 1),
	(31, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BR', 'Bra-xin', 'Bra-xin', 1, 1),
	(32, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IO', 'Lãnh thổ Ấn Độ Dương', 'Lãnh thổ Ấn Độ Dương', 1, 1),
	(33, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BN', 'Nhà nước Brunei Darussalam', 'Nhà nước Brunei Darussalam', 1, 1),
	(34, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BG', 'Bun-ga-ri', 'Bun-ga-ri', 1, 1),
	(35, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BF', 'Buốc-ki-na Pha-xô', 'Buốc-ki-na Pha-xô', 1, 1),
	(36, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'BI', 'Cộng hòa Bu-run-đi', 'Cộng hòa Bu-run-đi', 1, 1),
	(37, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KH', 'Campuchia', 'Campuchia', 1, 1),
	(38, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CM', 'Cộng hòa Cameroon', 'Cộng hòa Cameroon', 1, 1),
	(39, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CA', 'Ca-na-đa', 'Ca-na-đa', 1, 1),
	(40, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CV', 'Cáp Ve', 'Cáp Ve', 1, 1),
	(41, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KY', 'Quần đảo Cayman', 'Quần đảo Cayman', 1, 1),
	(42, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CF', 'Cộng hòa Trung Phi', 'Cộng hòa Trung Phi', 1, 1),
	(43, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TD', 'Sát', 'Sát', 1, 1),
	(44, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CL', 'Chi-lê', 'Chi-lê', 1, 1),
	(45, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CN', 'Trung Quốc', 'Trung Quốc', 1, 1),
	(46, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CX', 'Đảo Christmas', 'Đảo Christmas', 1, 1),
	(47, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CC', 'Tiểu bang và vùng lãnh thổ Úc', 'Tiểu bang và vùng lãnh thổ Úc', 1, 1),
	(48, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CO', 'Cộng hòa Cô-lôm-bi-a', 'Cộng hòa Cô-lôm-bi-a', 1, 1),
	(49, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'KM', 'Cô-mo', 'Cô-mo', 1, 1),
	(50, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CG', 'Công-gô', 'Công-gô', 1, 1),
	(51, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CD', 'Cộng hòa Dân chủ Công-gô', 'Cộng hòa Dân chủ Công-gô', 1, 1),
	(52, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CK', 'Quần đảo Cook', 'Quần đảo Cook', 1, 1),
	(53, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CR', 'Cộng hoà Costa Rica', 'Cộng hoà Costa Rica', 1, 1),
	(54, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CI', 'Bờ Biển Ngà', 'Bờ Biển Ngà', 1, 1),
	(55, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'HR', 'Crô-a-ti-a', 'Crô-a-ti-a', 1, 1),
	(56, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CU', 'Cu Ba', 'Cu Ba', 1, 1),
	(57, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CY', 'Cộng hòa Síp', 'Cộng hòa Síp', 1, 1),
	(58, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'CZ', 'Cộng hòa Séc', 'Cộng hòa Séc', 1, 1),
	(59, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'DK', 'Đan Mạch', 'Đan Mạch', 1, 1),
	(60, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'DJ', 'Ả Rập', 'Ả Rập', 1, 1),
	(61, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'DM', 'Thịnh vượng chung Dominica', 'Thịnh vượng chung Dominica', 1, 1),
	(62, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'DO', 'Cộng hòa Đô-mi-ni-ca-na', 'Cộng hòa Đô-mi-ni-ca-na', 1, 1),
	(63, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'EC', 'Cộng hòa Ê-cu-a-đo', 'Cộng hòa Ê-cu-a-đo', 1, 1),
	(64, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'EG', 'Ai Cập', 'Ai Cập', 1, 1),
	(65, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'SV', 'Cộng hòa En Xan-va-đo', 'Cộng hòa En Xan-va-đo', 1, 1),
	(66, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GQ', 'Ghi-nê Xích Đạo', 'Ghi-nê Xích Đạo', 1, 1),
	(67, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ER', 'Ê-ri-tơ-rê-a', 'Ê-ri-tơ-rê-a', 1, 1),
	(68, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'EE', 'E-xtô-ni-a', 'E-xtô-ni-a', 1, 1),
	(69, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ET', 'Ê-ti-ô-pi-a', 'Ê-ti-ô-pi-a', 1, 1),
	(70, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'FK', 'Quần đảo Falkland', 'Quần đảo Falkland', 1, 1),
	(71, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'FO', 'Quần đảo Faroe', 'Quần đảo Faroe', 1, 1),
	(72, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'FJ', 'Cộng hòa Quần đảo Phi-gi', 'Cộng hòa Quần đảo Phi-gi', 1, 1),
	(73, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'FI', 'Phần Lan', 'Phần Lan', 1, 1),
	(74, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'FR', 'Pháp', 'Pháp', 1, 1),
	(75, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GF', 'Guyane thuộc Pháp', 'Guyane thuộc Pháp', 1, 1),
	(76, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'PF', 'Polynesia thuộc Pháp', 'Polynesia thuộc Pháp', 1, 1),
	(77, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'TF', 'Vùng đất phía nam thuộc Pháp', 'Vùng đất phía nam thuộc Pháp', 1, 1),
	(78, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GA', 'Cộng hòa Ga-bông', 'Cộng hòa Ga-bông', 1, 1),
	(79, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GM', 'Cộng hòa Găm-bi-a', 'Cộng hòa Găm-bi-a', 1, 1),
	(80, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GE', 'Georgia, Hoa Kỳ', 'Georgia, Hoa Kỳ', 1, 1),
	(81, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'DE', 'Đức', 'Đức', 1, 1),
	(82, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GH', 'Ga-na', 'Ga-na', 1, 1),
	(83, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GI', 'Gibraltar', 'Gibraltar', 1, 1),
	(84, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GR', 'Hy Lạp', 'Hy Lạp', 1, 1),
	(85, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GL', 'Greenland', 'Greenland', 1, 1),
	(86, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GD', 'Grê-na-đa', 'Grê-na-đa', 1, 1),
	(87, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GP', 'Goa-đê-lốp', 'Goa-đê-lốp', 1, 1),
	(88, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GU', 'Lãnh thổ Guam', 'Lãnh thổ Guam', 1, 1),
	(89, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GT', 'Cộng hoà Guatemala', 'Cộng hoà Guatemala', 1, 1),
	(90, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GN', 'Cộng hòa Ghi-nê', 'Cộng hòa Ghi-nê', 1, 1),
	(91, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GW', 'Ghi-nê Bít-xao', 'Ghi-nê Bít-xao', 1, 1),
	(92, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'GY', 'Guy-a-na', 'Guy-a-na', 1, 1),
	(93, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'HT', 'Cộng hòa Ha-i-ti', 'Cộng hòa Ha-i-ti', 1, 1),
	(94, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'HM', 'Đảo Heard và quần đảo McDonald', 'Đảo Heard và quần đảo McDonald', 1, 1),
	(95, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'VA', 'Thành Quốc Vatican', 'Thành Quốc Vatican', 1, 1),
	(96, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'HN', 'Cộng hoà Honduras', 'Cộng hoà Honduras', 1, 1),
	(97, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'HK', 'Hồng Kông', 'Hồng Kông', 1, 1),
	(98, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'HU', 'Hung-ga-ri', 'Hung-ga-ri', 1, 1),
	(99, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IS', 'Ai-xơ-len', 'Ai-xơ-len', 1, 1),
	(100, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IN', 'Ấn Độ', 'Ấn Độ', 1, 1),
	(101, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'ID', 'In-đô-nê-xi-a', 'In-đô-nê-xi-a', 1, 1),
	(102, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IR', 'Iran', 'Iran', 1, 1),
	(103, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IQ', 'Iraq', 'Iraq', 1, 1),
	(104, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IE', 'Ai-len', 'Ai-len', 1, 1),
	(105, b'0', '2017-04-23 15:54:07', '2017-04-23 15:54:07', 'IL', 'Israel', 'Israel', 1, 1);
/*!40000 ALTER TABLE `quoctich` ENABLE KEYS */;

-- Dumping structure for table tttp.sotiepcongdan

CREATE TABLE "IF NOT EXISTS `SOTIEPCONGDAN`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DIADIEMGAPLANHDAO`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`GHICHUXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`HOANTHANHTCDLANHDAO`" bit(1) NOT NULL,
  "`HUONGGIAIQUYETTCDLANHDAO`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`HUONGXULY`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`KETQUAGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LOAITIEPDAN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGAYHENGAPLANHDAO`" datetime DEFAULT NULL,
  "`NGAYTIEPDAN`" datetime NOT NULL,
  "`NOIDUNGBOSUNG`" longtext COLLATE utf8_vietnamese_ci,
  "`NOIDUNGTIEPCONGDAN`" longtext COLLATE utf8_vietnamese_ci,
  "`SOTHUTULUOTTIEP`" int(11) NOT NULL,
  "`THOIHAN`" datetime DEFAULT NULL,
  "`TRANGTHAIKETQUA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`YKIENXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CANBOTIEPDAN_ID`" bigint(20) NOT NULL,
  "`DON_ID`" bigint(20) NOT NULL,
  "`DONVICHUTRI_ID`" bigint(20) DEFAULT NULL,
  "`DONVITIEPDAN_ID`" bigint(20) NOT NULL,
  "`PHONGBANGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`HOANTHANHTCDTHUONGXUYEN`" bit(1) NOT NULL,
  "`TRINHTRANGXULYTCDLANHDAO`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)







) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.sotiepcongdan: 13 rows
/*!40000 ALTER TABLE `sotiepcongdan` DISABLE KEYS */;
INSERT INTO `sotiepcongdan` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `diaDiemGapLanhDao`, `ghiChuXuLy`, `hoanThanhTCDLanhDao`, `huongGiaiQuyetTCDLanhDao`, `huongXuLy`, `ketQuaGiaiQuyet`, `loaiTiepDan`, `ngayHenGapLanhDao`, `ngayTiepDan`, `noiDungBoSung`, `noiDungTiepCongDan`, `soThuTuLuotTiep`, `thoiHan`, `trangThaiKetQua`, `yKienXuLy`, `nguoiSua_id`, `nguoiTao_id`, `canBoTiepDan_id`, `don_id`, `donViChuTri_id`, `donViTiepDan_id`, `phongBanGiaiQuyet_id`, `hoanThanhTCDThuongXuyen`, `trinhTrangXuLyTCDLanhDao`) VALUES
	(35, b'0', '2017-06-13 18:05:50', '2017-05-17 09:45:37', '', '', b'0', NULL, 'TU_CHOI', '', 'THUONG_XUYEN', NULL, '2017-05-17 09:39:35', ' ', 'Chưa có thông tin hồ sơ tài liệu bằng chứng', 1, NULL, '', '', 3, 1, 3, 18, NULL, 90, NULL, b'0', NULL),
	(36, b'0', '2017-06-13 18:05:07', '2017-05-17 10:05:05', '', '', b'0', NULL, 'BO_SUNG_THONG_TIN', '', 'THUONG_XUYEN', NULL, '2017-05-17 09:48:57', ' ', 'Bổ sung thông tin đơn thư', 1, NULL, '', '', 3, 1, 3, 19, NULL, 90, NULL, b'0', NULL),
	(37, b'0', '2017-06-13 17:57:09', '2017-05-17 10:14:19', '', '', b'0', NULL, 'TIEP_NHAN_DON', '', 'THUONG_XUYEN', NULL, '2017-05-17 10:06:27', ' ', 'Tiếp nhận đơn này.', 1, NULL, '', '', 3, 1, 3, 20, NULL, 90, NULL, b'0', NULL),
	(38, b'0', '2017-06-13 17:56:52', '2017-05-17 10:40:57', '', '', b'0', NULL, 'TRA_DON_VA_HUONG_DAN', '', 'THUONG_XUYEN', NULL, '2017-05-17 10:37:16', ' ', 'Đến cơ quan đúng thẩm quyền để trình đơn.\nSở Tài Nguyên Môi Trường', 1, NULL, '', '', 3, 1, 3, 21, NULL, 90, NULL, b'0', NULL),
	(39, b'0', '2017-06-13 17:55:55', '2017-05-17 11:13:00', '', '', b'0', NULL, 'YEU_CAU_GAP_LANH_DAO', '', 'THUONG_XUYEN', NULL, '2017-05-17 11:06:40', ' ', ' ', 1, NULL, '', '', 3, 1, 3, 22, NULL, 90, NULL, b'0', NULL),
	(40, b'0', '2017-06-13 17:55:09', '2017-05-17 11:23:07', '', '', b'0', NULL, 'YEU_CAU_GAP_LANH_DAO', '', 'THUONG_XUYEN', NULL, '2017-05-17 11:14:02', ' ', ' ', 1, NULL, '', '', 3, 1, 3, 23, NULL, 90, NULL, b'0', NULL),
	(41, b'0', '2017-06-13 17:54:12', '2017-05-17 11:36:30', '', '', b'0', NULL, 'YEU_CAU_GAP_LANH_DAO', '', 'THUONG_XUYEN', NULL, '2017-05-17 11:23:16', ' ', ' ', 1, NULL, '', '', 3, 1, 3, 24, NULL, 90, NULL, b'0', NULL),
	(42, b'0', '2017-06-13 18:06:26', '2017-05-17 12:34:41', '', '', b'0', 'GIAI_QUYET_NGAY', 'KHOI_TAO', ' ', 'DINH_KY', NULL, '2017-05-17 05:33:58', ' ', ' ', 0, NULL, '', '', 3, 1, 11, 22, NULL, 2, NULL, b'0', NULL),
	(43, b'0', '2017-06-13 18:06:12', '2017-05-17 12:34:41', '', '', b'0', 'CHO_GIAI_QUYET', 'KHOI_TAO', ' ', 'DINH_KY', NULL, '2017-05-17 05:33:58', ' ', ' ', 0, NULL, '', '', 3, 1, 11, 23, 86, 2, NULL, b'0', NULL),
	(44, b'0', '2017-06-13 18:07:45', '2017-05-17 12:40:20', '', '', b'0', 'GIAI_QUYET_NGAY', 'KHOI_TAO', '', 'DOT_XUAT', NULL, '2017-05-17 12:37:12', ' ', ' ', 0, NULL, '', '', 3, 1, 9, 25, NULL, 2, NULL, b'0', NULL),
	(45, b'0', '2017-06-13 18:07:32', '2017-05-17 12:48:49', '', '', b'0', 'GIAI_QUYET_NGAY', 'KHOI_TAO', '', 'DOT_XUAT', NULL, '2017-05-17 12:40:53', ' ', ' ', 0, NULL, '', '', 3, 1, 9, 26, NULL, 2, NULL, b'0', NULL),
	(46, b'0', '2017-06-13 18:07:14', '2017-05-17 13:01:05', '', '', b'0', 'GIAI_QUYET_NGAY', 'KHOI_TAO', '', 'DOT_XUAT', NULL, '2017-05-17 12:57:33', ' ', ' ', 0, NULL, '', '', 3, 1, 10, 27, NULL, 2, NULL, b'0', NULL),
	(47, b'0', '2017-06-13 18:06:56', '2017-05-17 14:03:24', '', '', b'0', 'CHO_GIAI_QUYET', 'KHOI_TAO', '', 'DOT_XUAT', NULL, '2017-05-17 13:59:59', ' ', ' ', 0, NULL, '', '', 3, 1, 10, 28, 5, 2, NULL, b'0', NULL);
/*!40000 ALTER TABLE `sotiepcongdan` ENABLE KEYS */;

-- Dumping structure for table tttp.sotiepcongdan_has_donviphoihop

CREATE TABLE "IF NOT EXISTS `SOTIEPCONGDAN_HAS_DONVIPHOIHOP`" (
  "`SOTIEPCONGDAN_ID`" bigint(20) NOT NULL,
  "`COQUANQUANLY_ID`" bigint(20) NOT NULL


) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.sotiepcongdan_has_donviphoihop: 2 rows
/*!40000 ALTER TABLE `sotiepcongdan_has_donviphoihop` DISABLE KEYS */;
/*!40000 ALTER TABLE `sotiepcongdan_has_donviphoihop` ENABLE KEYS */;

-- Dumping structure for table tttp.tailieubangchung

CREATE TABLE "IF NOT EXISTS `TAILIEUBANGCHUNG`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DUONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SOTRANG`" int(11) NOT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`TENFILE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TINHTRANGTAILIEU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) NOT NULL,
  "`LOAITAILIEU_ID`" bigint(20) DEFAULT NULL,
  "`SOTIEPCONGDAN_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)





) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.tailieubangchung: 0 rows
/*!40000 ALTER TABLE `tailieubangchung` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailieubangchung` ENABLE KEYS */;

-- Dumping structure for table tttp.tailieudinhkemdinhchi

CREATE TABLE "IF NOT EXISTS `TAILIEUDINHKEMDINHCHI`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DUONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TENFILE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.tailieudinhkemdinhchi: 0 rows
/*!40000 ALTER TABLE `tailieudinhkemdinhchi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailieudinhkemdinhchi` ENABLE KEYS */;

-- Dumping structure for table tttp.tailieuvanthu

CREATE TABLE "IF NOT EXISTS `TAILIEUVANTHU`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DUONGDAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LOAITEPDINHKEM`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGAYQUYETDINH`" datetime DEFAULT NULL,
  "`SOQUYETDINH`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`TENFILE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) NOT NULL,
  "`SOTIEPCONGDAN_ID`" bigint(20) DEFAULT NULL,
  "`BUOCGIAIQUYET`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`LOAIQUYTRINH`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)




) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.tailieuvanthu: 0 rows
/*!40000 ALTER TABLE `tailieuvanthu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailieuvanthu` ENABLE KEYS */;

-- Dumping structure for table tttp.tepdinhkem

CREATE TABLE "IF NOT EXISTS `TEPDINHKEM`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`LOAIFILEDINHKEM`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TENFILE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`URLFILE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.tepdinhkem: 0 rows
/*!40000 ALTER TABLE `tepdinhkem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tepdinhkem` ENABLE KEYS */;

-- Dumping structure for table tttp.thamquyengiaiquyet

CREATE TABLE "IF NOT EXISTS `THAMQUYENGIAIQUYET`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.thamquyengiaiquyet: 7 rows
/*!40000 ALTER TABLE `thamquyengiaiquyet` DISABLE KEYS */;
INSERT INTO `thamquyengiaiquyet` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-04-27 09:36:37', '2017-04-27 09:36:37', 'Hành chính', 'Hành chính', 1, 1),
	(2, b'0', '2017-04-27 09:36:43', '2017-04-27 09:36:43', 'Tư pháp', 'Tư pháp', 1, 1),
	(3, b'0', '2017-05-03 14:25:00', '2017-05-03 14:25:00', 'Cơ quan Đảng', 'Cơ quan Đảng', 1, 1),
	(4, b'0', '2017-05-03 14:25:52', '2017-05-03 14:25:52', 'Cơ quan dân cử', 'Cơ quan dân cử', 1, 1),
	(5, b'0', '2017-05-03 15:45:04', '2017-05-03 14:29:18', 'Đơn vị sự nghiệp công lập', 'Đơn vị sự nghiệp công lập', 1, 1),
	(6, b'0', '2017-05-03 15:37:56', '2017-05-03 14:31:54', 'Doanh nghiệp nhà nước', 'Doanh nghiệp nhà nước', 1, 1),
	(7, b'0', '2017-05-24 16:08:50', '2017-05-03 15:05:07', 'Khác', 'Khác', 1, 1);
/*!40000 ALTER TABLE `thamquyengiaiquyet` ENABLE KEYS */;

-- Dumping structure for table tttp.thamso

CREATE TABLE "IF NOT EXISTS `THAMSO`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`GIATRI`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.thamso: 30 rows
/*!40000 ALTER TABLE `thamso` DISABLE KEYS */;
INSERT INTO `thamso` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `giaTri`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-04-23 11:09:41', '2017-04-23 11:09:42', '1', 'CDVHC_TINH', 'CDVHC_TINH', 1, 1),
	(2, b'0', '2017-05-03 15:27:16', '2017-04-23 11:09:42', '4', 'CDVHC_THANH_PHO_TRUC_THUOC_TW', 'CDVHC_THANH_PHO_TRUC_THUOC_TW', 1, 1),
	(3, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '9', 'CDVHC_THANH_PHO-TRUC_THUOC_TINH', 'CDVHC_THANH_PHO-TRUC_THUOC_TINH', 1, 1),
	(4, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '5', 'CDVHC_QUAN', 'CDVHC_QUAN', 1, 1),
	(5, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '2', 'CDVHC_HUYEN', 'CDVHC_HUYEN', 1, 1),
	(6, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '6', 'CDVHC_PHUONG', 'CDVHC_PHUONG', 1, 1),
	(7, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '3', 'CDVHC_XA', 'CDVHC_XA', 1, 1),
	(8, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '7', 'CDVHC_THI_TRAN', 'CDVHC_THI_TRAN', 1, 1),
	(9, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '8', 'CDVHC_THI_XA', 'CDVHC_THI_XA', 1, 1),
	(10, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '5', 'CCQQL_SO_BAN_NGANH', 'CCQQL_SO_BAN_NGANH', 1, 1),
	(11, b'0', '2017-05-03 15:29:44', '2017-04-23 11:09:42', '2', 'LCCQQL_BO_CONG_AN', 'LCCQQL_BO_CONG_AN', 1, 1),
	(12, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '6', 'CCQQL_PHONG_BAN', 'CCQQL_PHONG_BAN', 1, 1),
	(13, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '1', 'CQQL_UBNDTP_DA_NANG', 'CQQL_UBNDTP_DA_NANG', 1, 1),
	(14, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '9', 'DVHC_TP_DA_NANG', 'DVHC_TP_DA_NANG', 1, 1),
	(15, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '1', 'CCQQL_CAP_CHINH_PHU', 'CCQQL_CAP_CHINH_PHU', 1, 1),
	(16, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '2', 'CCQQL_UBND_TINH_TP', 'CCQQL_UBND_TINH_TP', 1, 1),
	(17, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '3', 'CCQQL_UBND_QUAN_HUYEN', 'CCQQL_UBND_QUAN_HUYEN', 1, 1),
	(18, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '4', 'CCQQL_UBND_PHUONG_XA_THI_TRAN', 'CCQQL_UBND_PHUONG_XA_THI_TRAN', 1, 1),
	(19, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '7', 'CCQQL_CHI_CUC', 'CCQQL_CHI_CUC', 1, 1),
	(20, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '8', 'CCQQL_CAP_BO_NGANH', 'CCQQL_CAP_BO_NGANH', 1, 1),
	(21, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '9', 'CCQQL_TONG_CUC', 'CCQQL_TONG_CUC', 1, 1),
	(22, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '10', 'CCQQL_CUC', 'CCQQL_CUC', 1, 1),
	(23, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '11', 'CCQQL_VU', 'CCQQL_VU', 1, 1),
	(24, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '12', 'CCQQL_TRUNG_TAM', 'CCQQL_TRUNG_TAM', 1, 1),
	(25, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '13', 'CCQQL_CUC_THUOC_TONG_CUC', 'CCQQL_CUC_THUOC_TONG_CUC', 1, 1),
	(26, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '14', 'CCQQL_VU_THUOC_TONG_VU', 'CCQQL_VU_THUOC_TONG_VU', 1, 1),
	(27, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '15', 'CCQQL_TRUNG_TAM_THUOC_TONG_CUC', 'CCQQL_TRUNG_TAM_THUOC_TONG_CUC', 1, 1),
	(28, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '16', 'CCQQL_CO_QUAN_HANH_CHINH_SU_NGHIEP', 'CCQQL_CO_QUAN_HANH_CHINH_SU_NGHIEP', 1, 1),
	(29, b'0', '2017-05-03 15:29:44', '2017-04-23 11:09:42', '1', 'LCCQQL_SO_Y_TE', 'LCCQQL_SO_Y_TE', 1, 1),
	(30, b'0', '2017-04-23 11:09:42', '2017-04-23 11:09:42', '2', 'CQQL_THANH_TRA_THANH_PHO', 'CQQL_THANH_TRA_THANH_PHO', 1, 1);
/*!40000 ALTER TABLE `thamso` ENABLE KEYS */;

-- Dumping structure for table tttp.thongtingiaiquyetdon

CREATE TABLE "IF NOT EXISTS `THONGTINGIAIQUYETDON`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`DARAQUYETDINHGIAIQUYET`" bit(1) NOT NULL,
  "`DATHAMTRAXACMINHVUVIEC`" bit(1) NOT NULL,
  "`DATHULY`" bit(1) NOT NULL,
  "`DATDATHUNHANUOC`" bigint(20) NOT NULL,
  "`DATDATRACONGDAN`" bigint(20) NOT NULL,
  "`DATPHAITHUNHANUOC`" bigint(20) NOT NULL,
  "`DATPHAITRACONGDAN`" bigint(20) NOT NULL,
  "`DIADIEMDOITHOAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DOITHOAI`" bit(1) NOT NULL,
  "`GIAHANGIAIQUYET`" bit(1) NOT NULL,
  "`GIAOCOQUANDIEUTRA`" bit(1) NOT NULL,
  "`HINHTHUCTHEODOI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`KETLUANNOIDUNGKHIEUNAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`KETQUATHUCHIENTHEODOI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`KHOITO`" bit(1) NOT NULL,
  "`LAPTODOANXACMINH`" bit(1) NOT NULL,
  "`NGAYBAOCAOKETQUATTXM`" datetime DEFAULT NULL,
  "`QUYETDINHGIAIQUYETKHIEUNAI`" bit(1) NOT NULL,
  "`SODOITUONGBIKHOITO`" int(11) NOT NULL,
  "`SONGUOIDABIXULYHANHCHINH`" int(11) NOT NULL,
  "`SOQUYETDINHGIAHAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SOQUYETDINHTHANHLAPDTXM`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`THEODOITHUCHIEN`" bit(1) NOT NULL,
  "`THOIGIANDOITHOAI`" datetime DEFAULT NULL,
  "`TIENDATHUNHANUOC`" bigint(20) NOT NULL,
  "`TIENDATRACONGDAN`" bigint(20) NOT NULL,
  "`TIENPHAITHUNHANUOC`" bigint(20) NOT NULL,
  "`TIENPHAITRACONGDAN`" bigint(20) NOT NULL,
  "`TONGSONGUOIXULYHANHCHINH`" int(11) NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CANBOGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`CANBOTHAMTRAXACMINH_ID`" bigint(20) DEFAULT NULL,
  "`COQUANDIEUTRA_ID`" bigint(20) DEFAULT NULL,
  "`COQUANTHEODOI_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) DEFAULT NULL,
  "`DONVITHAMTRAXACMINH_ID`" bigint(20) DEFAULT NULL,
  "`TRUONGDOANTTXM_ID`" bigint(20) DEFAULT NULL,
  "`LYDOGIAHAN`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGAYBATDAUGIAIQUYET`" datetime DEFAULT NULL,
  "`NGAYBATDAUTTXM`" datetime DEFAULT NULL,
  "`NGAYHETHANGIAIQUYET`" datetime DEFAULT NULL,
  "`NGAYHETHANSAUKHIGIAHANTTXM`" datetime DEFAULT NULL,
  "`NGAYHETHANTTXM`" datetime DEFAULT NULL,
  "`NGAYRAQUYETDINHGIAHANTTXM`" datetime DEFAULT NULL,
  "`NGAYKETTHUCGIAIQUYET`" datetime DEFAULT NULL,
  "`NGAYKETTHUCTTXM`" datetime DEFAULT NULL,
  "`NOIDUNG`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SODOITUONGGIAOCOQUANDIEUTRA`" int(11) NOT NULL,
  "`SOVUBIKHOITO`" int(11) NOT NULL,
  "`SOVUGIAOCOQUANDIEUTRA`" int(11) NOT NULL,
  PRIMARY KEY (`id`)









) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.thongtingiaiquyetdon: 0 rows
/*!40000 ALTER TABLE `thongtingiaiquyetdon` DISABLE KEYS */;
/*!40000 ALTER TABLE `thongtingiaiquyetdon` ENABLE KEYS */;

-- Dumping structure for table tttp.todanpho

CREATE TABLE "IF NOT EXISTS `TODANPHO`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`MOTA`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`DONVIHANHCHINH_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)



) ENGINE=MyISAM AUTO_INCREMENT=526 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.todanpho: 500 rows
/*!40000 ALTER TABLE `todanpho` DISABLE KEYS */;
INSERT INTO `todanpho` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `moTa`, `ten`, `nguoiSua_id`, `nguoiTao_id`, `donViHanhChinh_id`) VALUES
	(1, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 23),
	(2, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 23),
	(3, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 25),
	(4, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 32),
	(5, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 23),
	(6, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 23),
	(7, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 23),
	(8, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 23),
	(9, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 23),
	(10, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 23),
	(11, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 23),
	(12, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 23),
	(13, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 22),
	(14, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 22),
	(15, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 22),
	(49, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 25),
	(48, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 25),
	(57, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 26),
	(19, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 22),
	(20, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 22),
	(21, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 22),
	(22, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 22),
	(23, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 22),
	(24, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 22),
	(25, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 22),
	(50, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 25),
	(51, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 25),
	(52, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 25),
	(53, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 25),
	(54, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 25),
	(55, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 25),
	(36, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 24),
	(37, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 24),
	(38, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 24),
	(39, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 24),
	(40, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 24),
	(41, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 24),
	(42, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 24),
	(43, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 24),
	(44, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 24),
	(45, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 24),
	(56, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 25),
	(58, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 26),
	(59, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 26),
	(60, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 26),
	(61, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 26),
	(62, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 26),
	(63, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 26),
	(64, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 26),
	(65, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 26),
	(66, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 26),
	(67, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 27),
	(68, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 27),
	(69, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 27),
	(70, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 27),
	(71, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 27),
	(72, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 27),
	(73, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 27),
	(74, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 27),
	(75, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 27),
	(76, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 27),
	(77, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 28),
	(78, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 28),
	(79, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 28),
	(80, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 28),
	(81, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 28),
	(82, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 28),
	(83, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 28),
	(84, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 28),
	(85, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 28),
	(86, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 28),
	(87, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 29),
	(88, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 29),
	(89, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 29),
	(90, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 29),
	(91, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 29),
	(92, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 29),
	(93, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 29),
	(94, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 29),
	(95, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 29),
	(96, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 29),
	(97, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 30),
	(98, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 30),
	(99, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 30),
	(100, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 30),
	(101, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 30),
	(102, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 30),
	(103, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 30),
	(104, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 30),
	(105, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 30),
	(106, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 30),
	(107, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 31),
	(108, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 31),
	(109, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 31),
	(110, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 31),
	(111, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 31),
	(112, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 31),
	(113, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 31),
	(114, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 31),
	(115, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 31),
	(116, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 31),
	(117, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 32),
	(118, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 32),
	(119, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 32),
	(120, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 32),
	(121, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 32),
	(122, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 32),
	(123, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 32),
	(124, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 32),
	(125, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 32),
	(126, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 33),
	(127, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 33),
	(128, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 33),
	(129, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 33),
	(130, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 33),
	(131, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 33),
	(132, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 33),
	(133, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 33),
	(134, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 33),
	(135, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 33),
	(136, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 34),
	(137, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 34),
	(138, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 34),
	(139, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 34),
	(140, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 34),
	(141, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 34),
	(142, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 34),
	(143, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 34),
	(144, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 34),
	(145, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 34),
	(146, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 35),
	(147, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 35),
	(148, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 35),
	(149, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 35),
	(150, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 35),
	(151, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 35),
	(152, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 35),
	(153, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 35),
	(154, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 35),
	(155, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 35),
	(156, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 36),
	(157, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 36),
	(158, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 36),
	(159, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 36),
	(160, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 36),
	(161, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 36),
	(162, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 36),
	(163, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 36),
	(164, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 36),
	(165, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 36),
	(166, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 37),
	(167, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 37),
	(168, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 37),
	(169, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 37),
	(170, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 37),
	(171, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 37),
	(172, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 37),
	(173, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 37),
	(174, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 37),
	(175, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 37),
	(176, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 38),
	(177, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 38),
	(178, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 38),
	(179, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 38),
	(180, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 38),
	(181, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 38),
	(182, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 38),
	(183, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 38),
	(184, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 38),
	(185, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 38),
	(186, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 39),
	(187, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 39),
	(188, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 39),
	(189, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 39),
	(190, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 39),
	(191, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 39),
	(192, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 39),
	(193, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 39),
	(194, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 39),
	(195, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 39),
	(196, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 40),
	(197, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 40),
	(198, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 40),
	(199, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 40),
	(200, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 40),
	(201, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 40),
	(202, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 40),
	(203, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 40),
	(204, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 40),
	(205, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 40),
	(206, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 41),
	(207, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 41),
	(208, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 41),
	(209, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 41),
	(210, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 41),
	(211, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 41),
	(212, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 41),
	(213, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 41),
	(214, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 41),
	(215, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 41),
	(216, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 42),
	(217, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 42),
	(218, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 42),
	(219, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 42),
	(220, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 42),
	(221, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 42),
	(222, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 42),
	(223, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 42),
	(224, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 42),
	(225, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 42),
	(226, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 43),
	(227, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 43),
	(228, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 43),
	(229, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 43),
	(230, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 43),
	(231, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 43),
	(232, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 43),
	(233, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 43),
	(234, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 43),
	(235, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 43),
	(236, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 44),
	(237, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 44),
	(238, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 44),
	(239, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 44),
	(240, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 44),
	(241, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 44),
	(242, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 44),
	(243, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 44),
	(244, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 44),
	(245, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 44),
	(246, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 45),
	(247, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 45),
	(248, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 45),
	(249, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 45),
	(250, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 45),
	(251, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 45),
	(252, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 45),
	(253, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 45),
	(254, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 45),
	(255, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 45),
	(256, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 46),
	(257, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 46),
	(258, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 46),
	(259, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 46),
	(260, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 46),
	(261, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 46),
	(262, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 46),
	(263, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 46),
	(264, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 46),
	(265, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 46),
	(266, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 47),
	(267, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 47),
	(268, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 47),
	(269, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 47),
	(270, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 47),
	(271, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 47),
	(272, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 47),
	(273, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 47),
	(274, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 47),
	(275, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 47),
	(276, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 48),
	(277, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 48),
	(278, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 48),
	(279, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 48),
	(280, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 48),
	(281, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 48),
	(282, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 48),
	(283, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 48),
	(284, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 48),
	(285, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 48),
	(286, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 49),
	(287, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 49),
	(288, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 49),
	(289, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 49),
	(290, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 49),
	(291, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 49),
	(292, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 49),
	(293, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 49),
	(294, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 49),
	(295, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 49),
	(296, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 50),
	(297, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 50),
	(298, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 50),
	(299, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 50),
	(300, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 50),
	(301, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 50),
	(302, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 50),
	(303, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 50),
	(304, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 50),
	(305, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 50),
	(306, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 51),
	(307, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 51),
	(308, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 51),
	(309, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 51),
	(310, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 51),
	(311, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 51),
	(312, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 51),
	(313, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 51),
	(314, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 51),
	(315, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 51),
	(316, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 52),
	(317, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 52),
	(318, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 52),
	(319, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 52),
	(320, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 52),
	(321, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 52),
	(322, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 52),
	(323, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 52),
	(324, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 52),
	(325, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 52),
	(326, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 53),
	(327, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 53),
	(328, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 53),
	(329, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 53),
	(330, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 53),
	(331, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 53),
	(332, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 53),
	(333, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 53),
	(334, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 53),
	(335, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 53),
	(336, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 54),
	(337, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 54),
	(338, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 54),
	(339, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 54),
	(340, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 54),
	(341, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 54),
	(342, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 54),
	(343, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 54),
	(344, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 54),
	(345, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 54),
	(346, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 55),
	(347, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 55),
	(348, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 55),
	(349, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 55),
	(350, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 55),
	(351, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 55),
	(352, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 55),
	(353, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 55),
	(354, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 55),
	(355, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 55),
	(356, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 56),
	(357, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 56),
	(358, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 56),
	(359, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 56),
	(360, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 56),
	(361, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 56),
	(362, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 56),
	(363, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 56),
	(364, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 56),
	(365, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 56),
	(366, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 57),
	(367, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 57),
	(368, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 57),
	(369, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 57),
	(370, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 57),
	(371, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 57),
	(372, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 57),
	(373, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 57),
	(374, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 57),
	(375, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 57),
	(376, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 58),
	(377, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 58),
	(378, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 58),
	(379, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 58),
	(380, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 58),
	(381, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 58),
	(382, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 58),
	(383, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 58),
	(384, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 58),
	(385, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 58),
	(386, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 59),
	(387, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 59),
	(388, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 59),
	(389, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 59),
	(390, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 59),
	(391, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 59),
	(392, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 59),
	(393, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 59),
	(394, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 59),
	(395, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 59),
	(396, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 60),
	(397, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 60),
	(398, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 60),
	(399, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 60),
	(400, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 60),
	(401, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 60),
	(402, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 60),
	(403, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 60),
	(404, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 60),
	(405, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 60),
	(406, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 61),
	(407, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 61),
	(408, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 61),
	(409, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 61),
	(410, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 61),
	(411, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 61),
	(412, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 61),
	(413, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 61),
	(414, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 61),
	(415, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 61),
	(416, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 62),
	(417, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 62),
	(418, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 62),
	(419, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 62),
	(420, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 62),
	(421, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 62),
	(422, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 62),
	(423, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 62),
	(424, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 62),
	(425, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 62),
	(426, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 63),
	(427, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 63),
	(428, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 63),
	(429, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 63),
	(430, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 63),
	(431, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 63),
	(432, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 63),
	(433, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 63),
	(434, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 63),
	(435, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 63),
	(436, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 64),
	(437, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 64),
	(438, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 64),
	(439, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 64),
	(440, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 64),
	(441, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 64),
	(442, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 64),
	(443, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 64),
	(444, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 64),
	(445, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 64),
	(446, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 65),
	(447, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 65),
	(448, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 65),
	(449, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 65),
	(450, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 65),
	(451, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 65),
	(452, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 65),
	(453, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 65),
	(454, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 65),
	(455, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 65),
	(456, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 66),
	(457, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 66),
	(458, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 66),
	(459, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 66),
	(460, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 66),
	(461, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 66),
	(462, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 66),
	(463, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 66),
	(464, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 66),
	(465, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 66),
	(466, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 67),
	(467, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 67),
	(468, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 67),
	(469, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 67),
	(470, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 67),
	(471, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 67),
	(472, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 67),
	(473, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 67),
	(474, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 67),
	(475, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 67),
	(476, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 68),
	(477, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 68),
	(478, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 68),
	(479, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 68),
	(480, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 68),
	(481, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 68),
	(482, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 68),
	(483, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 68),
	(484, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 68),
	(485, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 68),
	(486, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 69),
	(487, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 69),
	(488, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 69),
	(489, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 69),
	(490, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 69),
	(491, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 69),
	(492, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 69),
	(493, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 69),
	(494, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 69),
	(495, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 69),
	(496, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 70),
	(497, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 70),
	(498, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 70),
	(499, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 70),
	(500, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 70),
	(501, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 70),
	(502, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 70),
	(503, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 70),
	(504, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 70),
	(505, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 70),
	(506, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 01', 'Tổ 01', 1, 1, 71),
	(507, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 02', 'Tổ 02', 1, 1, 71),
	(508, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 03', 'Tổ 03', 1, 1, 71),
	(509, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 04', 'Tổ 04', 1, 1, 71),
	(510, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 05', 'Tổ 05', 1, 1, 71),
	(511, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 06', 'Tổ 06', 1, 1, 71),
	(512, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 07', 'Tổ 07', 1, 1, 71),
	(513, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 08', 'Tổ 08', 1, 1, 71),
	(514, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 09', 'Tổ 09', 1, 1, 71),
	(515, b'0', '2017-04-25 09:16:05', '2017-04-25 09:16:05', 'Tổ 10', 'Tổ 10', 1, 1, 71);
/*!40000 ALTER TABLE `todanpho` ENABLE KEYS */;

-- Dumping structure for table tttp.vaitro

CREATE TABLE "IF NOT EXISTS `VAITRO`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`LOAIVAITRO`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.vaitro: 4 rows
/*!40000 ALTER TABLE `vaitro` DISABLE KEYS */;
INSERT INTO `vaitro` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `loaiVaiTro`, `ten`, `nguoiSua_id`, `nguoiTao_id`) VALUES
	(1, b'0', '2017-06-11 10:46:48', '2017-04-25 15:36:45', 'LANH_DAO', 'Lãnh đạo', 1, 1),
	(2, b'0', '2017-06-11 13:05:42', '2017-05-10 14:48:29', 'TRUONG_PHONG', 'Trưởng Phòng', 1, 1),
	(3, b'0', '2017-06-11 13:06:07', '2017-05-10 14:48:46', 'CHUYEN_VIEN', 'Chuyên viên', 1, 1),
	(4, b'0', '2017-06-11 13:06:01', '2017-05-10 14:48:55', 'VAN_THU', 'Chuyên viên nhập liệu', 1, 1);
/*!40000 ALTER TABLE `vaitro` ENABLE KEYS */;

-- Dumping structure for table tttp.vaitro_quyen

CREATE TABLE "IF NOT EXISTS `VAITRO_QUYEN`" (
  "`VAITRO_ID`" bigint(20) NOT NULL,
  "`QUYENS`" longtext COLLATE utf8_vietnamese_ci

) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.vaitro_quyen: 4 rows
/*!40000 ALTER TABLE `vaitro_quyen` DISABLE KEYS */;
INSERT INTO `vaitro_quyen` (`vaitro_id`, `quyens`) VALUES
	(1, 'thamquyengiaiquyet:lietke,thamquyengiaiquyet:xem,thamquyengiaiquyet:them,thamquyengiaiquyet:sua,thamquyengiaiquyet:xoa,loaitailieu:lietke,loaitailieu:xem,loaitailieu:them,loaitailieu:sua,loaitailieu:xoa,chucvu:lietke,chucvu:xem,chucvu:them,chucvu:sua,chucvu:xoa,quoctich:lietke,quoctich:xem,quoctich:them,quoctich:sua,quoctich:xoa,capdonvihanhchinh:lietke,capdonvihanhchinh:xem,capdonvihanhchinh:them,capdonvihanhchinh:sua,capdonvihanhchinh:xoa,donvihanhchinh:lietke,donvihanhchinh:xem,donvihanhchinh:them,donvihanhchinh:sua,donvihanhchinh:xoa,loaicoquanquanly:lietke,loaicoquanquanly:xem,loaicoquanquanly:them,loaicoquanquanly:sua,loaicoquanquanly:xoa,capcoquanquanly:lietke,capcoquanquanly:xem,capcoquanquanly:them,capcoquanquanly:sua,capcoquanquanly:xoa,coquanquanly:lietke,coquanquanly:xem,coquanquanly:them,coquanquanly:sua,coquanquanly:xoa,todanpho:lietke,todanpho:xem,todanpho:them,todanpho:sua,todanpho:xoa,dantoc:lietke,dantoc:xem,dantoc:them,dantoc:sua,dantoc:xoa,linhvucdonthu:lietke,linhvucdonthu:xem,linhvucdonthu:them,linhvucdonthu:sua,linhvucdonthu:xoa,congchuc:lietke,congchuc:xem,congchuc:them,congchuc:sua,congchuc:xoa,congdan:lietke,congdan:xem,congdan:them,congdan:sua,congdan:xoa,vaitro:lietke,vaitro:xem,vaitro:them,vaitro:sua,vaitro:xoa,thoihan:lietke,thoihan:xem,thoihan:them,thoihan:sua,thoihan:xoa,thamso:lietke,thamso:xem,thamso:them,thamso:sua,thamso:xoa,sotiepcongdan:lietke,sotiepcongdan:xem,sotiepcongdan:sua,sotiepcongdan:them,sotiepcongdan:xoa,xulydon:lietke,xulydon:xem,xulydon:them,xulydon:sua,xulydon:xoa,giaiquyetdon:lietke,giaiquyetdon:xem,giaiquyetdon:them,giaiquyetdon:sua,giaiquyetdon:xoa,thanhtra:lietke,thanhtra:xem,thanhtra:them,thanhtra:sua,thanhtra:xoa,tonghopbaocao:lietke,tonghopbaocao:thongke,theodoigiamsat:lietke,theodoigiamsat:thongke,giaiquyetdon:dinhchi,xulydon:dinhchi:rutdon'),
	(2, 'xulydon:sua,xulydon:xoa,giaiquyetdon:lietke,giaiquyetdon:xem,giaiquyetdon:sua,giaiquyetdon:xoa,loaitailieu:xem,chucvu:xem,quoctich:xem,capdonvihanhchinh:xem,donvihanhchinh:xem,loaicoquanquanly:xem,capcoquanquanly:xem,coquanquanly:xem,todanpho:xem,dantoc:xem,linhvucdonthu:xem,congchuc:xem,congdan:xem,vaitro:xem,thoihan:xem,thamso:xem,sotiepcongdan:xem,xulydon:xem,thamquyengiaiquyet:xem,sotiepcongdan:lietke,sotiepcongdan:sua,sotiepcongdan:xoa,xulydon:lietke,xulydon:dinhchi:rutdon,giaiquyetdon:dinhchi'),
	(3, 'sotiepcongdan:xem,xulydon:xem,xulydon:sua,xulydon:xoa,giaiquyetdon:lietke,giaiquyetdon:xem,giaiquyetdon:sua,giaiquyetdon:xoa,thamquyengiaiquyet:xem,loaitailieu:xem,chucvu:xem,quoctich:xem,capdonvihanhchinh:xem,donvihanhchinh:xem,loaicoquanquanly:xem,capcoquanquanly:xem,coquanquanly:xem,todanpho:xem,dantoc:xem,linhvucdonthu:xem,congchuc:xem,congdan:xem,vaitro:xem,thoihan:lietke,thoihan:xem,thoihan:them,thoihan:sua,thoihan:xoa,thamso:xem,xulydon:lietke,sotiepcongdan:lietke,sotiepcongdan:them,sotiepcongdan:sua,sotiepcongdan:xoa,xulydon:dinhchi:rutdon,giaiquyetdon:dinhchi,giaiquyetdon:them,xulydon:them'),
	(4, 'xulydon:xem,xulydon:sua,xulydon:xoa,giaiquyetdon:lietke,giaiquyetdon:xem,giaiquyetdon:them,giaiquyetdon:sua,giaiquyetdon:xoa,sotiepcongdan:sua,sotiepcongdan:xoa,xulydon:lietke,giaiquyetdon:dinhchi,xulydon:dinhchi:rutdon,sotiepcongdan:lietke,thamquyengiaiquyet:xem,loaitailieu:xem,chucvu:xem,quoctich:xem,capdonvihanhchinh:xem,donvihanhchinh:xem,loaicoquanquanly:xem,capcoquanquanly:xem,coquanquanly:xem,todanpho:xem,dantoc:xem,linhvucdonthu:xem,congchuc:xem,congdan:xem,vaitro:xem,thoihan:xem,thamso:xem,sotiepcongdan:xem,xulydon:them');
/*!40000 ALTER TABLE `vaitro_quyen` ENABLE KEYS */;

-- Dumping structure for table tttp.wf_donvi_has_state

CREATE TABLE "IF NOT EXISTS `WF_DONVI_HAS_STATE`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`PROCESSTYPE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SOTHUTU`" int(11) NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`COQUANQUANLY_ID`" bigint(20) DEFAULT NULL,
  "`STATE_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)




) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.wf_donvi_has_state: 24 rows
/*!40000 ALTER TABLE `wf_donvi_has_state` DISABLE KEYS */;
INSERT INTO `wf_donvi_has_state` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `processType`, `soThuTu`, `nguoiSua_id`, `nguoiTao_id`, `coQuanQuanLy_id`, `state_id`) VALUES
	(1, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'XU_LY_DON', 1, 1, 1, 2, 1),
	(2, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'XU_LY_DON', 2, 1, 1, 2, 2),
	(3, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'XU_LY_DON', 3, 1, 1, 2, 3),
	(5, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'XU_LY_DON', 4, 1, 1, 2, 5),
	(6, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'XU_LY_DON', 5, 1, 1, 2, 9),
	(8, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'XU_LY_DON', 6, 1, 1, 2, 8),
	(9, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'GIAI_QUYET_DON', 1, 1, 1, 2, 1),
	(10, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'GIAI_QUYET_DON', 2, 1, 1, 2, 5),
	(12, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'GIAI_QUYET_DON', 4, 1, 1, 2, 11),
	(13, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'GIAI_QUYET_DON', 3, 1, 1, 2, 10),
	(14, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'GIAI_QUYET_DON', 6, 1, 1, 2, 8),
	(15, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'GIAI_QUYET_DON', 5, 1, 1, 2, 12),
	(25, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'KIEM_TRA_DE_XUAT', 1, 1, 1, 2, 1),
	(17, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'THAM_TRA_XAC_MINH', 1, 1, 1, 14, 1),
	(18, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'THAM_TRA_XAC_MINH', 2, 1, 1, 14, 2),
	(19, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'THAM_TRA_XAC_MINH', 6, 1, 1, 14, 15),
	(20, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'THAM_TRA_XAC_MINH', 5, 1, 1, 14, 9),
	(22, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'THAM_TRA_XAC_MINH', 4, 1, 1, 14, 5),
	(24, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'THAM_TRA_XAC_MINH', 3, 1, 1, 14, 3),
	(26, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'KIEM_TRA_DE_XUAT', 2, 1, 1, 2, 2),
	(27, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'KIEM_TRA_DE_XUAT', 3, 1, 1, 2, 3),
	(29, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'KIEM_TRA_DE_XUAT', 4, 1, 1, 2, 5),
	(31, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'KIEM_TRA_DE_XUAT', 5, 1, 1, 2, 9),
	(32, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'KIEM_TRA_DE_XUAT', 6, 1, 1, 2, 16);
/*!40000 ALTER TABLE `wf_donvi_has_state` ENABLE KEYS */;

-- Dumping structure for table tttp.wf_form

CREATE TABLE "IF NOT EXISTS `WF_FORM`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`ALIAS`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`PROCESSTYPE`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.wf_form: 15 rows
/*!40000 ALTER TABLE `wf_form` DISABLE KEYS */;
INSERT INTO `wf_form` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `alias`, `ten`, `nguoiSua_id`, `nguoiTao_id`, `processType`) VALUES
	(1, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'WordProcessingOperatorAction', 'Component văn thư trình lãnh đạo', 1, 1, 'XU_LY_DON'),
	(2, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'ManagerAction', 'Component lãnh đạo giao việc cho trưởng phòng hoặc cán bộ', 1, 1, 'XU_LY_DON'),
	(3, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'LeaderAction', 'Component trưởng phòng giao việc cán bộ', 1, 1, 'XU_LY_DON'),
	(4, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'WordProcessingSpecialistAction', 'Component cán bộ đề xuất hướng xử lý', 1, 1, 'XU_LY_DON'),
	(5, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'WordProcessingOperatorLastAction', 'Component văn thư chuyển bộ phân giải quyết hoặc lưu hồ sơ', 1, 1, 'XU_LY_DON'),
	(6, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'LeaderAction', 'Component trưởng phòng đề xuất giao việc lại', 1, 1, 'XU_LY_DON'),
	(7, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'WordProcessingSpecialistAction', 'Component cán bộ đề xuất giao việc lại', 1, 1, 'XU_LY_DON'),
	(11, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'TruongPhongGiaiQuyetDonAction', 'Component Trưởng phòng giải quyết đơn giao việc cán bộ giải quyết đơn', 1, 1, 'GIAI_QUYET_DON'),
	(12, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'CanBoGiaiQuyetDonAction', 'Component Cán bộ giải quyết đơn giải quyết đơn', 1, 1, 'GIAI_QUYET_DON'),
	(13, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'CanBoNhapLieuGiaiQuyetDonAction', 'Component Cán bộ nhập liệu giải quyết đơn chuyển cho đơn vị TTXM', 1, 1, 'GIAI_QUYET_DON'),
	(14, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'CanBoNhapLieuTTXMAction', 'Component Cán bộ nhập liệu TTXM trình đơn lãnh đạo', 1, 1, 'THAM_TRA_XAC_MINH'),
	(15, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'LanhDaoTTXMAction', 'Component Lãnh đạo TTXM giao việc cán bộ hoặc trưởng phòng TTXM', 1, 1, 'THAM_TRA_XAC_MINH'),
	(16, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'TruongPhongTTXMAction', 'Component Trưởng phòng TTXM giao việc cán bộ TTXM', 1, 1, 'THAM_TRA_XAC_MINH'),
	(17, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'CanBoTTXMAction', 'Component Cán bộ TTXM  chuyển về đơn vị giải quyết', 1, 1, 'THAM_TRA_XAC_MINH'),
	(18, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'CanBoGiaiQuyetDonLapDuThaoAction', 'Component Cán bộ giải quyết đơn nhận kết quả TTXM và giải quyết đơn', 1, 1, 'GIAI_QUYET_DON');
/*!40000 ALTER TABLE `wf_form` ENABLE KEYS */;

-- Dumping structure for table tttp.wf_process

CREATE TABLE "IF NOT EXISTS `WF_PROCESS`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`GHICHU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`OWNER`" bit(1) NOT NULL,
  "`TENQUYTRINH`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CHA_ID`" bigint(20) DEFAULT NULL,
  "`COQUANQUANLY_ID`" bigint(20) DEFAULT NULL,
  "`VAITRO_ID`" bigint(20) DEFAULT NULL,
  "`PROCESSTYPE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)





) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.wf_process: 50 rows
/*!40000 ALTER TABLE `wf_process` DISABLE KEYS */;
INSERT INTO `wf_process` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ghiChu`, `owner`, `tenQuyTrinh`, `nguoiSua_id`, `nguoiTao_id`, `cha_id`, `coQuanQuanLy_id`, `vaiTro_id`, `processType`) VALUES
	(1, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 2, 4, 'XU_LY_DON'),
	(2, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 2, 4, 'XU_LY_DON'),
	(3, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 2, 1, 'XU_LY_DON'),
	(4, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 2, 2, 'XU_LY_DON'),
	(5, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 2, 3, 'XU_LY_DON'),
	(6, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Giải quyết đơn của Trưởng Phòng', 1, 1, NULL, 2, 2, 'GIAI_QUYET_DON'),
	(7, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Giải quyết đơn của Văn Thư', 1, 1, NULL, 2, 4, 'GIAI_QUYET_DON'),
	(8, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Giải quyết đơn của Chuyên Viên', 1, 1, NULL, 2, 3, 'GIAI_QUYET_DON'),
	(9, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Thẩm tra xác minh của Lãnh Đạo', 1, 1, NULL, 14, 1, 'THAM_TRA_XAC_MINH'),
	(10, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Thẩm tra xác minh của Trưởng Phòng', 1, 1, NULL, 14, 2, 'THAM_TRA_XAC_MINH'),
	(11, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Thẩm tra xác minh của Văn Thư', 1, 1, NULL, 14, 4, 'THAM_TRA_XAC_MINH'),
	(12, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Thẩm tra xác minh của Chuyên Viên', 1, 1, NULL, 14, 3, 'THAM_TRA_XAC_MINH'),
	(13, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Kiểm tra đề xuất của Chuyên Viên', 1, 1, NULL, 2, 3, 'KIEM_TRA_DE_XUAT'),
	(14, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Kiểm tra đề xuất của Văn Thư', 1, 1, NULL, 2, 4, 'KIEM_TRA_DE_XUAT'),
	(15, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Kiểm tra đề xuất của Trưởng Phòng', 1, 1, NULL, 2, 2, 'KIEM_TRA_DE_XUAT'),
	(16, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Kiểm tra đề xuất của Lãnh Đạo', 1, 1, NULL, 2, 1, 'KIEM_TRA_DE_XUAT'),
	(17, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 4, 1, 'XU_LY_DON'),
	(18, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 14, 1, 'XU_LY_DON'),
	(19, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 17, 1, 'XU_LY_DON'),
	(20, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 20, 1, 'XU_LY_DON'),
	(21, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 21, 1, 'XU_LY_DON'),
	(22, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 36, 1, 'XU_LY_DON'),
	(23, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Lãnh Đạo', 1, 1, NULL, 42, 1, 'XU_LY_DON'),
	(24, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 4, 2, 'XU_LY_DON'),
	(25, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 14, 2, 'XU_LY_DON'),
	(26, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 17, 2, 'XU_LY_DON'),
	(27, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 20, 2, 'XU_LY_DON'),
	(28, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 21, 2, 'XU_LY_DON'),
	(29, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 36, 2, 'XU_LY_DON'),
	(30, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Trưởng Phòng', 1, 1, NULL, 42, 2, 'XU_LY_DON'),
	(39, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 4, 3, 'XU_LY_DON'),
	(40, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 14, 3, 'XU_LY_DON'),
	(41, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 17, 3, 'XU_LY_DON'),
	(42, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 20, 3, 'XU_LY_DON'),
	(43, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 21, 3, 'XU_LY_DON'),
	(44, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 36, 3, 'XU_LY_DON'),
	(45, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Chuyên Viên', 1, 1, NULL, 42, 3, 'XU_LY_DON'),
	(46, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 4, 4, 'XU_LY_DON'),
	(47, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 14, 4, 'XU_LY_DON'),
	(48, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 17, 4, 'XU_LY_DON'),
	(49, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 20, 4, 'XU_LY_DON'),
	(50, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 21, 4, 'XU_LY_DON'),
	(51, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 36, 4, 'XU_LY_DON'),
	(52, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'0', 'Xử lý đơn của Văn Thư', 1, 1, NULL, 42, 4, 'XU_LY_DON'),
	(53, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 4, 4, 'XU_LY_DON'),
	(54, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 14, 4, 'XU_LY_DON'),
	(55, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 17, 4, 'XU_LY_DON'),
	(56, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 20, 4, 'XU_LY_DON'),
	(57, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 21, 4, 'XU_LY_DON'),
	(58, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', NULL, b'1', 'Xử lý đơn của Văn Thư', 1, 1, 1, 36, 4, 'XU_LY_DON');
/*!40000 ALTER TABLE `wf_process` ENABLE KEYS */;

-- Dumping structure for table tttp.wf_state

CREATE TABLE "IF NOT EXISTS `WF_STATE`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`TEN`" varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  "`TYPE`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`TENVIETTAT`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)


) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.wf_state: 16 rows
/*!40000 ALTER TABLE `wf_state` DISABLE KEYS */;
INSERT INTO `wf_state` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `ten`, `type`, `nguoiSua_id`, `nguoiTao_id`, `tenVietTat`) VALUES
	(1, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Bắt đầu', 'BAT_DAU', 1, 1, 'Bắt đầu'),
	(2, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Văn thư Trình lãnh đạo', 'TRINH_LANH_DAO', 1, 1, 'Trình lãnh đạo'),
	(3, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Lãnh đạo giao việc trưởng phòng', 'LANH_DAO_GIAO_VIEC_TRUONG_PHONG', 1, 1, 'Giao việc trưởng phòng'),
	(4, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Trường phòng đề xuất giao việc lại', 'TRUONG_PHONG_DE_XUAT_GIAO_VIEC_LAI', 1, 1, 'Đề xuất giao việc lại'),
	(5, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Trưởng phòng giao việc cán bộ', 'TRUONG_PHONG_GIAO_VIEC_CAN_BO', 1, 1, 'Giao việc cán bộ'),
	(6, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ đề xuất giao việc lại', 'CAN_BO_DE_XUAT_GIAO_VIEC_LAI', 1, 1, 'Đề xuất giao việc lại'),
	(7, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ đề xuất hướng xử lý', 'CAN_BO_DE_XUAT_HUONG_XU_LY', 1, 1, 'Đề xuất hướng xử lý'),
	(8, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Kết thúc', 'KET_THUC', 1, 1, 'Kết thúc'),
	(9, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Lãnh đạo giao việc cán bộ', 'LANH_DAO_GIAO_VIEC_CAN_BO', 1, 1, 'Giao việc cán bộ'),
	(10, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ chuyển văn thư giao TTXM', 'CAN_BO_CHUYEN_VAN_THU_GIAO_TTXM', 1, 1, 'Giao thẩm tra xác minh'),
	(11, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Văn thư chuyển đơn cho đơn vị TTXM', 'VAN_THU_CHUYEN_DON_VI_TTXM', 1, 1, 'Chuyển đơn vị TTXM'),
	(12, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ nhận kết quả TTXM', 'CAN_BO_NHAN_KET_QUA_TTXM', 1, 1, 'Nhận kết quả TTXM'),
	(13, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ chuyển văn thư kết quả TTXM', 'CAN_BO_CHUYEN_VAN_THU_KET_QUA_TTXM', 1, 1, 'Chuyển văn thư kết quả TTXM'),
	(14, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ giải quyết đơn', 'CAN_BO_GIAI_QUYET_DON', 1, 1, 'Tự thẩm tra xác minh'),
	(15, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ chuyển về đơn vị giải quyết', 'CAN_BO_CHUYEN_VE_DON_VI_GIAI_QUYET', 1, 1, 'Chuyển về đơn vị giải quyết'),
	(16, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 'Cán bộ chuyển kết quả về đơn vị giao', 'CAN_BO_CHUYEN_KET_QUA_DON_VI_GIAO', 1, 1, 'Chuyển về đơn vị giao');
/*!40000 ALTER TABLE `wf_state` ENABLE KEYS */;

-- Dumping structure for table tttp.wf_transition

CREATE TABLE "IF NOT EXISTS `WF_TRANSITION`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CURRENTSTATE_ID`" bigint(20) DEFAULT NULL,
  "`FORM_ID`" bigint(20) DEFAULT NULL,
  "`NEXTSTATE_ID`" bigint(20) DEFAULT NULL,
  "`PROCESS_ID`" bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)






) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.wf_transition: 73 rows
/*!40000 ALTER TABLE `wf_transition` DISABLE KEYS */;
INSERT INTO `wf_transition` (`id`, `daXoa`, `ngaySua`, `ngayTao`, `nguoiSua_id`, `nguoiTao_id`, `currentState_id`, `form_id`, `nextState_id`, `process_id`) VALUES
	(1, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 1),
	(2, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 2),
	(3, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 3),
	(5, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 4),
	(8, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 5),
	(14, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 5),
	(15, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 3),
	(17, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 10, 13, 11, 7),
	(43, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 12, 18, 8, 8),
	(42, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 11, 18, 12, 8),
	(41, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 12, 10, 8),
	(40, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 12, 8, 8),
	(26, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 14, 2, 11),
	(27, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 15, 3, 9),
	(29, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 16, 5, 10),
	(32, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 17, 15, 12),
	(35, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 11, 5, 6),
	(45, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 17, 15, 12),
	(47, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 15, 9, 9),
	(50, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 1, 16, 13),
	(51, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 1, 16, 13),
	(53, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 14),
	(56, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 1, 5, 15),
	(58, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 1, 9, 16),
	(61, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 1, 3, 16),
	(62, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 46),
	(63, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 47),
	(64, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 48),
	(65, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 49),
	(66, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 50),
	(67, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 51),
	(68, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 52),
	(69, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 53),
	(70, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 54),
	(71, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 55),
	(72, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 56),
	(73, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 57),
	(74, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 1, 1, 2, 58),
	(75, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 17),
	(76, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 18),
	(77, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 19),
	(78, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 20),
	(79, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 21),
	(80, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 22),
	(81, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 3, 23),
	(82, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 17),
	(83, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 18),
	(84, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 19),
	(85, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 20),
	(86, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 21),
	(87, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 22),
	(88, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 2, 2, 9, 23),
	(89, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 24),
	(90, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 25),
	(91, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 26),
	(92, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 27),
	(93, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 28),
	(94, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 29),
	(95, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 3, 3, 5, 30),
	(96, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 39),
	(97, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 40),
	(98, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 41),
	(99, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 42),
	(100, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 43),
	(101, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 44),
	(102, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 5, 4, 8, 45),
	(103, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 39),
	(104, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 40),
	(105, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 41),
	(106, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 42),
	(107, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 43),
	(108, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 44),
	(109, b'0', '2017-05-03 13:20:39', '2017-05-03 13:20:39', 1, 1, 9, 4, 8, 45);
/*!40000 ALTER TABLE `wf_transition` ENABLE KEYS */;

-- Dumping structure for table tttp.xulydon

CREATE TABLE "IF NOT EXISTS `XULYDON`" (
  "`ID`" bigint(20) NOT NULL AUTO_INCREMENT,
  "`DAXOA`" bit(1) NOT NULL,
  "`NGAYSUA`" datetime DEFAULT NULL,
  "`NGAYTAO`" datetime DEFAULT NULL,
  "`CHUCVU`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`CHUCVUGIAOVIEC`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`DIADIEM`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`GHICHU`" longtext COLLATE utf8_vietnamese_ci,
  "`HUONGXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`MOTATRANGTHAI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGAYHENGAPLANHDAO`" datetime DEFAULT NULL,
  "`NGAYQUYETDINHDINHCHI`" datetime DEFAULT NULL,
  "`NOIDUNGTHONGTINTRINHLANHDAO`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NOIDUNGYEUCAUXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`SOQUYETDINHDINHCHI`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`THUTUTHUCHIEN`" int(11) NOT NULL,
  "`TRANGTHAIDON`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`YKIENXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  "`NGUOISUA_ID`" bigint(20) DEFAULT NULL,
  "`NGUOITAO_ID`" bigint(20) DEFAULT NULL,
  "`CANBOXULY_ID`" bigint(20) DEFAULT NULL,
  "`CANBOXULYCHIDINH_ID`" bigint(20) DEFAULT NULL,
  "`COQUANCHUYENDON_ID`" bigint(20) DEFAULT NULL,
  "`COQUANTIEPNHAN_ID`" bigint(20) DEFAULT NULL,
  "`CONGCHUC_ID`" bigint(20) DEFAULT NULL,
  "`DON_ID`" bigint(20) DEFAULT NULL,
  "`PHONGBANGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`PHONGBANXULY_ID`" bigint(20) DEFAULT NULL,
  "`PHONGBANXULYCHIDINH_ID`" bigint(20) DEFAULT NULL,
  "`THAMQUYENGIAIQUYET_ID`" bigint(20) DEFAULT NULL,
  "`DONCHUYEN`" bit(1) NOT NULL,
  "`NEXTFORM_ID`" bigint(20) DEFAULT NULL,
  "`NEXTSTATE_ID`" bigint(20) DEFAULT NULL,
  "`DONVIXULY_ID`" bigint(20) DEFAULT NULL,
  "`OLD`" bit(1) NOT NULL,
  "`NOIDUNGXULY`" varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)















) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table tttp.xulydon: 0 rows
/*!40000 ALTER TABLE `xulydon` DISABLE KEYS */;
/*!40000 ALTER TABLE `xulydon` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
