USE [master];
GO

IF db_id('Ads_info') is not null
BEGIN
	DROP DATABASE [Ads_info];
END
GO

CREATE DATABASE [Ads_info];
GO

USE [Ads_info];
GO

CREATE TABLE [Info_DB]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Phone] VARCHAR(20) not null
);

CREATE TABLE [Owners_Id]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Owner_Id] INT not null
);

CREATE TABLE [Prices]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Price] MONEY not null CHECK ([Price] >= 0.0) DEFAULT 0.0
);

CREATE TABLE [Addresses]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Adress] NVARCHAR(max) not null CHECK ([Adress] <> N''),
);

CREATE TABLE [Links]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Link] NVARCHAR(max) not null CHECK ([Link] <> N''),
);

CREATE TABLE [Black_phones]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Phone] NVARCHAR(20) not null
);

CREATE TABLE [Info_DB_Owners_Id]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Info_DB_Id] INT not null FOREIGN KEY ([Info_DB_Id])
REFERENCES [Info_DB] ([Id]),
[Owner_Id] INT not null FOREIGN KEY ([Owner_Id])
REFERENCES [Owners_Id] ([Id])
);

CREATE TABLE [Info_DB_Prices_Id]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Info_DB_Id] INT not null FOREIGN KEY ([Info_DB_Id])
REFERENCES [Info_DB] ([Id]),
[Price_Id] INT not null FOREIGN KEY ([Price_Id])
REFERENCES [Prices] ([Id])
);

CREATE TABLE [Info_DB_Addresses_Id]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Info_DB_Id] INT not null FOREIGN KEY ([Info_DB_Id])
REFERENCES [Info_DB] ([Id]),
[Address_Id] INT not null FOREIGN KEY ([Address_Id])
REFERENCES [Addresses] ([Id])
);

CREATE TABLE [Info_DB_Links_Id]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Info_DB_Id] INT not null FOREIGN KEY ([Info_DB_Id])
REFERENCES [Info_DB] ([Id]),
[Link_Id] INT not null FOREIGN KEY ([Link_Id])
REFERENCES [Links] ([Id])
);

CREATE TABLE [Info_DB_Black_phones_Id]
(
[Id] INT not null IDENTITY(1, 1) PRIMARY KEY,
[Info_DB_Id] INT not null FOREIGN KEY ([Info_DB_Id])
REFERENCES [Info_DB] ([Id]),
[Black_Phone_Id] INT not null FOREIGN KEY ([Black_Phone_Id])
REFERENCES [Black_phones] ([Id])
);