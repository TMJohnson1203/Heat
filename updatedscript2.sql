USE [master]
GO
/****** Object:  Database [Heat]    Script Date: 12/11/2017 2:56:19 PM ******/
CREATE DATABASE [Heat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Heat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Heat.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Heat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Heat_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Heat] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Heat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Heat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Heat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Heat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Heat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Heat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Heat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Heat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Heat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Heat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Heat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Heat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Heat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Heat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Heat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Heat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Heat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Heat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Heat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Heat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Heat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Heat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Heat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Heat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Heat] SET  MULTI_USER 
GO
ALTER DATABASE [Heat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Heat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Heat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Heat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Heat] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Heat]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 12/11/2017 2:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[CouplesComboID] [int] IDENTITY(1,1) NOT NULL,
	[Combo] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Combo] PRIMARY KEY CLUSTERED 
(
	[CouplesComboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Couple]    Script Date: 12/11/2017 2:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Couple](
	[CouplesID] [int] IDENTITY(1,1) NOT NULL,
	[Partner] [nvarchar](100) NOT NULL,
	[ProID] [int] NOT NULL,
	[HeatListID] [int] NOT NULL,
	[Number] [nvarchar](10) NOT NULL,
	[DanceLevelID] [int] NOT NULL,
	[CouplesComboID] [int] NOT NULL,
	[DanceTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Couple] PRIMARY KEY CLUSTERED 
(
	[CouplesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanceLevel]    Script Date: 12/11/2017 2:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanceLevel](
	[DanceLevelID] [int] IDENTITY(1,1) NOT NULL,
	[DanceLevel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanceLevel] PRIMARY KEY CLUSTERED 
(
	[DanceLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanceType]    Script Date: 12/11/2017 2:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanceType](
	[DanceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Dance] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanceType] PRIMARY KEY CLUSTERED 
(
	[DanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeatList]    Script Date: 12/11/2017 2:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeatList](
	[HeatListID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Time] [datetime] NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Heat] PRIMARY KEY CLUSTERED 
(
	[HeatListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pro]    Script Date: 12/11/2017 2:56:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pro](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Pro] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([CouplesComboID], [Combo]) VALUES (1, N'Pro-Am')
INSERT [dbo].[Combo] ([CouplesComboID], [Combo]) VALUES (2, N'Pro-Pro')
SET IDENTITY_INSERT [dbo].[Combo] OFF
SET IDENTITY_INSERT [dbo].[Couple] ON 

INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (1, N'Matt Jarvis', 1, 2, N'646', 1, 2, 1)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (2, N'Matt Jarvis', 1, 3, N'646', 1, 2, 2)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (3, N'Coco James', 3, 9, N'11', 3, 1, 2)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (4, N'Daniella Hock', 3, 7, N'12', 2, 2, 6)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (5, N'Judith Hinckleman', 3, 8, N'21', 3, 1, 3)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (6, N'Sophia Maria', 4, 8, N'22', 3, 1, 3)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (7, N'Selena Gomez', 5, 6, N'2121', 2, 2, 1)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (8, N'Shakira', 5, 7, N'800', 2, 2, 6)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (9, N'Asger Barr', 2, 3, N'777', 1, 2, 2)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (10, N'Asger Barr', 2, 4, N'777', 1, 2, 3)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (11, N'Matt Jarvis', 1, 4, N'6464', 1, 2, 3)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (12, N'Asger Barr', 2, 2, N'777', 1, 2, 1)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (13, N'Selena Gomez', 5, 3, N'2121', 1, 2, 2)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (14, N'Selena Gomez', 5, 4, N'2121', 1, 2, 3)
INSERT [dbo].[Couple] ([CouplesID], [Partner], [ProID], [HeatListID], [Number], [DanceLevelID], [CouplesComboID], [DanceTypeID]) VALUES (15, N'Selena Gomez', 5, 5, N'2121', 1, 2, 6)
SET IDENTITY_INSERT [dbo].[Couple] OFF
SET IDENTITY_INSERT [dbo].[DanceLevel] ON 

INSERT [dbo].[DanceLevel] ([DanceLevelID], [DanceLevel]) VALUES (1, N'Bronze')
INSERT [dbo].[DanceLevel] ([DanceLevelID], [DanceLevel]) VALUES (2, N'Silver')
INSERT [dbo].[DanceLevel] ([DanceLevelID], [DanceLevel]) VALUES (3, N'Gold')
SET IDENTITY_INSERT [dbo].[DanceLevel] OFF
SET IDENTITY_INSERT [dbo].[DanceType] ON 

INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (1, N'Waltz')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (2, N'Foxtrot')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (3, N'Tango')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (4, N'Quickstep')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (5, N'Viennese Waltz')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (6, N'Rumba')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (7, N'Cha Cha')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (8, N'East Coast Swing')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (9, N'West Coast Swing')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (10, N'Jive')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (11, N'Samba')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (12, N'Mambo')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (13, N'Bolero')
INSERT [dbo].[DanceType] ([DanceTypeID], [Dance]) VALUES (14, N'Paso Doble')
SET IDENTITY_INSERT [dbo].[DanceType] OFF
SET IDENTITY_INSERT [dbo].[HeatList] ON 

INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (1, NULL, NULL, N'NOT ASSIGNED')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (2, N'Now', CAST(N'2017-12-05 12:00:00.000' AS DateTime), N'Heat 1 Bronze Waltz Pro-Pro')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (3, N'On deck', NULL, N'Heat 2 Bronze Foxtrot Pro-Pro')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (4, N'In the hole', NULL, N'Heat 3 Bronze Tango Pro-Pro')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (5, NULL, NULL, N'Heat 4 Bronze Rumba Pro-Pro')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (6, NULL, NULL, N'Heat 5 Silver Waltz Pro-Pro')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (7, NULL, NULL, N'Heat 6 Silver Rumba Pro-Pro')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (8, NULL, NULL, N'Heat 7 Gold Tango Pro-Am')
INSERT [dbo].[HeatList] ([HeatListID], [Status], [Time], [Name]) VALUES (9, NULL, NULL, N'Heat 8 Gold Foxtrot Pro-Am')
SET IDENTITY_INSERT [dbo].[HeatList] OFF
SET IDENTITY_INSERT [dbo].[Pro] ON 

INSERT [dbo].[Pro] ([ProID], [Name]) VALUES (1, N'Kaitie Fox')
INSERT [dbo].[Pro] ([ProID], [Name]) VALUES (2, N'Teresa Johnson')
INSERT [dbo].[Pro] ([ProID], [Name]) VALUES (3, N'Dejan Stanarevic')
INSERT [dbo].[Pro] ([ProID], [Name]) VALUES (4, N'Faizon Alexander')
INSERT [dbo].[Pro] ([ProID], [Name]) VALUES (5, N'David Gomez')
SET IDENTITY_INSERT [dbo].[Pro] OFF
ALTER TABLE [dbo].[Couple]  WITH CHECK ADD  CONSTRAINT [FK_Couple_Combo] FOREIGN KEY([CouplesComboID])
REFERENCES [dbo].[Combo] ([CouplesComboID])
GO
ALTER TABLE [dbo].[Couple] CHECK CONSTRAINT [FK_Couple_Combo]
GO
ALTER TABLE [dbo].[Couple]  WITH CHECK ADD  CONSTRAINT [FK_Couple_DanceLevel] FOREIGN KEY([DanceLevelID])
REFERENCES [dbo].[DanceLevel] ([DanceLevelID])
GO
ALTER TABLE [dbo].[Couple] CHECK CONSTRAINT [FK_Couple_DanceLevel]
GO
ALTER TABLE [dbo].[Couple]  WITH CHECK ADD  CONSTRAINT [FK_Couple_DanceType] FOREIGN KEY([DanceTypeID])
REFERENCES [dbo].[DanceType] ([DanceTypeID])
GO
ALTER TABLE [dbo].[Couple] CHECK CONSTRAINT [FK_Couple_DanceType]
GO
ALTER TABLE [dbo].[Couple]  WITH CHECK ADD  CONSTRAINT [FK_Couple_HeatList] FOREIGN KEY([HeatListID])
REFERENCES [dbo].[HeatList] ([HeatListID])
GO
ALTER TABLE [dbo].[Couple] CHECK CONSTRAINT [FK_Couple_HeatList]
GO
ALTER TABLE [dbo].[Couple]  WITH CHECK ADD  CONSTRAINT [FK_Couple_Pro] FOREIGN KEY([ProID])
REFERENCES [dbo].[Pro] ([ProID])
GO
ALTER TABLE [dbo].[Couple] CHECK CONSTRAINT [FK_Couple_Pro]
GO
USE [master]
GO
ALTER DATABASE [Heat] SET  READ_WRITE 
GO
