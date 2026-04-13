/*
=========================================================
Create Database and Schemas
=========================================================
Script Purpose:
	This script creates a new database named "DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the scripts set up three schemas within the database: 'bronze', 'silver', 'gold'.

WARNING:
	Running this script will drop the entire 'DataWarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.
*/

Use master;
GO

-- Drop and recreate the 'DataWarehouse' database
If Exists (Select 1 from sys.databases where name = 'DataWarehouse')
Begin
	Alter Database DataWarehouse SET Single_User with rollback Immediate;
	DROP Database DataWarehouse;
END;
GO

---- Create Database 'DataWarehouse'
Create Database DataWarehouse;
GO

Use DataWarehouse;

/*a schema is basically a logical container inside a database that holds objects like:
Tables
Views
Stored Procedures
Functions
Think of it like a folder inside your database. */

-- Go - separate batches when working with multiple SQL statements
-- CREATE Schemas
Create Schema bronze;
GO 
Create Schema silver;
GO
Create Schema gold;
GO
