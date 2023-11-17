create database KaraokeNice
use KaraokeNice
CREATE TABLE NhanVienThuNgan (
  MaThuNgan varchar(10) primary key,
  MatKhau varchar(20),
  HoTen NVARCHAR(100) NOT NULL,
  SDT VARCHAR(12),
  NgaySinh DATE,
  Email varchar(100),
  GioiTinh NVARCHAR(5)
);



CREATE TABLE KhachHang (
  TenTaiKhoan varchar(10) primary key,
  MatKhau varchar(20),
  Email varchar(100),
  HoTenKH NVARCHAR(100) NOT NULL,
  SDT VARCHAR(12),
  NgaySinh DATE,
  GioiTinh NVARCHAR(10),
  NgayDangKi DATE
);

CREATE TABLE PhongHat (
  MaPH varchar(10) primary key,
  TenPH NVARCHAR(100) NOT NULL,
  LoaiPH VARCHAR(10)
);
create table LoaiPhongHat(
 MaLoai varchar(10) primary key,
 TenLoai nvarchar(20),
 MoTa nvarchar(100),
 GiaTien decimal(10,2)
)

CREATE TABLE DichVuBoSung (
  MaDV varchar(10) primary key,
  TenDV NVARCHAR(100) NOT NULL,
  SoLuongTon INT,
  DonGia DECIMAL(10, 2)
);
CREATE TABLE PhieuDichVuBoSung (
 MaPhieu varchar(10) primary key,
 MaKH varchar(10),
 NgayDat DateTime,
 TongTien decimal(10,2),
 TrangThai nvarchar(10)
);
create table ChiTietPhieuGoiBoSung(
 MaChiTiet varchar(10) primary key,
 MaPhieu varchar(10),
 MaDV varchar(10),
 SoLuong int,
 TongTien decimal(10,2)
)
CREATE TABLE PhieuDatPhong (
  MaDP varchar(10) PRIMARY KEY ,
  MaKH varchar(10),
  ThoiGianDat DATETIME,
  DonGia DECIMAL(10, 2),
  TrangThai nvarchar(10)
);
CREATE TABLE ChiTietPhieuDP (
 MaChiTiet varchar(10) primary key,
 MaPhong varchar(10),
 SoTien decimal(10,2), 
 ThoiGianSuDung int,
 MaPhieuDP varchar(10)
);

CREATE TABLE Hoadon (
  MaHD VARCHAR(10) PRIMARY KEY ,
  MaPhieuDatPhong varchar(10),
  MaPhieuDVBoSung varchar(10),
  MaThuNgan varchar(10),
  TrangThai NVARCHAR(10) NOT NULL,
  TongSoTien DECIMAL(10, 2),
  NoiDung NVARCHAR(200),
  NgayThanhToan DATETIME,
);
CREATE TABLE QuanLi(
 MaQL varchar(10) primary key,
 MatKhau varchar(20),
 HoTenQL nvarchar(100),
 SDT varchar(12),
 Email varchar(10)
)
create table ChiTietQuanLiKhachHang(
  MaChiTiet varchar(10) primary key,
  MaQL varchar(10),
  MaKH varchar(10),
  ThaoTac nvarchar(50),
  NgaySua Date,
)
create table ChiTietQuanLiPhongHat(
  MaChiTiet varchar(10) primary key,
  MaQL varchar(10),
  MaPhongHat varchar(10),
  ThaoTacQuanLi nvarchar(50), -- Them, xoa hoac sua
  NgaySua Date,
)



ALTER TABLE PhongHat ADD FOREIGN KEY (LoaiPH) REFERENCES LoaiPhongHat(MaLoai);
ALTER TABLE PhieuDichVuBoSung ADD FOREIGN KEY (MaKH) REFERENCES KhachHang(TenTaiKhoan);
ALTER TABLE ChiTietPhieuGoiBoSung ADD FOREIGN KEY (MaPhieu) REFERENCES PhieuDichVuBoSung(MaPhieu);
ALTER TABLE ChiTietPhieuGoiBoSung ADD FOREIGN KEY (MaDV) REFERENCES DichVuBoSung(MaDV);
ALTER TABLE PhieuDatPhong ADD FOREIGN KEY (MaKH) REFERENCES KhachHang(TenTaiKhoan);
ALTER TABLE ChiTietPhieuDP ADD FOREIGN KEY (MaPhong) REFERENCES PhieuDatPhong(MaDP);
ALTER TABLE HoaDon ADD FOREIGN KEY (MaPhieuDatPhong) REFERENCES PhieuDatPhong(MaDP);
ALTER TABLE HoaDon ADD FOREIGN KEY (MaPhieuDVBoSung) REFERENCES PhieuDichVuBoSung(MaPhieu);
ALTER TABLE HoaDon ADD FOREIGN KEY (MaThuNgan) REFERENCES NhanVienThuNgan(MaThuNgan);
ALTER TABLE ChiTietQuanLiKhachHang ADD FOREIGN KEY (MaQL) REFERENCES QuanLi(MaQL);
ALTER TABLE ChiTietQuanLiKhachHang ADD FOREIGN KEY (MaKH) REFERENCES KhachHang(TenTaiKhoan);
ALTER TABLE ChiTietQuanLiPhongHat ADD FOREIGN KEY (MaQL) REFERENCES QuanLi(MaQL);
ALTER TABLE ChiTietQuanLiPhongHat ADD FOREIGN KEY (MaPhongHat) REFERENCES PhongHat(MaPH);
ALTER TABLE ChiTietPhieuDP ADD FOREIGN KEY (MaPhieuDP) REFERENCES PhieuDatPhong(MaDP);

INSERT INTO LoaiPhongHat (MaLoai, TenLoai, MoTa, GiaTien)
VALUES
('VIP', N'Phòng VIP', 'Đây là phòng có đầy đủ thiết bị phục vụ chu đáo',700000),
('NORMAL', N'Phòng Loại Thường', 'Phòng thường có đủ thiết bị ',500000)

INSERT INTO PhongHat (MaPH, TenPH, LoaiPH)
VALUES
('VIP1', N'Phòng Vip 1', 'VIP'),
('VIP2', N'Phòng Vip 2', 'VIP'),
('NM1', N'Phòng Thường 1', 'NORMAL'),
('NM2', N'Phòng Thường 2', 'NORMAL'),
('NM3', N'Phòng Thường 3 ', 'NORMAL')

INSERT INTO NhanVienThuNgan (MaThuNgan, MatKhau, HoTen, SDT, NgaySinh, Email, GioiTinh)
VALUES
('TN001', 'matkhau123', N'Nguyễn Văn A', '0123456789', '1990-01-01', 'a@gmail.com', N'Nam'),
('TN002', 'pass456', N'Trần Thị B', '0987654321', '1995-05-15', 'b@gmail.com', N'Nữ'),
('TN003', 'securepass', N'Lê Văn C', '0368745912', '1988-11-20', 'c@gmail.com', N'Nam'),
('TN004', '123456', N'Phạm Văn D', '0778945612', '1992-07-07', 'd@gmail.com', N'Nam'),
('TN005', 'password', N'Nguyễn Thị E', '0897456321', '1985-03-25', 'e@gmail.com', N'Nữ')

INSERT INTO KhachHang (TenTaiKhoan, MatKhau, Email, HoTenKH, SDT, NgaySinh, GioiTinh, NgayDangKi)
VALUES
('user001', 'pass123', 'user1@gmail.com', N'Nguyễn Văn User1', '0123456789', '1993-02-10', N'Nam', '2023-01-15'),
('user002', 'pass456', 'user2@gmail.com', N'Trần Thị User2', '0987654321', '1998-06-20', N'Nữ', '2023-02-22'),
('user003', 'pass789', 'user3@gmail.com', N'Lê Văn User3', '0368745912', '1990-09-05', N'Nam', '2023-03-10'),
('user004', 'pass000', 'user4@gmail.com', N'Phạm Thị User4', '0778945612', '1987-11-15', N'Nữ', '2023-04-18'),
('user005', 'pass999', 'user5@gmail.com', N'Nguyễn Văn User5', '0897456321', '1995-04-30', N'Nam', '2023-05-25')





INSERT INTO DichVuBoSung (MaDV, TenDV, SoLuongTon, DonGia)
VALUES
('DV001', N'Nước ngọt Coca', 50, 15000),
('DV002', N'Bia', 30, 25000),
('DV003', N'Kem', 20, 20000),
('DV004', N'Snack', 40, 10000),
('DV005', N'Rượu vang', 15, 50000)

INSERT INTO PhieuDichVuBoSung (MaPhieu, MaKH, NgayDat, TongTien, TrangThai)
VALUES
('PDV001', 'user001', '2023-01-20 15:30:00', 45000, N'xong'),
('PDV002', 'user002', '2023-02-25 18:45:00', 75000, N'chưa'),
('PDV003', 'user003', '2023-03-10 10:15:00', 60000, N'xong'),
('PDV004', 'user004', '2023-04-18 20:00:00', 40000, N'chưa'),
('PDV005', 'user005', '2023-05-25 14:00:00', 125000, N'xong');

INSERT INTO ChiTietPhieuGoiBoSung (MaChiTiet, MaPhieu, MaDV, SoLuong, TongTien)
VALUES
('CT001', 'PDV001', 'DV001', 3, 45000),
('CT002', 'PDV002', 'DV002', 2, 50000),
('CT003', 'PDV003', 'DV003', 4, 80000),
('CT004', 'PDV004', 'DV004', 1, 10000),
('CT005', 'PDV005', 'DV005', 5, 250000);

INSERT INTO PhieuDatPhong (MaDP, MaKH, ThoiGianDat, DonGia, TrangThai)
VALUES
('PDP001', 'user001', '2023-01-15 12:00:00', 1400000, null),
('PDP002', 'user002', '2023-02-22 14:30:00', 2100000, null),
('PDP003', 'user003', '2023-03-10 16:45:00',  500000, null),
('PDP004', 'user004', '2023-04-18 19:00:00', 100000, null),
('PDP005', 'user005', '2023-05-25 21:15:00', 250000, null);

INSERT INTO Hoadon (MaHD, MaPhieuDatPhong, MaPhieuDVBoSung, MaThuNgan, TrangThai, TongSoTien, NoiDung, NgayThanhToan)
VALUES
('HD001', 'PDP001', 'PDV001', 'TN001','xong', 245000, N'Hóa đơn thanh toán phòng và dịch vụ', '2023-01-20 16:00:00'),
('HD002', 'PDP002', 'PDV002', 'TN002','chua',230000, N'Hóa đơn phòng và dịch vụ chưa thanh toán', NULL),
('HD003', 'PDP003', 'PDV003', 'TN003','xong', 280000, N'Hóa đơn phòng và dịch vụ chưa thanh toán', NULL),
('HD004', 'PDP004', 'PDV004', 'TN004','xong', 160000, N'Hóa đơn thanh toán phòng và dịch vụ', '2023-04-18 20:30:00'),
('HD005', 'PDP005', 'PDV005', 'TN005','xong', 375000, N'Hóa đơn phòng và dịch vụ chưa thanh toán', NULL);

INSERT INTO QuanLi (MaQL, MatKhau, HoTenQL, SDT, Email)
VALUES
('QL001', 'qlpass1', N'Trần Văn Quân', '0987654321', 'quanli1@'),
('QL002', 'qlpass2', N'Lê Thị Quyên', '0123456789', 'quanli2@'),
('QL003', 'qlpass3', N'Nguyen Van Quang', '0368745912', 'quanli3@'),
('QL004', 'qlpass4', N'Hoang Thi Mai', '0778945612', 'quanli4@'),
('QL005', 'qlpass5', N'Pham Van Anh', '0897456321', 'quanli5@');


