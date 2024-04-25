CREATE DATABASE QuanLyCafe
GO

USE QuanLyCafe
GO

--food
--table
--foodcategory
--accounnt
--bill
--billinfo

CREATE TABLE Tablefood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	--Trống || Có người
	
)
GO

CREATE TABLE Account
(	
	Username NVARCHAR(100) PRIMARY KEY,
	Displayname NVARCHAR(100) NOT NULL DEFAULT N'Cus',
	PassWord NVARCHAR(100) NOT NULL,
	TYPE INT NOT NULL -- 1: admin || 0: staff
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán || 0: chưa thanh toán
	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
Go

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
Go

CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.Tablefood
GO

EXEC dbo.USP_GetTableList
--thêm thông tin
