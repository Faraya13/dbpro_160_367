USE [master]
GO
/****** Object:  Database [DB10]    Script Date: 28-Apr-19 7:31:42 PM ******/
CREATE DATABASE [DB10]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB10', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB10.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB10_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB10_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB10] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB10].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB10] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB10] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB10] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB10] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB10] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB10] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB10] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB10] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB10] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB10] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB10] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB10] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB10] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB10] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB10] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB10] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB10] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB10] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB10] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB10] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB10] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB10] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB10] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB10] SET  MULTI_USER 
GO
ALTER DATABASE [DB10] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB10] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB10] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB10] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB10] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB10]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Attendance_Id] [int] NOT NULL,
	[Student_Roll_No] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Attendance_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Father_Name] [nvarchar](50) NULL,
	[CNIC] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Contact_No] [nvarchar](50) NULL,
	[Monthly_Salary] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_id] [int] NOT NULL,
	[Course_Name] [nvarchar](50) NOT NULL,
	[Batch] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenditure]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenditure](
	[Employee_Id] [int] NOT NULL,
	[Student_Id] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fee]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[Id] [int] NOT NULL,
	[Student_Roll_No] [nvarchar](50) NOT NULL,
	[Attendance_Id] [int] NULL,
	[Monthly_Fee] [int] NOT NULL,
 CONSTRAINT [PK_Fee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Student_Id] [nvarchar](50) NOT NULL,
	[Student_Name] [nvarchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Class] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[Batch] [int] NOT NULL,
	[Class] [nvarchar](50) NOT NULL,
	[Roll_No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Father_Name] [nvarchar](50) NULL,
	[CNIC] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Contact_No] [int] NULL,
	[Monthly_Fee] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Roll_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 28-Apr-19 7:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[Id] [int] NOT NULL,
	[Day] [nvarchar](50) NOT NULL,
	[Course_Name] [nvarchar](50) NOT NULL,
	[Batch] [int] NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([Student_Roll_No])
REFERENCES [dbo].[Student] ([Roll_No])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_Employee]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Roll_No])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_Student]
GO
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD  CONSTRAINT [FK_Fee_Attendance] FOREIGN KEY([Attendance_Id])
REFERENCES [dbo].[Attendance] ([Attendance_Id])
GO
ALTER TABLE [dbo].[Fee] CHECK CONSTRAINT [FK_Fee_Attendance]
GO
ALTER TABLE [dbo].[Fee]  WITH CHECK ADD  CONSTRAINT [FK_Fee_Student] FOREIGN KEY([Student_Roll_No])
REFERENCES [dbo].[Student] ([Roll_No])
GO
ALTER TABLE [dbo].[Fee] CHECK CONSTRAINT [FK_Fee_Student]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Course_Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Course]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Roll_No])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
USE [master]
GO
ALTER DATABASE [DB10] SET  READ_WRITE 
GO
