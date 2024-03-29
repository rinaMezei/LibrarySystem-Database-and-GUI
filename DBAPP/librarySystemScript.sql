USE [master]
GO
/****** Object:  Database [LibrarySystem]    Script Date: 6/7/2021 9:48:29 PM ******/
CREATE DATABASE [LibrarySystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibrarySystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibrarySystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibrarySystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibrarySystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibrarySystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibrarySystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibrarySystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibrarySystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibrarySystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibrarySystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibrarySystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibrarySystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibrarySystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibrarySystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibrarySystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibrarySystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibrarySystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibrarySystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibrarySystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibrarySystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibrarySystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibrarySystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibrarySystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibrarySystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibrarySystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibrarySystem] SET  MULTI_USER 
GO
ALTER DATABASE [LibrarySystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibrarySystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibrarySystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibrarySystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibrarySystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibrarySystem] SET QUERY_STORE = OFF
GO
USE [LibrarySystem]
GO
/****** Object:  User [SQLManager]    Script Date: 6/7/2021 9:48:29 PM ******/
CREATE USER [SQLManager] FOR LOGIN [LibrarySystemLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SQLManager]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SQLManager]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] NOT NULL,
	[AuthorFName] [varchar](25) NOT NULL,
	[AuthorLName] [varchar](35) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ISBN] [varchar](20) NOT NULL,
	[BookTitle] [varchar](45) NOT NULL,
	[BookCost] [decimal](4, 2) NOT NULL,
	[BookPublisherID] [int] NOT NULL,
	[BookCategoryID] [int] NOT NULL,
	[BookGenreID] [int] NULL,
	[BookConditionID] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Author]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Author](
	[AuthorID] [int] NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Author_Book] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookBranch]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookBranch](
	[BookID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[isBorrowed] [bit] NOT NULL,
 CONSTRAINT [PK_BOOKBRANCH] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowedBook]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowedBook](
	[BookID] [int] NOT NULL,
	[LibraryCardID] [int] NOT NULL,
	[DateCheckedOut] [date] NOT NULL,
	[DateDue]  AS (dateadd(day,(14),[DateCheckedOut])),
	[DateReturned] [date] NULL,
 CONSTRAINT [PK_BORROWEDBOOK] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[LibraryCardID] ASC,
	[DateCheckedOut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrower](
	[BorrowerID] [int] NOT NULL,
	[BorrowerFName] [varchar](20) NOT NULL,
	[BorrowerLName] [varchar](35) NOT NULL,
	[BorrowerAddress] [varchar](35) NOT NULL,
	[BorowerCity] [varchar](30) NOT NULL,
	[BorrowerState] [varchar](20) NOT NULL,
	[BorrowerZip] [varchar](10) NOT NULL,
	[BorrowerPhoneNum] [varchar](10) NOT NULL,
	[BorrowerDOB] [date] NOT NULL,
	[GuardianID] [int] NULL,
 CONSTRAINT [PK_BORROWER] PRIMARY KEY CLUSTERED 
(
	[BorrowerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowerGuardian]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowerGuardian](
	[GuardianID] [int] NOT NULL,
	[GuardianFName] [varchar](25) NOT NULL,
	[GuardianLName] [varchar](35) NOT NULL,
	[GuardianAddress] [varchar](35) NOT NULL,
	[GuardianCity] [varchar](30) NOT NULL,
	[GuardianState] [varchar](20) NOT NULL,
	[GuardianZip] [varchar](10) NOT NULL,
	[GuardianPhoneNum] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Guardian] PRIMARY KEY CLUSTERED 
(
	[GuardianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchID] [int] NOT NULL,
	[BranchName] [varchar](45) NOT NULL,
	[BranchAddress] [varchar](35) NOT NULL,
	[BranchCity] [varchar](20) NOT NULL,
	[BranchState] [varchar](30) NOT NULL,
	[BranchZip] [varchar](10) NOT NULL,
	[BranchPhone] [varchar](10) NOT NULL,
	[BranchFax] [varchar](10) NOT NULL,
	[BranchHeadLibrarianID] [int] NULL,
 CONSTRAINT [PK_BRANCH] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryDesc] [varchar](30) NOT NULL,
	[OverdueCharge]  AS (case [CategoryDesc] when 'Juvenile' then (0.05) when 'Adult' then (0.10)  end),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condition]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condition](
	[ConditionID] [int] NOT NULL,
	[ConditionDesc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CONDITION] PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DegreeType]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DegreeType](
	[DegreeTypeID] [int] NOT NULL,
	[DegreeTypeDesc] [varchar](45) NOT NULL,
 CONSTRAINT [PK_DEGREE] PRIMARY KEY CLUSTERED 
(
	[DegreeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeFName] [varchar](20) NOT NULL,
	[EmployeeLName] [varchar](35) NOT NULL,
	[EmployeeAddress] [varchar](35) NOT NULL,
	[EmployeeCity] [varchar](20) NOT NULL,
	[EmployeeState] [varchar](30) NOT NULL,
	[EmployeeZip] [varchar](10) NOT NULL,
	[EmployeeDOB] [date] NOT NULL,
	[EmployeeHireDate] [date] NOT NULL,
	[EmployeeVacaHours] [int] NOT NULL,
	[EmployeeTypeID] [int] NOT NULL,
	[EmployeeBranchID] [int] NOT NULL,
	[EmployeeSalary] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDegree]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDegree](
	[EmployeeID] [int] NOT NULL,
	[DegreeTypeID] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEEDEGREE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[DegreeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[EmployeeTypeID] [int] NOT NULL,
	[EmployeeTypeDesc] [varchar](45) NOT NULL,
	[EmployeeSalaryTypeID] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEETYPE] PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] NOT NULL,
	[GenreDesc] [varchar](45) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourLog]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourLog](
	[EmployeeID] [int] NOT NULL,
	[DateWorked] [date] NOT NULL,
	[HoursWorked] [decimal](5, 1) NOT NULL,
 CONSTRAINT [PK_HOURLOG] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[DateWorked] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[EmployeeID] [int] NOT NULL,
	[LibrarianCellNum] [varchar](10) NOT NULL,
 CONSTRAINT [PK_LIBRARIAN] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibraryCard]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryCard](
	[LibraryCardID] [int] NOT NULL,
	[DateIssued] [date] NOT NULL,
	[ExpDate]  AS (dateadd(year,(10),[dateIssued])),
	[BalanceDue] [decimal](5, 2) NULL,
	[BorrowerID] [int] NULL,
 CONSTRAINT [PK_LIBRARYCARD] PRIMARY KEY CLUSTERED 
(
	[LibraryCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [varchar](45) NOT NULL,
	[PublisherAddress] [varchar](30) NOT NULL,
	[PublisherCity] [varchar](20) NOT NULL,
	[PublisherState] [varchar](30) NOT NULL,
	[PublisherZipCode] [varchar](10) NULL,
	[PublisherPhone] [varchar](10) NOT NULL,
	[PublisherContact] [varchar](35) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryType]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryType](
	[SalaryTypeID] [int] NOT NULL,
	[SalaryTypeDesc] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SalaryType] PRIMARY KEY CLUSTERED 
(
	[SalaryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookBranch] ADD  DEFAULT ((0)) FOR [isBorrowed]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((112)) FOR [EmployeeVacaHours]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Category] FOREIGN KEY([BookCategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Category]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_CONDITION] FOREIGN KEY([BookConditionID])
REFERENCES [dbo].[Condition] ([ConditionID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_CONDITION]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Genre] FOREIGN KEY([BookGenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Genre]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Publisher] FOREIGN KEY([BookPublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Publisher]
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Book_Author] CHECK CONSTRAINT [FK_Author]
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_Book] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Book] ([ISBN])
GO
ALTER TABLE [dbo].[Book_Author] CHECK CONSTRAINT [FK_Book]
GO
ALTER TABLE [dbo].[BookBranch]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_BRANCH] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Book] ([ISBN])
GO
ALTER TABLE [dbo].[BookBranch] CHECK CONSTRAINT [FK_BOOK_BRANCH]
GO
ALTER TABLE [dbo].[BookBranch]  WITH CHECK ADD  CONSTRAINT [FK_BRANCH_BOOK] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[BookBranch] CHECK CONSTRAINT [FK_BRANCH_BOOK]
GO
ALTER TABLE [dbo].[BorrowedBook]  WITH CHECK ADD  CONSTRAINT [FK_BORROWEDBOOK] FOREIGN KEY([BookID])
REFERENCES [dbo].[BookBranch] ([BookID])
GO
ALTER TABLE [dbo].[BorrowedBook] CHECK CONSTRAINT [FK_BORROWEDBOOK]
GO
ALTER TABLE [dbo].[BorrowedBook]  WITH CHECK ADD  CONSTRAINT [FK_LIBRARYCARD] FOREIGN KEY([LibraryCardID])
REFERENCES [dbo].[LibraryCard] ([LibraryCardID])
GO
ALTER TABLE [dbo].[BorrowedBook] CHECK CONSTRAINT [FK_LIBRARYCARD]
GO
ALTER TABLE [dbo].[Borrower]  WITH CHECK ADD  CONSTRAINT [FK_GUARDIAN] FOREIGN KEY([GuardianID])
REFERENCES [dbo].[BorrowerGuardian] ([GuardianID])
GO
ALTER TABLE [dbo].[Borrower] CHECK CONSTRAINT [FK_GUARDIAN]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_HEADLIBRARIAN] FOREIGN KEY([BranchHeadLibrarianID])
REFERENCES [dbo].[Librarian] ([EmployeeID])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_HEADLIBRARIAN]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_BRANCH] FOREIGN KEY([EmployeeBranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_BRANCH]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Type] FOREIGN KEY([EmployeeTypeID])
REFERENCES [dbo].[EmployeeType] ([EmployeeTypeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Type]
GO
ALTER TABLE [dbo].[EmployeeDegree]  WITH CHECK ADD  CONSTRAINT [FK_DEGREE] FOREIGN KEY([DegreeTypeID])
REFERENCES [dbo].[DegreeType] ([DegreeTypeID])
GO
ALTER TABLE [dbo].[EmployeeDegree] CHECK CONSTRAINT [FK_DEGREE]
GO
ALTER TABLE [dbo].[EmployeeDegree]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_DEGREE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeDegree] CHECK CONSTRAINT [FK_EMPLOYEE_DEGREE]
GO
ALTER TABLE [dbo].[EmployeeType]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEESALARYTYPE] FOREIGN KEY([EmployeeSalaryTypeID])
REFERENCES [dbo].[SalaryType] ([SalaryTypeID])
GO
ALTER TABLE [dbo].[EmployeeType] CHECK CONSTRAINT [FK_EMPLOYEESALARYTYPE]
GO
ALTER TABLE [dbo].[HourLog]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[HourLog] CHECK CONSTRAINT [FK_EMPLOYEE]
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD  CONSTRAINT [FK_LIBRARIAN_EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Librarian] CHECK CONSTRAINT [FK_LIBRARIAN_EMPLOYEE]
GO
ALTER TABLE [dbo].[LibraryCard]  WITH CHECK ADD  CONSTRAINT [FK_BORROWER] FOREIGN KEY([BorrowerID])
REFERENCES [dbo].[Borrower] ([BorrowerID])
GO
ALTER TABLE [dbo].[LibraryCard] CHECK CONSTRAINT [FK_BORROWER]
GO
ALTER TABLE [dbo].[Borrower]  WITH CHECK ADD  CONSTRAINT [CHK_Guardian] CHECK  ((datediff(year,[borrowerdob],getdate())<(18) AND [GuardianID] IS NOT NULL OR datediff(year,[borrowerdob],getdate())>=(18) AND [GuardianID] IS NULL))
GO
ALTER TABLE [dbo].[Borrower] CHECK CONSTRAINT [CHK_Guardian]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [CHK_CATEGORY] CHECK  (([CategoryDesc]='Reference' OR [CategoryDesc]='Adult' OR [CategoryDesc]='Juvenile'))
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [CHK_CATEGORY]
GO
ALTER TABLE [dbo].[SalaryType]  WITH CHECK ADD  CONSTRAINT [CHK_DESC] CHECK  (([SalaryTypeDesc]='HOURLY' OR [SalaryTypeDesc]='YEARLY' OR [SalaryTypeDesc]='MONTHLY' OR [SalaryTypeDesc]='BIMONTHLY' OR [SalaryTypeDesc]='BIWEEKLY' OR [SalaryTypeDesc]='WEEKLY'))
GO
ALTER TABLE [dbo].[SalaryType] CHECK CONSTRAINT [CHK_DESC]
GO
/****** Object:  StoredProcedure [dbo].[usp_BorrowBook]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BorrowBook] 
	-- Add the parameters for the stored procedure here
     @BookID int,
	 @LibraryCard int,
	 @dateCheckedOut date,
	 --@DateDue date,
	 @DateReturned date
AS
BEGIN
	BEGIN try
		if(select isBorrowed from BookBranch 
		where BookID = @BookID) = 0
			BEGIN
				if @DateReturned is null 
					BEGIN
						update BookBranch
						set isBorrowed = 1
						where BookID = @BookID
						insert into BorrowedBook (BookID, LibraryCardID, DateCheckedOut, DateReturned) values(@BookID, @LibraryCard, @dateCheckedOut, @DateReturned)
					END
			END
	END try
	BEGIN Catch
			rollback;
			BEGIN;
				throw 60001 , 'Book already checked out', 1;
			END 
	END catch

	
	
END

GO
/****** Object:  StoredProcedure [dbo].[usp_returnBorrowedBook]    Script Date: 6/7/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_returnBorrowedBook]
	-- Add the parameters for the stored procedure here
	@BookID int,
	@LibraryCardID int
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN try
		-- Insert statements for procedure here
		Declare @dateCheckedOut date

		select @dateCheckedOut = DateCheckedOut from BorrowedBook
		where BookID = @BookID and LibraryCardID = @LibraryCardID and DateReturned is null
		update BorrowedBook 
		set DateReturned = GETDATE()
		where BookID = @BookID and LibraryCardID = @LibraryCardID and DateCheckedOut = @dateCheckedOut

		update BookBranch
		set isBorrowed = 0
		where BookID = @BookID
	END try
	BEGIN Catch
		rollback;
		throw 60002, 'Error returning book', 1
	END Catch
END
GO
USE [master]
GO
ALTER DATABASE [LibrarySystem] SET  READ_WRITE 
GO
