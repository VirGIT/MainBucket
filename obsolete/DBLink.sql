You want to create a database link in your local database. Full explanation is at http://download.oracle.com/docs/cd/B19306_01/server.102/b14200/statements_5005.htm#i2061505

to simplify

CREATE DATABASE LINK mylink CONNECT TO scott IDENTIFIED BY tiger USING dbname;

Where
mylink - is whatever name seems appropriate to name this link
scott - is whatever account you use to connect to the target database
tiger - is scott's password
dbname - is the name you have in your local tnsnames file to refer to the target database.

Then getting data into your local table would be as simple as

INSERT INTO mytable
SELECT * FROM theirtable@mylink;