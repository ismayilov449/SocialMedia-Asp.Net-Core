USE [master]
GO
/****** Object:  Database [SocaialMediaDB]    Script Date: 2/21/2020 10:09:51 PM ******/
CREATE DATABASE [SocaialMediaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocaialMediaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SocaialMediaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocaialMediaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SocaialMediaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SocaialMediaDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocaialMediaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocaialMediaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocaialMediaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocaialMediaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SocaialMediaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocaialMediaDB] SET  MULTI_USER 
GO
ALTER DATABASE [SocaialMediaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocaialMediaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocaialMediaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocaialMediaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocaialMediaDB] SET QUERY_STORE = OFF
GO
USE [SocaialMediaDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/21/2020 10:09:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 2/21/2020 10:09:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[ConnectionId] [nvarchar](max) NULL,
	[IsOnline] [bit] NOT NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2/21/2020 10:09:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[UserFullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 2/21/2020 10:09:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId1] [nvarchar](max) NULL,
	[UserId2] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2/21/2020 10:09:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderUserId] [nvarchar](450) NULL,
	[RecieverUserId] [nvarchar](450) NULL,
	[MessageDate] [datetime2](7) NOT NULL,
	[MessageText] [nvarchar](max) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 2/21/2020 10:09:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[UserFullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200209142410_InitialForSMDB', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200209143208_InitialForSMDB2', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200210115601_InitialForSMDB3', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200211130318_Init3', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200214161648_Init5', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200214161856_Init6', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200214172513_Init7', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200216111214_Init8', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200216113536_Init9', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200220121819_Init10', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200220142606_Init11', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200220143316_Init12', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200220144539_Init13', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200220144709_Init14', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200220145004_Init15', N'2.2.6-servicing-10079')
INSERT [dbo].[AppUser] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Surname], [Age], [ImageURL], [ConnectionId], [IsOnline]) VALUES (N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Ruf_smay86', N'RUF_SMAY86', N'rufet@gmail.com', N'RUFET@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEE8fOsDmsojx5zkeuE2ree/rpvU+cEN/pDzXqO0IqX9SH8PN2f4WD9VV7Sh1cOorPg==', N'5HRRIH7PHA5BCVAHJD2SZVUMVVIPKX2P', N'2f06d41d-4029-4719-b470-b2377258ec41', NULL, 0, 0, NULL, 1, 0, N'Rufat ', N'Ismayilov', 0, N'pic4cv.jpg', N'fS-Q5dR6iyxU1QewsBriHg', 0)
INSERT [dbo].[AppUser] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Surname], [Age], [ImageURL], [ConnectionId], [IsOnline]) VALUES (N'56d00d47-5877-4f8c-a501-8b8da268a18a', N'mam_amed92', N'MAM_AMED92', N'mamed@gmail.com', N'MAMED@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH+zyaNIWmz2LsZZd4zpZWCKYVJ12DLsKbtStJetCp6HzWhFow1JjJtPZjabSVS7Uw==', N'CIIRSGB7K5GV3XD34AJVTUQ5KYENZUDH', N'7013bd5a-ceda-488f-ae7d-e7a4ab41a261', NULL, 0, 0, NULL, 1, 0, N'Mamed', N'Mamedov', 0, N'mamed.png', N'lq2VKqRtG_qSaUzL5uXNkg', 0)
INSERT [dbo].[AppUser] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Surname], [Age], [ImageURL], [ConnectionId], [IsOnline]) VALUES (N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'fil_ilan42', N'FIL_ILAN42', N'filankes@gmail.com', N'FILANKES@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENorLIqwfQDzDbHRmWo6iIIWeXPTj9zLa8bZJU96onwsWEG4y0blxRoS/WPogzuyCQ==', N'3GXITHY2GBTNEDOHWEJSTSGBPFB2FP2Q', N'58fe718d-9f2e-46b7-96cc-d10ac89307de', NULL, 0, 0, NULL, 1, 0, N'Filankes', N'Filankesov', 0, N'default.png', N'qovnc-wcxoNrmUi5D7e5jw', 1)
INSERT [dbo].[AppUser] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Surname], [Age], [ImageURL], [ConnectionId], [IsOnline]) VALUES (N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', N'ron_rist5', N'RON_RIST5', N'ronaldo@gmail.com', N'RONALDO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAnEvhSSq9kj/TkFU5GsUVy9jYPB8/QfVmNYztdtjfXo7x6VLgAkpziDZAaMm92fyw==', N'EFN66VQ6Q2WB3VSDJB5FCIG5UHYMQZ2B', N'0a60d73a-7220-4354-be34-451be626603b', NULL, 0, 0, NULL, 1, 0, N'Ronaldo', N'Cristiane', 0, N'ronaldo.jpg', N'iKABTEf2sGepufwRn1E0RA', 0)
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (1, N'Teyyare adam imishe aydaaa', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (2, N'Salam qaqaq', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (3, N'Salam qaqaq55555555', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (4, N'Salam qaqaq55555555', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (5, N'Salam qaqaq', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (6, N'sdfsdf', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (7, N'sdfsdfds', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (8, N'sdfsdfsd', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (9, N'sdfsdfds', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (10, N'sfsdfsdfsdf', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (11, N'sadasdas', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (13, N'sdfsdfsd', 4, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (14, N'Yeeeeee', 4, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (15, N'Ishledi axirki', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (16, N'Geldimee geldimm', 1, N'e50c9afe-9480-49be-8eac-138ee08fd343', N'Mamed Mamedov', N'mam_amed43')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (17, N'sdfsdfsd', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (18, N'sdfs', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (19, N'aaaa', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (20, N'dasdasd', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (21, N'ne qeder yazime day', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (22, N'ayy Allah', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (23, N'Bu yarashigli kimdi bele', 7, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (24, N'Besdideee', 7, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (25, N'hahahhaha', 7, N'e50c9afe-9480-49be-8eac-138ee08fd343', N'Mamed Mamedov', N'mam_amed43')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Friends] ON 

INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (23, N'e50c9afe-9480-49be-8eac-138ee08fd343', N'f8bf5ea3-898a-4ae1-a8d8-8c0290208fb1', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (24, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'f8bf5ea3-898a-4ae1-a8d8-8c0290208fb1', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (25, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (26, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'56d00d47-5877-4f8c-a501-8b8da268a18a', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (27, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'56d00d47-5877-4f8c-a501-8b8da268a18a', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (28, N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (29, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', N'Accepted')
SET IDENTITY_INSERT [dbo].[Friends] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (21, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', CAST(N'2020-02-21T19:48:43.3731817' AS DateTime2), N'salaaam')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (22, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'56d00d47-5877-4f8c-a501-8b8da268a18a', CAST(N'2020-02-21T19:49:00.9385608' AS DateTime2), N'salam filankes qaqa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (23, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'675a39c7-770c-4633-b8da-ae4a6de7280d', CAST(N'2020-02-21T19:55:06.2455040' AS DateTime2), N'salam filankes qaqa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (24, N'56d00d47-5877-4f8c-a501-8b8da268a18a', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', CAST(N'2020-02-21T20:29:47.2694951' AS DateTime2), N'asasasa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (25, N'56d00d47-5877-4f8c-a501-8b8da268a18a', N'675a39c7-770c-4633-b8da-ae4a6de7280d', CAST(N'2020-02-21T20:29:56.4727184' AS DateTime2), N'assaas')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (26, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', CAST(N'2020-02-21T20:30:19.0631888' AS DateTime2), N'salam filankes qaqa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (27, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'56d00d47-5877-4f8c-a501-8b8da268a18a', CAST(N'2020-02-21T20:30:24.9530932' AS DateTime2), N'salaaam')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (28, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'56d00d47-5877-4f8c-a501-8b8da268a18a', CAST(N'2020-02-21T20:30:42.3827055' AS DateTime2), N'salam filankes qaqa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (29, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'675a39c7-770c-4633-b8da-ae4a6de7280d', CAST(N'2020-02-21T20:30:55.4007572' AS DateTime2), N'salaaam')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (30, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', CAST(N'2020-02-21T20:31:09.0361356' AS DateTime2), N'daaaa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (31, N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'56d00d47-5877-4f8c-a501-8b8da268a18a', CAST(N'2020-02-21T20:31:17.6536531' AS DateTime2), N'sdfsdfs')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (32, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (33, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', CAST(N'2020-02-21T20:37:03.8681130' AS DateTime2), N'ouuuu')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (34, N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', N'675a39c7-770c-4633-b8da-ae4a6de7280d', CAST(N'2020-02-21T20:42:12.2613703' AS DateTime2), N'salam filankes qaqa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (35, N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', CAST(N'2020-02-21T20:42:36.5064789' AS DateTime2), N'he ')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (36, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', CAST(N'2020-02-21T20:42:56.3074662' AS DateTime2), N'daaaa')
INSERT [dbo].[Messages] ([Id], [SenderUserId], [RecieverUserId], [MessageDate], [MessageText]) VALUES (37, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', CAST(N'2020-02-21T21:11:05.6180859' AS DateTime2), N'salam filankes qaqa')
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (1, N'Bakıda maşın Təyyarəni vurdu', N'hE heee okkk', N'90436.jpg', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (4, N'', N'Jizn voram AUEeeee', N'90436.jpg', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (7, N'', N'Oydaaaaa,aydaaaa,eydeeedadadad', N'linkedinpic.jpg', N'56d00d47-5877-4f8c-a501-8b8da268a18a', N'Mamed Mamedov', N'mam_amed92')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (8, N'', N'Geldimeeee geldimmmmmm', N'img4cv.jpg', N'675a39c7-770c-4633-b8da-ae4a6de7280d', N'Filankes Filankesov', N'fil_ilan42')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (9, N'', N'Neceyem?', N'ronaldo.jpg', N'79d0e6e5-fb3d-4f1f-bb96-085e591a7e2f', N'Ronaldo Cristiane', N'ron_rist5')
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Messages_RecieverUserId]    Script Date: 2/21/2020 10:09:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_RecieverUserId] ON [dbo].[Messages]
(
	[RecieverUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Messages_SenderUserId]    Script Date: 2/21/2020 10:09:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_SenderUserId] ON [dbo].[Messages]
(
	[SenderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AppUser_RecieverUserId] FOREIGN KEY([RecieverUserId])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AppUser_RecieverUserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AppUser_SenderUserId] FOREIGN KEY([SenderUserId])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AppUser_SenderUserId]
GO
USE [master]
GO
ALTER DATABASE [SocaialMediaDB] SET  READ_WRITE 
GO
