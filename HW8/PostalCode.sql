/* Author: Kyra Phillips
   Due Date: 12/12/2017
   Help from/Worked with: Myself, Max Morrison, Cooper Stevens
   Assignment: Homework Assignment #8 Also, Extra Credit
*/

--Copies the information 
COPY usa.postalcodes FROM './data'
WITH (FORMAT csv, HEADER True, QUOTE '"');

--This creates the points for the postal codes
SELECT AddGeometryColumn('usa','postalcodes','geom',0,'POINT',2);

--Insert classroster
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Stevens','Amy',80111);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Phillips','Kyra',80241);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Stevens','Cooper',80241);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Graae','Myla',68901);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Phillips','Helga',80001);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Rogers','Celia',83686);

--Update the postal code data so it can be viewed... 
UPDATE usa.postalcodes
SET geom = 'POINT(' || postalcodes.long|| ' ' || postalcodes.lat || ')';

/*
Using the query builder in QGIS we created the layer witht the points for the postal codes. Here is that code
*/

"code"  LIKE  '%80111%'  
OR  "code"  LIKE '%80241%'
OR  "code"  LIKE '%68901%' 
OR  "code"  LIKE '%80001%'
OR  "code"  LIKE '%83686%'
