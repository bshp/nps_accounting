# Microsoft NPS SQL Accounting

When using NPS in Server 2008+ the table creation scripts for accoutning do not contain all the correct data sets.

These SQL scripts will create the table with all the correct data sets, ensure you run them in the following order AFTER you have created a blank database for NPS.

Database Name: NPS

1. nps_accounting_table.sql
2. nps_sp_reportEvent.sql

Optional:

nps_sp_retention.sql will cleanup (delete) any records older than the time specified. You would need to create a job in sql server to execute this on a regular basis.

nps_accounting_alter_table.sql will modify an existing accounting_data table to have smaller data types and include new columns added in Server 2022, by creating a new table, copying the data, and dropping the old table.