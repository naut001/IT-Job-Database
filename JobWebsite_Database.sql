use master
go

create database JobWebsite

use  JobWebsite
go

---------------------------------------------------------------------------------------------
-------------------------Tạo bảng, khóa chính--------------------------------------

create table LoaiTaiKhoan
(
	MaLoaiTK int primary key,
	TenLoai nvarchar (50)
)
go

create table TaiKhoan
(
	MaND int primary key identity (1,1),
	MaLoaiTK int,
	TenDangNhap varchar (50) ,
	MatKhau varchar (50)
)
go

create table CongTy
(
	MaCongTy int primary key identity(100,1),
	MaND int,
	TenCongTy nvarchar (50) ,
	DiaChi nvarchar (50) ,
	MoTa nvarchar (100),
	Email varchar (50) ,
	Website varchar (50) ,
	MaThanhPho int 
)
go


create table UngVien
(
	MaUV int primary key identity (1000,1),
	MaND int,
	HoTen nvarchar(50) ,
	GioiTinh char (10) ,
	NgaySinh datetime ,
	SDT char (10),
	Email varchar (50) ,
	MaThanhPho int
)
go


  create table ThanhPho
(
	MaThanhPho int primary key,
	TenThanhPho nvarchar (50)
)
go

create table CV_UngVien
(
	MaCV int primary key identity (10000,1),
	MaUV int ,
	TieuDe nvarchar (100),
	HocVan nvarchar (100) ,
	KinhNghiem nvarchar (100) ,
	NgoaiNgu nvarchar (50),
	MaKyNang int,
	MaViTriUT int,
	MaLoaiCongViecUT int
)
go

create table HoSoUngTuyen
(
	MaHS int primary key identity (10000,1),
	MaCV int ,
	MaCongViec int ,
	NgayTaoHS datetime ,
	TrangThai bit
)
go

create table CongViec
(	
	MaCongViec int primary key identity (100000,1),
	TenCongViec nvarchar (50) ,
	MoTaCongViec nvarchar (100),
	MaCongTy int,
	MaKyNang int,
	MaViTriUT int,
	MaLoaiCongViecUT int,
	MucLuong int,
	NgayDang datetime,
	NgayHetHan datetime,
	SoLuong int,
	TrangThai bit,
	MaThanhPho int
)
go

create table KyNang
(
	MaKyNang int primary key,
	TenKyNang nvarchar (50)
)
go

create table ViTriUngTuyen
(
	MaViTriUT int primary key,
	TenViTri nvarchar (50)
)
go

create table LoaiCongViec
(
	MaLoaiCongViecUT int primary key,
	TenLoaiCongViec nvarchar (50)
)
go

create table ChiNhanhCongTy
(
	MaCongTy int,
	MaThanhPho int,
	TenCongTy nvarchar (50),
)
go

create table DiaDiemCongViec
(
	MaCongViec int,
	MaThanhPho int,
	TenCongViec nvarchar (50),
)
go
------------------------------------Tạo khóa ngoại----------------------------------

ALTER TABLE ChiNhanhCongTy
ADD CONSTRAINT fk_ThanhPho_CN
FOREIGN KEY (MaThanhPho)
REFERENCES ThanhPho (MaThanhPho)
GO

ALTER TABLE ChiNhanhCongTy
ADD CONSTRAINT fk_CongTy_CN
FOREIGN KEY (MaCongTy)
REFERENCES CongTy (MaCongTy)
GO

ALTER TABLE DiaDiemCongViec
ADD CONSTRAINT fk_ThanhPho_DD
FOREIGN KEY (MaThanhPho)
REFERENCES ThanhPho (MaThanhPho)
GO

ALTER TABLE DiaDiemCongViec
ADD CONSTRAINT fk_CongViec_DD
FOREIGN KEY (MaCongViec)
REFERENCES CongViec (MaCongViec)
GO

ALTER TABLE TaiKhoan
ADD CONSTRAINT fk_LoaiTK
FOREIGN KEY (MaLoaiTK)
REFERENCES LoaiTaiKhoan (MaLoaiTK)
GO

ALTER TABLE NguoiDung
ADD CONSTRAINT fk_TKUV
FOREIGN KEY (MaND)
REFERENCES TaiKhoan (MaND)
GO

ALTER TABLE CongTy
ADD CONSTRAINT fk_TKCT
FOREIGN KEY (MaND)
REFERENCES TaiKhoan (MaND)
GO

ALTER TABLE UngVien
ADD CONSTRAINT fk_ThanhPho_UV
FOREIGN KEY (MaThanhPho)
REFERENCES ThanhPho (MaThanhPho)
GO

ALTER TABLE CongTy
ADD CONSTRAINT fk_ThanhPho_CT
FOREIGN KEY (MaThanhPho)
REFERENCES ThanhPho (MaThanhPho)
GO

ALTER TABLE CongViec
ADD CONSTRAINT fk_ThanhPho_CV
FOREIGN KEY (MaThanhPho)
REFERENCES ThanhPho (MaThanhPho)
GO

ALTER TABLE CV_UngVien
ADD CONSTRAINT fk_UngVien
FOREIGN KEY (MaUV)
REFERENCES UngVien (MaUV)
GO

ALTER TABLE HoSoUngTuyen
ADD CONSTRAINT fk_CV
FOREIGN KEY (MaCV)
REFERENCES CV_UngVien (MaCV)
GO

ALTER TABLE HoSoUngTuyen
ADD CONSTRAINT fk_CongViec
FOREIGN KEY (MaCongViec)
REFERENCES CongViec (MaCongViec)
GO

ALTER TABLE CV_UngVien
ADD CONSTRAINT fk_KyNang_CV
FOREIGN KEY (MaKyNang)
REFERENCES KyNang (MaKyNang)
GO

ALTER TABLE CongViec
ADD CONSTRAINT fk_KyNang_CongViec
FOREIGN KEY (MaKyNang)
REFERENCES KyNang (MaKyNang)
GO

ALTER TABLE CV_UngVien
ADD CONSTRAINT fk_ViTri_CV
FOREIGN KEY (MaViTriUT)
REFERENCES ViTriUngTuyen (MaViTriUT)
GO

ALTER TABLE CongViec
ADD CONSTRAINT fk_ViTri_CongViec
FOREIGN KEY (MaViTriUT)
REFERENCES ViTriUngTuyen (MaViTriUT)
GO

ALTER TABLE CV_UngVien
ADD CONSTRAINT fk_LoaiCongViec_CV
FOREIGN KEY (MaLoaiCongViecUT)
REFERENCES LoaiCongViec (MaLoaiCongViecUT)
GO

ALTER TABLE CongViec
ADD CONSTRAINT fk_LoaiCongViec_CongViec
FOREIGN KEY (MaLoaiCongViecUT)
REFERENCES LoaiCongViec (MaLoaiCongViecUT)
GO

ALTER TABLE CongViec
ADD CONSTRAINT fk_CongTy
FOREIGN KEY (MaCongTy)
REFERENCES CongTy (MaCongTy)
GO

-----------------------------------------------------------------------------------------------
--------------------------------Thêm dữ liệu vào bảng------------------------------------------

insert into LoaiTaiKhoan (MaLoaiTK, TenLoai)
values 
	('0',N'Ứng viên'),
	('1',N'Công ty');	

insert into ThanhPho (MaThanhPho, TenThanhPho)
values 
	('1',N'An Giang'),		('2',N'Bà Rịa - Vũng Tàu'), ('3',N'Bắc Giang'),		('4',N'Bắc Kạn'),					('5',N'Bạc Liêu'),		('6',N'Bắc Ninh'),
	('7',N'Bến Tre'),		('8',N'Bình Định'),			('9',N'Bình Dương'),	('10',N'Bình Phước'),				('11',N'Bình Thuận'),	('12',N'Cà Mau'),
	('13',N'Cần Thơ'),		('14',N'Cao Bằng'),			('15',N'Đà Nẵng'),		('16',N'Đắk Lắk'),					('17',N'Đắk Nông'),		('18',N'Điện Biên'),
	('19',N'Đồng Nai'),		('20',N'Đồng Tháp'),		('21',N'Gia Lai'),		('22',N'Hà Giang'),					('23',N'Hà Nam'),		('24',N'Hà Nội'),
	('25',N'Hà Tĩnh'),		('26',N'Hải DƯơng'),		('27',N'Hải Phòng'),	('28',N'Hậu Giang'),				('29',N'Hòa Bình'),		('30',N'Hưng Yên'),
	('31',N'Khánh Hòa'),	('32',N'Kiên Giang'),		('33',N'Kon Tum'),		('34',N'Lai Châu'),					('35',N'Lâm Đồng'),		('36',N'Lạng Sơn'),
	('37',N'Lào Cai'),		('38',N'Long An'),			('39',N'Nam Định'),		('40',N'Nghệ An'),					('41',N'Ninh Bình'),	('42',N'Ninh Thuận'),
	('43',N'Phú Thọ'),		('44',N'Phú Yên'),			('45',N'Quảng Bình'),	('46',N'Quảng Nam'),				('47',N'Quảng Ngãi'),	('48',N'Quảng Ninh'),
	('49',N'Quảng Trị'),	('50',N'Sóc Trăng'),		('51',N'Sơn La'),		('52',N'Tây Ninh'),					('53',N'Thái Bình'),	('54',N'Thái Nguyên'),
	('55',N'Thanh Hóa'),	('56',N'Thừa Thiên Huế'),	('57',N'Tiền Giang'),	('58',N'Thành phố Hồ Chí Minh'),	('59',N'Trà Vinh'),		('60',N'Tuyên Quang'),
	('61',N'Vĩnh Long'),	('62',N'Vĩnh Phúc'),		('63',N'Yên Bái');
go

insert into LoaiCongViec (MaLoaiCongViecUT, TenLoaiCongViec)
values
	('01',N'Toàn thời gian'),
	('02',N'Bán thời gian'),
	('03',N'Thực tập'),
	('04',N'Hợp đồng'),
	('05',N'Thời vụ');
go

insert into ViTriUngTuyen (MaViTriUT, TenViTri)
values
	('1',N'Developer'),		('2',N'Analyst'),
	('3',N'Manager'),		('4',N'Architect'),
	('5',N'Engineer'),		('6',N'Owner'),
	('7',N'Leader'),		('8',N'Administrator'),
	('9',N'Tester'),		('10',N'Designer'),				('11',N'Scientist');
go

insert into KyNang (MaKyNang, TenKyNang)
values
	('1',N'ASP.NET'),		('2',N'Cloud'),			('3',N'DevOps'),		('4',N'English'),		('5',N'HTML5'),		('6',N'J2EE'),
	('7',N'JQuery'),		('8',N'Linux'),			('9',N'Angular'),		('10',N'MySQL'),		('11',N'NoSQL'),	('12',N'PHP'),
	('13',N'Python'),		('14',N'Ruby'),			('15',N'Swift'),		('16',N'Wordpress'),	('17',N'Android'),	('18',N'C#'),
	('19',N'CSS'),			('20',N'ERP'),			('21',N'Hybrid'),		('22',N'Japanese'),		('23',N'JSON'),		('24',N'.NET'),
	('25',N'Blockchain'),	('26',N'C++'),			('27',N'Database'),		('28',N'Games'),		('29',N'IOS'),		('30',N'Java'),
	('31',N'Networking'),	('32',N'OOP'),			('33',N'ReactJS'),		('34',N'SAP'),			('35',N'Unity'),	('36',N'C language'),
	('37',N'IT Support'),	('38',N'JavaScript'),	('39',N'MVC'),			('40',N'NodeJS'),		('41',N'Oracle'),	('42',N'SQL');
go

insert into TaiKhoan (MaLoaiTK, TenDangNhap, MatKhau)
values
	('0','1956210100','minhtuan'),
	('0','1956210109','thutrang'),
	('0','1956210102','dieutham'),
	('1','1111111111','111'),
	('1','2222222222','222'),
	('1','3333333333','333'),
	('1','TestTD','1234'),
	('0','TestTD','123'),
	('0','Test','12366'),
	('1','techcombank','123'),
	('1','fptsoftware','123'),
	('1','viettelgroup','123'),
	('1','zalogroup','123'),
	('1','pizzahutdigital','123'),
	('1','binance','123'),
	('1','acbbank','123'),
	('1','linevietnam','123'),
	('1','homecredit','123'),
	('1','gfttechnology','123'),
	('1','saigontechnology','123');
go

------------------------------------------Dữ liệu công ty (dùng stored procedure)
insert into CongTy (MaND)
select MaND from TaiKhoan where MaND > = 10 and MaND <=20
go


exec sp_UpdateCongTy 10,'Techcombank' ,N'191 Bà Triệu, Hà Nội',N'Techcombank - Giữ trọn niềm tin','techcombank@gmail.com','www.techcombank.com.vn',24
go
exec sp_UpdateCongTy 11,'FPT Software' ,N'Hà Nội, Việt Nam',N'FPT Software - Cường quốc phần mềm','fsoft.contact@fsoft.com.vn','fsoft.contact@fsoft.com.vn',24
go
exec sp_UpdateCongTy 12,'Viettel Group' ,N'Hà Nội, Việt Nam',N'Luôn luôn lắng nghe - Luôn luôn thấu hiểu','viettelgroup@gmail.com.vn','www.viettel.com.vn',24
go
exec sp_UpdateCongTy 13,'Zalo Careers' ,N'Hồ Chí Minh, Việt Nam',N'Sản phẩm công nghệ đẳng cấp thế giới','careers@zalo.me','zalo.careers',58
go
exec sp_UpdateCongTy 14,'Pizza Hut Digital Ventures' ,N'Tân Bình,Hồ Chí Minh',N'Pizza Pixar Pica Picachu','pizzahut@gmail.com','pizzahut.io',58
go
exec sp_UpdateCongTy 15,'Binance' ,N'Somewhere in Europe',N'Double to the heaven','binance@mail.com','binance.com',58
go
exec sp_UpdateCongTy 16,'ACB Bank' ,N'Hồ Chí Minh, Việt Nam',N'why not ABC? Cause we like','acbbank@mail.com','acb.com.vn',58
go
exec sp_UpdateCongTy 17,'LineTech Vietnam' ,N'Hồ Chí Minh, Việt Nam',N'Seems to be a foregin company','linetech@mail.com','linetechnology.com.vn',58
go
exec sp_UpdateCongTy 18,'Home Credit' ,N'Europe',N'Money is human life','homcredit@mail.com','homecredit.com.vn',58
go
exec sp_UpdateCongTy 19,'GFT Technologies' ,N'Singapore',N'Tech should be a plural noun, that is also ours','GFTTech@mail.com','gft.com.vn',58
go
exec sp_UpdateCongTy 20,'SaiGon Technology' ,N'Hồ Chí Minh, Việt Nam',N'Hoàng Sa, Trường Sa là của Việt Nam!','saigontech@mail.com','saigontech.com.vn',58
go

------------------------------Thêm dữ liệu ỨNG VIÊN (dùng stored procedure)
insert into UngVien(MaND)
select MaND from TaiKhoan where MaND > = 1 and MaND <=3
go

exec sp_UpdateUngVien 1, N'Nguyễn Minh Tuấn', Male, '2001-02-17' ,'0372591035','1956210100@hcmussh.edu.vn',58
go
exec sp_UpdateUngVien 2, N'Phạm Thu Trang', Female, '2001-08-27' ,'0123456789','1956210109@hcmussh.edu.vn',9
go
exec sp_UpdateUngVien 3, N'Tạ Thị Diệu Thắm', Female, '2001-06-01' ,'0914099822','1956210102@hcmussh.edu.vn',35
go

----------------------------Thêm dữ liệu CV ỨNG VIÊN (dùng stored procedure)
insert into CV_UngVien(MaUV)
select MaUV from UngVien where MaUV > = 1000 and MaND <= 1002
go

exec sp_Update_CVUngVien 1000,N'CV của Tuấn',N'Đại học',N'2 năm thất nghiệp','English',19,1,02
go
exec sp_Update_CVUngVien 1001,N'CV của trang',N'Đại học',N'2 năm quản lý','English',27,3,01
go
exec sp_Update_CVUngVien 1002,N'CV của Thắm',N'Đại học',N'2 năm sáng tạo','English',1,1,01
go

select * from UngVien
-----------------------------------------------------------------------Thêm CÔNG VIỆC-------------------------------------------------------------------
-----------------------------Techcombank
exec sp_ThemCongViec
	'Java Developer',N'Hỗ trợ thiết kế, phát triển các sản phẩm web....',100,30,1,01,2500,'2021-06-15','2021-08-15',10,1,24
exec sp_ThemCongViec
	'DevOps Engineer',N'...is a senior backend developer that can play two roles...',100,3,5,01,2500,'2021-06-21','2021-08-21',5,1,24
exec sp_ThemCongViec
	'Business Analyst',N'Tiếp nhận, phân tích và chủ động tư vấn các yêu cầu công nghệ cho các Khối nghiệp vụ',100,4,2,01,2500,'2021-06-24','2021-08-24',5,1,24
exec sp_ThemCongViec
	'IT Support Manager',N'Tổ chức thực hiện các chức năng nhiệm vụ của đơn vị theo quy định',100,4,3,04,1500,'2021-06-19','2021-08-19',10,1,24
exec sp_ThemCongViec
	'Solution Architect',N'design and develop technical solutions for business through studying...',100,3,4,02,3500,'2021-06-01','2021-08-01',1,1,58

-----------------------------FPT Software
exec sp_ThemCongViec
	'Senior Engineer',N'Highly engaging user experiences',101,1,5,01,3500,'2021-06-24','2021-08-24',5,1,24
exec sp_ThemCongViec
	'Software Data Analyst',N'Architect data pipelines and ETL jobs to ingest data...',101,42,2,01,4000,'2021-06-18','2021-08-18',1,1,24
exec sp_ThemCongViec
	'Product Owner',N'Tham gia vào dự án hệ thống ecommerce phục vụ quyền lợi của nhân viên với mô hình B2E...',101,4,6,01,4000,'2021-06-17','2021-08-17',1,1,24
exec sp_ThemCongViec
	'Ruby on Rails Developer',N'Working for large business unit of high profile Corporation in Europe...',101,14,1,02,2000,'2021-06-16','2021-08-16',1,1,58
exec sp_ThemCongViec
	'UI/UX Designer',N'Creates fantastic UI designs and fully interactive prototypes..',101,4,10,04,2500,'2021-06-23','2021-08-23',1,1,58

-----------------------------Viettel  Group
	exec sp_ThemCongViec
		'Data Scientist',N'Data Understanding, Data Cleaning, Data Integration...',102,13,11,03,3500,'2021-06-24','2021-08-24',5,1,24
	exec sp_ThemCongViec
		'Senior Bigdata Engineer',N'Xây dựng, phát triển hạ tầng công nghệ và triển khai các ứng dụng...',102,42,5,01,3000,'2021-06-25','2021-08-25',5,1,24
	exec sp_ThemCongViec
		'Java Engineer',N'Ứng dụng các kết quả phân tích dữ liệu dựa trên nền tảng dữ liệu lớn...',102,30,5,01,3500,'2021-06-23','2021-08-23',5,1,24
	exec sp_ThemCongViec
		'Software Engineer',N'Thiết kế và phát triển các module phần mềm trong các dự án phần mềm trên web...',102,26,5,02,3500,'2021-06-21','2021-08-21',5,1,24
	exec sp_ThemCongViec
		'Solution Architect',N'xây dựng, quy hoạch các hệ thống phần mềm hỗ trợ triển khai các quy trình nghiệp vụ...',102,42,4,01,2500,'2021-06-20','2021-08-20',5,1,24

-----------------------------------------------------STORED PROCEDURES------------------------------------
------------------------------------------1. Thêm Tài khoản
create proc sp_ThemTaiKhoan
(
	@MaLoaiTK int,
	@TenDangNhap varchar (50),
	@MatKhau varchar (50) 
)
AS 
BEGIN 
	INSERT INTO TaiKhoan ( MaLoaiTK, TenDangNhap, MatKhau) 
	VALUES ( @MaLoaiTK, @TenDangNhap, @MatKhau) 
END 
go
--
exec dbo.sp_ThemTaiKhoan  0, Test, 123466
go 

--------------------------------------------------2. update Tài khoản
create procedure sp_UpdateTaiKhoan
(	
	@MaND int,
	@MaLoaiTK int,
	@TenDangNhap varchar (50),
	@MatKhau varchar (50)
)
as
begin
	update TaiKhoan
	set MaLoaiTK=@MaLoaiTK,
		TenDangNhap=@TenDangNhap,
		MatKhau=@MatKhau
	where MaND=@MaND
end

exec sp_UpdateTaiKhoan 1,0,1956210100,minhtuan
go

--------------------------------------------------3. thêm công ty

create procedure sp_ThemCongTy
(
	@MaND int,
	@TenCongTy nvarchar (50),
	@DiaChi nvarchar (50),
	@MoTa nvarchar (100),
	@Email varchar (50),
	@Website varchar (50),
	@MaThanhPho int 
)
as
begin
	insert into CongTy ( MaND, TenCongTy, DiaChi, MoTa, Email, Website, MaThanhPho)
	values (@MaND, @TenCongTy, @DiaChi, @MoTa, @Email, @Website, @MaThanhPho)
end
go

exec sp_ThemCongTy  8,Ng,q,q,r,t,1
go

--------------------------------------------------4. update công ty
CREATE PROCEDURE sp_UpdateCongTy
(
	@MaND int,
	@TenCongTy nvarchar (50),
	@DiaChi nvarchar (50),
	@MoTa nvarchar (100),
	@Email varchar (50),
	@Website varchar (50),
	@MaThanhPho int 
)
AS 
BEGIN 
UPDATE CongTy
SET TenCongTy=@TenCongTy,
	Diachi= @Diachi,
	MoTa =@MoTa,
	Email= @Email,
	Website=@Website, 
	MaThanhPho=@MaThanhPho
WHERE  MaND=@MaND
END 

exec sp_UpdateCongTy 7,r,5,6,1,6,5
go

------------------------------------------------5. thêm Ứng viên
create procedure sp_ThemUngVien
(
	@MaND int,
	@HoTen nvarchar(50),
	@GioiTinh char (10),
	@NgaySinh datetime ,
	@SDT char (10),
	@Email varchar (50),
	@MaThanhPho int
)
as
begin
	insert into UngVien (MaND, HoTen, GioiTinh, NgaySinh, SDT, Email, MaThanhPho)
	values (@MaND, @HoTen, @GioiTinh, @NgaySinh, @SDT, @Email, @MaThanhPho)
end
go

exec sp_ThemUngVien 9,N'Nguyễn Minh Tèo',0,'2001-02-17',025647, asfqwtoqtpw, 10
go

------------------------------------------------6. update ứng viên
create PROCEDURE sp_UpdateUngVien
(
	@MaND int,
	@HoTen nvarchar(50),
	@GioiTinh char (10),
	@NgaySinh datetime ,
	@SDT char(10),
	@Email varchar (50),
	@MaThanhPho int
)
AS 
BEGIN 
UPDATE UngVien
SET HoTen = @HoTen,
	GioiTinh=@GioiTinh,
	Ngaysinh=@Ngaysinh,
	SDT= @SDT,
	Email= @Email,
	MaThanhPho= @MaThanhPho 
WHERE  MaND=@MaND
END 

EXEC sp_UpdateUngVien 9,agqgq,1,'2001-01-28',98,1,4
go

------------------------------------------------7.thêm cv_ứng viên
create procedure sp_ThemCVUngVien
(
	@MaUV int,
	@TieuDe nvarchar (100),
	@HocVan nvarchar (100) ,
	@KinhNghiem nvarchar (100),
	@NgoaiNgu nvarchar (50),
	@MaKyNang int,
	@MaViTriUT int,
	@MaLoaiCongViecUT int
)
as
begin
	insert into CV_UngVien ( MaUV, TieuDe, HocVan, KinhNghiem, NgoaiNgu, MaKyNang, MaViTriUT,MaLoaiCongViecUT)
	values ( @MaUV,@TieuDe, @HocVan, @KinhNghiem, @NgoaiNgu, @MaKyNang, @MaViTriUT, @MaLoaiCongViecUT)
end
go

exec sp_ThemCVUngVien 1002, CV, aff, qwrrrw, wrqw,1,2,3
go

------------------------------------------------8. update CV
CREATE PROCEDURE sp_Update_CVUngVien
(
	@MaUV int,
	@TieuDe nvarchar (100),
	@HocVan nvarchar (100) ,
	@KinhNghiem nvarchar (100),
	@NgoaiNgu nvarchar (50),
	@MaKyNang int,
	@MaViTriUT int,
	@MaLoaiCongViecUT int
)
AS 
BEGIN 
UPDATE CV_UngVien
SET
	MaUV=@MaUV, 
	TieuDe = @TieuDe,
	HocVan=@HocVan,
	KinhNghiem= @KinhNghiem,
	NgoaiNgu= @NgoaiNgu,
	MaKyNang= @MaKyNang,
	MaViTriUT=@MaViTriUT,
	MaLoaiCongViecUT=@MaLoaiCongViecUT 
WHERE  MaUV= @MaUV
END 

exec sp_Update_CVUngVien 1002, gqgga,qwtt,123,1513,2,5,1
go

-------------------------------------------------9. thêm công việc
create procedure sp_ThemCongViec
(
	@TenCongViec nvarchar (50),
	@MoTaCongViec nvarchar (100),
	@MaCongTy int,
	@MaKyNang int,
	@MaViTriUT int,
	@MaLoaiCongViecUT int,
	@MucLuong int,
	@NgayDang datetime,
	@NgayHetHan datetime,
	@SoLuong int,
	@TrangThai bit,
	@MaThanhPho int
)
as
begin
	insert into CongViec (TenCongViec, MoTaCongViec, MaCongTy, MaKyNang, MaViTriUT, MaLoaiCongViecUT, MucLuong, NgayDang,NgayHetHan,SoLuong, TrangThai, MaThanhPho)
	values (@TenCongViec, @MoTaCongViec, @MaCongTy, @MaKyNang, @MaViTriUT, @MaLoaiCongViecUT, @MucLuong, @NgayDang, @NgayHetHan,@SoLuong, @TrangThai, @MaThanhPho)
end
go

exec sp_ThemCongViec 'IT developer',afag,106,4,5,2,1000,'2021-01-31','2021-03-31',30, 1, 6
go

------------------------------------------------10. update công việc
CREATE PROCEDURE sp_UpdateCongViec
(
	@MaCongViec int,
	@TenCongViec nvarchar (50),
	@MoTaCongViec nvarchar (100),
	@MaCongTy int,
	@MaKyNang int,
	@MaViTriUT int,
	@MaLoaiCongViecUT int,
	@MucLuong int,
	@NgayDang datetime,
	@NgayHetHan datetime,
	@SoLuong int,
	@TrangThai bit,
	@MaThanhPho int
)
AS 
BEGIN 
UPDATE CONGVIEC
SET 
	TenCongViec=@TenCongViec, 
	MoTaCongViec=@MoTaCongViec, 
	MaCongTy=@MaCongTy,
	MaKyNang=@MaKyNang, 
	MaViTriUT=@MaViTriUT,
	MaLoaiCongViecUT=@MaLoaiCongViecUT,
	MucLuong=@MucLuong,
	NgayDang =@NgayDang,
	NgayHetHan=@NgayHetHan,
	SoLuong =@SoLuong, 
	TrangThai=@TrangThai,
	MaThanhPho=@MaThanhPho 
WHERE  MaCongViec=@MaCongViec
END

exec sp_UpdateCongViec 100009,DEVC,à,106,3,2,1,900,'2021-01-31','2021-03-31',30, 1, 6
go

---------------------------------------------11. thêm hồ sơ ứng tuyển
create proc sp_HoSoUngTuyen
(
	@MaCV int,
	@MaCongViec char (10),
	@NgayTaoHS datetime,
	@TrangThai bit
)
AS 
BEGIN 
INSERT INTO HoSoUngTuyen ( MaCV, MaCongViec, NgayTaoHS, TrangThai)
VALUES ( @MaCV, @MaCongViec, @NgayTaoHS, @TrangThai)
END
go

exec sp_HoSoUngTuyen 10007,100006,'2021-03-27',1
go

--------------------------------------------12. update hồ sơ ứng tuyển
create procedure sp_UpdateHoSoUngTuyen
(
	@MaCV int,
	@MaCongViec char (10),
	@NgayTaoHS datetime,
	@TrangThai bit
)
as
begin
	update HoSoUngTuyen
	set 
		MaCongViec=@MaCongViec,
		NgayTaoHS=@NgayTaoHS,
		TrangThai=@TrangThai
	where MaCV=@MaCV
end
go

exec sp_UpdateHoSoUngTuyen 10007,100009,'2021-03-26',1
go
--------------------------------------------------------Stored procedures chức năng---------------------------------------------
-------------------13. Tìm tất cả công việc phù hợp với ứng viên

create procedure sp_CongViecphuhop
(	
	@MaUV int
)
as
begin
	select MaCongViec, TenCongViec, MoTaCongViec, MaCongTy,MucLuong,NgayDang,NgayHetHan, SoLuong, TrangThai, MaThanhPho from CongViec
		join CV_UngVien on CongViec.MaKyNang=CV_UngVien.MaKyNang 
						and CongViec.MaViTriUT=CV_UngVien.MaViTriUT 
						and CongViec.MaLoaiCongViecUT=CV_UngVien.MaLoaiCongViecUT
	where CV_UngVien.MaUV=@MaUV
end
go
--
exec sp_CongViecphuhop 1005
go

-------------------14. Tìm ứng viên thỏa 2/3 yêu cầu của công việc và vị trí địa lý phù hợp

create procedure sp_UngVienphuhop
as
begin
	select distinct UngVien.MaUV, HoTen,GioiTinh, NgaySinh,SDT, Email, UngVien.MaThanhPho from UngVien 
		join CV_UngVien on UngVien.MaUV=CV_UngVien.MaUV 
		join CongViec on UngVien.MaThanhPho=CongViec.MaThanhPho
	where CongViec.MaKyNang=CV_UngVien.MaKyNang and CongViec.MaViTriUT=CV_UngVien.MaViTriUT
		or CongViec.MaViTriUT=CV_UngVien.MaViTriUT and CongViec.MaLoaiCongViecUT=CV_UngVien.MaLoaiCongViecUT
		or CongViec.MaKyNang=CV_UngVien.MaKyNang and CongViec.MaLoaiCongViecUT=CV_UngVien.MaLoaiCongViecUT
end
--
exec sp_UngVienphuhop

--------------------15. Tìm công việc theo kỹ năng, vị trí công việc, loại công việc

create procedure sp_TimCongViec
(
	@TenKyNang nvarchar(50),
	@TenViTri nvarchar(50),
	@TenLoaiCongViec nvarchar(50)
)
as
begin
	select MaCongViec, TenCongViec, MoTaCongViec, MaCongTy,MucLuong,NgayDang,NgayHetHan, SoLuong, TrangThai, MaThanhPho from CongViec
		join KyNang on CongViec.MaKyNang=KyNang.MaKyNang
		join ViTriUngTuyen on CongViec.MaViTriUT=ViTriUngTuyen.MaViTriUT
		join LoaiCongViec on CongViec.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
	where	TenKyNang = @TenKyNang 
		or	TenViTri= @TenViTri
		or	TenLoaiCongViec = @TenLoaiCongViec
end
go
--
exec sp_TimCongViec English,'',''
go

----------------------------------------------------------------TRIGGER--------------------------------------------
----------------1. Không thêm tài khoản ứng viên dưới 18 tuổi

create trigger UngVien_age
on UngVien
for insert, update
as
	begin
		declare @count int = 0

		select @count = count (*)  from inserted 
		where year(getdate())-year(inserted.NgaySinh) < 18

		if (@count > 0)
		begin
			print N'Bạn phải từ 18 tuổi trở lên'
				rollback tran
		end
	end
--	
insert into UngVien ( HoTen, GioiTinh, NgaySinh, SDT, Email,MaThanhPho)
values ('n',1,'2000-08-17',12,'a',12)
go

----------------2. không cho phép 1 công ty đăng 2 vị trí công việc trong 1 ngày (trên đà ý tưởng, không làm được)
alter trigger CongTy_post
on CongViec
for insert, update
as
	begin
		declare @NgayDang datetime
		declare @MaCongTy int = 0
		declare @MaCongTy2 int = 0

		select @NgayDang = inserted.NgayDang from inserted
		select @MaCongTy = inserted.MaCongTy from inserted
		select @MaCongTy2 = MaCongTy from CongViec

		if   exists ( select NgayDang from CongViec where @NgayDang = NgayDang)
		
			commit tran
		
	end

	
insert into CongViec (TenCongViec, MoTaCongViec, MaCongTy, MaKyNang, MaViTriUT, MaLoaiCongViecUT, MucLuong, NgayDang, NgayHetHan, SoLuong, TrangThai, MaThanhPho)
values ('a','a',125,5,4,2,122,'2021-06-21','2021-08-15',1,1,21)


exists (select MaCongTy from CongViec where MaCongTy = @MaCongTy) and
select * from CongViec
go

--------------------------Bonus: thêm tài khoản --> mã người dùng tự thêm
create trigger ThemTaiKhoan
on TaiKhoan
after insert 
as
	begin 
		declare @MaND int;
		declare @MaLoaiTK int;

		select @MaND = MaND from inserted
		select @MaLoaiTK=MaLoaiTK from inserted

		if  @MaLoaiTK = '1'
		insert into CongTy (MaND)
		values (@MaND)

		if @MaLoaiTK = '0'
		insert into UngVien (MaND)
		values (@MaND)

		print N'Mã người dùng vừa thêm: ' + cast (@MaND as nvarchar (10))
	end
--
exec sp_ThemTaiKhoan 0,toilatuan,minhtuan
go

-----------------------------------------------------Stored procedure lấy dữ liệu
-----------lấy dữ liệu ứng Viên

alter proc get_UV
(
@ID_UV int
)
as
begin 
	if (@ID_UV != 0)
	select UngVien.MaND,UngVien.MaUV,HoTen, GioiTinh,Email,SDT,TenThanhPho,NgaySinh,HocVan,KinhNghiem,TenKyNang,TenViTri,TenLoaiCongViec,TenDangNhap,MatKhau  from UngVien 
	join CV_UngVien on UngVien.MaUV=CV_UngVien.MaUV
	join ThanhPho on UngVien.MaThanhPho=ThanhPho.MaThanhPho
	join KyNang on CV_UngVien.MaKyNang= KyNang.MaKyNang
	join ViTriUngTuyen on CV_UngVien.MaViTriUT=ViTriUngTuyen.MaViTriUT
	join LoaiCongViec on CV_UngVien.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
	join TaiKhoan on TaiKhoan.MaND = UngVien.MaND
	where UngVien.MaUV=@ID_UV
	else
	select UngVien.MaND,UngVien.MaUV,HoTen, GioiTinh,Email,SDT,TenThanhPho,NgaySinh,HocVan,KinhNghiem,TenKyNang,TenViTri,TenLoaiCongViec,TenDangNhap,MatKhau from UngVien 
	join CV_UngVien on UngVien.MaUV=CV_UngVien.MaUV
	join ThanhPho on UngVien.MaThanhPho=ThanhPho.MaThanhPho
	join KyNang on CV_UngVien.MaKyNang= KyNang.MaKyNang
	join ViTriUngTuyen on CV_UngVien.MaViTriUT=ViTriUngTuyen.MaViTriUT
	join LoaiCongViec on CV_UngVien.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
	join TaiKhoan on TaiKhoan.MaND = UngVien.MaND
end

exec get_UV 1002

select * from UngVien
----------Lấy dữ liệu công ty
create proc get_CT
(
@ID_CT int
)
as
begin 
	if (@ID_CT != 0)
	select * from CongTy
	join TaiKhoan on TaiKhoan.MaND = CongTy.MaND
	where @ID_CT = MaCongTy
	else
	select * from CongTy
	join TaiKhoan on TaiKhoan.MaND = CongTy.MaND
end

exec get_CT 100

------------Lấy công việc của công ty
drop proc get_CVofCT
(
@ID_Job int
)
as
begin 
	if (@ID_Job != 0)
	select CongTy.MaCongTy,TenCongTy,DiaChi,Email,MoTa,Website,MaCongViec,TenCongViec,MoTaCongViec,TenKyNang,TenLoaiCongViec,TenViTri,TenThanhPho  from CongViec 
	join CongTy on CongViec.MaCongTy=CongTy.MaCongTy
	join ThanhPho on CongViec.MaThanhPho=ThanhPho.MaThanhPho
	join KyNang on CongViec.MaKyNang= KyNang.MaKyNang
	join ViTriUngTuyen on CongViec.MaViTriUT=ViTriUngTuyen.MaViTriUT
	join LoaiCongViec on CongViec.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
	where CongTy.MaCongTy = @ID_Job
	else
	select CongTy.MaCongTy,TenCongTy,DiaChi,Email,MoTa,Website,MaCongViec,TenCongViec,MoTaCongViec,TenKyNang,TenLoaiCongViec,TenViTri,TenThanhPho from CongViec 
	join CongTy on CongViec.MaCongTy=CongTy.MaCongTy
	join ThanhPho on CongViec.MaThanhPho=ThanhPho.MaThanhPho
	join KyNang on CongViec.MaKyNang= KyNang.MaKyNang
	join ViTriUngTuyen on CongViec.MaViTriUT=ViTriUngTuyen.MaViTriUT
	join LoaiCongViec on CongViec.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
end

exec get_CVofCT 100

-----------Lấy dữ liệu công việc
alter proc get_CV
(
@ID_CV int
)
as
begin 
	if (@ID_CV != 0)
	select *  from CongViec 
	join CongTy on CongViec.MaCongTy=CongTy.MaCongTy
	join ThanhPho on CongViec.MaThanhPho=ThanhPho.MaThanhPho
	join KyNang on CongViec.MaKyNang= KyNang.MaKyNang
	join ViTriUngTuyen on CongViec.MaViTriUT=ViTriUngTuyen.MaViTriUT
	join LoaiCongViec on CongViec.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
	where CongViec.MaCongViec = @ID_CV
	else
	select * from CongViec 
	join CongTy on CongViec.MaCongTy=CongTy.MaCongTy
	join ThanhPho on CongViec.MaThanhPho=ThanhPho.MaThanhPho
	join KyNang on CongViec.MaKyNang= KyNang.MaKyNang
	join ViTriUngTuyen on CongViec.MaViTriUT=ViTriUngTuyen.MaViTriUT
	join LoaiCongViec on CongViec.MaLoaiCongViecUT=LoaiCongViec.MaLoaiCongViecUT
end

exec get_CV 100


select * from CongTy 


------------------Thông tin tài khoản
create proc get_TKUV
as
select * from TaiKhoan 
join LoaiTaiKhoan on TaiKhoan.MaLoaiTK = LoaiTaiKhoan.MaLoaiTK
join UngVien on TaiKhoan.MaND = UngVien.MaND


exec get_TKUV 
-------------------------------------
create proc get_TKCT
as
select * from TaiKhoan 
join LoaiTaiKhoan on TaiKhoan.MaLoaiTK = LoaiTaiKhoan.MaLoaiTK
join CongTy on TaiKhoan.MaND = CongTy.MaND


exec get_TKCT


------------------------------------------
drop proc getSV
(
@ID int
)
as
begin 
	if (@ID != 0)
	select * from UngVien
	where @ID = MaUV
	else
	select * from UngVien
end

exec getSV 100

_______________________________________________
--------------------------TRIGGER----------------------------
----------------1. Không thêm tài khoản ứng viên dưới 18 tuổi
create trigger UngVien_age
on UngVien
for insert, update
as
begin
declare @count int = 0
select @count = count (*) from inserted
where year(getdate())-year(inserted.NgaySinh) < 18
if (@count > 0)
begin
print N'Bạn phải từ 18 tuổi trở lên'
rollback tran
end
end
--
insert into UngVien ( HoTen, GioiTinh, NgaySinh, SDT,
Email,MaThanhPho)
values ('n',1,'2000-08-17',12,'a',12)
go
_____________________________________________________________
------------------2.thêm tài khoản --> mã người dùng tự
thêm
create trigger ThemTaiKhoan
on TaiKhoan
after insert
as
begin
declare @MaND int;
declare @MaLoaiTK int;
select @MaND = MaND from inserted
select @MaLoaiTK=MaLoaiTK from inserted
if @MaLoaiTK = '1'
insert into CongTy (MaND)
values (@MaND)
if @MaLoaiTK = '0'
insert into UngVien (MaND)
values (@MaND)
print N'Mã người dùng vừa thêm: ' + cast (@MaND as
nvarchar (10))
end
--
exec sp_ThemTaiKhoan 0,toilatuan,minhtuan
go
