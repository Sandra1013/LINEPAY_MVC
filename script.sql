USE [master]
GO
/****** Object:  Database [WiseMachine]    Script Date: 2019/7/22 上午 11:20:03 ******/
CREATE DATABASE [WiseMachine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WiseMachine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WiseMachine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WiseMachine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WiseMachine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WiseMachine] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WiseMachine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WiseMachine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WiseMachine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WiseMachine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WiseMachine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WiseMachine] SET ARITHABORT OFF 
GO
ALTER DATABASE [WiseMachine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WiseMachine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WiseMachine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WiseMachine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WiseMachine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WiseMachine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WiseMachine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WiseMachine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WiseMachine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WiseMachine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WiseMachine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WiseMachine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WiseMachine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WiseMachine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WiseMachine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WiseMachine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WiseMachine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WiseMachine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WiseMachine] SET  MULTI_USER 
GO
ALTER DATABASE [WiseMachine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WiseMachine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WiseMachine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WiseMachine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WiseMachine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WiseMachine] SET QUERY_STORE = OFF
GO
USE [WiseMachine]
GO
/****** Object:  Table [dbo].[EmpDb]    Script Date: 2019/7/22 上午 11:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpDb](
	[Account] [varchar](50) NOT NULL,
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[PhoneNum] [nchar](15) NULL,
	[Sex] [char](4) NULL,
	[Email] [varchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Birthday] [varchar](50) NULL,
	[AddDate] [varchar](50) NULL,
	[UpdateTime] [varchar](50) NULL,
	[Permission] [int] NULL,
	[PassWord] [nvarchar](50) NULL,
	[Assignment] [int] NULL,
	[MachineId] [varchar](50) NULL,
 CONSTRAINT [PK_EmpDb] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemDb]    Script Date: 2019/7/22 上午 11:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDb](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemImg] [nvarchar](200) NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemUnitPrice] [int] NULL,
	[Class] [nvarchar](10) NULL,
	[Calorles] [nvarchar](50) NULL,
	[Protein] [nvarchar](50) NULL,
	[Carbohydrate] [nvarchar](50) NULL,
	[Fat] [nvarchar](50) NULL,
	[Sugars] [nvarchar](50) NULL,
	[Sodium] [nvarchar](50) NULL,
	[Capacity] [nvarchar](5) NULL,
	[Slogan1] [nvarchar](10) NULL,
	[Slogen2] [nvarchar](10) NULL,
	[PayUrl] [nvarchar](200) NULL,
	[ImgUrl] [nvarchar](50) NULL,
 CONSTRAINT [PK_ItemDb] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineDb]    Script Date: 2019/7/22 上午 11:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineDb](
	[MachineId] [varchar](50) NOT NULL,
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[Area] [nchar](10) NULL,
	[Location] [nvarchar](200) NULL,
	[AddDate] [nchar](10) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_MachineDb] PRIMARY KEY CLUSTERED 
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MacInvDb]    Script Date: 2019/7/22 上午 11:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MacInvDb](
	[DataNo] [int] IDENTITY(1,1) NOT NULL,
	[MachineId] [varchar](50) NULL,
	[Account] [varchar](50) NULL,
	[ItemId_DataNo] [int] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_MacInvDb] PRIMARY KEY CLUSTERED 
(
	[DataNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseDb]    Script Date: 2019/7/22 上午 11:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseDb](
	[DataNo] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[Amount] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[Addtime] [date] NULL,
 CONSTRAINT [PK_WarehouseDb] PRIMARY KEY CLUSTERED 
(
	[DataNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmpDb] ON 

INSERT [dbo].[EmpDb] ([Account], [EmployeeID], [UserName], [PhoneNum], [Sex], [Email], [Address], [Birthday], [AddDate], [UpdateTime], [Permission], [PassWord], [Assignment], [MachineId]) VALUES (N'test', 1, N'陳韋達', N'0973771477     ', N'M   ', N'a1236852@yahoo.com.tw', N'測試地址', N'1981-01-01', N'2019-07-10', N'07 10 2019  3:24AM', 1, N'1234', 0, N'0')
SET IDENTITY_INSERT [dbo].[EmpDb] OFF
SET IDENTITY_INSERT [dbo].[ItemDb] ON 

INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (1, N'item5.png', N'測試飲料A', 25, N'飲料', N'123', N'22', N'10', N'2', N'3', N'0', N'150', N'熱賣商品', N'TOP1', N'', N'https://thumbs2.imgbox.com/df/96/VanJRiVe_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (2, N'item6.png', N'測試飲料B', 25, N'飲料', N'111', N'10', N'3', N'5', N'5', N'0', N'150', N'熱賣商品', N'TOP2', NULL, N'https://thumbs2.imgbox.com/68/72/n5MKE7Ck_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (3, N'item7.png', N'測試飲料C', 30, N'飲料', N'115', N'20', N'33', N'4', N'13', N'0', N'175', N'新品上市', N'快來嘗鮮', N'https://sandbox-web-pay.line.me/web/payment/wait?transactionReserveId=WGt4UFh2QmlldklRekNzMVlJbkRrV1E3czBKVVh5QllNM21OYWRseXd5YmZVY25Jb1YrWHpWcXhUcE9zN29PNw', N'https://thumbs2.imgbox.com/0b/93/LyFuw80q_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (4, N'item8.png', N'測試飲料D', 35, N'飲料', N'140', N'30', N'12', N'3', N'5', N'1', N'600', N'熱賣商品', N'TOP3', NULL, N'https://thumbs2.imgbox.com/bc/80/TC4LBGu4_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (5, N'item9.png', N'測試飲料E', 20, N'飲料', N'132', N'16', N'10', N'5', N'6', N'10', N'600', N'新品上市', N'快來嘗鮮', NULL, N'https://thumbs2.imgbox.com/db/07/VbnSJ9H7_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (6, N'item10.png', N'測試飲料F', 30, N'飲料', N'26', N'20', N'10', N'5', N'6', N'9', N'750', N'熱賣商品', N'TOP4', NULL, N'https://thumbs2.imgbox.com/0d/14/rGIBsSqi_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (7, N'item11.png', N'測試飲料G', 35, N'飲料', N'34', N'30', N'5', N'4', N'5', N'10', N'600', N'季節限定', N'6/15~8/1', N'', N'https://thumbs2.imgbox.com/76/51/PpZSu6s5_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (8, N'item12.png', N'測試飲料H', 20, N'飲料', N'26', N'40', N'10', N'12', N'4', N'12', N'500', N'新品上市', N'快來嘗鮮', N'', N'https://thumbs2.imgbox.com/8b/2c/FvLXvYXy_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (9, N'item13.png', N'測試飲料I', 40, N'飲料', N'10', N'36', N'12', N'10', N'3', N'18', N'760', N'新品上市', N'快來嘗鮮', NULL, N'https://thumbs2.imgbox.com/a4/8e/HijlfuBl_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (10, N'item14.png', N'測試飲料J', 25, N'飲料', N'16', N'60', N'16', N'16', N'3', N'16', N'500', N'季節限定', N'6/15~8/1', NULL, N'https://thumbs2.imgbox.com/a4/8e/HijlfuBl_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (12, N'item15.png', N'測試飲料K', 20, N'飲料', N'132', N'16', N'10', N'5', N'6', N'10', N'550', N'新品上市', N'快來嘗鮮', N'https://sandbox-web-pay.line.me/web/payment/wait?transactionReserveId=dStTd1ZOZ2xoNldvTit1eWNNZzJZSml6NGlMeklsUkFhdzRNRy9FVUJwaU9pUC95VGZ1WmNhUisrYS94cmJ3Nw', N'https://thumbs2.imgbox.com/da/4a/SnTSrOhN_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (13, N'item16.png', N'測試飲料L', 30, N'飲料', N'26', N'20', N'10', N'5', N'6', N'9', N'350', N'季節限定', N'6/15~8/1', N'https://sandbox-web-pay.line.me/web/payment/wait?transactionReserveId=UGV5d1ZPaGhoNldZdk82eUVEV0VZSW5ZaUQ0TFkvczlEalhTMUM4TEJ4RTBYcVVXZldxRFQ4SUVNMm8wdkxMTA', N'https://thumbs2.imgbox.com/97/09/OHszaKqL_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (14, N'item1.png', N'測試餅乾A', 45, N'餅乾', N'34', N'30', N'5', N'4', N'5', N'10', N'40', N'季節限定', N'6/15~8/1', N'https://sandbox-web-pay.line.me/web/payment/wait?transactionReserveId=cThYNkdWZ3QxczhvcUl3dGNITVc2anZVOS9RMndqTWRITDM0ZUw2eGQ4REpURUx0SVZFckdnc2NjL1c2cHpuWg', N'https://thumbs2.imgbox.com/96/68/qHcPMtjs_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (15, N'item2.png', N'測試餅乾B', 45, N'餅乾', N'26', N'40', N'10', N'12', N'4', N'12', N'40', N'新品上市', N'快來嘗鮮', N'https://sandbox-web-pay.line.me/web/payment/wait?transactionReserveId=NTZiN0dUZzMzYzlJUFBZdE1DNHA4L2lHdlZKRTA0N0FNbVJqTXpwOFJoWFF2OXRUa1IzK1NYTGVnMjdjc3VxWQ', N'https://thumbs2.imgbox.com/0c/94/8U9YA3Hk_t.jpg')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (16, N'item3.png', N'測試餅乾C', 40, N'餅乾', N'10', N'36', N'12', N'10', N'3', N'18', N'40', N'新品上市', N'快來嘗鮮', N'', N'https://thumbs2.imgbox.com/90/b3/KFRIb8Xa_t.jpg
')
INSERT [dbo].[ItemDb] ([ItemId], [ItemImg], [ItemName], [ItemUnitPrice], [Class], [Calorles], [Protein], [Carbohydrate], [Fat], [Sugars], [Sodium], [Capacity], [Slogan1], [Slogen2], [PayUrl], [ImgUrl]) VALUES (17, N'item4.png', N'測試餅乾B', 45, N'餅乾', N'16', N'60', N'16', N'16', N'3', N'16', N'40', N'季節限定', N'6/15~8/1', N'', N'https://thumbs2.imgbox.com/10/50/7mdl2Gdi_t.jpg')
SET IDENTITY_INSERT [dbo].[ItemDb] OFF
SET IDENTITY_INSERT [dbo].[MachineDb] ON 

INSERT [dbo].[MachineDb] ([MachineId], [Serial], [Area], [Location], [AddDate], [UpdateTime]) VALUES (N'1', 2, N'台中區       ', N'測試地點', N'2019-07-10', CAST(N'2019-07-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[MachineDb] OFF
SET IDENTITY_INSERT [dbo].[WarehouseDb] ON 

INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (1, 1, 1, CAST(N'2019-07-19T12:08:12.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (2, 1, 1, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (3, 2, 1, CAST(N'2019-06-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (4, 2, 1, CAST(N'2019-05-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (5, 2, 1, CAST(N'2019-04-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (6, 3, 1, CAST(N'2018-01-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (7, 3, 1, CAST(N'2019-07-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (8, 4, 1, CAST(N'2019-04-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[WarehouseDb] ([DataNo], [ItemId], [Amount], [UpdateTime], [Addtime]) VALUES (9, 4, 1, CAST(N'2019-03-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[WarehouseDb] OFF
ALTER TABLE [dbo].[MacInvDb]  WITH CHECK ADD  CONSTRAINT [FK_MacInvDb_EmpDb] FOREIGN KEY([Account])
REFERENCES [dbo].[EmpDb] ([Account])
GO
ALTER TABLE [dbo].[MacInvDb] CHECK CONSTRAINT [FK_MacInvDb_EmpDb]
GO
ALTER TABLE [dbo].[MacInvDb]  WITH CHECK ADD  CONSTRAINT [FK_MacInvDb_MachineDb] FOREIGN KEY([MachineId])
REFERENCES [dbo].[MachineDb] ([MachineId])
GO
ALTER TABLE [dbo].[MacInvDb] CHECK CONSTRAINT [FK_MacInvDb_MachineDb]
GO
ALTER TABLE [dbo].[MacInvDb]  WITH CHECK ADD  CONSTRAINT [FK_MacInvDb_WarehouseDb] FOREIGN KEY([ItemId_DataNo])
REFERENCES [dbo].[WarehouseDb] ([DataNo])
GO
ALTER TABLE [dbo].[MacInvDb] CHECK CONSTRAINT [FK_MacInvDb_WarehouseDb]
GO
ALTER TABLE [dbo].[WarehouseDb]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseDb_ItemDb] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemDb] ([ItemId])
GO
ALTER TABLE [dbo].[WarehouseDb] CHECK CONSTRAINT [FK_WarehouseDb_ItemDb]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工帳號 唯一值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工編號 遞增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工手機號碼(格式：0900000000)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'PhoneNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'男M /女F' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料更新日期時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpDb', @level2type=N'COLUMN',@level2name=N'Permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品序號 遞增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品圖片位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'ItemImg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品單價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'ItemUnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每100g卡路里 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Calorles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每100g蛋白質' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Protein'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每100g碳水化合物' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Carbohydrate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每100g脂肪' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Fat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每100g糖份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Sugars'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每100g鈉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDb', @level2type=N'COLUMN',@level2name=N'Sodium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'機台編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineDb', @level2type=N'COLUMN',@level2name=N'MachineId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'機台編號 遞增 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineDb', @level2type=N'COLUMN',@level2name=N'Serial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'區域 用於分析 ex' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineDb', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'機台位置 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineDb', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineDb', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料更新日期時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineDb', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料編號 遞增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MacInvDb', @level2type=N'COLUMN',@level2name=N'DataNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'機台編號 from MachineDb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MacInvDb', @level2type=N'COLUMN',@level2name=N'MachineId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工帳號 from EmpDb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MacInvDb', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品序號 from WarehouseDb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MacInvDb', @level2type=N'COLUMN',@level2name=N'ItemId_DataNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目前庫存量，不與總庫連動' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MacInvDb', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料編號 遞增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseDb', @level2type=N'COLUMN',@level2name=N'DataNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品序號 from itemDb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseDb', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseDb', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料更新日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseDb', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseDb', @level2type=N'COLUMN',@level2name=N'Addtime'
GO
USE [master]
GO
ALTER DATABASE [WiseMachine] SET  READ_WRITE 
GO
