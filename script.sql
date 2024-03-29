USE [QLNhaHang]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaNguyenLieu] [varchar](50) NOT NULL,
	[MaHoaDonNhap] [varchar](50) NOT NULL,
	[SoLuong] [float] NULL,
	[DonGia] [money] NULL,
	[KhuyenMai] [nchar](10) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu] ASC,
	[MaHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuDB]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuDB](
	[MaPhieu] [varchar](50) NOT NULL,
	[MaMonAn] [varchar](50) NOT NULL,
	[MaLoai] [varchar](50) NULL,
	[SoLuong] [float] NULL,
	[GiamGia] [money] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_ChiTietPhieuDB] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaMonAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongDung]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongDung](
	[MaCongDung] [varchar](50) NOT NULL,
	[TenCongDung] [varchar](50) NULL,
 CONSTRAINT [PK_CongDung] PRIMARY KEY CLUSTERED 
(
	[MaCongDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDonNhap] [varchar](50) NOT NULL,
	[NgayNhap] [date] NULL,
	[MaNhanVien] [varchar](50) NULL,
	[MaNhaCungCap] [varchar](50) NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khach]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khach](
	[MaKhach] [varchar](50) NOT NULL,
	[TenKhach] [varchar](50) NULL,
	[DiaChi] [varchar](50) NULL,
	[DienThoai] [nchar](10) NULL,
 CONSTRAINT [PK_Khach] PRIMARY KEY CLUSTERED 
(
	[MaKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMon]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMon](
	[MaLoai] [varchar](50) NOT NULL,
	[TenLoai] [varchar](50) NULL,
 CONSTRAINT [PK_LoaiMon] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAn](
	[MaMonAn] [varchar](50) NOT NULL,
	[TenMonAn] [varchar](50) NULL,
	[MaCongDung] [varchar](50) NULL,
	[MaLoai] [varchar](50) NULL,
	[CachLam] [varchar](50) NULL,
	[YeuCau] [varchar](50) NULL,
	[DonGia] [money] NULL,
 CONSTRAINT [PK_MonAn] PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[MaNguyenLieu] [varchar](50) NOT NULL,
	[TenNguyenLieu] [varchar](50) NULL,
	[DonViTinh] [varchar](50) NULL,
	[SoLuong] [float] NULL,
	[DonGiaNhap] [money] NULL,
	[DonGiaBan] [money] NULL,
	[CongDung] [varchar](50) NULL,
	[YeuCau] [varchar](50) NULL,
	[ChongChiDinh] [varchar](50) NULL,
 CONSTRAINT [PK_NguyenLieu] PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieu_MonAn]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu_MonAn](
	[MaMonAn] [varchar](50) NOT NULL,
	[MaNguyenLieu] [varchar](50) NOT NULL,
	[SoLuong] [float] NULL,
 CONSTRAINT [PK_NguyenLieu_MonAn] PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC,
	[MaNguyenLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [varchar](50) NOT NULL,
	[TenNhaCungCap] [varchar](50) NULL,
	[DiaChi] [varchar](50) NULL,
	[DienThoai] [nchar](10) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](50) NOT NULL,
	[TenNhanVien] [varchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [varchar](50) NULL,
	[MaQue] [varchar](50) NOT NULL,
	[DienThoai] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatBan]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatBan](
	[MaPhieu] [varchar](50) NOT NULL,
	[MaKhach] [varchar](50) NULL,
	[MaNhanVien] [varchar](50) NULL,
	[NgayDat] [date] NULL,
	[NgayDung] [date] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_PhieuDatBan] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Que]    Script Date: 10/30/2019 9:42:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Que](
	[MaQue] [varchar](50) NOT NULL,
	[TenQue] [varchar](50) NULL,
 CONSTRAINT [PK_Que] PRIMARY KEY CLUSTERED 
(
	[MaQue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaNguyenLieu], [MaHoaDonNhap], [SoLuong], [DonGia], [KhuyenMai], [ThanhTien]) VALUES (N'1', N'1', 12, 123.0000, N'12        ', 123.0000)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaNguyenLieu], [MaHoaDonNhap], [SoLuong], [DonGia], [KhuyenMai], [ThanhTien]) VALUES (N'2', N'2', 123, 123.0000, N'2         ', 2134.0000)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaNguyenLieu], [MaHoaDonNhap], [SoLuong], [DonGia], [KhuyenMai], [ThanhTien]) VALUES (N'3', N'2', 123, 232.0000, N'1231      ', 12324.0000)
INSERT [dbo].[ChiTietPhieuDB] ([MaPhieu], [MaMonAn], [MaLoai], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'1', N'1', N'1', 12, 1.0000, 123.0000)
INSERT [dbo].[ChiTietPhieuDB] ([MaPhieu], [MaMonAn], [MaLoai], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'2', N'1', N'1', 312, 12312.0000, 123132.0000)
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung]) VALUES (N'1', N'1')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung]) VALUES (N'2', N'2')
INSERT [dbo].[CongDung] ([MaCongDung], [TenCongDung]) VALUES (N'3', N'3')
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [NgayNhap], [MaNhanVien], [MaNhaCungCap], [TongTien]) VALUES (N'1', CAST(N'1999-10-10' AS Date), N'1', N'1', 123)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [NgayNhap], [MaNhanVien], [MaNhaCungCap], [TongTien]) VALUES (N'2', CAST(N'1999-10-10' AS Date), N'1', N'2', 234)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [NgayNhap], [MaNhanVien], [MaNhaCungCap], [TongTien]) VALUES (N'3', CAST(N'1999-10-10' AS Date), N'1', N'3', 345)
INSERT [dbo].[Khach] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'1', N'1', N'1', N'1         ')
INSERT [dbo].[Khach] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'2', N'2', N'2', N'2         ')
INSERT [dbo].[Khach] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'3', N'3', N'3', N'3         ')
INSERT [dbo].[Khach] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'4', N'4', N'4', N'4         ')
INSERT [dbo].[LoaiMon] ([MaLoai], [TenLoai]) VALUES (N'1', N'm?n')
INSERT [dbo].[LoaiMon] ([MaLoai], [TenLoai]) VALUES (N'2', N'canh')
INSERT [dbo].[LoaiMon] ([MaLoai], [TenLoai]) VALUES (N'3', N'xào')
INSERT [dbo].[LoaiMon] ([MaLoai], [TenLoai]) VALUES (N'4', N'chiên1')
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [MaCongDung], [MaLoai], [CachLam], [YeuCau], [DonGia]) VALUES (N'1', N'a', N'1', N'1', N'1', N'1', 1.0000)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [MaCongDung], [MaLoai], [CachLam], [YeuCau], [DonGia]) VALUES (N'2', N'q', N'2', N'2', N'2', N'2', 2.0000)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [MaCongDung], [MaLoai], [CachLam], [YeuCau], [DonGia]) VALUES (N'3', N'ad', N'1', N'2', N'1', N'1', 231.0000)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [DonViTinh], [SoLuong], [DonGiaNhap], [DonGiaBan], [CongDung], [YeuCau], [ChongChiDinh]) VALUES (N'1', N'1', N'1', 123, 1.0000, 1.0000, N'1', N'1', N'1')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [DonViTinh], [SoLuong], [DonGiaNhap], [DonGiaBan], [CongDung], [YeuCau], [ChongChiDinh]) VALUES (N'2', N'2', N'2', 2, 2.0000, 2.0000, N'2', N'2', N'2')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [DonViTinh], [SoLuong], [DonGiaNhap], [DonGiaBan], [CongDung], [YeuCau], [ChongChiDinh]) VALUES (N'3', N'3', N'3', 3, 3.0000, 3.0000, N'3', N'3', N'3')
INSERT [dbo].[NguyenLieu_MonAn] ([MaMonAn], [MaNguyenLieu], [SoLuong]) VALUES (N'1', N'1', 12)
INSERT [dbo].[NguyenLieu_MonAn] ([MaMonAn], [MaNguyenLieu], [SoLuong]) VALUES (N'1', N'2', 12)
INSERT [dbo].[NguyenLieu_MonAn] ([MaMonAn], [MaNguyenLieu], [SoLuong]) VALUES (N'1', N'3', 2)
INSERT [dbo].[NguyenLieu_MonAn] ([MaMonAn], [MaNguyenLieu], [SoLuong]) VALUES (N'2', N'1', 122)
INSERT [dbo].[NguyenLieu_MonAn] ([MaMonAn], [MaNguyenLieu], [SoLuong]) VALUES (N'2', N'2', 5)
INSERT [dbo].[NguyenLieu_MonAn] ([MaMonAn], [MaNguyenLieu], [SoLuong]) VALUES (N'3', N'1', 12)
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [DienThoai]) VALUES (N'1', N'Nam', N'HN', N'0989      ')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [DienThoai]) VALUES (N'2', N'Ð?t', N'NÐ', N'0898      ')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [DienThoai]) VALUES (N'3', N'Lít', N'TN', N'234       ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [MaQue], [DienThoai]) VALUES (N'1', N'1', 1, CAST(N'1999-10-10' AS Date), N'1', N'1', N'1         ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [MaQue], [DienThoai]) VALUES (N'2', N'2', 0, CAST(N'1999-10-10' AS Date), N'2', N'2', N'2         ')
INSERT [dbo].[PhieuDatBan] ([MaPhieu], [MaKhach], [MaNhanVien], [NgayDat], [NgayDung], [TongTien]) VALUES (N'1', N'1', N'1', CAST(N'2000-10-10' AS Date), CAST(N'2000-10-11' AS Date), 1.0000)
INSERT [dbo].[PhieuDatBan] ([MaPhieu], [MaKhach], [MaNhanVien], [NgayDat], [NgayDung], [TongTien]) VALUES (N'2', N'1', N'1', CAST(N'2000-11-11' AS Date), CAST(N'2000-11-12' AS Date), 25.0000)
INSERT [dbo].[PhieuDatBan] ([MaPhieu], [MaKhach], [MaNhanVien], [NgayDat], [NgayDung], [TongTien]) VALUES (N'3', N'3', N'2', CAST(N'2019-11-11' AS Date), CAST(N'2019-11-12' AS Date), 123.0000)
INSERT [dbo].[Que] ([MaQue], [TenQue]) VALUES (N'1', N'HN')
INSERT [dbo].[Que] ([MaQue], [TenQue]) VALUES (N'2', N'Thái Nguyên')
INSERT [dbo].[Que] ([MaQue], [TenQue]) VALUES (N'3', N'HNN')
INSERT [dbo].[Que] ([MaQue], [TenQue]) VALUES (N'4', N'C')
INSERT [dbo].[Que] ([MaQue], [TenQue]) VALUES (N'5', N'D')
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap] FOREIGN KEY([MaHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDonNhap])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_NguyenLieu] FOREIGN KEY([MaNguyenLieu])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_NguyenLieu]
GO
ALTER TABLE [dbo].[ChiTietPhieuDB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuDB_LoaiMon] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiMon] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuDB] CHECK CONSTRAINT [FK_ChiTietPhieuDB_LoaiMon]
GO
ALTER TABLE [dbo].[ChiTietPhieuDB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuDB_MonAn] FOREIGN KEY([MaMonAn])
REFERENCES [dbo].[MonAn] ([MaMonAn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuDB] CHECK CONSTRAINT [FK_ChiTietPhieuDB_MonAn]
GO
ALTER TABLE [dbo].[ChiTietPhieuDB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuDB_PhieuDatBan] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuDatBan] ([MaPhieu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuDB] CHECK CONSTRAINT [FK_ChiTietPhieuDB_PhieuDatBan]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_CongDung] FOREIGN KEY([MaCongDung])
REFERENCES [dbo].[CongDung] ([MaCongDung])
GO
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_CongDung]
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_MonAn_MonAn] FOREIGN KEY([MaMonAn])
REFERENCES [dbo].[MonAn] ([MaMonAn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn] CHECK CONSTRAINT [FK_NguyenLieu_MonAn_MonAn]
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_MonAn_NguyenLieu] FOREIGN KEY([MaNguyenLieu])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn] CHECK CONSTRAINT [FK_NguyenLieu_MonAn_NguyenLieu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Que] FOREIGN KEY([MaQue])
REFERENCES [dbo].[Que] ([MaQue])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Que]
GO
ALTER TABLE [dbo].[PhieuDatBan]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDatBan_Khach] FOREIGN KEY([MaKhach])
REFERENCES [dbo].[Khach] ([MaKhach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDatBan] CHECK CONSTRAINT [FK_PhieuDatBan_Khach]
GO
ALTER TABLE [dbo].[PhieuDatBan]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDatBan_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDatBan] CHECK CONSTRAINT [FK_PhieuDatBan_NhanVien]
GO
