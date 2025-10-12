/*
============================================
Create Database Schemas
============================================
Script Purpose:
	This script creates a new database named 'DataWarehouse' after checking if it already exists.
	IF the database exist, it is dropped and recreated. Additionally, the script will set up 3 schemas within the 
	database which is 'bronze', 'silver', 'gold'.

Warning:
	Running this script will drop entire 'Datawarehouse' database if it exists and all data in the database will be 
	permanently deleted. Proceed with caution and ensure proper backup before running this script

*/

USE master;
GO

--Drop and recreate the 'DataWarehouse' Database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
