USE [master]
GO
/****** Object:  Database [FoodShop_SWP391]    Script Date: 6/4/2023 12:40:07 AM ******/
CREATE DATABASE [FoodShop_SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodShop_SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FoodShop_SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodShop_SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FoodShop_SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FoodShop_SWP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodShop_SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodShop_SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodShop_SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodShop_SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodShop_SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodShop_SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodShop_SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [FoodShop_SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodShop_SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodShop_SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodShop_SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodShop_SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodShop_SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FoodShop_SWP391', N'ON'
GO
ALTER DATABASE [FoodShop_SWP391] SET QUERY_STORE = OFF
GO
USE [FoodShop_SWP391]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phonenum] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[accountID] [int]  NOT NULL,
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[blogTitle] [nvarchar](100) NULL,
	[blogDetail] [nvarchar](max) NULL,
	[date] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blogImage]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogImage](
	[blogID] [int] NOT NULL,
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cartDetail]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartDetail](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
	[describe] [nvarchar](max) NULL,
	[catImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[combo]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[combo](
	[comboID] [int] IDENTITY(1,1) NOT NULL,
	[comboName] [nvarchar](100) NOT NULL,
	[price] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[comboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comboDetail]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comboDetail](
	[comboID] [int] NOT NULL,
	[productID] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int]  NOT NULL,
	[accountID] [int] NOT NULL,
	[fcontent] [nvarchar](max) NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[accountID] [int] NOT NULL,
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[total] [int] NOT NULL,
	[date] [date] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[note] [nvarchar](200) NULL,
	[orderStatusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderInfo]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderInfo](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NULL,
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderStatus]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderStatus](
	[orderStatusID] [int] NOT NULL,
	[orderStatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [int] NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[details] [nvarchar](max) NULL,
	[price] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productImage]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productImage](
	[productID] [int] NULL,
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 6/4/2023 12:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (1, N'ngxson2411@gmail.com', N'123456@son', 1, N'Son Nguyen', N'0384244398', N'Ha Long', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (2, N'sonnxhe163813@fpt.edu.vn', N'123456789.ok', 1, N'Son', N'0342677962', N'Ha Noi', 0)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (4, N'hieuvmhe172039@fpt.edu.vn', N'123456@hieu', 2, N'Hieu', N'0368974574', N'Long Bien', 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[cartDetail] ON 

INSERT [dbo].[cartDetail] ([cartID], [accountID], [productID], [quantity], [status]) VALUES (9, 4, 28, 1, 1)
INSERT [dbo].[cartDetail] ([cartID], [accountID], [productID], [quantity], [status]) VALUES (10, 4, 16, 1, 1)
INSERT [dbo].[cartDetail] ([cartID], [accountID], [productID], [quantity], [status]) VALUES (11, 4, 28, 1, 1)
INSERT [dbo].[cartDetail] ([cartID], [accountID], [productID], [quantity], [status]) VALUES (12, 4, 16, 1, 1)
INSERT [dbo].[cartDetail] ([cartID], [accountID], [productID], [quantity], [status]) VALUES (13, 4, 4, 1, 1)
INSERT [dbo].[cartDetail] ([cartID], [accountID], [productID], [quantity], [status]) VALUES (18, 1, 16, 1, 1)
SET IDENTITY_INSERT [dbo].[cartDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (1, N'Snack', NULL, N'images/category/snack.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (2, N'Dessert-Drink', NULL, N'images/category/dessert.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (3, N'Spaghetti', NULL, N'images/category/MY-Y-POP.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (4, N'Rice', NULL, N'images/category/Rice-F.Chicken.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (5, N'Burger', NULL, N'images/category/burger.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (6, N'Chicken', NULL, N'images/category/Fried-Chicken.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (7, N'Combo', NULL, N'images/category/c-gahoangkim.jpg')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[combo] ON 

INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (1, N'Combo Fried Chicken', 89000, 1, N'2 Fried Chicken + 1 FF (R) /2 Nuggets + 1 Lipton Regular', N'images/combo/2-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (2, N'Combo Spaghetti', 89000, 1, N'1 Spaghetti with Tomato Sauce and Popcorn + 1 Fried Chicken/2 Tenderods + 1 Pepsi Can', N'images/combo/3-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (3, N'D4 CBO Salad', 79000, 1, N'1 Fried Chicken + 1 Salad Hat + 1 Pepsi Can', N'images/combo/D4-new.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (4, N'Combo Burger', 91000, 1, N'1 Burger Zinger/ Burger Flava/ Burger Shrimp + 1 Fried Chicken + 1 Pepsi Can', N'images/combo/D5.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (5, N'Combo For Group 1', 175000, 1, N'3 Fried Chicken + 1 Burger Shrimp + 2 Pepsi Can', N'images/combo/D6.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (6, N'Combo For Group 2', 195000, 1, N'4 Fried Chicken + 2 Pumcheese + 2 Pepsi Can', N'images/combo/D7-new.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (7, N'Combo For Group 3', 232000, 1, N'5 Fried Chicken + 1 Pop R /4 Nuggets + 2 Pepsi Can', N'images/combo/D8-new.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (8, N'2 Golden Egg Chicken', 79000, 1, N'2 Golden Egg Chicken', N'images/combo/2-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (9, N'3 Golden Egg Chicken', 117000, 1, N'3 Golden Egg Chicken', N'images/combo/3-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (10, N'6 Golden Egg Chicken', 231000, 1, N'6 Golden Egg Chicken', N'images/combo/6-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (11, N'Golden Egg HDA', 69000, 1, N'01 Golden Egg (HS/NSC) + 01 FF (R) / 01 (CLR + MPR) + 01 Pepsi Can', N'images/combo/a-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (12, N'Golden Egg HDB', 104000, 1, N'02 Golden Egg (HS/NSC) + 02 Nuggets + 01 Pepsi Can', N'images/combo/b-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (13, N'Golden Egg HDC', 199000, 1, N'03 Golden Egg (HS/NSC)+ 01 COB (OR/HS/NSC) + 03 Nuggets + 02 Pepsi Can', N'images/combo/c-gahoangkim.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (14, N'2 Hash Browns', 17000, 1, N'2 Hash Browns', N'images/combo/2-Hash-Browns.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (15, N'3 Hash Browns', 25000, 1, N'3 Hash Browns', N'images/combo/3-Hash-Browns.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (16, N'4 Hash Browns', 32000, 1, N'4 Hash Browns', N'images/combo/4-Hash-Browns.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (17, N'6 Hash Browns', 47000, 1, N'6 Hash Browns', N'images/combo/6-Hash-Browns.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (18, N'Combo Hash Browns A', 78000, 1, N'2 Hash Browns + 1 Rice Fried Chicken/Rice Flava/Rice Skewer/Rice Teriyaki/Rice Steak + 1 Seaweed Soup/Vegetable Soup + 1 Pepsi Can', N'images/combo/Hash-Browns-A.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (19, N'Combo Hash Browns B', 68000, 1, N'2 Hash Browns + 1 Spaghetti with Tomato Sauce and Popcorn + 1 Pepsi Can', N'images/combo/Hash-Browns-B.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (20, N'Combo Hash Browns C', 89000, 1, N'2 Hash Browns + 1 Spaghetti with Tomato Sauce and Popcorn + 1 Pepsi Can', N'images/combo/Hash-Browns-C.jpg')
INSERT [dbo].[combo] ([comboID], [comboName], [price], [status], [describe], [image]) VALUES (21, N'Combo Hash Browns D', 179000, 1, N'3 Hash Browns + 3 Fried Chicken + 1 Burger Zinger/ Burger Flava/ Burger Shrimp + 2 Pepsi Can', N'images/combo/Hash-Browns-D.jpg')
SET IDENTITY_INSERT [dbo].[combo] OFF
GO
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (1, 1, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (1, 20, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (1, 16, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (2, 12, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (2, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (13, 1, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (2, 1, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (3, 1, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (3, 18, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (3, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (4, 6, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (4, 1, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (4, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (5, 1, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (5, 5, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (5, 24, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (6, 1, 4)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (6, 25, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (6, 24, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (7, 1, 5)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (7, 27, 4)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (7, 24, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (8, 28, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (9, 28, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (10, 28, 6)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (11, 28, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (11, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (11, 14, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (11, 15, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (12, 27, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (12, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (12, 28, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (13, 27, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (13, 28, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (13, 24, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (14, 29, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (15, 29, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (16, 29, 4)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (17, 29, 6)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (18, 29, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (18, 7, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (18, 13, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (18, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (19, 12, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (19, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (19, 29, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (20, 1, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (20, 29, 2)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (20, 24, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (21, 6, 1)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (21, 1, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (21, 29, 3)
INSERT [dbo].[comboDetail] ([comboID], [productID], [quantity]) VALUES (21, 24, 2)
GO
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (1, N'Preparing')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (2, N'Deliverying')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (3, N'Delivered')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (4, N'Fail to delivery')
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (1, 6, N'Fried Chicken', NULL, 36000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (2, 6, N'Roasted Fillet', NULL, 39000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (3, 6, N'ROASTED CHICKEN LEG QUARTER', NULL, 75000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (4, 5, N'Burger Flava', NULL, 55000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (5, 5, N'Burger Shrimp', NULL, 45000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (6, 5, N'Burger Zinger', NULL, 55000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (7, 4, N'Fried Chicken Rice', NULL, 46000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (8, 4, N'Flava Rice', NULL, 46000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (9, 4, N'Steak Rice', NULL, 46000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (10, 4, N'Tenderods Rice', NULL, 46000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (11, 4, N'Skewer Rice', NULL, 46000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (12, 3, N'Spaghetti with Tomato Sauce and Popcorn', NULL, 41000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (13, 1, N'Seaweed Soup', NULL, 17000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (14, 1, N'Coleslaw', NULL, 12000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (15, 1, N'Mashed Potato', NULL, 12000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (16, 1, N'French Fries', NULL, 19000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (17, 1, N'Salad Pop', NULL, 39000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (18, 1, N'Salad Hat', NULL, 36000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (19, 2, N'Peach Tea', NULL, 24000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (20, 2, N'Lipton Lemon Tea', NULL, 10000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (21, 2, N'Pepsi Black Lime Can', NULL, 17000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (22, 2, N'Aquafina 500ml', NULL, 15000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (23, 2, N'7Up Can', NULL, 17000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (24, 2, N'Pepsi Can', NULL, 17000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (25, 2, N'Pumcheese', NULL, 15000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (26, 2, N'Eggtart', NULL, 18000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (27, 6, N'PCS KFC NUGGETS', NULL, 9000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (28, 6, N'Golden Egg Chicken', NULL, 41000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (29, 1, N'Hash Brown', NULL, 9000, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (1, 1, N'images\chicken\fried-chicken\Fried-Chicken.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (2, 2, N'images\chicken\rosted-chicken\MOD-PHI-LE-GA-QUAY.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (3, 3, N'images\chicken\rosted-chicken\luon-ga.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (4, 4, N'images\burger\Burger-Flava.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (5, 5, N'images\burger\Burger-Shrimp.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (6, 6, N'images\burger\Burger-Zinger.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (7, 7, N'images\rice\Rice-F.Chicken.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (8, 8, N'images\rice\Rice-Flava.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (9, 9, N'images\rice\Rice-Steak.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (10, 10, N'images\rice\Rice-TENDERODS.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (11, 11, N'images\rice\Rice-Skewer.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (12, 12, N'images\spaghetti\MY-Y-POP.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (13, 13, N'images\snack\Soup-Rong-Bien.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (14, 14, N'images\snack\BapCai-Tron.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (15, 15, N'images\snack\KhoaiTay-Nghien.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (16, 16, N'images\snack\KhoaiTay-Chien.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (17, 17, N'images\snack\SALAD-HAT-GA-VIEN.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (18, 18, N'images\snack\SALAD-HAT.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (19, 19, N'images\dessert-drink\Peach-Tea.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (20, 20, N'images\dessert-drink\Lipton.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (21, 21, N'images\dessert-drink\pepsi-lime-can.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (22, 22, N'images\dessert-drink\Aquafina-600ml.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (23, 23, N'images\dessert-drink\7Up-Can.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (24, 24, N'images\dessert-drink\Pepsi-Can.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (25, 25, N'images\dessert-drink\Pumcheese.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (26, 26, N'images\dessert-drink\eggtart.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (27, 27, N'images\chicken\fried-chicken\3_Nuggests.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (28, 28, N'images\chicken\fried-chicken\1-gahoangkim.jpg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (29, 29, N'images\snack\2-Hash-Browns.jpg')
GO
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (1, N'Customer')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (2, N'Admin')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (3, N'Sale')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (4, N'MKT')
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[blogImage]  WITH CHECK ADD FOREIGN KEY([imageID])
REFERENCES [dbo].[blog] ([blogID])
GO
ALTER TABLE [dbo].[cartDetail]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[cartDetail]  WITH CHECK ADD  CONSTRAINT [FK_cartDetail_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[cartDetail] CHECK CONSTRAINT [FK_cartDetail_product]
GO
ALTER TABLE [dbo].[comboDetail]  WITH CHECK ADD FOREIGN KEY([comboID])
REFERENCES [dbo].[combo] ([comboID])
GO
ALTER TABLE [dbo].[comboDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([orderStatusID])
REFERENCES [dbo].[orderStatus] ([orderStatusID])
GO
ALTER TABLE [dbo].[orderInfo]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[orderInfo]  WITH CHECK ADD  CONSTRAINT [FK_OrderInfo_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[orderInfo] CHECK CONSTRAINT [FK_OrderInfo_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[productImage]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
USE [master]
GO
ALTER DATABASE [FoodShop_SWP391] SET  READ_WRITE 
GO
