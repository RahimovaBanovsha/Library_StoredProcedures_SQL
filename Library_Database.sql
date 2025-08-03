USE [master]
GO
/****** Object:  Database [Library]    Script Date: 03.08.2025 22:31:31 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Library] SET QUERY_STORE = ON
GO
ALTER DATABASE [Library] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 03.08.2025 22:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Pages] [int] NOT NULL,
	[YearPress] [int] NOT NULL,
	[Id_Themes] [int] NOT NULL,
	[Id_Category] [int] NOT NULL,
	[Id_Author] [int] NOT NULL,
	[Id_Press] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Id_Faculty] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libs]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libs](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Libs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Press]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Press](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Press] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Cards]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Cards](
	[Id] [int] NOT NULL,
	[Id_Student] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL,
 CONSTRAINT [PK_S_Cards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Group] [int] NOT NULL,
	[Term] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Cards]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Cards](
	[Id] [int] NOT NULL,
	[Id_Teacher] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL,
 CONSTRAINT [PK_T_Cards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Dep] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themes]    Script Date: 03.08.2025 22:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (1, N'James R. ', N'Groff')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (2, N'Sergey ', N'Nikolsky')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (3, N'Michael ', N'Marows')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (4, N'Boris ', N'Carpov')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (5, N'Alexey ', N'Arkhangelsky')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (6, N'Vladimir ', N'Korol')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (7, N'Evangelos ', N'Petrusos')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (8, N'Markus', N'Herhager')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (9, N'Pavel', N'Garbar')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (10, N'Aleksandr', N'Matrosov')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (11, N'Ludmila', N'Omelchenko')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (12, N'Kevin ', N'Reichard')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (13, N'Olga ', N'Kokoreva')
GO
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (14, N'Mark ', N'Braun')
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (1, N'SQL', 816, 2001, 1, 1, 1, 2, N'2nd edition', 4)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (2, N'3D Studio Max 3', 640, 2000, 3, 6, 3, 3, N'Training course', 5)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (3, N'100 components of the general purpose library Delphi 5', 272, 1999, 2, 4, 5, 4, N'Components', 2)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (4, N'Visual Basic 6', 416, 2000, 2, 5, 4, 3, N'Special reference book', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (5, N'Course of mathematical analysis', 328, 1990, 4, 2, 2, 5, N'Volume 1', 2)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (6, N'C ++ Builder 5: 70 library of information input / output components', 288, 2000, 2, 3, 5, 4, N'Components', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (7, N'Integrated Development Environment', 272, 2000, 2, 3, 5, 4, N'Development environment', 2)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (8, N'Help for Delphi 5 and Object Pascal', 32, 2000, 2, 4, 5, 4, N'Directory', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (9, N'Visual Basic 6.0 for Application', 488, 2000, 2, 5, 6, 6, N'Directory', 3)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (10, N'Visual Basic 6', 576, 2000, 2, 5, 7, 2, N'Developer`s guide 1-st volume', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (11, N'Mathcad 2000', 416, 2000, 5, 7, 8, 2, N'Complete Guide', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (12, N'Novell GroupWise 5.5 e-mail and collaboration system', 480, 2000, 6, 8, 9, 2, N'Network Packages', 2)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (13, N'Windows 2000 registry', 352, 2000, 9, 12, 13, 2, N'A guide for professionals', 4)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (14, N'Unix directory', 384, 1999, 9, 13, 12, 3, N'Reference Guide', 0)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (15, N'Self-Teaching Visual FoxPro 6.0', 512, 1999, 1, 11, 11, 2, N'Self-Teaching', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (16, N'Self-Teaching FrontPage 2000', 512, 1999, 7, 10, 11, 2, N'Self-Teaching', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (17, N'Self-Teaching Perl', 432, 2000, 2, 9, 10, 2, N'Self-Teaching', 2)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (18, N'HTML 3.2', 1040, 2000, 7, 14, 14, 2, N'Guide', 5)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (19, N'Data base', 256, 1996, 1, 1, 4, 4, NULL, 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (20, N'WCF, Part 1', 250, 2010, 1, 1, 4, 2, NULL, 4)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (21, N'WCF, Part 2', 250, 2010, 1, 1, 4, 2, NULL, 4)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (22, N'WCF, Part 3', 250, 2010, 1, 1, 4, 2, NULL, 4)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (101, N'SQL server part 1', 105, 2010, 1, 1, 4, 3, N'Part 1', 1)
GO
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (102, N'SQL server part 2', 115, 2010, 1, 1, 4, 3, N'Part 2', 4)
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'SQL Language')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Mathematical Analysis')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'C ++ Builder ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Delphi ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Visual Basic ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'3D Studio Max ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Mathcad ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Novell ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Perl ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'FrontPage ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Visual FoxPro ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Windows 2000 ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Unix ')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (14, N'HTML ')
GO
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'Programmerstva ')
GO
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'Graphics and Designs')
GO
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'Iron and Administration')
GO
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (1, N'Programming ')
GO
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (2, N'Web Design')
GO
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (3, N'Administrations')
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (2, N'9P1 ', 1)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (3, N'9P2 ', 1)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (4, N'9A ', 3)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (5, N'9D ', 2)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (6, N'14A ', 3)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (7, N'19P1 ', 1)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (8, N'18P2 ', 1)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (9, N'18A ', 3)
GO
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (10, N'19D ', 2)
GO
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (1, N'Sergey ', N'Maksimenko')
GO
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (2, N'Dmitry ', N'Chebotarev')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (1, N'DiaSoft ')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (2, N'BHV ')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (3, N'Piter')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (4, N'Binom ')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (5, N'Nauka')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (6, N'Kudits-Image')
GO
INSERT [dbo].[Press] ([Id], [Name]) VALUES (7, N'Dialectics')
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 1, CAST(N'2001-05-17T00:00:00.000' AS DateTime), CAST(N'2001-06-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 17, 18, CAST(N'2000-05-18T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 3, CAST(N'2001-04-21T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 21, 4, CAST(N'2001-03-26T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 3, 1, CAST(N'2000-05-07T00:00:00.000' AS DateTime), CAST(N'2001-04-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 7, 11, CAST(N'2001-06-02T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 16, 14, CAST(N'2001-04-05T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 11, 6, CAST(N'2001-05-05T00:00:00.000' AS DateTime), CAST(N'2002-12-11T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (9, 17, 2, CAST(N'2001-10-01T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (10, 10, 13, CAST(N'2001-05-05T00:00:00.000' AS DateTime), CAST(N'2002-12-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (11, 16, 11, CAST(N'2001-05-05T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (12, 2, 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (99, 5, 14, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (101, 5, 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (2, N'Vyacheslav ', N'Zesik', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (3, N'Olga ', N'Mantulyak', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (4, N'Olga ', N'Hrenova', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (5, N'Olga ', N'Medvedeva', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (6, N'Galina ', N'Inashchenko', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (7, N'Jury ', N'Minaev', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (8, N'Jury ', N'Domovesov', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (9, N'Russland ', N'Yarmolovich', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (10, N'Igor ', N'Udovik', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (11, N'Petr ', N'Katsevich', 8, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (12, N'Eugenius', N'Burcev', 3, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (13, N'Flora ', N'Pobirskaya', 3, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (14, N'Atalya ', N'Gridina', 3, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (15, N'Elena ', N'Akusova', 3, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (16, N'Svetlana ', N'Gorshkov', 9, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (17, N'Alexander', N'Lyubenko ', 10, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (18, N'Eugenia ', N'Cymbalyuk', 10, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (19, N'Olga ', N'Bolyachevskaya', 5, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (20, N'Stanislav ', N'Pleshakov', 7, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (21, N'Elena ', N'Taran', 4, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (22, N'Denis ', N'Rogachevsky', 6, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (23, N'Oksana ', N'Tihonova', 6, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (24, N'Petr ', N'Maximov', 3, 2)
GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (25, N'Iryna ', N'Stogneeva', 5, 2)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 13, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2001-07-04T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 10, 2, CAST(N'2000-03-03T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 12, CAST(N'2000-06-04T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 3, 1, CAST(N'2000-09-05T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 8, 8, CAST(N'2000-05-05T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 5, 18, CAST(N'2001-02-02T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 12, 17, CAST(N'2001-03-04T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 4, 18, CAST(N'2000-07-02T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (1, N'Grigory ', N'Jashchuk', 1)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (2, N'Alex', N'Tumanov ', 1)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (3, N'Sergey ', N'Maksimenko', 2)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (4, N'Dmitry', N'Borovsky', 2)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (5, N'Victor ', N'Brovar', 2)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (6, N'Vadim ', N'Tkachenko', 3)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (7, N'Vyacheslav ', N'Kalashnikov', 3)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (8, N'Ruslan ', N'Kucherenko', 1)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (9, N'Andrey', N'Tendyuk', 1)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (10, N'Anatoly ', N'Vyklyuk', 2)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (11, N'Oleg ', N'Reznichenko', 3)
GO
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (12, N'Alexander', N'Artemov ', 1)
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (1, N'Bases of data ')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (2, N'Programming')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (3, N'Graphic Packages')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (4, N'High Mathematics')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (5, N'Mathematical Packages')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (6, N'Networks')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (7, N'Web-design')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (8, N'Windows 2000 ')
GO
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (9, N'operating systems')
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Author] FOREIGN KEY([Id_Author])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Author]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Category] FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Category]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Press] FOREIGN KEY([Id_Press])
REFERENCES [dbo].[Press] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Press]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Theme] FOREIGN KEY([Id_Themes])
REFERENCES [dbo].[Themes] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Theme]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Faculty] FOREIGN KEY([Id_Faculty])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Faculty]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [FK_S_Cards_Book] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [FK_S_Cards_Book]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [FK_S_Cards_Lib] FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [FK_S_Cards_Lib]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [FK_S_Cards_Stud] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [FK_S_Cards_Stud]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Group] FOREIGN KEY([Id_Group])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Group]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [FK_T_Cards_Book] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [FK_T_Cards_Book]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [FK_T_Cards_Lib] FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [FK_T_Cards_Lib]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [FK_T_Cards_Teacher] FOREIGN KEY([Id_Teacher])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [FK_T_Cards_Teacher]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Dep] FOREIGN KEY([Id_Dep])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Dep]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
