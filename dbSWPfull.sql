USE [swpfull]
GO
/****** Object:  Table [dbo].[tb_Cart]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[ShopName] [nvarchar](500) NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Discount]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Discount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [ntext] NULL,
	[DiscountPercent] [decimal](18, 2) NULL,
	[EndDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[Status] [bit] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_tb_Discount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Feedback]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Rate] [int] NULL,
	[Detail] [ntext] NULL,
 CONSTRAINT [PK_tb_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Order]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
	[UserID] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[TotalPrice] [decimal](18, 0) NOT NULL,
	[OrderDate] [datetime] NULL,
	[PaymentID] [int] NULL,
 CONSTRAINT [PK_tb_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_OrderDetail]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductPrice] [decimal](18, 0) NULL,
	[DiscountPrice] [decimal](18, 0) NULL,
	[SubTotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tb_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Payment]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[PaymentDate] [datetime] NULL,
	[Amount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tb_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Post]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
 CONSTRAINT [PK_tb_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Product]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Status] [bit] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Decription] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[QuantitySold] [int] NULL,
	[CateID] [varchar](50) NOT NULL,
	[ShopID] [int] NULL,
	[Rate] [int] NULL,
	[Video] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Image1] [varchar](max) NULL,
	[Image2] [varchar](max) NULL,
	[Image3] [varchar](max) NULL,
	[Image4] [varchar](max) NULL,
	[DiscountID] [int] NULL,
 CONSTRAINT [PK_tb_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ProductCategory]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ProductCategory](
	[CateID] [varchar](50) NOT NULL,
	[CateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Profit]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Profit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Orderdate] [datetime] NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tb_Sales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Role]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Role](
	[RoleID] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Shop]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Shop](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [int] NULL,
	[ShopName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[UserID] [int] NULL,
	[Is_verified] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Token]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Token](
	[ID] [int] NOT NULL,
	[Token] [ntext] NULL,
	[UserID] [int] NOT NULL,
	[ExpiryDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Token] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_User]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_User](
	[Dob] [datetime] NULL,
	[Gender] [nvarchar](50) NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[RoleID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[Avatar] [image] NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[ShopID] [int] NULL,
 CONSTRAINT [PK_tb_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_WishList]    Script Date: 6/8/2023 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_WishList](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_tb_WishList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tb_Discount] ON 

INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (1, N'50%', N'Mã giảm giá 50% giá trị đơn hàng', CAST(0.50 AS Decimal(18, 2)), CAST(0x0000B019009C8E20 AS DateTime), CAST(0x0000B01B00A281DA AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (2, N'25%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.25 AS Decimal(18, 2)), CAST(0x0000B01B00A281DA AS DateTime), CAST(0x0000B187009C8E20 AS DateTime), 1, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (3, N'15%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.15 AS Decimal(18, 2)), CAST(0x0000B05900000000 AS DateTime), CAST(0x0000AF9E00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (4, N'10%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.10 AS Decimal(18, 2)), CAST(0x0000AFF900000000 AS DateTime), CAST(0x0000AF9C00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (5, N'20%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.20 AS Decimal(18, 2)), CAST(0x0000B03C00000000 AS DateTime), CAST(0x0000AF9F00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (6, N'5%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.05 AS Decimal(18, 2)), CAST(0x0000B02900000000 AS DateTime), CAST(0x0000AFBB00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (9, N'8%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.08 AS Decimal(18, 2)), CAST(0x0000B06600000000 AS DateTime), CAST(0x0000AFD900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (11, N'30%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.30 AS Decimal(18, 2)), CAST(0x0000B08600000000 AS DateTime), CAST(0x0000B01A00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Discount] ([ID], [Name], [Description], [DiscountPercent], [EndDate], [StartDate], [Status], [ProductID]) VALUES (12, N'2%', N'Mã giảm giá 25% giá trị đơn hàng', CAST(0.02 AS Decimal(18, 2)), CAST(0x0000B09900000000 AS DateTime), CAST(0x0000AF9E00000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Discount] OFF
SET IDENTITY_INSERT [dbo].[tb_Product] ON 

INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (1, N'chim sẻ', NULL, CAST(123123 AS Decimal(18, 0)), N'chim sẻ j đó', N'chim sẻ đọc nhất việt nam', 0, N'chim', 1, NULL, NULL, N'https://th.bing.com/th/id/OIP.d7Nv6Tst_zXDuflERpvIxgHaDe?w=338&h=164&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/OIP.AtzDjcF6CQEanApHRSZoLAAAAA?w=310&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/OIP.8MbVMCtNNq0ELUeat6t2_QHaFj?w=233&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/OIP.A6afnQbdEFCRe33M8RqOyQHaE0?w=269&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (2, N'chim đại bàng', 1, CAST(56139487 AS Decimal(18, 0)), N'đây là chim đại bàng nè ', N'chim đại bàng độc lạ nhất Bình Dương', 0, N'chim', 2, 5, N'', N'https://th.bing.com/th/id/OIP.3G1t32N-tHuc8gRUrbCu5QHaEo?w=277&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/OIP.BqCWcC9hZeO2Ag_qxUZpQgHaEo?w=277&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/OIP.QLJyGMVP8b3GHeAxSpXiAwHaEu?w=271&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/R.42d76b95d4d89c6eb08e80c5cba11faa?rik=EMYpqFo9H%2f0yXA&riu=http%3a%2f%2fthegioidongvat.co%2fwp-content%2fuploads%2f2017%2f09%2f15-loai-chim-dai-bang-lon-nhat-va-nho-nhat-tren-gioi4.jpg&ehk=h%2bD1CIq5sDWUfk4CC85cJ9H82v%2fLI2R%2b3r6%2fgtw%2bs6w%3d&risl=&pid=ImgRaw&r=0', N'https://th.bing.com/th/id/OIP.Qc_L7sn_WZT8VtKgs-XM3wHaEu?pid=ImgDet&w=193&h=123&c=7&dpr=1.3', NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (3, N'lồng chim', 1, CAST(528745234 AS Decimal(18, 0)), N'đay là lồng chim', N'lồng chim ưng nè bà con', 0, N'long-chim', 1, 3, N'', N'https://th.bing.com/th/id/OIP.lSrKwAORsECShTP1C-DPugHaKh?w=195&h=278&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/OIP.KXKPCrdSgOnxAhjOCns8vAHaHa?w=195&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7', N'https://th.bing.com/th/id/R.73b67bd2f841842a29ec05183aa57e49?rik=DVO1SEW0vnTBYQ&riu=http%3a%2f%2fsieuthilongchim.net%2fadmin%2fwebroot%2fupload%2fimage%2fimages%2flong-chim+(44).jpg&ehk=jaL8vOX%2bRDD%2bsDLN4XfSgPzCsF4%2bnC6dw3GX5De6AQk%3d&risl=&pid=ImgRaw&r=0', NULL, NULL, 1)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (4, N'chim ưng', 1, CAST(528734598 AS Decimal(18, 0)), N'đây là chim ưng', N'lai coi chim ung cua tui ne ba con', 0, N'chim', 2, 4, N'', N'https://th.bing.com/th/id/R.bebbfb8a85cc9dccd054aae04e0e6800?rik=mcJj%2bh%2fLnxsH9Q&pid=ImgRaw&r=0', N'https://th.bing.com/th/id/OIP.ZtrI_6gHSH98cg1wZh85fgAAAA?pid=ImgDet&w=300&h=300&rs=1', N'https://live.staticflickr.com/786/27294126788_65f3845c8d.jpg', N'https://th.bing.com/th/id/R.6031ba79cfebca581581b5192f81f304?rik=NWhltmLOPeWFog&riu=http%3a%2f%2fmedia.growsonyou.com%2fphotos%2fphoto%2fimage%2f133957%2fmain%2fDSCF1173.jpg&ehk=74hs2r%2bxB7prPcX7EgBEkT4qbedAPsZUYCeqMpxfZjI%3d&risl=&pid=ImgRaw&r=0', N'https://th.bing.com/th/id/OIP.Godpk0CFFD3BXiEpp_0noQAAAA?pid=ImgDet&w=310&h=310&rs=1', NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (5, N'thuc an cho chim', 1, CAST(12000 AS Decimal(18, 0)), N'Hãng Hiển Bảo Khánh', N'Đây là thương hiệu đi đầu trong lĩnh vực sản xuất thức ăn dành cho các loại chim cảnh. Từng sản phẩm của Hiển Bảo Khánh đều dựa vào sự nghiên cứu kỹ lưỡng về thuộc tính, đặc điểm của các loài chim hiện nay. Đó cũng là lý do mà Hiển Bảo Khánh mang về nhiều giải thưởng lớn về lĩnh vực chăm sóc chim cảnh mọi miền Nam Bắc.', 0, N'do-an', 1, 5, N'', N'https://polyart-imgs.s3-ap-southeast-1.amazonaws.com/products/WhatsApp%20Image%202020-04-18%20at%2011.54.07_1587197338.jpeg', N'https://cf.shopee.vn/file/b6b26fe726a780002f211606f2ee4162_tn', N'https://th.bing.com/th/id/R.8ea0a13fdfe272e3e11ff224e7d36f9d?rik=C1CM6Z0cUSrRRg&pid=ImgRaw&r=0', N'https://polyart-imgs.s3-ap-southeast-1.amazonaws.com/products/WhatsApp%20Image%202020-04-18%20at%2011.54.05_1587197465.jpeg', NULL, 2)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (6, N'Chim công', 1, CAST(2500000 AS Decimal(18, 0)), N'Chim công là một loại chim lớn với lông đặc biệt và mảng lông màu sáng trên đuôi.', N'Chim công thuộc họ Gruidae và có nhiều loài khác nhau trong họ này. Một trong những loài chim công phổ biến là chim công đen (Grus nigra) có kích thước lớn, chiều dài trung bình từ 100-150 cm và cân nặng khoảng 4-7 kg. Lông chim công đen màu đen, nhưng trên cổ và đuôi có mảng lông màu sáng. Chúng thường sống ở vùng đồng cỏ, hồ và đầm lầy và ăn các loại cỏ, củ và côn trùng.', 0, N'chim', 1, 4, NULL, N'https://e.khoahoc.tv/photos/image/2015/12/03/chim-cong.jpg', N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Peacock_Plumage.jpg/800px-Peacock_Plumage.jpg', N'https://gacanhvn.com/wp-content/uploads/2023/02/mua-ban-chim-cong-xanh-trang-ngu-sac-dep-gia-re-tphcm-ha-noi-can-tho-hai-phong-dong-nai-2.jpg', NULL, NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (9, N'Chim chào mào', 1, CAST(1200000 AS Decimal(18, 0)), N'Chim chào mào là một loài chim nhỏ với lông màu nâu xám phía trên và lông màu nâu nhạt phía dưới. Chim đực có một đốm đen trên cổ và một mảng đen trên má.', N' Chim chào mào (Passer montanus) thuộc họ Passeridae và phân bố rộng rãi ở châu Á, bao gồm cả Việt Nam. Chúng có kích thước trung bình, khoảng 11-12 cm chiều dài và cân nặng từ 14-18 gram. Chim chào mào thường sống thành đàn và thích xây tổ trong các khe nứt hoặc hang đá. Chế độ ăn của chúng chủ yếu là hạt, thức ăn thừa và côn trùng nhỏ.', 0, N'chim', 2, 5, NULL, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Red-whiskered_bulbul_by_Creepanta_11.jpg/1200px-Red-whiskered_bulbul_by_Creepanta_11.jpg', N'https://static-images.vnncdn.net/files/publish/2022/11/13/chim-chao-mao-5-939.jpg', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRISFRUYGBgYGRgYGBgYGBgYGBgYGBgZGRgYGBgcIS4lHB4rIRgYJjgmKy8xNTU1HCQ7QDs0Py40NTEBDAwMEA8QHhISHjQkJCE0NDU0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0MTQ0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0MTQ0NP/AABEIAQoAvgMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACAwEEBQYAB//EADwQAAIBAgMFBAgFBAICAwAAAAECAAMRBBIhBTFBUXEiYYGxBhMyUnKRkqFCgsHR8BQjYrIHM+HxJFOi/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EACgRAAICAgMAAgECBwAAAAAAAAABAhEhMQMSQSJRgQSxBRMyQmFxof/aAAwDAQACEQMRAD8ACu7Zm7R3niecrs7e83zMtVl7TdT5xDrPO7A0Vndveb5mJao/vN9Rlh1imSVZBXeo/vt9Ri2qP77fUZYZItklKRRXNR/ff6j+8Eu/vv8AU37x5ST6uNMVC0Z/ff6j+8so7j8bfUYKJHBJSY6B9Y/vN9RnhVf3m+owjTkZI7AE1n99vqME1X99vqMYacHLCxizUf32+oxbu/vt9R/eWMsBkisCqzv77fU37wGqP77/AFN+8slItkhYUVjVf33+pv3hLVf33+pv3jDThLThbGeR399vqb95r7Jw2YPVqu4pJ7XaIztvCA9NSRuFud5X2bgTUcJcKu93NgEQe0xv/L2lraWLSqVp0hahT0T/ADYHVjz11vxMiUnpbNeOK/qel/0r47HPXfOSUQaIikqABoCQO7h/Bc2GW9Ybsx7B3k+8srLTl/ZNOzn4T5rLguuETOTk7Y2qO03U+cQ6y1VXtN1PnEss5byTIqssWyS0yxbCNMyKrLFmnLRSRllJlHPYnaLUqxR17BsVYctxM1qLK4DKQw5jWFjcClVSjjoRvU8wZy1WnUwz2DWvqCPZYd45zoioyVaY9nWqkYEmPhNtggB115pqD4HWbNCuji6sPI+IOsThKI6PZZBSOIkGTY6ElIJSOIgkRhQrLIKRlpJEAorskUUlpoFpI6K4pxtHDliFAuSQABvJO4RypNOp/wDGQbjXqCyL/wDWp3seTWv0Gm8xSlSLhBydFbHMET+kpkFmsazjkPwKeXAeJiadIAAAWA0AnsPhglyNSxuxO8nn3dJZVIoprL2Pkkm6jpABJd2YvaPwnzErWlzZw7R+E+Ymi2ZM9UGp6nziXj6m89T5xDzjvISYkwSI0iCRGmZAFYJEImCZoikBaVsfhVqIyEX004WPAgy0ZU2lihTp1HPAadToPvLhdqhnBOWRil9xIMs0cYRaxOnfM16hYk336x+Hpn2iGCDewXlvtfQmd9lJN6Nmjtt0t2jbvt+tpr4Tb6OQpvckAZRc/TvPhecTjSjMfVl8th/2BQ1+Ps6WjMHs1nUubhAbXCliTyA0F+pEmUYvYrPqQwlS1/Vv9D/tFvSZfaUjqCPOYWBfGKnq8OjogUKHrVtQBwRNAl+4HrLODp4wavjHI4oAHB7iXuLflmUoxXo7ZftIaGzRbmYjFNJUQTG01JIAFySAAN5J3AQCy5s/DhiXbREGZzu6LfmT9ryurl3aq29vZHJOA8d/yHCX8c6LTGFVruGzVbbr+7fjut0F+MqCQlcr+jZvrHr69jVWHaLVoyWYkWlrZ3tH4T5iVTLOzvbPwnzEqOxMGsdT1PnFFo+qO03U+cSwnHWSJAZoJnjBJjSFQLCDeSxi2M0SGeYzk/S3F3K0wdF1I5k7vAfrOlqVMoLHcBf5TjcfhmZ2Yneb6d834Y5tlxVoV6PbCxGMqerw9IuRYuQQqopO9nOi7j3mxsDPrdD/AI0qFFWpVRdBcKCwHOxNr9bCaX/G2NwtPA00o5VcXNYMwDtVt22bu0FuQtNR9r1q5KYemxHGq4KUx8JOr/lFjzE3nBSqzbg/U8nDfT3eEz576Q/8dUaFMBKz1KzuiKLKqKpYGo1tSbKGO89J0GIoUsNRWnTQBUAVToST73xE3JM232dl7TuXfiToB3Ko3D+XO+ct6TYjtrT90XPVt32/2kTdKjJu22zMZ76mAWiC8jPMRNj2eATFXkh4CCl/CsKSNiG3i60xxLHQsOl7DvPdE7PwTVnyLoBq7nciDex/QcTA2jXWrUGQWp0+xTX4dC55n9bmRL6XprxJK5vS/cGmTqSbkm7HmT/AOgEeplcQ1aVozcnJ2ywphZooPJLQCx2eW9nHtH4T5iZuaXNlt2z8J81lxBlioNT1PnFMstump6mLKzlrIOJSdYoy46ys6ykKhTCJaNeJJloRXxY7J8POYq0XdxTQAsxsOZv3fzjNjajqlIluJ0tvuL2t4iYGwHP9VQuCRnUWJ3lm7H2v950caNUqifRvQ/0OrYeoKr5CNCCPaUAagabjf7ciZ9FbO260DC1Qyr0EupabUZ2VkwfPfznI+nWwAV/qU0ZFAdfeQfiHePLpr27vpOI/5G2wEo+rU2diLWPC9z4WH3ilFNZBZPnhM8GlmlhGekayjVDaog3rpo45jny6bqlpzMJJp0HmngYEfs/CmrUSnuBPaPJRqx+X3tJbEreEX62KqJh0pqQgck2A1a2hdyd/cN1rc5Qp2AAEsbRrB6hK+yLKo4BV0Fhw3faIUSE/fs25ZVUF5+4wGTBE8THZiFmkipEsYJMpMLLIeXtkt2z8J81mQHmjsR/7h+A/7LLjsdmxVbU9TEs8OqdT1MrsZgzaiWMU4kloLNGkQ0VqgiGNuZ7hqT074+oZOAANWkDuzr/sJSRNFfbeCdMiuozXYlRqNTYWPcAPvOa2TVanXp1yAQHuVN7XT8Qtp3jpPofpGM2awu5sB3Xvv8bTmsLsKzaklc+7mg1fT7TVS64N6tH1jZuJzIj+8AfAzTWvOfwARKVNVFhYZRyvwl56+/XhN1IwaLNaucp7pwvpJsv17tUdrqR2L3srWAsBwuADfrOnfFc/5w/nWZ2LUOrU7m1rHnqNLdLzObtFxwzn/RrAPTNSmd+4Hhpey36AW6mYeJUZ3S2VkYq6e6d4I/xIIYcr24Ttdm0v7atvcaG/G2/xmb6U7IDMmMp77ZKova6fhbvKsbdGPITKrVlTXbBy7JL1ItQppUA7bkFb8EHHxOvgsjCYUu6091955KNWPyBgY7EesdmHsjRBu7I0Hl5TJ7oXF8U5vzC/2IzEksd5JJ6mGBBURgiMNkWgmMMEiAC2EAxjRTGNACZo7B/7G+A/7LM0zS2D/wBjfAf9lmkQNaq2p6mV3aOrbz1PnK7iQdLBLQGaCxii8aRDJcwaNTK6N7rButje0BniXeUiGdOKyu9RvaDKhXu3g/Ij7RuHp3bMbWawtyGhnMejWOAxDUHPvMvera6dCzfOdhhrDILWtvv0tHWcmt4wWaRvoD7P6a/rGvWOv2H86RVIgO1uenjr5Whut2vy/WaeECfWXA4WO7xvAF82p4Wv5GE631HS0hXFxfTSZsuxqKVAHKE7KQ9MgMjggqdRrvB7je3jAZ7XHymRtDayU2VTcsd6qpdgo9p8o1IHG1zusI3F+AmU8Vh/6dHCm7VDkQ/iWnvbN/lw5dm/GY9pq1AcQlSvnVyCMmR1YZBqTlX2QQRZTuyNvmUZjTV3sXM1hLRIEkQRCvAwJvIM9aRaKhgNENHsIlkPKNCAvNLYP/Y3wH/ZZm5DymnsJT6w/Af9lmkdiTNaqNT1MQ4j3OrdT5xTyGdVFN1ldpbeVnEEQ0V6kUxj3WKZI7IaLGAwitUp1gAHW4Fs1yLEtpew0DfywnXK4YLUG4mx7t04yg7IwdTYjj3HQibeycbcEE6Ne45EGxPdwMrsXDKo3E0BJ3g/+pJcrqD84rPmHfFpVuCp3ct00tCLDvftAxNZ76jeJVZyh3m3nJNQkZgf53zNyspIacTprpb+azi9uZnNQvbIjKQ2W5VmuBYrZiDbUX0sDOqq1BblMbGpmWpTC3zLmPCzfh66SP5ji1RrCCkm34I9B8czsKSO6i7PUVkFRL3BYessGQm7e0Wvbffe/H4fI7pyJ+XCYfoMatLH0xYBXORri4vlOU2+MW/NO+9LUp5kbJldl3gkjQ8ie/lNZ5yYSVKjlZIWEqQ1WYmYKpHLSh06cuUqMaQFRMPeOTBzSp0JaTDzRQAxRs7ulrAYGzk/4kfcTYTDxow80UKYqOYd9W6nzgl4NQ9pup84JMwZ1AOYoiNIkFYiWhWWCyR0m0lktFUpENW9Uwc+yxVWPBTchW6a2PhLxSJr4cMrIwuGBBjTJj8XZt0aoOVxpwI4XEZikNwynXfOY2LjyrNh6h7acT+NB7Ljv3X8Oc6HD1FPZa/cRwjdrBtV5QZe41lVq2X/AMSxXpsp3eI4jnK7tviuwSoAVQ7FTuALN0G/9PnAwxLFqh0zEt8+EGtSyUGYDtVTlHciakjq1vlB2dVt2Wtbv3CTVtmknUUvyZ+OxYoV1qBTc3CMB7DspAY91/1nTbUxgr4fCVtxZb2/yslx5/KUcdgkcizC9xoSB8juMx6u0slLCUGO6uy/lZai2+orNIPHUznG42XQsbTSQglvD04JHKNoUZfo0Z6hTmhRpzaMRg0qMtJSjKdOWkpzZRAQtGTVp2HjLiJF4xOyOv6GVQHz2p7TdT5yAIdVe03U+cECcLOhHrSSkMLJyxDK5WSFjGElRESxeSCySyEk+rhRNHPba2czhalPSomqnmOK9/H5wdlbZWqNdHX2k4qRppzWdH6uch6W7GZG/qqN1I9u2mvPxlpKXxf4GpOJ2GExgK2vcHd3fbSU3xIZiq79w0t5Tl9gekaHSqADxG4NzK8j3Te2VVD4ipUQ50Rc66a5mBCqefE8PZkSjKN34bRSk1Xpc2hjC9W2XIqAIiXvYDnbS57oe0qlNaRdVFxbXXtdxnO/1is2ZHUkndezXvwGn2lutjlZMl9TvHI8fKQ31RvDhfLOkBT2mb9kW3nLvW43HunNbeqNkoORZ0dwT1Idf1+836CWdR/LTK9LksCB76n61b9o+DkuaR1fqv0sePhb9Ovwrh1VxuYKw6MAf1mrhkmB6Nvnw+HP+GU9UZk8lE6nDJunSo5o8KWy5h0mhRSIoJNCkk3SAOnTllEkIksIsoAVSJxq9kdR5GWwsr7QHYHxDyMAPm7ntN1PnIIgP7TdT5z15ws3TGrDEUrRgMQ7AYayVE9eEsolsaqybQkEK0KCwQsCvRDKVYXBFjHWnisdAfNMd6OFMRyQHMTzG8W+R+RmxtCscFhMPlH9yufWuDcEBl7CnomUEc785u4tsM1aktauECscyEe2G0IzEWA0tv0sec530vrPWxJdkulrIQQQbgNoRpexXTfNXckk9eji+ttbMvZtBXUHjx5+M0SuUdod1x9ryumFyKzi+gBIHIaX+XlHU6wI15fOcfPFqX+D3/0XLCUE/Vss4ZwXB5KPEyf6FcV68sxBUpqBfdoCNf8AJr9RKDVCljz/AGNptbHIKUyBYsDTe3v0zmVvzIV8VaHFB32Xhj/EOdKLits0NlYVaSJTU5suYk2tqzXsAZ0uDXdMXC05v4NZ1ceWfPt27NCgkv0hK9BZbQToQFhBHKIlDHKYwGASttEdkfEPIyyDK20T2R8Q8jGB8zqL2m6nzg2huNW6nzgTgZqRaMWCBDSKxglYxIwJJRIrFQaCMAkosPLNEAAEKTaejoDmttVEp+sZ6LObOVdELMgYWKMbarqWBNwLWuNJX2TXw+IorQUsbCx7NspFzmU62tprzNp1u1MMrGlTYAhEZm7y+mVuYsDp/iJVTBojO6Kqs9s5AALWva9up+cvumtDaa9MfCbNZQwcqRYrofaDCx7PDS853H4IqgKaMjsj94btofG1TwtO7NOYe1cNZ2FtKqG3LPSs48SoyyLt5KjOUX8XRyoDHLm4cPKbGynIY0/fAKd1RLlLdQXT84mdUG/vF/ERiubAgkEWIPEEag/OaKKSpClOUpXJ2d3gyGCuNzAEeM2sKN053YGIDggCwPbUcg986juVw46W5zpMPFBUZSWTSoS4ko0jLSNN0SWBGo0QDCBjAsBpX2i3ZHxDyMIPK+PfsjqPIwA4F01bqfOD6uXHXU9TIyzz2alUpJVY9kgZYhh040CLWNWCFQaLGWgKY1ZrEYBEZhqeZxfcNT0XU+VvGeInsSGWk2QgPUbIpPBR2nP2HylPCscVborIgu7++xbffuX7AQssaqWAHKSBGlSoJO3YkrM/bVEmmXA7VMiov5NSPpzTWyz2WHUR84xSBXIHs37PwNqp+kiV1axsZc2rRyEod6FkPfkN0P0MnymdiH9luY+40MpCZvej2NyOAdwN/wAr2VvkQjdFafQaJnyfDOAQ1iefeDoR4gkT6J6O431lMAm7IcjHnbc35hY+MemJq0dFTMtIZRpGWkM1RBaUxgMrq0MNGIaTKuOPZHX9DHXlbGN2R1/QwA5Z956mCTBdtT1PnBzTiaNEgjBnryLyKKCENTF3kgwoBymNQxKR6CaRGMpoWIUC5Mmu4ZyF1VBkU8zvc+Jt94S0wEd29lVN9bX5D7iBhaGRFQ6EDX4ibn7kyqbkkPCjZOWeCx2WeyzQkXaTlhhYVoxHD+l2Gy1Q3Col/wA9PRv/AMMPpnK1BdHA/A1/Bp9C9M6P9gVQuY0nR7c1JyOOhDfaZXpNs6ktOjXpgCmRkcqN6OLq3fY+cSWwbMf0d2UcQSA1goux8p0tPDHA16V2vTqjIx5MvsMfA26LG+hmBFKmb6lmvcagj8OvSbfpPsk18Myj2lIdeo4eIuPGW4/Gye2aNCmZYRpkbJqMUVX9tQobv0BB8R9wZoq8EwaLitCzyqrwg8qxFgv3xNdvOCzbuvK//qLqNCxHLO2p6mDminbtN1PnIDTmotFgNJvEBoxTFRaDEYokIseiQ6gSix6yFWMRCSBzjSoCaq9gLfVmVm+AHT52aNEq07O71OHsJ3Iumnjf5CWRHDOfscsY+gwJ6QDJlkEz0i8i8YCcfhRUp1KZ/GjJ9QIvMLYeBNfAGi+hytkPKxuPkbjwnRFphbI2glHE18I7Bf7jVKeYgBkrWdlBOlw+fTvjWxPRhege1GSp/S1AbBmCnihGpQ/477T6uFDLzBE+R+k2FOFxi4mlqGIa34SdxBPfz5kz6ls/EI6KR2bgHfbf3y0/CX9nM7SxQw+JwyEj+6HpsOhU02+pmH5zNgNOW9P9n0wRVQn1pKgFbkWU5rs3C1jbrN3Z+K9ZTp1PfVWPUjUfO8h7GtF0NCDRUNYwCfeul7Hfe1tDrbjCcwGtdN2/iL8DuPA9/WE8pCZyFQ9pup854GFUGrdT5yEWZdSkEiSwiT1JJZVYqKs8iSwqwFEasdAEqyMS5VHYEZjZFv7z6D+d8YIrEKruiAhgi53sb2d9FB7wAfESOTVL3BcN39DKNIKqqNwAHW3E98MmFBaXVEXZAMkNBnoAMgyM0i8BHiZzvpLggWo4ke1Sdcxte6ZgdeYB/wBjOhMVUphgVIuCLEcwYFFL0gp0KioxPaKWFwdQRcWU6k/t3Rnorj3WmaboyqmgzDNfXQC2u7uMp4TYiU39Yja2KjMMxCk3sDy0mumkdu7J61gXtyuldDTR2BOhC03uw5FmACiNwGHFNEpj8It+v6wwYStD22GlSHAQ1EUHjFeUIIg3Xfv1ta24778OkloJINjy3eU8zRpks5Rx2j1PnDRJommLnQb+UJEHIfKIoqUkllVlhUHIfKeURAAqxiiEojBCh2QgFxfdx6cZXwAurVLWzsXA5KdEHyAPiZYq+w/QyKI7K/CPKZ/3fgu/j+QzAaMkGXRAomehmehQCyZ68IwYwJvAIhyRABVpIhzwEAshTGCeEkQoD1pInoUYjwMkmekmCBn/2Q==', N'https://img.kythuatnuoitrong.edu.vn/2018/03/13/cach-cham-soc-chao-mao-dau-gian.jpg', NULL, 4)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (11, N'Chim chìa vôi', 1, CAST(500000 AS Decimal(18, 0)), N' Chim chìa vôi có hình dạng đặc biệt với mỏ dài cong và phủ 1 bộ lông trắng đen', N'Chim chìa vôi là một loại chim thuộc họ Upupidae. Một trong những loài chim chìa vôi phổ biến là chìa vôi châu Phi (Upupa epops). Chúng có kích thước trung bình, chiều dài khoảng 25-30 cm và cân nặng khoảng 60-100 gram. Màu lông của chim chìa vôi châu Phi thường là màu nâu đỏ và trắng, có hoa văn đặc trưng trên cánh và đuôi. Mỏ của chúng dài và cong về phía dưới. Chim chìa vôi thích sống trong khu vực cây cối, chủ yếu ăn côn trùng và sâu bọ.', 0, N'chim', 1, 5, NULL, N'https://dogily.vn/wp-content/uploads/2020/04/chim-chich-choe-than.jpg', N'https://media.dolenglish.vn/PUBLIC/MEDIA/31fbcdf4-1b7c-439b-af5b-74b15e402f63.jpg', N'https://petmaster.vn/petroom/wp-content/uploads/2020/11/chim-chia-voi-3.jpg', NULL, NULL, 5)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (12, N'Lòng chim chào mào', 1, CAST(500000 AS Decimal(18, 0)), N'Dùng để là nơi sinh sống của chim chào mào', N'Khá rộng rãi đủ khoảng cách để chim có thể bay lượn', 0, N'long-chim', 2, 5, NULL, N'https://vatnuoi.vn/wp-content/uploads/2020/04/long-chao-mao-dep-4-e1621409831155-812x1024.jpg', N'https://filebroker-cdn.lazada.vn/kf/S65e4e200846f4945ae3e2e1b74cda433X.jpg', NULL, NULL, NULL, 11)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (16, N'Lòng chim chìa vôi', 1, CAST(300000 AS Decimal(18, 0)), N'Dùng để là nơi sinh sống của chim chìa vôi', N'Khá rộng rãi đủ khoảng cách để chim có thể bay lượn', 0, N'long-chim', 1, 5, NULL, N'https://petmaster.vn/petroom/wp-content/uploads/2020/11/chim-chia-voi-7.jpg', N'https://alltop.vn/backend/media/images/posts/845/Long_Chim_Hoanh_Co-82169.jpg', NULL, NULL, NULL, 12)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (17, N'Thức ăn chim chào mào', 1, CAST(100000 AS Decimal(18, 0)), N'Là thức ăn dùng cho chim chào mào', N'Tích hợp được nhiều nguồn dinh dưỡng khác nhau giúp chim tăng trưởng và phát triển', 0, N'do-an', 1, 4, NULL, N'https://cf.shopee.vn/file/9c9033c32c82640c80beb5cd5252d658', N'https://bizweb.dktcdn.net/100/163/312/articles/chao-mao-so-1.jpg?v=1647940713357', NULL, NULL, NULL, 11)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [Status], [Price], [Decription], [Detail], [QuantitySold], [CateID], [ShopID], [Rate], [Video], [Image], [Image1], [Image2], [Image3], [Image4], [DiscountID]) VALUES (21, N'Lòng chim sẻ', 1, CAST(100000 AS Decimal(18, 0)), N'Dùng để là chổ ở của chim sẻ', N'Khá rộng rãi và phù hợp với chim sẻ', 0, N'long-chim', 2, 3, NULL, N'https://vcdn1-giadinh.vnecdn.net/2022/02/17/longchim-1645065926-4671-1645066078.jpg?w=900&h=540&q=100&dpr=1&fit=crop&s=ebTkXmxJKlrzb2r_q9ZfKg', N'https://cf.shopee.vn/file/78e4ed38cecb8cdabca4091f339ac9d4', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Product] OFF
INSERT [dbo].[tb_ProductCategory] ([CateID], [CateName]) VALUES (N'chim', N'Chim')
INSERT [dbo].[tb_ProductCategory] ([CateID], [CateName]) VALUES (N'do-an', N'Đồ ăn cho chim')
INSERT [dbo].[tb_ProductCategory] ([CateID], [CateName]) VALUES (N'long-chim', N'Lồng chim')
INSERT [dbo].[tb_ProductCategory] ([CateID], [CateName]) VALUES (N'phu-kien', N'Phụ kiện cho chim')
INSERT [dbo].[tb_Role] ([RoleID], [RoleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tb_Role] ([RoleID], [RoleName]) VALUES (N'CUS', N'Customer')
INSERT [dbo].[tb_Role] ([RoleID], [RoleName]) VALUES (N'SP', N'Shop')
SET IDENTITY_INSERT [dbo].[tb_Shop] ON 

INSERT [dbo].[tb_Shop] ([ShopID], [Rate], [ShopName], [Description], [UserID], [Is_verified], [CreateDate]) VALUES (1, 4, N'HienShop', N'', 2, NULL, CAST(0x0000B01B00A281D5 AS DateTime))
INSERT [dbo].[tb_Shop] ([ShopID], [Rate], [ShopName], [Description], [UserID], [Is_verified], [CreateDate]) VALUES (2, 1, N'DuongShop', N'dan choi chim', 5, 1, CAST(0x0000B01B00A281D5 AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Shop] OFF
SET IDENTITY_INSERT [dbo].[tb_User] ON 

INSERT [dbo].[tb_User] ([Dob], [Gender], [UserID], [Email], [Name], [Password], [RoleID], [UpdateDate], [CreateDate], [Avatar], [Phone], [Address], [ShopID]) VALUES (CAST(0x0000B01B00A281D4 AS DateTime), N'Nam', 1, N'lelongnhat@gmail.com', N'Le Long Nhat', N'123456', N'AD', CAST(0x0000B01B00A281D4 AS DateTime), CAST(0x0000B01B00A281D4 AS DateTime), NULL, N'123456789', N'dhFPTtpHCM', NULL)
INSERT [dbo].[tb_User] ([Dob], [Gender], [UserID], [Email], [Name], [Password], [RoleID], [UpdateDate], [CreateDate], [Avatar], [Phone], [Address], [ShopID]) VALUES (CAST(0x0000B01B00A281D5 AS DateTime), N'Nu', 2, N'duongthihien@gmail.com', N'Duong Thi Hien', N'123456', N'SP', CAST(0x0000B01B00A281D5 AS DateTime), CAST(0x0000B01B00A281D5 AS DateTime), NULL, N'1234565684', N'dhFPTtpHCM', 1)
INSERT [dbo].[tb_User] ([Dob], [Gender], [UserID], [Email], [Name], [Password], [RoleID], [UpdateDate], [CreateDate], [Avatar], [Phone], [Address], [ShopID]) VALUES (CAST(0x0000B01B00A281D5 AS DateTime), N'Nam', 3, N'ledinhthanh@gmail.com', N'Le Dinh Thanh', N'123456', N'CUS', CAST(0x0000B01B00A281D5 AS DateTime), CAST(0x0000B01B00A281D5 AS DateTime), NULL, N'12343645636', N'dhFPTtpHCM', NULL)
INSERT [dbo].[tb_User] ([Dob], [Gender], [UserID], [Email], [Name], [Password], [RoleID], [UpdateDate], [CreateDate], [Avatar], [Phone], [Address], [ShopID]) VALUES (CAST(0x0000B01B00A281D5 AS DateTime), N'Nam', 4, N'nguyenvotunglam@gmail.com', N'Nguyen Vo Tung Lam', N'123456', N'CUS', CAST(0x0000B01B00A281D5 AS DateTime), CAST(0x0000B01B00A281D5 AS DateTime), NULL, N'28375161897', N'dhFPTtpHCM', NULL)
INSERT [dbo].[tb_User] ([Dob], [Gender], [UserID], [Email], [Name], [Password], [RoleID], [UpdateDate], [CreateDate], [Avatar], [Phone], [Address], [ShopID]) VALUES (CAST(0x0000B01B00A281D5 AS DateTime), N'Nam', 5, N'hoangchiduong@gmail.com', N'Hoang Chi Duong', N'123456', N'SP', CAST(0x0000B01B00A281D5 AS DateTime), CAST(0x0000B01B00A281D5 AS DateTime), NULL, N'12367137', N'dhFPTtpHCM', 2)
INSERT [dbo].[tb_User] ([Dob], [Gender], [UserID], [Email], [Name], [Password], [RoleID], [UpdateDate], [CreateDate], [Avatar], [Phone], [Address], [ShopID]) VALUES (CAST(0x0000B01B00A281D5 AS DateTime), N'Nam', 6, N'phamminhthien@gmail.com', N'Pham Minh Thien', N'123456', N'CUS', CAST(0x0000B01B00A281D5 AS DateTime), CAST(0x0000B01B00A281D5 AS DateTime), NULL, N'978345221', N'dhFPTtpHCM', NULL)
SET IDENTITY_INSERT [dbo].[tb_User] OFF
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[tb_Cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_Cart_tb_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tb_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tb_Cart] CHECK CONSTRAINT [FK_tb_Cart_tb_Product]
GO
ALTER TABLE [dbo].[tb_Cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_Cart_tb_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_Cart] CHECK CONSTRAINT [FK_tb_Cart_tb_User]
GO
ALTER TABLE [dbo].[tb_Discount]  WITH CHECK ADD  CONSTRAINT [FK_tb_Discount_tb_Product] FOREIGN KEY([ID])
REFERENCES [dbo].[tb_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tb_Discount] CHECK CONSTRAINT [FK_tb_Discount_tb_Product]
GO
ALTER TABLE [dbo].[tb_Feedback]  WITH CHECK ADD  CONSTRAINT [FK_tb_Feedback_tb_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tb_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tb_Feedback] CHECK CONSTRAINT [FK_tb_Feedback_tb_Product]
GO
ALTER TABLE [dbo].[tb_Feedback]  WITH CHECK ADD  CONSTRAINT [FK_tb_Feedback_tb_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_Feedback] CHECK CONSTRAINT [FK_tb_Feedback_tb_User]
GO
ALTER TABLE [dbo].[tb_Order]  WITH CHECK ADD  CONSTRAINT [FK_tb_Order_tb_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[tb_Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[tb_Order] CHECK CONSTRAINT [FK_tb_Order_tb_Payment]
GO
ALTER TABLE [dbo].[tb_Order]  WITH CHECK ADD  CONSTRAINT [FK_tb_Order_tb_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_Order] CHECK CONSTRAINT [FK_tb_Order_tb_User]
GO
ALTER TABLE [dbo].[tb_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tb_OrderDetail_tb_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tb_Order] ([OrderID])
GO
ALTER TABLE [dbo].[tb_OrderDetail] CHECK CONSTRAINT [FK_tb_OrderDetail_tb_Order]
GO
ALTER TABLE [dbo].[tb_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tb_OrderDetail_tb_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tb_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tb_OrderDetail] CHECK CONSTRAINT [FK_tb_OrderDetail_tb_Product]
GO
ALTER TABLE [dbo].[tb_Payment]  WITH CHECK ADD  CONSTRAINT [FK_tb_Payment_tb_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_Payment] CHECK CONSTRAINT [FK_tb_Payment_tb_User]
GO
ALTER TABLE [dbo].[tb_Post]  WITH CHECK ADD  CONSTRAINT [FK_tb_Post_tb_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tb_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tb_Post] CHECK CONSTRAINT [FK_tb_Post_tb_Product]
GO
ALTER TABLE [dbo].[tb_Post]  WITH CHECK ADD  CONSTRAINT [FK_tb_Post_tb_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[tb_Shop] ([ShopID])
GO
ALTER TABLE [dbo].[tb_Post] CHECK CONSTRAINT [FK_tb_Post_tb_Shop]
GO
ALTER TABLE [dbo].[tb_Product]  WITH CHECK ADD  CONSTRAINT [FK_tb_Product_tb_ProductCategory] FOREIGN KEY([CateID])
REFERENCES [dbo].[tb_ProductCategory] ([CateID])
GO
ALTER TABLE [dbo].[tb_Product] CHECK CONSTRAINT [FK_tb_Product_tb_ProductCategory]
GO
ALTER TABLE [dbo].[tb_Product]  WITH CHECK ADD  CONSTRAINT [FK_tb_Product_tb_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[tb_Shop] ([ShopID])
GO
ALTER TABLE [dbo].[tb_Product] CHECK CONSTRAINT [FK_tb_Product_tb_Shop]
GO
ALTER TABLE [dbo].[tb_Profit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Profit_tb_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tb_Order] ([OrderID])
GO
ALTER TABLE [dbo].[tb_Profit] CHECK CONSTRAINT [FK_tb_Profit_tb_Order]
GO
ALTER TABLE [dbo].[tb_Profit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Sales_tb_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[tb_Shop] ([ShopID])
GO
ALTER TABLE [dbo].[tb_Profit] CHECK CONSTRAINT [FK_tb_Sales_tb_Shop]
GO
ALTER TABLE [dbo].[tb_Shop]  WITH CHECK ADD  CONSTRAINT [FK_tb_Shop_tb_User] FOREIGN KEY([ShopID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_Shop] CHECK CONSTRAINT [FK_tb_Shop_tb_User]
GO
ALTER TABLE [dbo].[tb_Token]  WITH CHECK ADD  CONSTRAINT [FK_tb_Token_tb_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_Token] CHECK CONSTRAINT [FK_tb_Token_tb_User]
GO
ALTER TABLE [dbo].[tb_User]  WITH CHECK ADD  CONSTRAINT [FK_tb_User_tb_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tb_Role] ([RoleID])
GO
ALTER TABLE [dbo].[tb_User] CHECK CONSTRAINT [FK_tb_User_tb_Role]
GO
ALTER TABLE [dbo].[tb_WishList]  WITH CHECK ADD  CONSTRAINT [FK_tb_WishList_tb_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tb_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tb_WishList] CHECK CONSTRAINT [FK_tb_WishList_tb_Product]
GO
ALTER TABLE [dbo].[tb_WishList]  WITH CHECK ADD  CONSTRAINT [FK_tb_WishList_tb_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[tb_User] ([UserID])
GO
ALTER TABLE [dbo].[tb_WishList] CHECK CONSTRAINT [FK_tb_WishList_tb_User]
GO
