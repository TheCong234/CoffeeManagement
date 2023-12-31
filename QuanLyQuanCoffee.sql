USE [master]
GO
/****** Object:  Database [COFFEEMANAGER]    Script Date: 8/2/2023 12:30:17 PM ******/
CREATE DATABASE [COFFEEMANAGER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'COFFEEMANAGER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\COFFEEMANAGER.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'COFFEEMANAGER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\COFFEEMANAGER_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [COFFEEMANAGER] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [COFFEEMANAGER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [COFFEEMANAGER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET ARITHABORT OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [COFFEEMANAGER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [COFFEEMANAGER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [COFFEEMANAGER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET  ENABLE_BROKER 
GO
ALTER DATABASE [COFFEEMANAGER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [COFFEEMANAGER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [COFFEEMANAGER] SET  MULTI_USER 
GO
ALTER DATABASE [COFFEEMANAGER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [COFFEEMANAGER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [COFFEEMANAGER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [COFFEEMANAGER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [COFFEEMANAGER] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [COFFEEMANAGER] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [COFFEEMANAGER] SET QUERY_STORE = ON
GO
ALTER DATABASE [COFFEEMANAGER] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [COFFEEMANAGER]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [bit] NULL,
	[DateCheckIn] [datetime] NULL,
	[DateCheckOut] [datetime] NULL,
	[idTableFood] [int] NULL,
	[employeeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](30) NULL,
	[email] [varchar](50) NULL,
	[phoneNumber] [varchar](10) NULL,
	[jobId] [int] NULL,
	[dateStartWork] [datetime] NULL,
	[userName] [nvarchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[images] [nvarchar](max) NULL,
	[price] [float] NOT NULL,
	[idCateGory] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 8/2/2023 12:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (1, 1, CAST(N'2023-05-15T00:00:00.000' AS DateTime), CAST(N'2023-05-15T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (2, 1, CAST(N'2023-06-14T00:00:00.000' AS DateTime), CAST(N'2023-06-14T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (3, 1, CAST(N'2023-07-07T00:00:00.000' AS DateTime), CAST(N'2023-07-07T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (4, 1, CAST(N'2023-07-13T00:00:00.000' AS DateTime), CAST(N'2023-07-13T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (5, 1, CAST(N'2023-07-14T00:00:00.000' AS DateTime), CAST(N'2023-07-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (6, 1, CAST(N'2023-07-16T00:00:00.000' AS DateTime), CAST(N'2023-07-16T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (7, 1, CAST(N'2023-07-16T00:00:00.000' AS DateTime), CAST(N'2023-07-16T00:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (8, 1, CAST(N'2023-07-17T00:00:00.000' AS DateTime), CAST(N'2023-07-17T00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (9, 1, CAST(N'2023-07-19T00:00:00.000' AS DateTime), CAST(N'2023-07-19T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (10, 1, CAST(N'2023-07-20T00:00:00.000' AS DateTime), CAST(N'2023-07-20T00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (11, 1, CAST(N'2023-07-20T00:00:00.000' AS DateTime), CAST(N'2023-07-20T00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (12, 1, CAST(N'2023-07-23T00:00:00.000' AS DateTime), CAST(N'2023-07-23T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (13, 1, CAST(N'2023-07-24T00:00:00.000' AS DateTime), CAST(N'2023-07-24T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (14, 1, CAST(N'2023-07-24T00:00:00.000' AS DateTime), CAST(N'2023-07-24T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (15, 1, CAST(N'2023-07-25T00:00:00.000' AS DateTime), CAST(N'2023-07-25T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (16, 1, CAST(N'2023-07-25T00:00:00.000' AS DateTime), CAST(N'2023-07-25T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (17, 1, CAST(N'2023-07-25T00:00:00.000' AS DateTime), CAST(N'2023-07-25T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (18, 1, CAST(N'2023-07-26T00:00:00.000' AS DateTime), CAST(N'2023-07-26T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (19, 0, CAST(N'2023-08-02T10:49:39.440' AS DateTime), NULL, 3, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (20, 0, CAST(N'2023-08-02T10:50:13.090' AS DateTime), NULL, 9, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (21, 0, CAST(N'2023-08-02T10:50:26.990' AS DateTime), NULL, 10, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (22, 1, CAST(N'2023-08-02T10:52:30.780' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (23, 1, CAST(N'2023-08-02T10:52:49.447' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (24, 1, CAST(N'2023-08-02T10:52:59.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Bill] ([id], [status], [DateCheckIn], [DateCheckOut], [idTableFood], [employeeId]) VALUES (25, 1, CAST(N'2023-08-02T10:53:12.320' AS DateTime), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1, 1, 4, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (2, 1, 5, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (3, 1, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (4, 2, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (5, 3, 19, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (6, 4, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (7, 6, 7, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (8, 5, 1, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (9, 11, 5, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (10, 11, 4, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (11, 7, 2, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (12, 9, 7, 7)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (13, 8, 4, 13)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (14, 10, 2, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (15, 12, 31, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (16, 17, 30, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (17, 17, 28, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (18, 13, 2, 7)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (19, 14, 15, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (20, 16, 16, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (21, 15, 7, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (22, 15, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (23, 19, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (24, 19, 11, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (25, 19, 14, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (26, 19, 27, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (27, 20, 27, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (28, 20, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (29, 21, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (30, 22, 3, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (31, 22, 17, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (32, 22, 19, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (33, 23, 19, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (34, 23, 4, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (35, 23, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (36, 24, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (37, 24, 15, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (38, 24, 5, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (39, 25, 3, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (1, N'Nguyễn Vũ Nhật', N'Minh', N'admin@gmail.com', N'012412491', 3, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'admin', N'admin')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (2, N'NGuyễn Vũ Việt', N'Bách', N'bachdz@gmail.com', N'0245654215', 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'ngheoviantham', N'khongnho')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (3, N'Trần Thế', N'Công', N'cong99@gmail.com', N'012546874', 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'cong99', N'cong99123')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (4, N'Võ Mạnh', N'Cường', N'cuong07@gmail.com', N'0256789454', 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'cuong07', N'mcuong12')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (5, N'Trần Thanh', N'Nga', N'thanhnga09@gmail.com', N'0933124542', 2, CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'conga', N'nganga123')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (6, N'Nguyễn Văn', N'Lượng', N'gcl055@gmail.com', N'0978526554', 1, CAST(N'2023-01-10T00:00:00.000' AS DateTime), N'quansu', N'12345')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (7, N'Nguyễn Thị', N'Nở', N'thino@gmail.com', N'0411525636', 1, CAST(N'2023-01-09T00:00:00.000' AS DateTime), N'thino', N'123654')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (8, N'Trần Ngọc', N'Mai', N'ngocmai@gmail.com', N'0625114225', 1, CAST(N'2023-01-10T00:00:00.000' AS DateTime), N'maingoc', N'123456')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [email], [phoneNumber], [jobId], [dateStartWork], [userName], [password]) VALUES (9, N'Trần Ngọc', N'Tú', N'tutrang@gmail.com', N'0833599999', 2, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'tutran', N'tu123')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (1, N'Cà phê sữa', N'', 35000, 1)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (2, N'Cà phê đen', N'', 32000, 1)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (3, N'Bạc xỉu', N'', 35000, 1)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (4, N'Sô-cô-la Katinat', N'', 45000, 1)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (5, N'Cà phê latte hạt phỉ', N'', 55000, 2)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (6, N'Cà phê latte hạnh nhân', N'', 55000, 2)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (7, N'Latte', N'', 50000, 2)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (8, N'Americano', N'', 35000, 2)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (9, N'Capuchino', N'', 50000, 2)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (10, N'Espresso', N'', 25000, 2)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (11, N'Caranel Sô-cô-la đá xay', N'', 55000, 3)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (12, N'Bánh oreo Sô-cô-la đá xay', N'', 55000, 3)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (13, N'Cà phê hạt phỉ đá xay', N'', 55000, 3)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (14, N'Cà phên hạnh nhân đá xay', N'', 55000, 3)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (15, N'Sữa chua dâu', N'', 50000, 4)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (16, N'Sữa chua nhiệt đới', N'', 50000, 4)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (17, N'Trà oolong dâu Mai Sơn', N'', 60000, 5)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (18, N'Trà đào hồng đài', N'', 65000, 5)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (19, N'Trà cam quế hồng đài', N'', 55000, 5)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (20, N'Trà đào', N'', 45000, 5)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (21, N'Trà vải', N'', 45000, 5)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (22, N'Trà sữa chôm chôm', N'', 60000, 6)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (23, N'Trà oolong nướng sữa', N'', 45000, 6)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (24, N'Trà oolong tứ quý sữa', N'', 45000, 6)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (25, N'Trà B"Lao sữa', N'', 45000, 6)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (26, N'Trà xanh lài sữa', N'', 45000, 6)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (27, N'Trân châu phô mai dẻo - 4 viên', N'', 15000, 7)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (28, N'Viên phô mai jumbo - 4 viên', N'', 15000, 7)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (29, N'Bánh chuối nho khô', N'', 35000, 8)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (30, N'Bánh kem bắp', N'', 50000, 8)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (31, N'Bánh phô mai tan chảy', N'', 55000, 8)
INSERT [dbo].[Food] ([id], [name], [images], [price], [idCateGory]) VALUES (32, N'Bông lan trứng muối', N'', 35000, 8)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (9, N'All')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (8, N'Bánh')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Cà phê espresso')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Cà phê truyền thống')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Đá xay')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Sữa chua')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (7, N'Topping')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (6, N'Trà sữa')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Trà trái cây')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([id], [name], [salary]) VALUES (1, N'Nhân viên', 6000000)
INSERT [dbo].[Job] ([id], [name], [salary]) VALUES (2, N'Quản lý', 8000000)
INSERT [dbo].[Job] ([id], [name], [salary]) VALUES (3, N'Cửa hàng trưởng', 9000000)
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn mang đi', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 2', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 3', 1)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 4', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 5', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 6', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 7', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 8', 0)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 9', 1)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 10', 1)
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 11', 0)
SET IDENTITY_INSERT [dbo].[TableFood] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Employees_Email]    Script Date: 8/2/2023 12:30:17 PM ******/
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [UQ_Employees_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Employees_Username]    Script Date: 8/2/2023 12:30:17 PM ******/
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [UQ_Employees_Username] UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_FoodCategory_Name]    Script Date: 8/2/2023 12:30:17 PM ******/
ALTER TABLE [dbo].[FoodCategory] ADD  CONSTRAINT [UQ_FoodCategory_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Job_Name]    Script Date: 8/2/2023 12:30:17 PM ******/
ALTER TABLE [dbo].[Job] ADD  CONSTRAINT [UQ_Job_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_TableFood_Name]    Script Date: 8/2/2023 12:30:17 PM ******/
ALTER TABLE [dbo].[TableFood] ADD  CONSTRAINT [UQ_TableFood_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (NULL) FOR [DateCheckOut]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (getdate()) FOR [dateStartWork]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'') FOR [images]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT ((0)) FOR [salary]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTableFood])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_TableFood] FOREIGN KEY([idTableFood])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_TableFood]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Bill] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Bill]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Food] FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Food]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([jobId])
REFERENCES [dbo].[Job] ([id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Job] FOREIGN KEY([jobId])
REFERENCES [dbo].[Job] ([id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Job]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCateGory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
USE [master]
GO
ALTER DATABASE [COFFEEMANAGER] SET  READ_WRITE 
GO
