CREATE TABLE Khoa 
( 
MaKhoa CHAR(5) NOT NULL, 
TenKhoa VARCHAR(20) NOT NULL, 
PRIMARY KEY (MaKhoa) );
CREATE TABLE DSKham 
( 
  MaDS CHAR(5) NOT NULL, 
  NgayKham DATE NOT NULL, 
  PRIMARY KEY (MaDS) 
); 
CREATE TABLE ChucVu 
( 
  MaCV CHAR(5) NOT NULL, 
  TenCV VARCHAR(20) NOT NULL, 
  Luong FLOAT NOT NULL, 
  PRIMARY KEY (MaCV) 
); 
CREATE TABLE TaiKhoan 
( 
  MaTK CHAR(5) NOT NULL, 
  Email VARCHAR(55) NOT NULL, 
  Password VARCHAR(55) NOT NULL, 
  Active INT NOT NULL, 
  PRIMARY KEY (MaTK) 
); 
CREATE TABLE Kho 
( 
  MaKho CHAR(5) NOT NULL, 
  TenKho VARCHAR(55) NOT NULL, 
  DiaChi VARCHAR(255) NOT NULL, 
  Loai VARCHAR(55) NOT NULL, 
  SL INT NOT NULL, 
  PRIMARY KEY (MaKho) 
);
CREATE TABLE PhongBan 
( 
  MaPhong CHAR(5) NOT NULL, 
  TenPhong VARCHAR(20) NOT NULL, 
  MaKhoa CHAR(5) NOT NULL, 
  MaDS CHAR(5) NOT NULL, 
  PRIMARY KEY (MaPhong), 
  FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa), 
  FOREIGN KEY (MaDS) REFERENCES DSKham(MaDS) 
);
CREATE TABLE NhanVien 
( 
  MaNV CHAR(5) NOT NULL, 
  NgaySinh DATE, 
  NgayVaoLam DATE, 
  HoTen VARCHAR(20) NOT NULL, 
  DiaChi VARCHAR(55) NOT NULL, 
  GioiTinh VARCHAR(20) NOT NULL, 
  SDT VARCHAR(20) NOT NULL, 
  MaPhong CHAR(5) NOT NULL, 
  MaTK CHAR(5) NOT NULL, 
  MaCV CHAR(5) NOT NULL, 
  PRIMARY KEY (MaNV), 
  FOREIGN KEY (MaPhong) REFERENCES PhongBan(MaPhong), 
  FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK), 
  FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV) 
);
CREATE TABLE HoSoBN 
( 
  MaHS CHAR(5) NOT NULL, 
  NgayLap DATE NOT NULL, 
  MaNV CHAR(5) NOT NULL, 
  PRIMARY KEY (MaHS), 
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV) 
);
CREATE TABLE Thuoc 
( 
  MaThuoc CHAR(5) NOT NULL, 
  TenThuoc VARCHAR(55) NOT NULL, 
  CachDung VARCHAR(255) NOT NULL, 
  DonGia FLOAT NOT NULL, 
  SL INT NOT NULL, 
  MaKho CHAR(5) NOT NULL, 
  PRIMARY KEY (MaThuoc), 
  FOREIGN KEY (MaKho) REFERENCES Kho(MaKho) 
);
CREATE TABLE BenhAn 
( 
  MaBA CHAR(5) NOT NULL, 
  PPDC VARCHAR(255) NOT NULL, 
  NgayKham DATE NOT NULL, 
  MaHS CHAR(5) NOT NULL, 
  PRIMARY KEY (MaBA), 
  FOREIGN KEY (MaHS) REFERENCES HoSoBN(MaHS) 
); 
CREATE TABLE HoaDon 
( 
  MaHD CHAR(5) NOT NULL, 
  TongTien FLOAT NOT NULL, 
  MaBA CHAR(5) NOT NULL, 
  PRIMARY KEY (MaHD), 
  FOREIGN KEY (MaBA) REFERENCES BenhAn(MaBA) 
); 
CREATE TABLE HoaDDon_Thuoc 
( 
  MaThuoc CHAR(5) NOT NULL, 
  MaHD CHAR(5) NOT NULL, 
  PRIMARY KEY (MaThuoc, MaHD), 
  FOREIGN KEY (MaThuoc) REFERENCES Thuoc(MaThuoc), 
  FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD) 
);
CREATE TABLE Phieu 
( 
  MaPhieu CHAR(5) NOT NULL, 
  TenPhieu VARCHAR(20) NOT NULL, 
  Loai VARCHAR(20) NOT NULL, 
  Ngay DATE NOT NULL, 
  NoiDung VARCHAR(50) NOT NULL, 
  MaNV CHAR(5) NOT NULL, 
  PRIMARY KEY (MaPhieu), 
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV) 
);
CREATE TABLE BenhNhan 
( 
  MaBN CHAR(5) NOT NULL, 
  TenBN VARCHAR(20) NOT NULL, 
  NgaySinh DATE, 
  DiaChi VARCHAR(55) NOT NULL, 
  CCCD VARCHAR(55) NOT NULL, 
  GioiTinh VARCHAR(20) NOT NULL, 
  SDT VARCHAR(10) NOT NULL, 
  MaTK CHAR(5) NOT NULL, 
  MaDS CHAR(5) NOT NULL, 
  MaHS CHAR(5) NOT NULL, 
  PRIMARY KEY (MaBN), 
  FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK), 
  FOREIGN KEY (MaDS) REFERENCES DSKham(MaDS), 
  FOREIGN KEY (MaHS) REFERENCES HoSoBN(MaHS) 
);
CREATE TABLE DanhGia 
( 
  MaDG CHAR(5) NOT NULL, 
  TieuDe VARCHAR(55) NOT NULL, 
  NoiDung VARCHAR(255) NOT NULL, 
  MaBN CHAR(5) NOT NULL, 
  PRIMARY KEY (MaDG), 
  FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN) 
);
CREATE TABLE LichDat 
( 
  MaDat CHAR(5) NOT NULL, 
  NgayDat DATE NOT NULL, 
  MaNV CHAR(5) NOT NULL, 
  MaBN CHAR(5) NOT NULL, 
  PRIMARY KEY (MaDat), 
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV), 
  FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN) 
);
INSERT INTO Khoa (MaKhoa, TenKhoa) VALUES 
('K001', 'Khoa A'), 
('K002', 'Khoa B'); 
INSERT INTO DSKham (MaDS, NgayKham) VALUES 
('DS001', '2024-01-01'), 
('DS002', '2024-02-01'); 
INSERT INTO ChucVu (MaCV, TenCV, Luong) VALUES 
('CV001', 'Bac Si', 20000), 
('CV002', 'Y Ta', 15000);
INSERT INTO TaiKhoan (MaTK, Email, Password, Active) VALUES 
('TK001', 'user1@example.com', 'password1', 1), 
('TK002', 'user2@example.com', 'password2', 1);
INSERT INTO Kho (MaKho, TenKho, DiaChi, Loai, SL) VALUES
('KH001', 'Kho Thuoc A', '123 Street', 'Thuoc', 100), 
('KH002', 'Kho Vat Tu', '456 Avenue', 'Vat Tu', 200);
INSERT INTO PhongBan (MaPhong, TenPhong, MaKhoa, MaDS) VALUES 
('P001', 'Phong A', 'K001', 'DS001'), 
('P002', 'Phong B', 'K002', 'DS002'); 
INSERT INTO NhanVien (MaNV, NgaySinh, NgayVaoLam, HoTen, DiaChi, GioiTinh, SDT, 
MaPhong, MaTK, MaCV) VALUES 
('NV001', '1980-01-01', '2020-01-01', 'Nguyen Van A', 'HCMC', 'Nam', 
'0901234567', 'P001', 'TK001', 'CV001'), 
('NV002', '1985-02-02', '2021-02-02', 'Tran Thi B', 'HN', 'Nu', '0912345678', 
'P002', 'TK002', 'CV002'); 
INSERT INTO HoSoBN (MaHS, NgayLap, MaNV) VALUES 
('HS001', '2024-01-01', 'NV001'), 
('HS002', '2024-02-01', 'NV002'); 
INSERT INTO Thuoc (MaThuoc, TenThuoc, CachDung, DonGia, SL, MaKho) VALUES 
('TH001', 'Thuoc A', 'Uong', 500, 50, 'KH001'), 
('TH002', 'Thuoc B', 'Tiem', 1000, 30, 'KH002'); 
INSERT INTO BenhAn (MaBA, PPDC, NgayKham, MaHS) VALUES 
('BA001', 'Phuong phap A', '2024-01-01', 'HS001'), 
('BA002', 'Phuong phap B', '2024-02-01', 'HS002');
INSERT INTO HoaDon (MaHD, TongTien, MaBA) VALUES 
('HD001', 5000, 'BA001'), 
('HD002', 10000, 'BA002'); 
INSERT INTO Phieu (MaPhieu, TenPhieu, Loai, Ngay, NoiDung, MaNV) VALUES 
('PH001', 'Phieu A', 'Loai A', '2024-01-01', 'Noi dung A', 'NV001'), 
('PH002', 'Phieu B', 'Loai B', '2024-02-01', 'Noi dung B', 'NV002'); 
INSERT INTO BenhNhan (MaBN, TenBN, NgaySinh, DiaChi, CCCD, GioiTinh, SDT, MaTK, 
MaDS, MaHS) VALUES 
('BN001', 'Nguyen Van C', '1990-03-03', 'DN', '123456789', 'Nam', '0923456789', 'TK001', 'DS001', 'HS001'), 
('BN002', 'Le Thi D', '1995-04-04', 'HP', '987654321', 'Nu', '0934567890', 'TK002', 'DS002', 'HS002'); 
INSERT INTO DanhGia (MaDG, TieuDe, NoiDung, MaBN) VALUES 
('DG001', 'Danh gia 1', 'Noi dung 1', 'BN001'), 
('DG002', 'Danh gia 2', 'Noi dung 2', 'BN002');
INSERT INTO LichDat (MaDat, NgayDat, MaNV, MaBN) VALUES 
('LD001', '2024-03-03', 'NV001', 'BN001'), 
('LD002', '2024-04-04', 'NV002', 'BN002');

-- Gioi tinh nhan vien 
-- Gioi tinh nhan vien 
CREATE TRIGGER tr_GioiTinh_nhanvien 
on NhanVien  
FOR INSERT, UPDATE 
AS 
BEGIN 
    DECLARE @gioitinh VARCHAR(20) 
    DECLARE @manv CHAR(5) 
   SELECT @gioitinh = GioiTinh, @manv = MaNV FROM inserted 
   if(@gioitinh like 'nam' OR @gioitinh like 'nu') 
    BEGIN 
        UPDATE NhanVien 
        Set GioiTinh = @gioitinh 
        WHERE MaNV = @manv 
    END 
    ELSE 
    BEGIN 
       RAISERROR(N'Yêu c?u nh?p l?i gi?i tính', 16, 1); 
       ROLLBACK TRANSACTION;   
       RETURN 
    END 
END

--Gioi tinh benh nhan 
CREATE TRIGGER tr_GioiTinh_benhnhan 
on BenhNhan  
FOR INSERT, UPDATE 
AS 
BEGIN 
    DECLARE @gioitinh VARCHAR(20) 
    DECLARE @mabn CHAR(5) 
   SELECT @gioitinh = GioiTinh, @mabn = MaBN FROM inserted 
   if(@gioitinh like 'nam' OR @gioitinh like 'nu') 
    BEGIN 
        UPDATE BenhNhan 
        Set GioiTinh = @gioitinh 
        WHERE MaBN = @mabn 
    END 
    ELSE 
    BEGIN 
       RAISERROR(N'Yêu c?u nh?p l?i gi?i tính', 16, 1); 
       ROLLBACK TRANSACTION;   
       RETURN 
    END 
END 

--Tu?i nhân viên
CREATE TRIGGER tr_tuoi_nv 
ON NhanVien 
FOR INSERT, UPDATE 
AS 
BEGIN 
    DECLARE @ngaysinh DATE 
    select @ngaysinh = NgaySinh FROM inserted 
    IF (YEAR(GETDATE()) - YEAR(@ngaysinh) <= 18) 
    BEGIN 
        RAISERROR(N'Tu?i c?a nhân viên ph?i l?n h?n 18', 16, 1); 
        ROLLBACK TRANSACTION; 
        RETURN; 
    END 
END

--Ràng bu?c ngày ??t trong l?ch ??t khám
CREATE TRIGGER tr_ngaydat 
on LichDat 
FOR INSERT, UPDATE 
AS 
BEGIN 
    IF EXISTS ( 
        SELECT 1 
        FROM inserted 
        WHERE NgayDat <= GETDATE() 
    ) 
    BEGIN 
        RAISERROR(N'Th?i gian ??t nh? h?n th?i gian hi?n t?i !', 16, 1); 
        ROLLBACK TRANSACTION; 
        RETURN; 
    END 
END

--Ràng bu?c v? ch?c v?
CREATE TRIGGER tr_check_chucvu 
ON NhanVien 
AFTER INSERT, UPDATE, DELETE 
AS 
BEGIN 
    IF EXISTS ( 
        SELECT c.MaCV 
        FROM ChucVu c 
        LEFT JOIN NhanVien n ON c.MaCV = n.MaCV 
        GROUP BY c.MaCV 
        HAVING COUNT(n.MaNV) = 0 
    ) 
    BEGIN 
	 RAISERROR(N'M?i ch?c v? ph?i có ít nh?t 1 nhân viên', 16, 1); 
        ROLLBACK TRANSACTION; 
        RETURN; 
    END 
END 

--Ràng bu?c v? l??ng
CREATE TRIGGER tr_luong 
on ChucVu 
FOR INSERT, UPDATE 
AS 
BEGIN 
    DECLARE @luong FLOAT 
 
    IF EXISTS( 
        SELECT 1 FROM inserted i 
        WHERE i.Luong < 7000000 
    ) 
    BEGIN 
        RAISERROR(N'L??ng c?a m?i ch?c v? ph?i l?n h?n ho?c b?ng 7 tri?u ??ng', 
16, 1); 
        ROLLBACK TRANSACTION; 
        RETURN; 
    END 
END 

--Ràng bu?c v? ngày khám b?nh không ???c l?n h?n ngày hi?n t?i
CREATE TRIGGER tr_ngaykham_benhan 
ON BenhAn 
AFTER INSERT, UPDATE 
AS 
BEGIN 
    SET NOCOUNT ON; 
 
    DECLARE @errorMessage NVARCHAR(100) = N'Ngày khám b?nh không ???c l?n h?n 
ngày hi?n t?i!'; 
     
    IF EXISTS ( 
        SELECT 1 
        FROM inserted 
        WHERE NgayKham > GETDATE() 
    ) 
    BEGIN 
        RAISERROR(@errorMessage, 16, 1); 
        ROLLBACK TRANSACTION; 
        RETURN; 
    END 
END; 

