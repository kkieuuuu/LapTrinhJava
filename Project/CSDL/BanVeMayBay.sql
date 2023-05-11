Create Database BanVeMayBay
Use BanVeMayBay

CREATE TABLE tbKhachHang
(
MaKH NCHAR (6) not null CONSTRAINT pk_tbKhachHang PRIMARY KEY,
HoTenKH NVARCHAR (100) not null,
NgaySinhKH DATE,
GioiTinhKH NVARCHAR (10) CONSTRAINT ck_GioiTinh_tbKhachHang CHECK (GioiTinhKH IN (N'Nam', N'Nữ')),
DiaChiKH NVARCHAR (100),
SDTKH NVARCHAR (10) not null,
EmailKH NVARCHAR (50),
CMNDKH NVARCHAR (12),
)

CREATE TABLE tbNhanVien
(
MaNV NCHAR (6) not null CONSTRAINT pk_tbNhanvien PRIMARY KEY,
HoTenNV NVARCHAR (100),
NgaySinhNV DATE,
GioiTinhNV NCHAR (10),
CMNDNV NVARCHAR (12),
DiaChiNV NVARCHAR (100),
SDTNV NVARCHAR (11),
EmailNV NVARCHAR (50)
)


CREATE TABLE tbTaiKhoan
(
MaTK NCHAR (6) not null CONSTRAINT pk_tbTaiKhoan PRIMARY KEY,
MK NCHAR (30),
Quyen NCHAR(10),
MaNV NCHAR (6) CONSTRAINT fK_MaNV_tbTaiKhoan FOREIGN KEY (MaNV) REFERENCES tbNhanVien(MaNV),
)


--Hạng Vé
CREATE TABLE tbHangve
(
MaHV NCHAR (6) not null CONSTRAINT pk_tbHangve PRIMARY KEY,
TenHangVe NVARCHAR (50)
)

--Quản lý tuyến bay
CREATE TABLE tbTuyenBay
(
MaTB NCHAR (6) not null CONSTRAINT pk_tbTuyenBay PRIMARY KEY,
SanBayCat NVARCHAR (50),
GioCatCanh TIME,
SanBayHa NVARCHAR (50),
GioHaCanh TIME
)

--Lộ trình
CREATE TABLE tbLoTrinh
(
MaLT NCHAR (6) not null CONSTRAINT pk_tbLoTrinh PRIMARY KEY,
TenLoTrinh NVARCHAR (50)
)

--Lich Bay
CREATE TABLE tbLichBay
(
MaLB NCHAR (6) not null CONSTRAINT pk_tbLichBay PRIMARY KEY,
NgayHieuLuc DATETIME,
NgayKetThuc DATETIME
)

--Quản lý Máy Bay
CREATE TABLE tbMayBay
(
MaMB NCHAR (6) not null CONSTRAINT pk_tbMayBay PRIMARY KEY,
TenMB NVARCHAR (50),
NhaSX NVARCHAR (30),
KhoangCachToiDa NVARCHAR (30),
VanToc NVARCHAR (30),
TongSoGhe INT,
TongChieuDai NVARCHAR (30),
SaiCanh NVARCHAR (30),
ChieuCao NVARCHAR (30),
MoTa TEXT
)

--Quản lý Chuyến Bay
CREATE TABLE tbChuyenBay
(
MaCB NCHAR (6) not null CONSTRAINT pk_tbChuyenBay PRIMARY KEY,
MaMB NCHAR (6) CONSTRAINT fK_MaMB_tbChuyenBay FOREIGN KEY (MaMB) REFERENCES tbMayBay (MaMB),
MaLT NCHAR (6) CONSTRAINT fK_MaLT_tbChuyenBay FOREIGN KEY (MaLT) REFERENCES tbLoTrinh (MaLT),
MaLB NCHAR (6) CONSTRAINT fK_MaLB_tbChuyenBay FOREIGN KEY (MaLB) REFERENCES tbLichBay (MaLB),
MaTB NCHAR (6) CONSTRAINT fK_MaTB_tbChuyenBay FOREIGN KEY (MaTB) REFERENCES tbTuyenBay (MaTB),
TrangThai NVARCHAR (100)
)


--Quản lý thông tin chi tiết Vé Máy Bay
CREATE TABLE tbThongTinChiTietVe
(
MaVe NCHAR (6) not null CONSTRAINT pk_tbThongTinChiTietVe PRIMARY KEY,
MaCB NCHAR (6) CONSTRAINT fK_MaCB_tbThongTinChiTietVe FOREIGN KEY (MaCB) REFERENCES tbChuyenBay(MaCB),
MaMB NCHAR (6) CONSTRAINT fK_MaMB_tbThongTinChiTietVe FOREIGN KEY (MaMB) REFERENCES tbMayBay(MaMB),
MaHV NCHAR (6) CONSTRAINT fK_MaHV_tbThongTinChiTietVe FOREIGN KEY (MaHV) REFERENCES tbHangVe(MaHV),
TinhTrangVe NVARCHAR (50)
)

--Hóa đơn
CREATE TABLE tbHoaDon
(
MaHD NCHAR (6) not null CONSTRAINT pk_tbHoaDon PRIMARY KEY,
NgayLap DATETIME,
ThanhTien FLOAT,
MaNV NCHAR (6) CONSTRAINT fK_MaNV_tbHoaDon FOREIGN KEY (MaNV) REFERENCES tbNhanVien(MaNV),
MaKH NCHAR (6) CONSTRAINT fK_MaKH_tbHoaDon FOREIGN KEY (MaKH) REFERENCES tbKhachHang(MaKH)
)


-- CHÈN DỮ LIỆU KHÁCH HÀNG VÀO BẢNG tbKHACHHANG
INSERT INTO tbKhachHang (MaKH,HoTenKH,NgaySinhKH,GioiTinhKH,DiaChiKH,SDTKH,EmailKH,CMNDKH)
VALUES
('KH0001',N'Vũ Vương Vinh',Convert(date,'2001/12/23'),'Nam',N'Lê Lợi,Quận 1,TP.HCM','0939393993','vvv.v3@gmail.com','384858461'),
('KH0002',N'Lâm Hồ Thiên Tống',Convert(date,'2002/08/12'),'Nam',N'Lê Lợi,Quận 1,Tp.HCM','0949481584','thientong.lh@gmail.com','385848461'),
('KH0003',N'Grande Ariana',Convert(date,'1993/06/26'),N'Nữ',N'Phú Mỹ Hưng,Phường Mỹ Quý,Tp.Long Xuyên,An Giang','0999999999','anrianatocduoingua@gmail.com','483858888'),
('KH0004',N'Nguyễn Phong Phú Quý',Convert(date,'1995/05/04'),'Nam',N'140 Bàn Cờ,Phường 3,Quận 3,TP.HCM','0939231993','phuquy.nppq@gmail.com','618823451'),
('KH0005',N'Nguyễn Hưng Phát',Convert(date,'2002/04/21'),'Nam',N'Hẻm 125/48 Lê Đức Thọ,Phường 7,Gò Vấp,TP.HCM','0939789393','nhphat123@gmail.com','845823451'),
('KH0006',N'Lương Công Tiến',Convert(date,'2002/04/04'),'Nam',N'67 Số 30,Phường 7,Gò Vấp,TP.HCM','0942296545','tiencongluong@gmail.com','385821000'),
('KH0007',N'Tô Văn Duy Đang',Convert(date,'1993/12/12'),'Nam',N'77 Trần Huy Liệu,Phường 12,Phú Nhuận,Tp.HCM','0942393993','duydang@gmail.com','882345823'),
('KH0008',N'Trần Thị Như Ý',Convert(date,'1997/04/06'),N'Nữ',N'21 Thạch Lam,Hoà Thanh,Tân Phú,TP.HCM','0939432234','nhuytran@gmail.com','858233451'),
('KH0009',N'Đinh Như Ý',Convert(date,'1999/10/28'),N'Nữ',N'426 Tên Lửa,Bình Trị Đông B,Bình Tân,TP.HCM','0934767898','dinhnhuy@gmail.com','885823451'),
('KH0010',N'Trần Ý Vy',Convert(date,'1992/12/09'),N'Nữ',N'53 Xuân Hồng,Phường 4,Tân Bình,TP.HCM','0939390220','yvyyy@gmail.com','345123451'),
('KH0011',N'Nguyễn Thị Uyển Vy',Convert(date,'1994/06/15'),N'Nữ',N'380 Nguyễn Thái Sơn,Phường 5,Gò Vấp,Tp.HCM','0939212454','uyenvy123@gmail.com','834513451'),
('KH0012',N'Huỳnh Thị Mơ Muội',Convert(date,'1990/09/07'),N'Nữ',N'31A/30 Nguyễn Quý Yêm,quận Bình Tân,TP.HCM','0939789900','momuoi.htmm@gmail.com','883451451'),
('KH0013',N'Nguyễn Kiều Nhã Linh',Convert(date,'1996/10/06'),N'Nữ',N'792/26 Kha Vạn Cân,Phường Linh Đông,Quận Thủ Đức,TP.HCM','0939909808','nhalinh.nknl@gmail.com','882345151'),
('KH0014',N'Vũ Tường Nguyên',Convert(date,'1998/12/05'),'Nam',N'Số 22 Nguyễn Ảnh Thủ,Bà Điểm,Hóc Môn,TP.HCM','0939323433','nguyenvu2310@gmail.com','882334511'),
('KH0015',N'Đoàn Thị Kim Anh',Convert(date,'2000/11/04'),N'Nữ',N'84 Đặng Văn Ngữ,Phường 10,Phú Nhuận,TP.HCM','0931888999','kimanhdoan@gmail.com','882343451'),
('KH0016',N'Phạm Thị Kim Ngân',Convert(date,'2002/11/03'),N'Nữ',N'385A Tây Thạnh,Tân Phú,TP.HCM','0900900600','kimnganpham@gmail.com','812389551'),
('KH0017',N'Lại Thị Ngọc Hà',Convert(date,'2002/02/17'),N'Nữ',N'346 Lê Văn Sỹ,P.2,Tân Bình,TP.HCM','0939300400','laingocha@gmail.com','882319551'),
('KH0018',N'Đặng Minh Tâm',Convert(date,'2001/01/16'),'Nam',N'27 Lê Cao Lãng,Phú Thạnh,Tân Phú,TP.HCM','0939339900','dangminhtam@gmail.com','822319551'),
('KH0019',N'Thòng Tố Phương Anh',Convert(date,'2000/12/20'),N'Nữ',N'54 Đ.Cây Trâm,Phường 8,Gò Vấp,TP.HCM','0912343434','phuonganhhh@gmail.com','884219551'),
('KH0020',N'Lê Đức Trọng',Convert(date,'2001/11/21'),'Nam',N'337/2 Lê Văn Sỹ,Phường 1,Tân Bình,TP.HCM','0908166188','ductronggg@gmail.com','222319551'),
('KH0021',N'Trịnh Tuấn Dũng',Convert(date,'2002/01/10'),'Nam',N'269 Linh Đông,P.Linh Đông,Quận Thủ Đức,TP.HCM','0916338899','tuandungtrinh@gmail.com','222389551'),
('KH0022',N'Ngô Thị Tố Nữ',Convert(date,'2003/05/09'),N'Nữ',N'40/3A Đường Đông Lân Hưng Lân,ấp Hưng Lân,Bà Điểm,Hóc Môn,TP.HCM','0919293949','tonungo@gmail.com','127635946'),
('KH0023',N'Nguyễn Nhật Huy',Convert(date,'2001/07/08'),'Nam',N'33 Mã Lò,phường Bình Trị Đông A,quận Bình Tân,TP.HCM','0909888777','nhathuyday@gmail.com','389551551'),
('KH0024',N'Phạm Thị Tuyết Mai',Convert(date,'2002/09/07'),N'Nữ',N'27 Lê Cao Lãng,Phú Thạnh,Tân Phú,TP.HCM','0916200900','tuyetmaipham@gmail.com','22334151'),
('KH0025',N'Phan Đỗ Bảo Nhi',Convert(date,'2000/12/06'),N'Nữ',N'180 Đường Số 1,phường Bình Trị Đông B,quận Bình Tân,TP.HCM','0922393993','phandobaonhi@gmail.com','223823341'),
('KH0026',N'Lê Thị Ngọc Trâm',Convert(date,'1999/05/15'),N'Nữ',N'Phan Đăng Lưu,Phường 3,Bình Thạnh,TP.HCM','0915783993','lengoctram@gmail.com','223349551'),
('KH0027',N'Đinh Thảo Uyên',Convert(date,'1997/04/25'),N'Nữ',N'110 Ca Văn Thỉnh,Phường 13,Tân Bình,TP.HCM','0939707993','dinhthaouyen@gmail.com' ,'223419551'),
('KH0028',N'Huỳnh Ngọc Yến rang',Convert(date,'1989/03/23'),N'Nữ',N'76 Hai Bà Trưng,Bến Nghé,Quận 1,TP.HCM','0939398793','huynhngocyentranggg@gmail.com' ,'859323579'),
('KH0029',N'Nguyễn Thị Trà Giang',Convert(date,'1996/02/12'),N'Nữ',N'12H Nguyễn Thị Minh Khai,Đa Kao,Quận 1,TP.HCM','0939312343','tragiangday@gmail.com' ,'934206583'),
('KH0030',N'Ngô Thị Phượng Hằng',Convert(date,'2002/01/19'),N'Nữ',N'48A Nguyễn Duy Hiệu,Thảo Điền,Thành phố Thủ Đức,TP.HCM','0912953993','phuonghangisme@gmail.com' ,'934230583'),
('KH0031',N'Trần Hoàng Bảo Huy',Convert(date,'2001/01/17'),'Nam',N'219 Nguyễn Thị Định,Phường Bình Trưng Tây,Quận 2,TP.HCM','0926313993','tranhoangbaohuy@gmail.com','933242583'),
('KH0032',N'Mai Tuấn Kiệt',Convert(date,'2000/02/01'),'Nam',N'78 Đ.Tân Quý,Tân Quý,Tân Phú,TP.HCM','0987613993','maituankiet@gmail.com','934084023'),
('KH0033',N'Lê Nguyễn Tường Quy',Convert(date,'1992/06/02'),'Nam',N'419/2m Phan Xích Long,Phường 3,Phú Nhuận,TP.HCM','0939393993','tuongquylenguyen@gmail.com','934210583'),
('KH0034',N'Tôn Nữ Ngọc Thùy',Convert(date,'1998/04/04'),N'Nữ',N'38 Nguyễn Thượng Hiền,Phường 5,Quận 3,TP.HCM','0932266333','tonnungocthuy@gmail.com','934205813'),
('KH0035',N'Nguyễn Ngọc Anh Thư',Convert(date,'2002/10/06'),N'Nữ',N'243/29G Đường Tôn Đản,Phường 15,Quận 4,TP.HCM','0992925993','anhthunguyen@gmail.com','913420583'),
('KH0036',N'Nguyễn Thị Hồng Tiên',Convert(date,'2003/08/08'),N'Nữ',N'279 Lê Quang Sung,Phường 6,Quận 6,TP.HCM','0907334411','hongtiennguyen@gmail.com','193420583'),
('KH0037',N'Trần Trí',Convert(date,'2003/10/18'),'Nam',N'436 Lê Văn Việt,Hiệp Phú,Quận 9,TP.HCM','0901222999','trantriiii@gmail.com','293420583'),
('KH0038',N'Lê Ngô Tường Vy',Convert(date,'2001/12/12'),N'Nữ',N'7 Đường Tân Mỹ,Tân Thuận Tây,Quận 7,TP.HCM','0234553993','tuongvylengo@gmail.com','38823451'),
('KH0039',N'Nguyễn Hồng Khanh',Convert(date,'2002/11/16'),'Nam',N'9A Nguyễn Án,Phường 11,Quận 5,TP.HCM','0915234993','hongkhanhnguyen@gmail.com','885223451'),
('KH0040',N'Tạ Quốc Huy',Convert(date,'2000/09/24'),'Nam',N'Hẻm 200 Xóm Chiếu,Phường 14,Quận 4,TP.HCM','0915987993','taquochuy123@gmail.com','78823451'),
('KH0041',N'Nguyễn Tấn Phúc',Convert(date,'1994/07/14'),'Nam',N'193 Cô Giang,Quận 1,TP.HCM','0915712393','tanphucnguyen@gmail.com','908823451'),
('KH0042',N'Nguyễn Thị Hoài Thu',Convert(date,'1999/05/25'),N'Nữ',N'504-506 Hoàng Hữu Nam,Long Bình,Quận 9,TP.HCM','0915781233','hoaithunguyen@gmail.com','118823451'),
('KH0043',N'Ngô Quốc Tuấn',Convert(date,'1997/05/03'),'Nam',N'38d Học Lạc,Phường 14,Quận 5,TP.HCM','0915783111','ngoquoctuan111@gmail.com','128823451'),
('KH0044',N'Vũ Hoàng Quyên',Convert(date,'2003/11/01'),N'Nữ',N'210 Đường Nguyễn Duy Trinh,Phường Bình Trưng Tây,Quận 2,TP.HCM','0915799993','vuhoangquyen.vhq@gmail.com','8823451'),
('KH0045',N'Cao Thị Ngọc Bích',Convert(date,'2001/02/22'),N'Nữ',N'674 Xa lộ Hà Nội,Hiệp Phú,Quận 9,TP.HCM','0915783444','caongocbich@gmail.com','138823451'),
('KH0046',N'Đỗ Trung Kiên',Convert(date,'2000/04/14'),'Nam',N'144/24 Đường Hưng Phú, Phường 8, Quận 8,TP.HCM','0912383993','dochunkien@gmail.com','158823451'),
('KH0047',N'Lê Hồng Nhung',Convert(date,'2002/06/19'),N'Nữ',N'268 Lý Thái Tổ,Phường 1,Quận 3,TP.HCM','0915123493','hongnnhungle@gmail.com','248823451'),
('KH0048',N'Vũ Thị Hoàng Hậu',Convert(date,'1995/08/28'),N'Nữ',N'16 Đinh Tiên Hoàng,phường ĐaKao,Quận 1,TP.HCM','0914567993','hoanghauvu@gmail.com','238823451'),
('KH0049',N'Lê Hoàng Thanh Thảo',Convert(date,'1897/01/10'),N'Nữ',N'62/1 Đường Tân Mỹ,Tân Thuận Tây,Quận 7,TP.HCM','0999783993','lehoangthanhthao@gmail.com','822823451'),
('KH0050',N'Phan Duy Nhật Minh',Convert(date,'2002/02/12'),'Nam',N'122 Đường Hậu Giang,Phường 6,Quận 6,TP.HCM','0939000093','phanduynhatminh@gmail.com','832823451'),
('KH0051',N'Ngô Hoàng Phúc',Convert(date,'2000/03/01'),'Nam',N'387 Nguyễn Thị Định,Cát Lái,Quận 2,TP.HCM','0923453434','hoangphucngo@gmail.com','882342451'),
('KH0052',N'Lưu Thành Vinh',Convert(date,'1992/04/03'),'Nam',N'42 Đ. Hoàng Diệu, Phường 12, Quận 4,TP.HCM','0912399994','kuuthanhvinhhhh@gmail.com','881323451'),
('KH0053',N'Nguyễn Đức Thịnh',Convert(date,'1998/05/05'),'Nam',N'498 Hoà Hảo,Phường 5,Quận 10,TP.HCM','0912340000','ducthinhnguyen123@gmail.com','828623451'),
('KH0054',N'Nguyễn Minh Hiếu',Convert(date,'2002/09/07'),'Nam',N'924A,Tạ Quang Bửu,Phường 5,Quận 8,TP.HCM','0912000034','minhhieuuu@gmail.com','288234451'),
('KH0055',N'Mai Tấn Phát',Convert(date,'2003/12/09'),'Nam',N'16/73a Nguyễn Thiện Thuật,Phường 2,Quận 3,TP.HCM','0923343434','maitanphat123@gmail.com','288263451'),
('KH0056',N'Cao Quỳnh Như',Convert(date,'2003/11/19'),N'Nữ',N'136/1 Đ. Nguyễn Tri Phương,Phường 9,Quận 5,TP.HCM','0922343434','caoquynhnhu1911@gmail.com','884234451'),
('KH0057',N'Triệu Thị Thảo Nguyên',Convert(date,'2001/02/21'),N'Nữ',N'14b Làng Tăng Phú,Tăng Nhơn Phú A,Quận 9,TP.HCM','0956543434','thaonguyn2102@gmail.com','848263451'),
('KH0058',N'Trần Ngọc Thúy Diễm',Convert(date,'2002/03/22'),N'Nữ',N'An Dương Vương,Phường 3,Quận 5,TP.HCM','0912354434','tranngocthuydiem1234@gmail.com','882344251'),
('KH0059',N'Vũ Thị Hồng Nhung',Convert(date,'2000/04/27'),N'Nữ',N'200/8 Xóm Chiếu,Phường 16,Quận 4,TP.HCM','0942356434','hongnhungvu2704@gmail.com','882345216'),
('KH0060',N'Nguyễn Thị Kim Ngọc',Convert(date,'1994/05/05'),N'Nữ',N'51 Cao Thắng,Phường 3,Quận 3,TP.HCM','0987569424','Kimngocnguyen1505@gmail.com','882345129')





INSERT INTO tbNhanVien(MaNV,HoTenNV,NgaySinhNV,GioiTinhNV,CMNDNV,DiaChiNV,SDTNV,EmailNV) 
VALUES
('NV0001',N'Vũ Tường Linh',Convert(date,'2001/01/22'),N'Nữ','461212121',N'38 Nguyễn Thượng Hiền,P.5,Quận 3,TP.HCM','0123393993','vutuonglinh123@gmail.com'),
('NV0002',N'Vũ Duy Thông',Convert(date,'2002/03/12'),N'Nam','384824322',N'111 Nguyễn Xuân Khoát,Quận Tân Phú,TP.HCM','0939344493','duythonngvu@gmail.com'),
('NV0003',N'Doja Cat',Convert(date,'1995/10/21'),N'Nữ','384858574',N'189 Cống Quỳnh,P.Nguyễn Cư Trình,Quận 1,TP.HCM','0935312343','dojacat@gmail.com'),
('NV0004',N'Nicki Minaj',Convert(date,'1982/12/08'),N'Nữ','384322441',N'2 Trần Bình Trọng,P.5,Quận Bình Thạnh,TP.HCM','0852785457','nickiminaj@gmail.com'),
('NV0005',N'Cardi B',Convert(date,'1992/10/11'),N'Nữ','342435631',N'285 Hùng Vương,P.9,Quận 5,TP.HCM','0939300003','cardib@gmail.com'),
('NV0006',N'Nguyễn Phùng Vân Anh',Convert(date,'2002/02/12'),N'Nữ','345836251',N'277 Võ Văn Tần,P.5,Quận 3,TP.HCM','0852785457','npvananh@gmail.com'),
('NV0007',N'Nguyễn Thị Kim Kiều',Convert(date,'2002/06/24'),N'Nữ','388251634',N'386/43B Lê Văn Sỹ,P.14,Quận 3,TP.HCM','0339317215','nguyenthikimkieu21032002@gmail.com'),
('NV0008',N'Kim Kardashian',Convert(date,'1980/10/20'),N'Nam','384254634',N'90 Nguyễn Thượng Hiền,P.5,Quận 3,TP.HCM','0938527993','brightwinisreal.otp@gmail.com'),
('NV0009',N'Na Jaemin',Convert(date,'2000/06/13'),N'Nữ','382482532',N'663 Quang Trung,Quận Gò Vấp,TP.HCM','0939393993','nana@gmail.com'),
('NV0010',N'Trần Thủy Tiên',Convert(date,'2002/05/09'),N'Nữ','345352152',N'380 Nguyễn Tri Phương,P.4,Quận 10,TP.HCM','0339317215','janetran@gmail.com'),
('NV0011',N'Nguyễn Vũ Mẫn Nhi',Convert(date,'2002/03/12'),N'Nữ','382532543',N'881 Hoàng Sa,P.9,Quận 3,TP.HCM','0939112293','nguyenvumannhi@gmail.com'),
('NV0012',N'Nguyễn Cẩm Vy',Convert(date,'2002/01/24'),N'Nữ','352452561',N'272A Nguyễn Tri Phương,P.4,Quận 10,TP.HCM','0852785457','nguyencamvy.dth@gmail.com'),
('NV0013',N'Đặng Thanh Hiền',Convert(date,'1999/04/02'),N'Nữ','352628461',N'757 Hoàng Sa,Quận 3,TP.HCM','0939303393','thanhhien91@gmail.com'),
('NV0014',N'Lê Hoàng Dương',Convert(date,'1989/03/04'),N'Nam','384852413',N'183/29G Tân Hoà Đông,Phường 14,Quận 6,TP.HCM','0339852705','hoangduong98@gmail.com'),
('NV0015',N'Trần Xuân Hiên',Convert(date,'1999/02/16'),N'Nữ','321424858',N'99A Trần Văn Đang,P.9,Quận 3,TP.HCM','0827393993','xuanhiencp@gmail.com'),
('NV0016',N'Lê Nhật Tường',Convert(date,'1997/01/05'),N'Nam','471989921',N'145 Nguyễn Gia Trí,Phường 25,Quận Bình Thạnh,,TP.HCM','0339317215','lenhattuong@gmail.com'),
('NV0017',N'Vũ Minh Trí',Convert(date,'1989/12/10'),N'Nam','471989921',N'C218 Xóm Chiếu,Quận 4,TP.HCM','0903393993','chuyenvientuvanpk@gmail.com'),
('NV0018',N'Vũ Thu Phương',Convert(date,'1999/06/20'),N'Nam','412314531',N'243/29E Tôn Đản,P.15,Quận 4,TP.HCM','0852785457','phuongacb@gmail.com'),
('NV0019',N'Đoàn Kim Anh',Convert(date,'1999/10/03'),N'Nữ','135314531',N'150 Lê Văn Sỷ,Phường 10,Phú Nhuận,TP.HCM','0939393993','kkanh@gmail.com'),
('NV0020',N'Quách Xuân Lâm',Convert(date,'1996/05/09'),N'Nam','131314256',N'223 Trần Bình Trọng,Quận 5,TP.HCM','0930339333','quachxuanlam@gmail.com'),
('NV0021',N'Trần Tùng Duy',Convert(date,'2000/12/27'),N'Nam','451234423',N'346 Lê Văn Sỹ,Phường 2,Quận Tân Bình,TP.HCM','0852785457','tungtranduy91@gmail.com'),
('NV0022',N'Hồ Phương Anh',Convert(date,'1998/08/04'),N'Nữ','245512346',N'Hẻm 386/43B Lê Văn Sỹ,Phường 14,Quận 3,TP.HCM','0085278993','phuonganh@gmail.com'),
('NV0023',N'Mai Phương Anh',Convert(date,'1997/04/06'),N'Nữ','134535644',N'147 đường số 9,Phước Bình,Quận 9,TP.HCM','0339317215','phanhhh@gmail.com'),
('NV0024',N'Lưu Kiều Hương',Convert(date,'2002/11/08'),N'Nữ','123423224',N'187/4 Mai Xuân Thưởng,Phường 5,Quận 6,TP.HCM','0930852783','kieuhuongluu@gmail.com'),
('NV0025',N'Nguyễn Việt Dũng',Convert(date,'1998/09/11'),N'Nam','245635356',N'493 Trường Chinh,Phường 14,Quận Tân Bình,TP.HCM','0339317215','nguyenvietdung@gmail.com'),
('NV0026',N'Đỗ Hồng Anh',Convert(date,'1992/07/22'),N'Nữ','245456357',N'12 Tổ 1 KP1,Hiệp Thành,Quận 12,TP.HCM','0939393993','dohonganh@gmail.com'),
('NV0027',N'Nguyễn Ngọc Trúc',Convert(date,'2002/05/02'),N'Nữ','476424562',N'321 Lãnh Binh Thăng,Phường 8,Quận 11,TP.HCM','0852785457','nguyenngoctruc@gmail.com'),
('NV0028',N'Hoàng Việt Quang Huy',Convert(date,'2002/03/14'),N'Nam','254456727',N'319 Điện Biên Phủ,Quận Bình Thạnh,TP.HCM','0939393993','hoangvietquanghuy@gmail.com'),
('NV0029',N'Lê Minh Hiếu',Convert(date,'2002/01/17'),N'Nam','435564887',N'72 Trần Đình Xu,P.Cầu Kho,Quận 1,TP.HCM','0852783113','minhhieu@gmail.com'),
('NV0030',N'Trần Tố Tố',Convert(date,'1995/12/18'),N'Nữ','244887564',N'116/11 Phan Đăng Lưu,P.3,Quận Phú Nhuận,TP.HCM','0931111193','totoloto@gmail.com'),
('NV0031',N'Đặng Giáng Mi',Convert(date,'2002/10/23'),N'Nữ','654762242',N'60A Cao Thắng, P.5,Quận 3,TP.HCM','0939222293','giangmi@gmail.com'),
('NV0032',N'Nguyễn Giáng Son',Convert(date,'1998/08/28'),N'Nữ','566676883',N'835/17E Trần Hưng Đạo,P.1,Quận 5,TP.HCM','0912313993','giangson@gmail.com'),
('NV0033',N'Liễu Liễu',Convert(date,'1998/06/03'),N'Nữ','243678327',N'143 Lê Quang Sung,Quận 6,TP.HCM','0332317215','lieulieu@gmail.com'),
('NV0034',N'Trương Mỹ Lệ',Convert(date,'2000/04/07'),N'Nữ','343327242',N'243/29G Tôn Đản,phường 15,quận 4,TP.HCM','0851735457','milene@gmail.com'),
('NV0035',N'Tú Tú',Convert(date,'1991/02/14'),N'Nữ','647821347',N'9 Nguyễn Án,P.11,Quận 5,TP.HCM','0929299113','tutu@gmail.com'),
('NV0036',N'Liễu Liễu',Convert(date,'1997/12/28'),N'Nữ','245353821',N'Hẻm 419/2M Phan Xích Long,P.3,Quận Phú Nhuận,TP.HCM','0937364313','thuylieu@gmail.com'),
('NV0037',N'Tôn Ngọc Nữ',Convert(date,'1998/09/19'),N'Nữ','132327523',N'433/44 Lê Đại Hành,Phường 11,Quận 11,TP.HCM','0909813993','ngocnu@gmail.com'),
('NV0038',N'Nhã Lan Thanh',Convert(date,'1993/06/01'),N'Nữ','452313821',N'187 Cống Quỳnh,P.Phạm Ngũ Lão,Quận 1,TP.HCM','0990986332','nhalanthanh@gmail.com'),
('NV0039',N'Kylie Jenner',Convert(date,'1997/08/10'),N'Nữ','245821327',N'Số 22 Nguyễn Ảnh Thủ,Bà Điểm,Hóc Môn,TP.HCM','0109021213','chaquyen@gmail.com'),
('NV0040',N'Kendall Jenner',Convert(date,'1995/11/03'),N'Nữ','535721364',N'76 Nguyễn Văn Thủ,P.Đa Kao,Quận 1,TP.HCM','0981927613','sorimongtuyen@gmail.com')



INSERT INTO tbTaiKhoan(MaTK,MK,Quyen, MaNV) 
VALUES
('admin1','123','1','NV0001'),
('user01','123','0','NV0002')



INSERT INTO tbHangve(MaHV,TenHangVe) 
VALUES
('HV0001','Hạng Thương Gia'),
('HV0002','Hạng Phổ Thông Đặc Biệt'),
('HV0003','Hạng Phổ Thông')

INSERT INTO tbLichBay(MaLB,NgayHieuLuc,NgayKetThuc) 
VALUES
('LB0001',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0002',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0003',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0004',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0005',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0006',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0007',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0008',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0009',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0010',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0011',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0012',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0013',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0014',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0015',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0016',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0017',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0018',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0019',Convert(date,'2022/01/01'),Convert(date,'1995/12/31')),
('LB0020',Convert(date,'2022/01/01'),Convert(date,'1995/12/31'))


INSERT INTO tbLoTrinh(MaLT,TenLoTrinh) 
VALUES
('LT0001','Tp.HCM -> Hà Nội'),
('LT0002','Tp.HCM -> Phú Quốc'),
('LT0003','Tp.HCM -> Nha Trang'),
('LT0004','Tp.HCM -> Đà Nẵng'),
('LT0005','Tp.HCM -> Huế'),
('LT0006','Tp.HCM -> Vinh'),
('LT0007','Tp.HCM -> Cần Thơ'),
('LT0008','Tp.HCM -> Rạch Giá'),
('LT0009','Hà Nội -> Tp.HCM'),
('LT0010','Phú Quốc -> Tp.HCM'),
('LT0011','Nha Trang -> Tp.HCM'),
('LT0012','Đà Nẵng -> Tp.HCM'),
('LT0013','Huế -> Tp.HCM'),
('LT0014','Vinh -> Tp.HCM'),
('LT0015','Cần Thơ -> Tp.HCM'),
('LT0016','Rạch Giá -> Tp.HCM'),
('LT0017','Hà Nội -> Phú Quốc'),
('LT0018','Phú Quốc - > Hà Nội'),
('LT0019','Hà Nội -> Đà Nẵng'),
('LT0020','Đà Nẵng -> Hà Nội')

INSERT INTO tbMayBay(MaMB,TenMB, NhaSX, KhoangCachToiDa, VanToc, TongSoGhe, TongChieuDai, SaiCanh, ChieuCao, MoTa) 
VALUES
('MB0001','BOEING 787','Boeing','15.750 km','954 km/h','274','63.73m','60.93m','18.76m','Cấu hình và số lượng ghế có thể thay đổi theo tình hình khai thác thực tế'),
('MB0002','AIRBUS A350','Airbus','14.350 km','901 km/h','305','66.89m','64.75m','17.05m','Cấu hình và số lượng ghế có thể thay đổi theo tình hình khai thác thực tế'),
('MB0003','AIRBUS A321','Airbus','5.600 km','950 km/h','184','44.51m' ,'34.1m','11.76m','Cấu hình và số lượng ghế có thể thay đổi theo tình hình khai thác thực tế')




INSERT INTO tbTuyenBay(MaTB,SanBayCat,GioCatCanh,SanBayHa,GioHaCanh) 
VALUES
('TB0001','Tp.HCM','06:00:00','Hà Nội','08:10:00'),
('TB0002','Tp.HCM','06:00:00','Phú Quốc','07:10:00'),
('TB0003','Tp.HCM','06:00:00','Nha Trang','07:10:00'),
('TB0004','Tp.HCM','06:00:00','Đà Nẵng','07:30:00'),
('TB0005','Tp.HCM','07:00:00','Huế','08:30:00'),
('TB0006','Tp.HCM','07:00:00','Vinh','08:45:00'),
('TB0007','Tp.HCM','07:00:00','Cần Thơ','07:45:00'),
('TB0008','Tp.HCM','07:00:00','Rạch Giá','07:45:00'),
('TB0009','Hà Nội','07:00:00','Tp.HCM','09:10:00'),
('TB0010','Phú Quốc','10:00:00','Tp.HCM','11:10:00'),
('TB0011','Nha Trang','12:00:00','Tp.HCM','13:10:00'),
('TB0012','Đà Nẵng','14:10:00','Tp.HCM','15:10:00'),
('TB0013','Huế','15:00:00','Tp.HCM','16:10:00'),
('TB0014','Vinh','16:10:00','Tp.HCM','17:30:00'),
('TB0015','Cần Thơ','07:10:00','Tp.HCM','08:30:00'),
('TB0016','Rạch Giá','07:10:00','Tp.HCM','08:30:00'),
('TB0017','Hà Nội','18:10:00','Phú Quốc','21:10:00'),
('TB0018','Phú Quốc','18:10:00','Hà Nội','21:10:00'),
('TB0019','Hà Nội','20:30:00','Đà Nẵng','21:30:00'),
('TB0020','Đà Nẵng','20:30:00','Hà Nội','21:30:00')


INSERT INTO tbChuyenBay(MaCB,MaMB, MaLT, MaLB,MaTB, TrangThai) 
VALUES
('CB0001','MB0001','LT0001','LB0001','TB0001','Bay Thẳng'),
('CB0002','MB0001','LT0002','LB0002','TB0002','Bay Thẳng'),
('CB0003','MB0001','LT0003','LB0003','TB0003','Bay Thẳng'),
('CB0004','MB0001','LT0004','LB0004','TB0004','Bay Thẳng'),
('CB0005','MB0001','LT0005','LB0005','TB0005','Tạm Dừng Bay'),
('CB0006','MB0001','LT0006','LB0006','TB0006','Bay Thẳng'),
('CB0007','MB0001','LT0007','LB0007','TB0007','Bay Thẳng'),
('CB0008','MB0001','LT0008','LB0008','TB0008','Bay Thẳng'),
('CB0009','MB0001','LT0009','LB0009','TB0009','Bay Thẳng'),
('CB0010','MB0002','LT0010','LB0010','TB0010','Bay Thẳng'),
('CB0011','MB0002','LT0011','LB0011','TB0011','Bay Thẳng'),
('CB0012','MB0002','LT0012','LB0012','TB0012','Bay Thẳng'),
('CB0013','MB0002','LT0013','LB0013','TB0013','Tạm Dừng Bay'),
('CB0014','MB0002','LT0014','LB0014','TB0014','Tạm Dừng Bay'),
('CB0015','MB0002','LT0015','LB0015','TB0015','Bay Thẳng'),
('CB0016','MB0003','LT0016','LB0016','TB0016','Bay Thẳng'),
('CB0017','MB0003','LT0017','LB0017','TB0017','Bay Thẳng'),
('CB0018','MB0003','LT0018','LB0018','TB0018','Bay Thẳng'),
('CB0019','MB0003','LT0019','LB0019','TB0019','Bay Thẳng'),
('CB0020','MB0003','LT0020','LB0020','TB0020','Bay Thẳng')



INSERT INTO tbThongTinChiTietVe(MaVe,MaCB,MaMB,MaHV,TinhTrangVe) 
VALUES
('MV0001','CB0003','MB0001','HV0001','Hết Vé'),
('MV0002','CB0004','MB0001','HV0002','Còn Vé'),
('MV0003','CB0001','MB0001','HV0003','Còn Vé'),
('MV0004','CB0002','MB0001','HV0003','Còn Vé'),
('MV0005','CB0007','MB0001','HV0003','Còn Vé'),
('MV0006','CB0008','MB0001','HV0001','Còn Vé'),
('MV0007','CB0009','MB0001','HV0002','Còn Vé'),
('MV0008','CB0010','MB0002','HV0003','Còn Vé'),
('MV0009','CB0011','MB0002','HV0003','Còn Vé'),
('MV0010','CB0012','MB0002','HV0001','Còn Vé'),
('MV0011','CB0013','MB0002','HV0002','Còn Vé'),
('MV0012','CB0014','MB0002','HV0003','Còn Vé'),
('MV0013','CB0015','MB0002','HV0003','Còn Vé'),
('MV0014','CB0016','MB0003','HV0003','Còn Vé'),
('MV0015','CB0017','MB0003','HV0003','Còn Vé'),
('MV0016','CB0018','MB0003','HV0001','Hết Vé'),
('MV0017','CB0019','MB0003','HV0002','Còn Vé'),
('MV0018','CB0020','MB0003','HV0003','Còn Vé'),
('MV0019','CB0005','MB0001','HV0003','Còn Vé'),
('MV0020','CB0006','MB0001','HV0003','Còn Vé'),
('MV0021','CB0001','MB0001','HV0003','Còn Vé'),
('MV0022','CB0003','MB0001','HV0002','Còn Vé'),
('MV0023','CB0005','MB0001','HV0003','Còn Vé'),
('MV0024','CB0011','MB0002','HV0003','Còn Vé'),
('MV0025','CB0007','MB0001','HV0001','Còn Vé'),
('MV0026','CB0009','MB0001','HV0003','Còn Vé'),
('MV0027','CB0013','MB0002','HV0002','Còn Vé'),
('MV0028','CB0015','MB0002','HV0003','Còn Vé'),
('MV0029','CB0019','MB0003','HV0001','Còn Vé'),
('MV0030','CB0017','MB0003','HV0002','Còn Vé'),
('MV0031','CB0002','MB0001','HV0003','Còn Vé')



	  
INSERT INTO tbHoaDon(MaHD,NgayLap,ThanhTien,MaNV,MaKH) 
VALUES
('HD0001',Convert(date,'2022/08/01'),'','NV0001','KH0001'),
('HD0002',Convert(date,'2022/08/02'),'','NV0002','KH0002'),
('HD0003',Convert(date,'2022/08/01'),'','NV0003','KH0003'),
('HD0004',Convert(date,'2022/08/03'),'','NV0004','KH0004'),
('HD0005',Convert(date,'2022/08/01'),'','NV0005','KH0005'),
('HD0006',Convert(date,'2022/08/04'),'','NV0006','KH0006'),
('HD0007',Convert(date,'2022/08/02'),'','NV0007','KH0007'),
('HD0008',Convert(date,'2022/08/05'),'','NV0008','KH0008'),
('HD0009',Convert(date,'2022/08/02'),'','NV0009','KH0009'),
('HD0010',Convert(date,'2022/08/05'),'','NV0010','KH0010'),
('HD0011',Convert(date,'2022/08/02'),'','NV0011','KH0011'),
('HD0012',Convert(date,'2022/08/06'),'','NV0012','KH0012'),
('HD0013',Convert(date,'2022/08/02'),'','NV0013','KH0013'),
('HD0014',Convert(date,'2022/08/07'),'','NV0014','KH0014'),
('HD0015',Convert(date,'2022/08/08'),'','NV0015','KH0015'),
('HD0016',Convert(date,'2022/08/09'),'','NV0016','KH0016'),
('HD0017',Convert(date,'2022/08/10'),'','NV0017','KH0017'),
('HD0018',Convert(date,'2022/08/11'),'','NV0018','KH0018'),
('HD0019',Convert(date,'2022/08/12'),'','NV0019','KH0019'),
('HD0020',Convert(date,'2022/08/13'),'','NV0020','KH0020'),
('HD0021',Convert(date,'2022/08/14'),'','NV0021','KH0021'),
('HD0022',Convert(date,'2022/08/15'),'','NV0022','KH0022'),
('HD0023',Convert(date,'2022/08/16'),'','NV0023','KH0023'),
('HD0024',Convert(date,'2022/08/17'),'','NV0024','KH0024'),
('HD0025',Convert(date,'2022/08/18'),'','NV0025','KH0025'),
('HD0026',Convert(date,'2022/08/19'),'','NV0026','KH0026'),
('HD0027',Convert(date,'2022/08/20'),'','NV0027','KH0027'),
('HD0028',Convert(date,'2022/08/21'),'','NV0028','KH0028'),
('HD0029',Convert(date,'2022/08/22'),'','NV0029','KH0029'),
('HD0030',Convert(date,'2022/08/23'),'','NV0030','KH0040'),
('HD0031',Convert(date,'2022/08/24'),'','NV0031','KH0051'),
('HD0032',Convert(date,'2022/08/25'),'','NV0032','KH0042'),
('HD0033',Convert(date,'2022/08/26'),'','NV0033','KH0053'),
('HD0034',Convert(date,'2022/08/27'),'','NV0034','KH0044'),
('HD0035',Convert(date,'2022/08/28'),'','NV0035','KH0055'),
('HD0036',Convert(date,'2022/08/29'),'','NV0036','KH0046'),
('HD0037',Convert(date,'2022/08/30'),'','NV0037','KH0057'),
('HD0038',Convert(date,'2022/08/31'),'','NV0038','KH0048'),
('HD0039',Convert(date,'2022/08/03'),'','NV0039','KH0059'),
('HD0040',Convert(date,'2022/08/07'),'','NV0040','KH0060')
	  
SELECT cb.*
FROM tbChuyenBay cb

SELECT tb.*
FROM tbTuyenBay tb


SELECT cb.MaCB, mb.MaMB, mb.TenMB, cb.TrangThai, lt.MaLT, lt.TenLoTrinh, lb.MaLB, tb.MaTB, tb.SanBayCat,tb.GioCatCanh,tb.SanBayHa, tb.GioHaCanh FROM tbChuyenBay cb, tbLoTrinh lt, tbLichBay lb, tbTuyenBay tb, tbMayBay mb WHERE cb.MaMB = mb.MaMB AND cb.MaLT = lt.MaLT AND cb.MaLB = lb.MaLB AND cb.MaTB = tb.MaTB

