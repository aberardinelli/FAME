DROP DATABASE IF EXISTS FAME;
CREATE DATABASE FAME;
USE FAME;

CREATE TABLE ASSISTANT(
    AssistantID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(40) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    PhoneNumber BIGINT
);

CREATE TABLE MANAGER (
    ManagerID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(20) NOT NULL, 
    LastName VARCHAR(40) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    PhoneNumber BIGINT,
    Active BOOL NOT NULL DEFAULT 1,
    AssistantID INT,
    CONSTRAINT mgrfk FOREIGN KEY (AssistantID)
    REFERENCES ASSISTANT(AssistantID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE INSTRUMENT (
    InstrumentID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(40) NOT NULL
);

CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CustomerName VARCHAR(60) NOT NULL,
    BillingAddress VARCHAR(80) NOT NULL,
    BillingCity VARCHAR(40) NOT NULL,
    BillingState CHAR(2) NOT NULL,
    BillingZip CHAR(5) NOT NULL,
    PhoneNumber BIGINT NOT NULL,
    BillingContactFirstName VARCHAR(20),
    BillingContactLastName VARCHAR(40)
);

CREATE TABLE VENUE (
    VenueID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    VenueName VARCHAR(60) NOT NULL,
    VenueAddress VARCHAR(80),
    VenueCity VARCHAR(40) NOT NULL,
    VenueState CHAR(2) NOT NULL,
    VenueZip CHAR(5), 
    SeatingCapacity INT,
    StageCapacity INT,
    Description VARCHAR(1000),
    OwnerID INT NOT NULL,
    CONSTRAINT venueownerfk FOREIGN KEY (OwnerID)
    REFERENCES CUSTOMER(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE ARTIST (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(20) NOT NULL, 
    LastName VARCHAR(40) NOT NULL,
    Gender VARCHAR(6),
    PhoneNumber BIGINT,
    Email VARCHAR(80) NOT NULL,
    MailingAddress VARCHAR(80),
    City VARCHAR(40) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode CHAR(5),
    UnderContract BOOL DEFAULT 0,
    Recruiting BOOL DEFAULT 0,
    ManagerID INT NOT NULL,
    CONSTRAINT artistmanagerfk FOREIGN KEY (ManagerID)
    REFERENCES MANAGER(ManagerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE PERFORMANCE_STATUS(
    StatusName VARCHAR(20) PRIMARY KEY NOT NULL
);

INSERT INTO PERFORMANCE_STATUS VALUES
('Scheduled'),
('Cancelled'),
('Requested'),
('Completed');

CREATE TABLE PERFORMANCE (
    PerformanceID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    PerformanceDate DATE NOT NULL,
    PerformanceTime TIME,
    Fee DECIMAL(8,2) NOT NULL,
    Venue INT NOT NULL,
    InvoiceStatus ENUM('Paid','Sent', 'Unpaid','Not Sent'),
    CONSTRAINT performancevenuefk FOREIGN KEY (Venue)
    REFERENCES VENUE(VenueID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT perfstatusfk FOREIGN KEY (Status)
    REFERENCES PERFORMANCE_STATUS(StatusName)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

# This is our first linking table
CREATE TABLE PERFORMANCE_ARTIST(
    PerformanceID INT NOT NULL,
    ArtistID INT NOT NULL,
    CONSTRAINT performance_artist_performance_fk FOREIGN KEY (PerformanceID)
    REFERENCES PERFORMANCE(PerformanceID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT performance_artist_artist_fk FOREIGN KEY (ArtistID)
    REFERENCES ARTIST(ArtistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT performance_artist_pk PRIMARY KEY (PerformanceID, ArtistID)
);

/* Create validation table for expense type? */ 

CREATE TABLE ACCOUNT_TYPE(
    TypeName VARCHAR(7) PRIMARY KEY NOT NULL
);

INSERT INTO ACCOUNT_TYPE VALUES
('artist'),
('manager');

CREATE TABLE EXPENSE(
    ExpenseID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ExpenseType VARCHAR(30) NOT NULL,
    Amount DECIMAL(7,2) NOT NULL,
    ExpenseDate DATE NOT NULL,
    AccountType VARCHAR(7) NOT NULL,
    Notes VARCHAR(1000),
    Settled BOOL DEFAULT 0,
    ArtistID INT,
    ManagerID INT,
    CONSTRAINT expense_artist_fk FOREIGN KEY (ArtistID)
    REFERENCES ARTIST(ArtistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT expense_manager_fk FOREIGN KEY (ManagerID)
    REFERENCES MANAGER(ManagerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CHECK(ArtistID IS NOT NULL XOR ManagerID IS NOT NULL)
);

CREATE TABLE ARTIST_CALENDAR(
    ArtistID INT NOT NULL,
    CalDate DATE NOT NULL,
    Available BOOL NOT NULL,
    CONSTRAINT calendar_pk PRIMARY KEY (ArtistID, CalDate),
    CONSTRAINT calendar_artist_fk FOREIGN KEY (ArtistID)
    REFERENCES ARTIST(ArtistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE ARTIST_INSTRUMENT(
    InstrumentID INT NOT NULL,
    ArtistID INT NOT NULL,
    CONSTRAINT instrument_artist_instrument_fk FOREIGN KEY (InstrumentID)
    REFERENCES INSTRUMENT(InstrumentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT instrument_artist_artist_fk FOREIGN KEY (ArtistID)
    REFERENCES ARTIST(ArtistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT instrument_artist_pk PRIMARY KEY (InstrumentID, ArtistID)
);

CREATE TABLE CONTRACT(
    ArtistID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Royalty DECIMAL(6,5) NOT NULL,
    Notes BLOB,
    Active BOOL DEFAULT 0,
    Tentative BOOL DEFAULT 0,
    Signed BOOL DEFAULT 0,
    CONSTRAINT contract_artist_fk FOREIGN KEY (ArtistID)
    REFERENCES ARTIST(ArtistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT contract_pk PRIMARY KEY (ArtistID, StartDate)
);

CREATE VIEW ArtistContractInfo AS
SELECT A.ArtistID, A.FirstName, A.LastName, MAX(C.EndDate) as End
FROM ARTIST as A LEFT OUTER JOIN CONTRACT as C ON A.ArtistID = C.ArtistID
GROUP BY A.ArtistID
ORDER BY End;

CREATE VIEW CustomerSummary_Last6Months AS
SELECT C.CustomerName, COUNT(DISTINCT V.VenueID), COUNT(*)
FROM (CUSTOMER AS C LEFT OUTER JOIN VENUE AS V ON V.OwnerID=C.CustomerID)
    LEFT OUTER JOIN PERFORMANCE AS P ON V.VenueID = P.Venue
WHERE P.PerformanceDate >= CURRENT_DATE - INTERVAL 6 MONTH
    AND P.Status = 'Completed'
GROUP BY C.CustomerID;


/* Example 8 from class 11/29/2018

SELECT V.VenueName, A.FirstName, A.LastName
FROM ((VENUE AS V JOIN PERFORMANCE AS P ON V.VenueID = P.Venue)
    JOIN PERFORMANCE_ARTIST AS PA USING PerformanceID)
    JOIN ARTIST AS A USING ArtistID
WHERE P.PerformanceDate = '2018-12-01' AND 
    P.Status = 'Scheduled';
*/