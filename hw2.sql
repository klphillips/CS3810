/* Author: Kyra Phillips
   Due Date: 9/7/2017
   Help from/Worked with: Myself and Cooper Stevens
   Assignment: Homework Assignment #2 
*/

--Part (2) Creating the table Countrie 

CREATE TABLE Countries (
name VARCHAR(20),
latitude INT,
longitude INT,
area INT,
population INT,
gdp INT,
gdpYear INT,
PRIMARY KEY (name));

--Part (3) Adding Primary Key
--Part (4a) Added the Borders table!

CREATE TABLE Borders (
name VARCHAR(20),
borderCountries VARCHAR(100),
PRIMARY KEY (name));

--Part (4b) Populate both tables with the necessary information from the world factbook 

INSERT INTO Countries VALUES('Austria', 4720, 1320, 83871, 8754413, 47900, 2016);
INSERT INTO Countries VALUES ('Belgium',5050,400, 30528, 11491346, 44900, 2016);
INSERT INTO Countries VALUES('Czechia', 4945, 1530, 78867, 10674723, 33200, 2016);
INSERT INTO Countries VALUES('France', 4600, 200, 643801, 67106161, 42400, 2016);
INSERT INTO Countries VALUES('Germany', 5100, 900, 357022, 80594017, 48200, 2016);
INSERT INTO Countries VALUES('Luxemburg', 4945, 610, 2586, 594130, 102000, 2016);
INSERT INTO Countries VALUES('Netherlands', 5230, 545, 41543, 17084719, 50800, 2016);
INSERT INTO Countries VALUES('Poland',5200, 2000, 312685, 38476269, 27700, 2016);
INSERT INTO Countries VALUES('Switzerland', 4700, 800, 41277, 8236303, 59400, 2016);

INSERT INTO Borders VALUES ('Germany', 'Netherlands, Belgium, Luxemburg, Poland, Czechia, Austria, France, Switzerland');
INSERT INTO Borders VALUES ('Netherlands', 'Belgium, Germany');
INSERT INTO Borders VALUES ('Belgium', 'Netherlands, Germany, Luxemburg, France');
INSERT INTO Borders VALUES ('Luxemburg', 'Germany, Belgium, France');
INSERT INTO Borders VALUES ('Poland' , 'Germany, Czechia');
INSERT INTO Borders VALUES ('Czechia', 'Poland, Germany, Austria');
INSERT INTO Borders VALUES ('Austria', 'Czechia, Switzerland, Germany');
INSERT INTO Borders VALUES ('France', 'Belgium, Luxemburg, Germany, Switzerland');
INSERT INTO Borders VALUES ('Switzerland', 'France, Germany, Austria');

--Part(4c) Query to list border countries with Germany
SELECT * FROM Borders WHERE name='Germany';
--Part(4d) Query the list of countries with a population greater than 35000000
SELECT Countries.name FROM Countries WHERE population>35000000;
--Part(4e) Query to find countries with a population greater than 35000000 that also border Germany
SELECT Countries.name, Borders.borderCountries FROM Countries, Borders WHERE(Countries.population>35000000) AND (Borders.name = 'Germany');
