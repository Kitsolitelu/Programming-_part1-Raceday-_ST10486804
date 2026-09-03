# Programming-_part1-Raceday-_ST10486804


The project is done in 3 parts:

Part 1 - planning. ERD, API endpoint plan, and the SQL script for the database.
Part 2 - building the actual API in C#, connected to the database.
Part 3 - the MVC website that uses the API, plus Azure Blob Storage and Docker.

What's in /docs
raceday_erd.png - the ERD for the database
raceday_schema.sql - creates the database and tables, and adds sample data
raceday_api_endpoint_plan.md - the endpoints on how part 2 will be built

Database (Part 1)
--There are 6 tables: Users, Events,
--RouteInfo, Categories, 
--Enrolments, Results. 
Users is shared between Organisers and Participants There's a Role column .


How to run the script:
--Open SSMS and connect to SQL Server.
--Open a new query window.
--Open docs/raceday_schema.sql and run it.
--It creates a database called RaceDayDB, makes all the tables, and inserts some sample data (2 organisers, 2 participants, 3 events, categories, enrolments and results).
--To run SELECT * FROM Users; to see the sample data.
