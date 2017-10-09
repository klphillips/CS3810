/* Author: Kyra Phillips
   Due Date: 10/8/2017
   Help from/Worked with: Myself, Cooper Stevens, Max Morrison 
   Assignment: Homework Assignment #3
*/

-- Create tables SQL Statements, part one to HW3

 CREATE TABLE aircraftTable {
 	ID INT,
 	Group INT,
 	Type INT,
 	Config INT,
 	Class VARCHAR(4),
 	Seats INT,
 	CONSTRAINT Aircraft_pkey (ID)
 };

 CREATE TABLE carrierTable {
 	Unique_Carrier VARCHAR(6),
 	Airline_ID INT, 
 	Unique_Carrier_Name VARCHAR(50),
 	Unique_Carrier_Entity VARCHAR(6),
 	Region VARCHAR(1)
 	CONSTRAINT Carrier_pkey (Unique_Carrier)
 };

CREATE TABLE originTable {
	ORIGIN_AIRPORT_ID INT,
	ORIGIN_AIRPORT_SEQ_ID INT,	
	ORIGIN_CITY_MARKET_ID INT,	
	ORIGIN	VARCHAR(4),
	ORIGIN_CITY_NAME VARCHAR(30),	
	ORIGIN_STATE_ABR VARCHAR(2),	
	ORIGIN_STATE_FIPS INT,
	ORIGIN_STATE_NM VARCHAR(30),
	ORIGIN_WAC INT,
	CONSTRAINT origin_pkey (ORIGIN_AIRPORT_ID)

};

CREATE TABLE destinationTable {
 	Dest_Airport_ID INT,
 	Dest_Airport_SEQ_ID INT,
 	Dest_City_Market_ID INT,
 	Dest VARCHAR(4),
 	Dest_City_Name VARCHAR(30),
 	Dest_State_Abr VARCHAR(2),
 	Dest_State_Fips INT,
 	Dest_State_Name VARCHAR(20),
 	Dest_WAC INT,
 	CONSTRAINT Destination_pkey (Dest_Airport_ID)
 };
CREATE TABLE departureTable {
	AIRCRAFT_ID	INT,
	DEPARTURES_PERFORMED INT,	
	PAYLOAD	INT, 
	FREIGHT INT,	
	MAIL INT,	
	YEAR INT,	
	QUARTER INT,	
	MONTH INT
}

CREATE TABLE flightTimeTable {
	AIRCRAFT_ID	DISTANCE INT,
	RAMP_TO_RAMP INT,	
	AIR_TIME INT,
	DISTANCE_GROUP INT
};

CREATE TABLE keysTable {
	AIRCRAFT_ID INT,
	UNIQUE_CARRIER	VARCHAR(20), 
	DEST_AIRPORT_ID	INT,
	ORIGIN_AIRPORT_ID INT, 
	AIRCRAFT_ID INT,
	AIRCRAFT_ID INT
};
