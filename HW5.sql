/* Author: Kyra Phillips
   Due Date: 10/26/2017
   Help from/Worked with: Myself
   Assignment: Homework Assignment #5
*/

/*This table is specfically for the customers or purchasers of the tickets.
I did this because you cannot always assume that the people buying are the people flying.
In addition, there could be several passengers and only one payer.
*/

CREATE TABLE Payers(
	Email VARCHAR(200),
	firstName VARCHAR(50),
	lastName VARCHAR(50),
	PRIMARY KEY(Email)
);

--This table is specifically for holding all of the information that goes with a phone number of a payer.

CREATE TABLE PayerPhoneNumbers(
	countryCode INT,
	localCode INT, 
	localNumber INT,
	Email VARCHAR(200),
	FOREIGN KEY(Email) REFERENCES Payer(Email)
);

-- This table is for all of the information needed for a Payers address

CREATE TABLE PayerAddress(
	Country VARCHAR(25),
	City VARCHAR(25),
	State VARCHAR(25),
	postalCode INT,
	streetAddress VARCHAR(200),
	Email VARCHAR(200),
	FOREIGN KEY(Email) REFERENCES Payer(Email)
);

/* This table is the information needed for each individual passenger.
I made this table because Payers and passengers could be different and there could be several passengers per payer.
In addition, I added an extra field for a primary key of a unique passenger ID.
*/

CREATE TABLE Passenger(
	payerEmail VARCHAR(200),
	bookingNumber INT,
	uniqueFlightNumber INT,
	passFirstName VARCHAR(50),
	passLastName VARCHAR(50),
	passEmail VARCHAR(200),
	passID INT,
	PRIMARY KEY(passID),
	FOREIGN KEY(payerEmail) REFERENCES Payers(Email),
	FOREIGN KEY(bookingNumber) REFERENCES Booking(bookingNumber),
	FOREIGN KEY(uniqueFlightNumber) REFERENCES Flights(uniqueFlightNumber)
);

--This table is specifically for holding all of the information that goes with a phone number of a passenger.

CREATE TABLE PassengerPhoneNumbers(
	countryCode INT,
	localCode INT, 
	localNumber INT,
	Email VARCHAR(200),
	FOREIGN KEY(Email) REFERENCES Payer(Email)
);

-- This table is for all of the information needed for a Passengers address

CREATE TABLE PassengerAddress(
	Country VARCHAR(25),
	City VARCHAR(25),
	State VARCHAR(25),
	postalCode INT,
	streetAddress VARCHAR(200),
	Email VARCHAR(200),
	FOREIGN KEY(Email) REFERENCES Payer(Email)
);

-- This table is for airlines and airline information

CREATE TABLE Airlines(
	airlineName VARCHAR(200),
	airlineCode VARCHAR(10),
	Country VARCHAR(25),
	PRIMARY KEY(airlineCode)
);

--This table is the information needed for each individual flight

CREATE TABLE Flights(
	uniqueFlightNumber INT,
	originCode INT,
	destinationCode INT, 
	airlineCode VARCHAR(10),
	length INT,
	departureDate VARCHAR(50),
	departureHour INT,
	departureMinute INT,
	arrivalDate VARCHAR(50),
	arrivalHour INT,
	arrivalMin INT,
	PRIMARY KEY (uniqueFlightNumber),
	FOREIGN KEY (airlineCode) REFERENCES Airlines(airlineCode)
);

--This table is the necessary information for each booking

CREATE TABLE Booking(
	bookingNumber INT,
	payerEmail VARCHAR(200),
	payerFirstName VARCHAR(50),
	payerLastName VARCHAR(50),
	bookingCityCode INT,
	bookingDate VARCHAR(25),
	numberOfPassengers INT,
	PRIMARY KEY(bookingNumber),
	FOREIGN KEY(payerEmail) REFERENCES Payers(Email)
);

/* I made this table to keep track of people on a plane.
That way there is a roster of passengers with their booking information for each flight.
*/

CREATE TABLE IndividualFlight(
	uniqueFlightNumber INT,
	bookingNumber INT,
	passID INT,
	FOREIGN KEY(uniqueFlightNumber) REFERENCES Flights(uniqueFlightNumber),
	FOREIGN KEY(bookingNumber) REFERENCES Booking(bookingNumber),
	FOREIGN KEY(passID) REFERENCES Passenger(passID)
);
