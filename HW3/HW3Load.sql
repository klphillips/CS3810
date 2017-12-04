/* Author: Kyra Phillips
   Due Date: 10/8/2017 - resubmitting 12/3/2017
   Help from/Worked with: Myself, Cooper Stevens
   Assignment: Homework Assignment #3
*/

-- Copy SQL Statements, part two to HW3

COPY Airline (AIRLINE_ID, CARRIER, CARRIER_ENTITY, CARRIER_NAME, UNIQUE_CARRIER, UNIQUE_CARRIER_ENTITY, UNIQUE_CARRIER_NAME, WAC, CARRIER_GROUP, CARRIER_GROUP_NEW, REGION, START_DATE_SOURCE, THRU_DATE_SOURCE) from '.\Airline.csv' DELIMITER ',' CSV HEADER;  

COPY Carrier (UNIQUE_CARRIER_ENTITY, WAC, CARRIER_GROUP) from '.\CARRIER.csv' DELIMITER ',' CSV HEADER;  

COPY UniqueCarrierName (UNIQUE_CARRIER, UNIQUE_CARRIER_NAME) from '.\UniqueCarrierName.csv' DELIMITER ',' CSV HEADER; 

COPY Airport (AIRPORT_ID, AIRPORT_SEQ_ID, CITY_MARKET_ID, AIRPORT_WAC, AIRPORT_NAME) from '.\Airport.csv' DELIMITER ',' CSV HEADER; 

COPY Cities (CITY_MARKET_ID, CITY_NAME, STATE_FIPS) from '.\Cities.csv' DELIMITER ',' CSV HEADER;  

COPY States (STATE_FIPS, STATE_NAME, STATE) from '.\States.csv' DELIMITER ',' CSV HEADER; 

COPY Passengers (UNIQUE_CARRIER_ENTITY, ORIGIN_AIRPORT_ID, DEST_AIRPORT_ID, PASSENGERS) from '.\Passengers.csv' DELIMITER ',' CSV HEADER; 

COPY Freight (UNIQUE_CARRIER_ENTITY, ORIGIN_AIRPORT_ID, DEST_AIRPORT_ID, FREIGHT) from '.\Freight.csv' DELIMITER ',' CSV HEADER; 

COPY Mail (UNIQUE_CARRIER_ENTITY, ORIGIN_AIRPORT_ID, DEST_AIRPORT_ID, MAIL) from '.\Mail.csv' DELIMITER ',' CSV HEADER; 

COPY FLIGHT(FLIGHT_NUMBER, DISTANCE, AIR_TIME, FREIGHT, PASSENGERS, ORIGIN_STATE_ABR, DEST_STATE_ABR, UNIQUE_CARRIER_ENTITY) from '.\Flights.csv' DELIMITER ',' CSV HEADER;
