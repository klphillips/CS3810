/* Author: Kyra Phillips
   Due Date: 10/8/2017 - resubmitting 10/24/2017
   Help from/Worked with: Myself, Cooper Stevens, Max Morrison, Jack Kolb
   Assignment: Homework Assignment #3
*/

-- Copy SQL Statements, part two to HW3

Copy Carriers (UNIQUE_CARRIER, UNIQUE_CARRIER_ENTITY, UNIQUE_CARRIER_NAME)
from './Carriers.csv' DELIMITER ',' CSV HEADER;

Copy CarrierEntity (UNIQUE_CARRIER_ENTITY, CARRIER_GROUP, CARRIER_GROUP_NEW, REGION, AIRLINE_ID)
from './CarrierEntity.csv' DELIMITER ',' CSV HEADER;

Copy CarrierEntityDates (START_DATE_SOURCE, THRU_DATE_SOURCE, UNIQUE_CARRIER_ENTITY)
from './'

Copy Origins (ORIGIN_STATE_NM, ORIGIN_AIRPORT_ID, ORIGIN)
from './Origins.csv' DELIMITER ',' CSV HEADER;

Copy OriginNames (ORIGIN_STATE_NM, ORIGIN_WAC, ORIGIN_STATE_FIPS, ORIGIN_STATE_ABR)
from './OriginNames.csv' DELIMITER ',' CSV HEADER;

Copy OriginAirports (ORIGIN_AIRPORT_SEQ_ID, ORIGIN_AIRPORT_ID, ORIGIN_CITY_MARKET_ID)
from './OriginAirports.csv' DELIMITER ',' CSV HEADER;

Copy OriginCityName (ORIGIN_CITY_NAME, ORIGIN)
from './OriginCityName.csv' DELIMITER ',' CSV HEADER;

Copy Destinations (DEST_STATE_NM, DEST_AIRPORT_ID, DEST)
from './Destinations.csv' DELIMITER ',' CSV HEADER;

Copy DestinationAirport (DEST_AIRPORT_ID, DEST_AIRPORT_SEQ_ID, DEST_CITY_MARKET_ID)
from './DestinationAirport.csv' DELIMITER ',' CSV HEADER;

Copy DestinationNames (DEST_STATE_ABR, DEST_STATE_FIPS, DEST_STATE_NM, DEST_WAC)
from './DestinationNames.csv' DELIMITER ',' CSV HEADER;

Copy DestinationCityNames (DEST, DEST_CITY_NAME)
from './DestinationCityNames.csv' DELIMITER ',' CSV HEADER;

Copy Aircrafts (AIRCRAFT_GROUP, AIRCRAFT_TYPE, AIRCRAFT_CONFIG, CLASS, DISTANCE, DEPARTURES_SCHEDULED, DEPARTURES_PERFORMED)
from './Aircrafts.csv' DELIMITER ',' CSV HEADER;

Copy AircraftDistance (DISTANCE_GROUP, DISTANCE)
from './AircraftDistance.csv' DELIMITER ',' CSV HEADER;

Copy AircraftSeatsPassengers (AIRCRAFT_CONFIG, SEATS, PASSENGERS)
from './AircraftSeatsPassengers.csv' DELIMITER ',' CSV HEADER;

Copy Airtime (RAMP_TO_RAMP, AIR_TIME, DISTANCE)
from './Airtime.csv' DELIMITER ',' CSV HEADER;

Copy TimePeriod (YEAR, QUARTER, MONTH)
from './TimePeriod.csv' DELIMITER ',' CSV HEADER;

Copy Payload (PAYLOAD, FREIGHT, MAIL)
from './Payload.csv' DELIMITER ',' CSV HEADER;

