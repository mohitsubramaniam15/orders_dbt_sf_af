-- Switch to ACCOUNTADMIN role
USE ROLE ACCOUNTADMIN;

-- Create warehouse only if it doesn't exist
CREATE WAREHOUSE IF NOT EXISTS dbt_wh 
WITH WAREHOUSE_SIZE = 'X-SMALL';

-- Create database only if it doesn't exist
CREATE DATABASE IF NOT EXISTS dbt_db;

-- Create role only if it doesn't exist
CREATE ROLE IF NOT EXISTS dbt_role;

-- Show grants on the warehouse (optional for verification)
SHOW GRANTS ON WAREHOUSE dbt_wh;

-- Grant warehouse usage to dbt_role
GRANT USAGE ON WAREHOUSE dbt_wh TO ROLE dbt_role;

-- Grant role to user (replace 'MOHITSUBRAMANIAM' with actual username)
GRANT ROLE dbt_role TO USER MOHITSUBRAMANIAM;

-- Grant all privileges on database to the role
GRANT ALL ON DATABASE dbt_db TO ROLE dbt_role;

-- Switch to the newly created role
USE ROLE dbt_role;

-- Create schema only if it doesn't exist
CREATE SCHEMA IF NOT EXISTS dbt_db.dbt_schema;

use warehouse dbt_wh;
-- Switch back to ACCOUNTADMIN before cleanup
USE ROLE ACCOUNTADMIN;

-- Drop warehouse, database, and role if they exist (cleanup section)
DROP WAREHOUSE IF EXISTS dbt_wh;
DROP DATABASE IF EXISTS dbt_db;
DROP ROLE IF EXISTS dbt_role;
