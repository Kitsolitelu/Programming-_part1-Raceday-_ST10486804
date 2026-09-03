--create a database for this project
CREATE DATABASE RaceDayDB;
GO
 
USE RaceDayDB;
GO

--Create the user table
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL DEFAULT 'Participant', 
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE() -- Added the GETDATE function to display today's date
);
 
--Create the events table
CREATE TABLE Events (
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserId INT NOT NULL,
    Name NVARCHAR(150) NOT NULL,
    Description NVARCHAR(500) NULL,
    EventDate DATE NOT NULL,
    Location NVARCHAR(150) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (OrganiserId) REFERENCES Users(UserId)
);
--creating the RouteInfo table 
CREATE TABLE RouteInfo (
    RouteId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL UNIQUE,
    Distance DECIMAL(5,2) NOT NULL,
    ElevationGainM INT NULL,
    RouteDescript NVARCHAR(500) NULL,
    FOREIGN KEY (EventId) REFERENCES Events(EventId)
);
 
--Create the categories able
CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(8,2) NOT NULL DEFAULT 0,
    MaxParticipants INT NULL,
    FOREIGN KEY (EventId) REFERENCES Events(EventId)
);
 
--Create the enrolment table
CREATE TABLE Enrolments (
    EnrolmentId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryId INT NOT NULL,
    ParticipantId INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(20) NOT NULL DEFAULT 'Confirmed',
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
    FOREIGN KEY (ParticipantId) REFERENCES Users(UserId),
    CONSTRAINT UQ_Enrolment UNIQUE (CategoryId, ParticipantId) 
);
 
--Create the Result table
CREATE TABLE Results (
    ResultId INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentId INT NOT NULL UNIQUE,
    FinishTime TIME NULL,
    Position INT NULL,
    FOREIGN KEY (EnrolmentId) REFERENCES Enrolments(EnrolmentId)
);
 
--Added values into the user table
INSERT INTO Users (FullName, Email, PasswordHash, Role) VALUES
('Thato Sibiya', 'ThatoS@raceday.co.za', 'hashed_password_1', 'Organiser'),
('Lindiwe Nygewa', 'lindiweN@raceday.co.za', 'hashed_password_2', 'Organiser'),
('Loreen Van Zyl', 'LoreenVZ@raceday.co.za', 'hashed_password_3', 'Participant'),
('Katherine Fick', 'KAT32@raceday.co.za', 'hashed_password_4', 'Participant');

--Added values into the event table
INSERT INTO Events (OrganiserId, Name, Description, EventDate, Location) VALUES
(1, 'Hazeldean Marathon', 'Annual road marathon at Hzaeldean', '2026-11-08', 'Pretoria East, Pretoria'),
(1, 'Mabopane fun Run', 'Community 5km fun run', '2026-09-20', 'Mabopane, Pretoria'),
(2, 'Springs Cycling', 'Iconic cycling event around the the City of Gold', '2027-03-08', 'Johannesburg');
 
--Added values into the RouteInfo table
INSERT INTO RouteInfo (EventId, Distance, ElevationGainM, RouteDescript) VALUES
(1, 22.2, 320, 'marathon at Hzaeldean, mostly flat with two climbs'),
(2, 15.0, 40, 'mountains and natre around Mabopane '),
(3, 250, 800, 'City viewsand  mountain route around the City of Gold');

--Add sample Categories data
INSERT INTO Categories (EventId, Name, Price, MaxParticipants) VALUES
(1, '22km', 350.00, 5000),
(1, '15km', 250.00, 3000),
(2, '35km', 50.00, 500),
(3, '25km', 600.00, 10000);
 
--Add sample Enrolments data
INSERT INTO Enrolments (CategoryId, ParticipantId, Status) VALUES
(1, 3, 'Confirmed'),
(2, 4, 'Pending'),
(3, 3, 'Confirmed');
 
--Populated the Results table
INSERT INTO Results (EnrolmentId, FinishTime, Position) VALUES
(1, '03:00:22', 812),
(2, '02:31:10', 340);
 
