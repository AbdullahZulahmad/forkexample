create database atms;
use atms;


CREATE TABLE Airport (
    Name VARCHAR(255),
    Country VARCHAR(255),
    PRIMARY KEY (Name , Country),
    CONSTRAINT NAME_COUNTRY UNIQUE (Name , Country)
);

CREATE TABLE Airline (
    Airline_ID INT AUTO_INCREMENT,
    Airline_Name VARCHAR(255),
    PRIMARY KEY (Airline_ID)
);

CREATE TABLE Airport_Airline (
    Airport_Name VARCHAR(255),
    Country VARCHAR(255),
    Airline_ID INT,
    PRIMARY KEY (Airport_Name , Country , Airline_ID),
    FOREIGN KEY (Airport_Name , Country)
        REFERENCES Airport (Name , Country),
    FOREIGN KEY (Airline_ID)
        REFERENCES Airline (Airline_ID)
);

CREATE TABLE Flight (
    Flight_Number VARCHAR(255),
    fStatus VARCHAR(50),
    Duration TIME,
    fSource VARCHAR(255),
    Destination VARCHAR(255),
    Arrival_Time DATETIME,
    Departure_Time DATETIME,
    Airline_ID INT,
    PRIMARY KEY (Flight_Number),
    FOREIGN KEY (Airline_ID)
        REFERENCES Airline (Airline_ID)
);

CREATE TABLE Employee (
    Employee_ID INT AUTO_INCREMENT,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    DOB DATE,
    Street VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    Salary DECIMAL(10 , 2 ),
    Gender VARCHAR(10),
    Phone_No VARCHAR(20),
    Airport_Name VARCHAR(255),
    Airport_Country VARCHAR(255),
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Airport_Name , Airport_Country)
        REFERENCES Airport (Name , Country)
);

CREATE TABLE Passenger (
    Passport_Number VARCHAR(255),
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Street VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    DOB DATE,
    Phone_No VARCHAR(20),
    PRIMARY KEY (Passport_Number)
);

CREATE TABLE Employee_Passenger (
    Employee_ID INT,
    Passport_Number VARCHAR(255),
    PRIMARY KEY (Employee_ID , Passport_Number),
    FOREIGN KEY (Employee_ID)
        REFERENCES Employee (Employee_ID),
    FOREIGN KEY (Passport_Number)
        REFERENCES Passenger (Passport_Number)
);

CREATE TABLE Ticket (
    Ticket_Number VARCHAR(255),
    Airline_Name VARCHAR(255),
    Price DECIMAL(10 , 2 ),
    Seat_Number VARCHAR(10),
    Class VARCHAR(50),
    Arrival_Time DATETIME,
    Departure_Time DATETIME,
    Source VARCHAR(255),
    Destination VARCHAR(255),
    Passport_Number VARCHAR(255),
    PRIMARY KEY (Ticket_Number),
    FOREIGN KEY (Passport_Number)
        REFERENCES Passenger (Passport_Number)
);
INSERT IGNORE INTO Airport (Name, Country) VALUES
('John F. Kennedy International Airport', 'United States'),
('Heathrow Airport', 'United Kingdom'),
('Dubai International Airport', 'United Arab Emirates'),
('Charles de Gaulle Airport', 'France'),
('Los Angeles International Airport', 'United States'),
('Beijing Capital International Airport', 'China'),
('Tokyo Haneda Airport', 'Japan'),
('Hare International Airport', 'United States'),
('Shanghai Pudong International Airport', 'China'),
('Frankfurt Airport', 'Germany'),
('Indira Gandhi International Airport', 'India'),
('Denver International Airport', 'United States'),
('Singapore Changi Airport', 'Singapore'),
('Amsterdam Airport Schiphol', 'Netherlands'),
('Hong Kong International Airport', 'Hong Kong'),
('Incheon International Airport', 'South Korea'),
('Madrid-Barajas Adolfo Suárez Airport', 'Spain'),
('Toronto Pearson International Airport', 'Canada'),
('Dallas/Fort Worth International Airport', 'United States'),
('Guangzhou Baiyun International Airport', 'China'),
('Soekarno–Hatta International Airport', 'Indonesia'),
('San Francisco International Airport', 'United States'),
('London Gatwick Airport', 'United Kingdom'),
('Chengdu Shuangliu International Airport', 'China'),
('Rome Leonardo da Vinci–Fiumicino Airport', 'Italy');
INSERT IGNORE INTO Airline (Airline_Name) VALUES
('American Airlines'),
('Delta Air Lines'),
('United Airlines'),
('Lufthansa'),
('Emirates'),
('Air France'),
('British Airways'),
('China Southern Airlines'),
('Qatar Airways'),
('Singapore Airlines'),
('Cathay Pacific'),
('Southwest Airlines'),
('Ryanair'),
('Turkish Airlines'),
('ANA'),
('Air Canada'),
('KLM'),
('Virgin Atlantic Airways'),
('Etihad Airways'),
('All Nippon Airways'),
('Qantas'),
('Alaska Airlines'),
('Thai Airways'),
('EVA Air'),
('British Airways');
INSERT IGNORE INTO Airport_Airline (Airport_Name, Country, Airline_ID) VALUES
('John F. Kennedy International Airport', 'United States', 1),
('Heathrow Airport', 'United Kingdom', 2),
('Dubai International Airport', 'United Arab Emirates', 3),
('Charles de Gaulle Airport', 'France', 4),
('Los Angeles International Airport', 'United States', 5),
('Beijing Capital International Airport', 'China', 6),
('Tokyo Haneda Airport', 'Japan', 7),
('Hare International Airport', 'United States', 8),
('Shanghai Pudong International Airport', 'China', 9),
('Frankfurt Airport', 'Germany', 10),
('Indira Gandhi International Airport', 'India', 11),
('Denver International Airport', 'United States', 12),
('Singapore Changi Airport', 'Singapore', 13),
('Amsterdam Airport Schiphol', 'Netherlands', 14),
('Hong Kong International Airport', 'Hong Kong', 15),
('Incheon International Airport', 'South Korea', 16),
('Madrid-Barajas Adolfo Suárez Airport', 'Spain', 17),
('Toronto Pearson International Airport', 'Canada', 18),
('Dallas/Fort Worth International Airport', 'United States', 19),
('Guangzhou Baiyun International Airport', 'China', 20),
('Soekarno–Hatta International Airport', 'Indonesia', 21),
('San Francisco International Airport', 'United States', 22),
('London Gatwick Airport', 'United Kingdom', 23),
('Chengdu Shuangliu International Airport', 'China', 24),
('Rome Leonardo da Vinci–Fiumicino Airport', 'Italy', 25);
INSERT  IGNORE INTO Flight (Flight_Number, fStatus, Duration, fSource, Destination, Arrival_Time, Departure_Time, Airline_ID) VALUES
('AA101', 'Scheduled', '04:30:00', 'New York', 'London', '2024-06-23 08:30:00', '2024-06-23 03:00:00', 1),
('DL202', 'Delayed', '03:45:00', 'Los Angeles', 'Tokyo', '2024-06-23 14:15:00', '2024-06-23 09:30:00', 2),
('UA303', 'On Time', '06:15:00', 'Chicago', 'Paris', '2024-06-23 12:15:00', '2024-06-23 05:00:00', 3),
('EK404', 'Scheduled', '08:45:00', 'Dubai', 'New York', '2024-06-23 17:45:00', '2024-06-23 09:00:00', 5),
('AF505', 'Delayed', '09:30:00', 'Paris', 'Beijing', '2024-06-23 21:30:00', '2024-06-23 12:00:00', 6),
('BA606', 'On Time', '10:00:00', 'London', 'Sydney', '2024-06-24 06:00:00', '2024-06-24 02:00:00', 7),
('SQ707', 'Scheduled', '11:15:00', 'Singapore', 'Tokyo', '2024-06-24 15:15:00', '2024-06-24 04:00:00', 10),
('CX808', 'Delayed', '12:30:00', 'Hong Kong', 'New York', '2024-06-24 10:30:00', '2024-06-24 22:00:00', 11),
('TK909', 'On Time', '13:45:00', 'Istanbul', 'London', '2024-06-24 17:45:00', '2024-06-24 04:00:00', 14),
('AC1010', 'Scheduled', '05:30:00', 'Toronto', 'Los Angeles', '2024-06-24 10:30:00', '2024-06-24 05:00:00', 15),
('KL1112', 'Delayed', '06:45:00', 'Amsterdam', 'Dubai', '2024-06-24 15:45:00', '2024-06-24 09:00:00', 16),
('VS1213', 'On Time', '07:30:00', 'London', 'New York', '2024-06-24 12:30:00', '2024-06-24 05:00:00', 17),
('EY1314', 'Scheduled', '08:15:00', 'Abu Dhabi', 'Paris', '2024-06-24 13:15:00', '2024-06-24 05:00:00', 18),
('NH1415', 'Delayed', '09:00:00', 'Tokyo', 'Los Angeles', '2024-06-24 19:00:00', '2024-06-24 10:00:00', 19),
('QF1516', 'On Time', '10:15:00', 'Sydney', 'Singapore', '2024-06-25 02:15:00', '2024-06-24 16:00:00', 20),
('AS1617', 'Scheduled', '11:30:00', 'Seattle', 'Dallas', '2024-06-25 16:30:00', '2024-06-25 05:00:00', 21),
('TG1718', 'Delayed', '12:45:00', 'Bangkok', 'Dubai', '2024-06-25 23:45:00', '2024-06-25 11:00:00', 22),
('BR1819', 'On Time', '13:30:00', 'Taipei', 'Hong Kong', '2024-06-25 18:30:00', '2024-06-25 05:00:00', 23),
('BA1920', 'Scheduled', '05:45:00', 'London', 'Paris', '2024-06-25 11:45:00', '2024-06-25 06:00:00', 24),
('JL2021', 'Delayed', '06:30:00', 'Tokyo', 'Seoul', '2024-06-25 15:30:00', '2024-06-25 09:00:00', 25),
('EK2122', 'On Time', '07:15:00', 'Dubai', 'Singapore', '2024-06-25 12:15:00', '2024-06-25 05:00:00', 1),
('UA2223', 'Scheduled', '08:00:00', 'Chicago', 'Los Angeles', '2024-06-25 16:00:00', '2024-06-25 08:00:00', 2),
('DL2324', 'Delayed', '09:15:00', 'New York', 'London', '2024-06-25 19:15:00', '2024-06-25 10:00:00', 3),
('AF2425', 'On Time', '10:30:00', 'Paris', 'Frankfurt', '2024-06-26 01:30:00', '2024-06-25 15:00:00', 4),
('BA2526', 'Scheduled', '11:45:00', 'London', 'Amsterdam', '2024-06-26 18:45:00', '2024-06-26 07:00:00', 5);
INSERT  IGNORE INTO Employee (First_Name, Last_Name, DOB, Street, City, Country, Salary, Gender, Phone_No, Airport_Name, Airport_Country) VALUES
('John', 'Doe', '1990-05-15', '123 Main St', 'New York', 'United States', 60000.00, 'Male', '123-456-7890', 'John F. Kennedy International Airport', 'United States'),
('Jane', 'Smith', '1985-08-20', '456 Elm St', 'London', 'United Kingdom', 55000.00, 'Female', '987-654-3210', 'Heathrow Airport', 'United Kingdom'),
('Ahmed', 'Ali', '1995-02-10', '789 Oak St', 'Dubai', 'United Arab Emirates', 70000.00, 'Male', '567-890-1234', 'Dubai International Airport', 'United Arab Emirates'),
('Mark', 'Brown', '1987-04-25', '345 Walnut St', 'Los Angeles', 'United States', 65000.00, 'Male', '234-567-8901', 'Los Angeles International Airport', 'United States'),
('Sophie', 'Garcia', '1992-09-18', '678 Maple St', 'Paris', 'France', 60000.00, 'Female', '789-012-3456', 'Charles de Gaulle Airport', 'France'),
('Daniel', 'Nguyen', '1998-01-30', '901 Oak St', 'Beijing', 'China', 72000.00, 'Male', '321-654-9870', 'Beijing Capital International Airport', 'China'),
('Michael', 'Brown', '1980-06-12', '234 Pine St', 'Sydney', 'Australia', 75000.00, 'Male', '901-234-5678', 'Sydney Kingsford Smith Airport', 'Australia'),
('Emily', 'Johnson', '1995-11-05', '567 Cherry St', 'Toronto', 'Canada', 62000.00, 'Female', '678-901-2345', 'Toronto Pearson International Airport', 'Canada'),
('William', 'Lopez', '1983-03-20', '890 Elm St', 'Mexico City', 'Mexico', 68000.00, 'Male', '345-678-9012', 'Mexico City International Airport', 'Mexico'),
('Olivia', 'Rodriguez', '1997-07-15', '123 Oak St', 'Tokyo', 'Japan', 71000.00, 'Female', '012-345-6789', 'Tokyo Haneda Airport', 'Japan'),
('Ethan', 'Hernandez', '1993-02-28', '456 Walnut St', 'Sydney', 'Australia', 67000.00, 'Male', '789-012-3456', 'Sydney Kingsford Smith Airport', 'Australia'),
('Ava', 'Gonzalez', '1988-09-10', '789 Cherry St', 'Seoul', 'South Korea', 73000.00, 'Female', '234-567-8901', 'Incheon International Airport', 'South Korea'),
('James', 'Perez', '1994-01-02', '234 Pine St', 'Mexico City', 'Mexico', 65000.00, 'Male', '567-890-1234', 'Mexico City International Airport', 'Mexico'),
('Mia', 'Sanchez', '1982-06-15', '567 Walnut St', 'Toronto', 'Canada', 71000.00, 'Female', '901-234-5678', 'Toronto Pearson International Airport', 'Canada'),
('Noah', 'Martinez', '1996-10-20', '890 Elm St', 'Los Angeles', 'United States', 69000.00, 'Male', '345-678-9012', 'Los Angeles International Airport', 'United States'),
('Emma', 'Gonzalez', '1991-03-05', '123 Main St', 'London', 'United Kingdom', 74000.00, 'Female', '012-345-6789', 'Heathrow Airport', 'United Kingdom'),
('Alexander', 'Hernandez', '1986-07-25', '456 Elm St', 'Dubai', 'United Arab Emirates', 66000.00, 'Male', '234-567-8901', 'Dubai International Airport', 'United Arab Emirates'),
('Sophia', 'Lopez', '1989-12-30', '789 Oak St', 'Sydney', 'Australia', 72000.00, 'Female', '789-012-3456', 'Sydney Kingsford Smith Airport', 'Australia'),
('Matthew', 'Garcia', '1990-04-15', '345 Pine St', 'Seoul', 'South Korea', 68000.00, 'Male', '901-234-5678', 'Incheon International Airport', 'South Korea'),
('Isabella', 'Perez', '1997-08-28', '678 Cherry St', 'Mexico City', 'Mexico', 71000.00, 'Female', '012-345-6789', 'Mexico City International Airport', 'Mexico'),
('Jacob', 'Martinez', '1984-05-10', '901 Walnut St', 'Toronto', 'Canada', 73000.00, 'Male', '234-567-8901', 'Toronto Pearson International Airport', 'Canada'),
('Oliver', 'Sanchez', '1993-01-20', '123 Oak St', 'New York', 'United States', 70000.00, 'Male', '345-678-9012', 'John F. Kennedy International Airport', 'United States'),
('Charlotte', 'Gonzalez', '1988-06-05', '456 Maple St', 'London', 'United Kingdom', 75000.00, 'Female', '456-789-0123', 'Heathrow Airport', 'United Kingdom'),
('Amelia', 'Hernandez', '1992-11-18', '789 Pine St', 'Dubai', 'United Arab Emirates', 69000.00, 'Female', '567-890-1234', 'Dubai International Airport', 'United Arab Emirates'),
('Lucas', 'Rodriguez', '1980-08-10', '234 Elm St', 'Los Angeles', 'United States', 76000.00, 'Male', '678-901-2345', 'Los Angeles International Airport', 'United States');

INSERT  IGNORE INTO Passenger (Passport_Number, First_Name, Last_Name, Street, City, Country, DOB, Phone_No) VALUES
('AB123456', 'Emma', 'Smith', '123 Main St', 'New York', 'United States', '1990-05-15', '123-456-7890'),
('CD234567', 'James', 'Johnson', '456 Elm St', 'London', 'United Kingdom', '1985-08-20', '987-654-3210'),
('EF345678', 'Sophia', 'Brown', '789 Oak St', 'Dubai', 'United Arab Emirates', '1995-02-10', '567-890-1234'),
('GH456789', 'Olivia', 'Rodriguez', '123 Elm St', 'New York', 'United States', '1995-11-10', '456-789-0123'),
('IJ567890', 'William', 'Lopez', '456 Pine St', 'London', 'United Kingdom', '1980-06-28', '567-890-1234'),
('KL678901', 'Ethan', 'Hernandez', '789 Cherry St', 'Dubai', 'United Arab Emirates', '1983-03-05', '678-901-2345'),
('MN789012', 'Ava', 'Garcia', '901 Oak St', 'Los Angeles', 'United States', '1987-04-25', '789-012-3456'),
('OP890123', 'Noah', 'Martinez', '234 Walnut St', 'Paris', 'France', '1992-09-18', '890-123-4567'),
('QR901234', 'Emily', 'Perez', '567 Maple St', 'Tokyo', 'Japan', '1998-01-30', '901-234-5678'),
('ST012345', 'Michael', 'Nguyen', '678 Pine St', 'Sydney', 'Australia', '1989-12-30', '012-345-6789'),
('UV123456', 'Sophie', 'Sanchez', '789 Elm St', 'Toronto', 'Canada', '1986-07-25', '123-456-7890'),
('WX234567', 'Alexander', 'Gonzalez', '901 Oak St', 'Mexico City', 'Mexico', '1993-02-28', '234-567-8901'),
('YZ345678', 'Oliver', 'Martinez', '123 Cherry St', 'Seoul', 'South Korea', '1991-03-05', '345-678-9012'),
('AB456789', 'Mia', 'Lopez', '456 Walnut St', 'Dubai', 'United Arab Emirates', '1990-04-15', '456-789-0123'),
('CD567890', 'Ethan', 'Rodriguez', '567 Oak St', 'Los Angeles', 'United States', '1994-01-02', '567-890-1234'),
('EF678901', 'Sophia', 'Garcia', '678 Maple St', 'Paris', 'France', '1997-08-28', '678-901-2345'),
('GH789012', 'Matthew', 'Sanchez', '789 Pine St', 'Toronto', 'Canada', '1988-06-05', '789-012-3456'),
('IJ890123', 'Isabella', 'Johnson', '890 Elm St', 'Mexico City', 'Mexico', '1993-01-20', '890-123-4567'),
('KL901234', 'Jacob', 'Garcia', '123 Cherry St', 'Sydney', 'Australia', '1985-09-10', '901-234-5678'),
('MN012345', 'Charlotte', 'Lopez', '234 Walnut St', 'Dubai', 'United Arab Emirates', '1992-11-18', '012-345-6789'),
('OP123456', 'Lucas', 'Rodriguez', '345 Pine St', 'New York', 'United States', '1996-10-20', '123-456-7890'),
('QR234567', 'Amelia', 'Brown', '456 Elm St', 'London', 'United Kingdom', '1988-09-10', '234-567-8901'),
('ST345678', 'Jacob', 'Hernandez', '567 Oak St', 'Dubai', 'United Arab Emirates', '1984-05-10', '345-678-9012'),
('UV456789', 'Emma', 'Perez', '678 Maple St', 'Paris', 'France', '1997-07-15', '456-789-0123'),
('WX567890', 'Noah', 'Gonzalez', '789 Pine St', 'Los Angeles', 'United States', '1992-12-20', '567-890-1234');
INSERT  IGNORE INTO Employee_Passenger (Employee_ID, Passport_Number) VALUES
(1, 'AB123456'),
(2, 'CD234567'),
(3, 'EF345678'),
(4, 'GH456789'),
(5, 'IJ567890'),
(6, 'KL678901'),
(7, 'MN789012'),
(8, 'OP890123'),
(9, 'QR901234'),
(10, 'ST012345'),
(11, 'UV123456'),
(12, 'WX234567'),
(13, 'YZ345678'),
(14, 'AB456789'),
(15, 'CD567890'),
(16, 'EF678901'),
(17, 'GH789012'),
(18, 'IJ890123'),
(19, 'KL901234'),
(20, 'MN012345'),
(21, 'OP123456'),
(22, 'QR234567'),
(23, 'ST345678'),
(24, 'UV456789'),
(25, 'WX567890');
INSERT IGNORE INTO Ticket (Ticket_Number, Airline_Name, Price, Seat_Number, Class, Arrival_Time, Departure_Time, Source, Destination, Passport_Number) VALUES
('T001', 'American Airlines', 500.00, 'A001', 'Business', '2024-06-23 08:30:00', '2024-06-23 03:00:00', 'New York', 'London', 'AB123456'),
('T002', 'Delta Air Lines', 450.00, 'B002', 'Economy', '2024-06-23 14:15:00', '2024-06-23 09:30:00', 'Los Angeles', 'Tokyo', 'CD234567'),
('T003', 'United Airlines', 550.00, 'C003', 'First Class', '2024-06-23 12:15:00', '2024-06-23 05:00:00', 'Chicago', 'Paris', 'EF345678'),
('T004', 'Emirates', 600.00, 'D004', 'Business', '2024-06-23 17:45:00', '2024-06-23 09:00:00', 'Dubai', 'New York', 'GH456789'),
('T005', 'Air France', 480.00, 'E005', 'Economy', '2024-06-23 21:30:00', '2024-06-23 12:00:00', 'Paris', 'Beijing', 'IJ567890'),
('T006', 'British Airways', 520.00, 'F006', 'Business', '2024-06-24 06:00:00', '2024-06-24 02:00:00', 'London', 'Sydney', 'KL678901'),
('T007', 'Singapore Airlines', 580.00, 'G007', 'First Class', '2024-06-24 15:15:00', '2024-06-24 04:00:00', 'Singapore', 'Tokyo', 'MN789012'),
('T008', 'Cathay Pacific', 540.00, 'H008', 'Business', '2024-06-24 10:30:00', '2024-06-24 22:00:00', 'Hong Kong', 'New York', 'OP890123'),
('T009', 'Turkish Airlines', 570.00, 'I009', 'Economy', '2024-06-24 17:45:00', '2024-06-24 04:00:00', 'Istanbul', 'London', 'QR901234'),
('T010', 'Air Canada', 490.00, 'J010', 'First Class', '2024-06-24 10:30:00', '2024-06-24 05:00:00', 'Toronto', 'Los Angeles', 'ST012345'),
('T011', 'KLM Royal Dutch Airlines', 530.00, 'K011', 'Business', '2024-06-24 15:45:00', '2024-06-24 09:00:00', 'Amsterdam', 'Dubai', 'UV123456'),
('T012', 'Virgin Atlantic', 560.00, 'L012', 'Economy', '2024-06-24 12:30:00', '2024-06-24 05:00:00', 'London', 'New York', 'WX234567'),
('T013', 'Etihad Airways', 590.00, 'M013', 'Business', '2024-06-24 13:15:00', '2024-06-24 05:00:00', 'Abu Dhabi', 'Paris', 'YZ345678'),
('T014', 'All Nippon Airways', 610.00, 'N014', 'First Class', '2024-06-24 19:00:00', '2024-06-24 10:00:00', 'Tokyo', 'Los Angeles', 'AB456789'),
('T015', 'Qantas', 500.00, 'O015', 'Business', '2024-06-25 02:15:00', '2024-06-24 16:00:00', 'Sydney', 'Singapore', 'CD567890'),
('T016', 'Alaska Airlines', 450.00, 'P016', 'Economy', '2024-06-25 16:30:00', '2024-06-25 05:00:00', 'Seattle', 'Dallas', 'EF678901'),
('T017', 'Thai Airways', 550.00, 'Q017', 'First Class', '2024-06-25 23:45:00', '2024-06-25 11:00:00', 'Bangkok', 'Dubai', 'GH789012'),
('T018', 'EVA Air', 520.00, 'R018', 'Business', '2024-06-25 18:30:00', '2024-06-25 05:00:00', 'Taipei', 'Hong Kong', 'IJ890123'),
('T019', 'British Airways', 580.00, 'S019', 'Economy', '2024-06-25 11:45:00', '2024-06-25 06:00:00', 'London', 'Paris', 'KL901234'),
('T020', 'Japan Airlines', 480.00, 'T020', 'First Class', '2024-06-25 15:30:00', '2024-06-25 09:00:00', 'Tokyo', 'Seoul', 'MN012345'),
('T021', 'Emirates', 550.00, 'U021', 'Business', '2024-06-25 12:15:00', '2024-06-25 05:00:00', 'Dubai', 'Singapore', 'OP123456'),
('T022', 'United Airlines', 520.00, 'V022', 'Economy', '2024-06-25 16:00:00', '2024-06-25 08:00:00', 'Chicago', 'Los Angeles', 'QR234567'),
('T023', 'Delta Air Lines', 490.00, 'W023', 'First Class', '2024-06-25 19:15:00', '2024-06-25 10:00:00', 'New York', 'London', 'ST345678'),
('T024', 'Air France', 530.00, 'X024', 'Business', '2024-06-26 01:30:00', '2024-06-25 15:00:00', 'Paris', 'Frankfurt', 'UV456789'),
('T025', 'British Airways', 560.00, 'Y025', 'Economy', '2024-06-26 18:45:00', '2024-06-26 07:00:00', 'London', 'Amsterdam', 'WX567890');
-- Applying queries 



-- Multiple AND Conditions
SELECT * FROM Flight
WHERE fStatus = 'On Time' AND Airline_ID = 1 AND Duration > '05:00:00';
-- Use of AND Operator and OR Operator with Select Statement
SELECT * FROM Employee
WHERE Country = 'United States' AND (Salary > 60000 OR Gender = 'Female');
-- Using the AND Operator and OR Operator with the UPDATE Statement
UPDATE Employee
SET Salary = Salary * 1.1
WHERE Country = 'United States' AND (Gender = 'Male' OR Salary < 60000);
-- Using the AND Operator and OR Operator with the DELETE Statement
DELETE FROM Flight
WHERE fStatus = 'Cancelled' AND (Duration < '02:00:00' OR Airline_ID IN (1, 2, 3));
-- SQL BETWEEN Operator
SELECT * FROM Flight
WHERE Duration BETWEEN '05:00:00' AND '10:00:00';
-- Using NOT Operator with BETWEEN Operator
SELECT * FROM Flight
WHERE Duration NOT BETWEEN '05:00:00' AND '10:00:00';
-- SQL IN Operator
SELECT * FROM Employee
WHERE Country IN ('United States', 'United Kingdom', 'Canada');

-- Using NOT Operator with IN Operator
SELECT * FROM Employee
WHERE Country NOT IN ('United States', 'United Kingdom', 'Canada');
-- Use of BETWEEN Operator with IN Operator and NOT Operator
SELECT * FROM Employee
WHERE Salary BETWEEN 60000 AND 70000 AND Country IN ('United States', 'Canada') AND Gender NOT IN ('Male');
-- SELECT DISTINCT
SELECT DISTINCT Country FROM Airport;
-- DISTINCT on Multiple Columns
SELECT DISTINCT Airport_Name, Country FROM Employee;
-- LIKE Operator
SELECT * FROM Employee
WHERE First_Name LIKE 'J%';
-- Select Statement with ORDER BY Clause
SELECT * FROM Employee
ORDER BY Last_Name;

-- ORDER BY Clause Descending
SELECT * FROM Employee
ORDER BY Last_Name DESC;

--  LIMIT Clause
SELECT * FROM Employee
LIMIT 5;
-- Aggregate Functions: Average, Maximum, Minimum, Count, Sum
SELECT AVG(Salary) AS AverageSalary FROM Employee;
SELECT MAX(Salary) AS MaxSalary FROM Employee;
SELECT MIN(Salary) AS MinSalary FROM Employee;
SELECT COUNT(*) AS TotalEmployees FROM Employee;
SELECT SUM(Salary) AS TotalSalaries FROM Employee;
-- using having
SELECT Country, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY Country
HAVING AVG(Salary) > 65000;



-- Applying joins

-- INNER JOIN
SELECT * FROM Flight INNER JOIN Airline ON Flight.Airline_ID = Airline.Airline_ID;
    
  -- LEFT JOIN  
  SELECT * FROM Employee LEFT JOIN Airport ON Employee.Airport_Name = Airport.Name AND Employee.Airport_Country = Airport.Country;
-- RIGHT JOIN
SELECT * FROM Airport RIGHT JOIN Employee ON Airport.Name = Employee.Airport_Name AND Airport.Country = Employee.Airport_Country;


-- SELF JOin  join rows where the airport name and country match, but the employee IDs are different.

SELECT e1.First_Name AS Employee1_FirstName,e2.First_Name AS Employee2_FirstName FROM Employee e1 JOIN Employee e2 ON e1.Airport_Name = e2.Airport_Name AND e1.Airport_Country = e2.Airport_Country
AND e1.Employee_ID <> e2.Employee_ID;
    -- natural join
SELECT * FROM Airport_Airline NATURAL JOIN Airport;
    -- veiws
        -- veiws1Flights with Source and Destination Airport Names
CREATE VIEW FlightsWithAirportNames AS SELECT f.Flight_Number, f.fSource AS Source_Airport,f.Destination AS Destination_Airport FROM Flight f;
select * from FlightsWithAirportNames;
        
CREATE VIEW EmployeeDetailsWithAirportInfo AS
SELECT e.Employee_ID,
    e.First_Name,
    e.Last_Name,
    e.DOB,
    e.Street,
    e.City,
    e.Country,
    e.Salary,
    e.Gender,
    e.Phone_No,
    a.Name AS Airport_Name,
    a.Country AS Airport_Country
FROM Employee e
JOIN Airport a ON e.Airport_Name = a.Name AND e.Airport_Country = a.Country;
select*from EmployeeDetailsWithAirportInfo;
                -- veiws3 Passengers with Ticket Information
      CREATE VIEW PassengersWithTicketInfo AS
SELECT p.Passport_Number,
    p.First_Name,
    p.Last_Name,
    t.Ticket_Number,
    t.Airline_Name,
    t.Seat_Number,
    t.Class,
    t.Arrival_Time,
    t.Departure_Time,
    t.Source,
    t.Destination
FROM Passenger p JOIN Ticket t ON p.Passport_Number = t.Passport_Number;
 select * from  PassengersWithTicketInfo;       
                    
     -- INDEX               
CREATE INDEX idx_flight_airline ON Flight (Airline_ID);
CREATE INDEX idx_flight_arrival ON Flight (Arrival_Time);
CREATE INDEX idx_employee_lastname ON Employee (Last_Name);
CREATE INDEX idx_ticket_passport ON Ticket (Passport_Number);
CREATE INDEX idx_ticket_class ON Ticket (Class);

-- PROCEDURES
DELIMITER //

CREATE PROCEDURE GetFlightsByAirline(IN airlineId INT)
BEGIN
    SELECT * FROM Flight WHERE Airline_ID = airlineId;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateEmployeeSalary(IN employeeId INT, IN newSalary DECIMAL(10,2))
BEGIN
    UPDATE Employee SET Salary = newSalary WHERE Employee_ID = employeeId;
END //

DELIMITER ;

-- TRIGGERS
DELIMITER //

CREATE TRIGGER LogEmployeeChanges
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Changes (Employee_ID, Changed_At, Old_Salary, New_Salary)
    VALUES (OLD.Employee_ID, NOW(), OLD.Salary, NEW.Salary);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER UpdateFlightStatus
BEFORE UPDATE ON Flight
FOR EACH ROW
BEGIN
    IF NEW.Departure_Time < NOW() AND NEW.Arrival_Time > NOW() THEN
        SET NEW.fStatus = 'In Progress';
    ELSEIF NEW.Arrival_Time < NOW() THEN
        SET NEW.fStatus = 'Completed';
    ELSE
        SET NEW.fStatus = 'Scheduled';
    END IF;
END //

DELIMITER ;








                    







