db2 => create database GROUP2
DB20000I  The CREATE DATABASE command completed successfully.
db2 => CONNECT TO GROUP2

   Database Connection Information

 Database server        = DB2/NT 10.5.4
 SQL authorization ID   = DB2ADMIN
 Local database alias   = GROUP2

CREATE TABLE USER (User_ID int NOT NULL PRIMARY KEY, user_LastName varchar(20), user_FirstName varchar(20), user_PhoneNumber bigint, user_EmailAddress varchar(50))

SELECT * FROM USER

CREATE TABLE Sport (sports_code varchar(10) NOT NULL PRIMARY KEY, sports_name varchar(20), sports_type varchar(20))

SELECT * FROM sport

CREATE TABLE Amenity (amenity_ID varchar(10) NOT NULL PRIMARY KEY, amenity_name varchar(20))

SELECT * FROM amenity

CREATE TABLE Location (location_code int NOT NULL PRIMARY KEY, location_name varchar(20))

SELECT * FROM location

CREATE TABLE Facility (facility_ID varchar(10) NOT NULL PRIMARY KEY, sports_code varchar(10), facility_name varchar(20), location_code int, FOREIGN KEY(sports_code) REFERENCES Sport, FOREIGN KEY(location_code) REFERENCES Location)

SELECT * FROM facility

ALTER TABLE Location ADD facility_ID varchar(10) FOREIGN KEY(facility_ID) REFERENCES Facility

SELECT * FROM location

CREATE TABLE Amenity_Location (amenity_ID varchar(10) NOT NULL, location_code int NOT NULL,PRIMARY KEY(amenity_ID, location_code), FOREIGN KEY(amenity_ID) REFERENCES Amenity, FOREIGN KEY(location_code) REFERENCES Location)

SELECT * FROM AMENITY_LOCATION 

CREATE TABLE Rate (rate_ID varchar(10) NOT NULL PRIMARY KEY, facility_ID varchar(10), rate_per_hour_weekday decimal(7,2), rate_per_hour_weekend decimal(7,2), FOREIGN KEY(facility_ID) REFERENCES Facility)

SELECT * FROM rate

CREATE TABLE Booking (booking_ID int NOT NULL PRIMARY KEY, user_ID int, facility_ID varchar(10), booking_date date, rental_duration varchar(20), time_of_court_rental varchar(30), FOREIGN KEY(user_ID) REFERENCES User, FOREIGN KEY(facility_ID) REFERENCES Facility)

SELECT * FROM Booking

CREATE TABLE Payment (payment_ID varchar(10) NOT NULL PRIMARY KEY, booking_ID int, payment_amount decimal(7,2), payment_type varchar(20), payment_date date, FOREIGN KEY(booking_ID) REFERENCES Booking)

SELECT * FROM Payment

INSERT INTO USER VALUES (01, 'Austin', 'Javier', 60193669511, 'javieraustin@gmail.com')
INSERT INTO USER VALUES (02, 'Zafran', 'Muhammad', 60183834854, 'muhammadzafran@yahoo.com')
INSERT INTO USER VALUES (03, 'Danial', 'Ahmad', 60178714669, 'ahmaddanial@hotmail.com')
INSERT INTO USER VALUES (04, 'Wong', 'Isaiah', 60112321713, 'isaiahwong@gmail.com')
INSERT INTO USER VALUES (05, 'Zahin', 'Muhammad', 60116380145, 'zahin12345@yahoo.com')
INSERT INTO USER VALUES (06, 'Hafif', 'Aliya', 60162886999, 'aliyahafif@hotmail.com')



INSERT INTO Sport VALUES ('S1', 'Badminton', 'Indoor')
INSERT INTO Sport VALUES ('S2', 'Tennis', 'Indoor')
INSERT INTO Sport VALUES ('S3', 'Tennis', 'Outdoor')
INSERT INTO Sport VALUES ('S4', 'Basketball', 'Indoor')
INSERT INTO Sport VALUES ('S5', 'Basketball', 'Outdoor')
INSERT INTO Sport VALUES ('S6', 'Futsal', 'Indoor')
INSERT INTO Sport VALUES ('S7', 'Futsal', 'Outdoor')
INSERT INTO Sport VALUES ('S8', 'Volleyball', 'Indoor')
INSERT INTO Sport VALUES ('S9', 'Volleyball', 'Outdoor')



INSERT INTO AMENITY VALUES ('A1', 'Male Washroom 1')
INSERT INTO AMENITY VALUES ('A2', 'Female Washroom 1')
INSERT INTO AMENITY VALUES ('A3', 'Male Locker Room 1')
INSERT INTO AMENITY VALUES ('A4', 'Female Locker Room 1')
INSERT INTO AMENITY VALUES ('A5', 'Beverage Counter 1')
INSERT INTO AMENITY VALUES ('A6', 'Male Washroom 2')
INSERT INTO AMENITY VALUES ('A7', 'Female Washroom 2')
INSERT INTO AMENITY VALUES ('A8', 'Male Locker Room 2')
INSERT INTO AMENITY VALUES ('A9', 'Female Locker Room 2')
INSERT INTO AMENITY VALUES ('A10', 'Beverage Counter 2')



ALTER TABLE LOCATION DROP COLUMN facility_ID

ALTER TABLE Location ALTER COLUMN location_name SET DATA TYPE VARCHAR(50)

INSERT INTO LOCATION VALUES (1000, 'Indoor Badminton Ground')
INSERT INTO LOCATION VALUES (1001, 'Indoor Badminton Ground')
INSERT INTO LOCATION VALUES (1002, 'Indoor Badminton Ground')
INSERT INTO LOCATION VALUES (1003, 'Indoor Badminton Ground')
INSERT INTO LOCATION VALUES (1004, 'Indoor Badminton Ground')
INSERT INTO LOCATION VALUES (1005, 'Indoor Tennis Ground')
INSERT INTO LOCATION VALUES (1006, 'Indoor Tennis Ground')
INSERT INTO LOCATION VALUES (1007, 'Indoor Basketball Ground')
INSERT INTO LOCATION VALUES (1008, 'Indoor Basketball Ground')
INSERT INTO LOCATION VALUES (1009, 'Indoor Futsal Ground')
INSERT INTO LOCATION VALUES (1010, 'Indoor Futsal Ground')
INSERT INTO LOCATION VALUES (1011, 'Indoor Volleyball Ground')
INSERT INTO LOCATION VALUES (1012, 'Indoor Volleyball Ground')
INSERT INTO LOCATION VALUES (2000, 'Outdoor Tennis Ground')
INSERT INTO LOCATION VALUES (2001, 'Outdoor Tennis Ground')
INSERT INTO LOCATION VALUES (2002, 'Outdoor Basketball Ground')
INSERT INTO LOCATION VALUES (2003, 'Outdoor Basketball Ground')
INSERT INTO LOCATION VALUES (2004, 'Outdoor Futsal Ground')
INSERT INTO LOCATION VALUES (2005, 'Outdoor Futsal Ground')
INSERT INTO LOCATION VALUES (2006, 'Outdoor Volleyball Ground')
INSERT INTO LOCATION VALUES (2007, 'Outdoor Volleyball Ground')



SELECT * FROM LOCATION

SELECT * FROM FACILITY


INSERT INTO FACILITY VALUES ('BC1', 'S1', 'Badminton Court', 1000)
INSERT INTO FACILITY VALUES ('BC2', 'S1', 'Badminton Court', 1001)
INSERT INTO FACILITY VALUES ('BC3', 'S1', 'Badminton Court', 1002)
INSERT INTO FACILITY VALUES ('BC4', 'S1', 'Badminton Court', 1003)
INSERT INTO FACILITY VALUES ('BC5', 'S1', 'Badminton Court', 1004)
INSERT INTO FACILITY VALUES ('TC1', 'S2', 'Tennis Court', 1005)
INSERT INTO FACILITY VALUES ('TC2', 'S2', 'Tennis Court', 1006)
INSERT INTO FACILITY VALUES ('TC3', 'S3', 'Tennis Court', 2000)
INSERT INTO FACILITY VALUES ('TC4', 'S3', 'Tennis Court', 2001)
INSERT INTO FACILITY VALUES ('BK1', 'S4', 'Basketball Court', 1007)
INSERT INTO FACILITY VALUES ('BK2', 'S4', 'Basketball Court', 1008)
INSERT INTO FACILITY VALUES ('BK3', 'S5', 'Basketball Court', 2002)
INSERT INTO FACILITY VALUES ('BK4', 'S5', 'Basketball Court', 2003)
INSERT INTO FACILITY VALUES ('FC1', 'S6', 'Futsal Court', 1009)
INSERT INTO FACILITY VALUES ('FC2', 'S6', 'Futsal Court', 1010)
INSERT INTO FACILITY VALUES ('FC3', 'S7', 'Futsal Court', 2004)
INSERT INTO FACILITY VALUES ('FC4', 'S7', 'Futsal Court', 2005)
INSERT INTO FACILITY VALUES ('VC1', 'S8', 'Volleyball Court', 1011)
INSERT INTO FACILITY VALUES ('VC2', 'S8', 'Volleyball Court', 1012)
INSERT INTO FACILITY VALUES ('VC3', 'S9', 'Volleyball Court', 2006)
INSERT INTO FACILITY VALUES ('VC4', 'S9', 'Volleyball Court', 2007)



ALTER TABLE Location ADD facility_ID varchar(10) FOREIGN KEY(facility_ID) REFERENCES Facility

SELECT * FROM LOCATION

UPDATE location SET facility_ID = 'BC1' WHERE location_code = 1000
UPDATE location SET facility_ID = 'BC2' WHERE location_code = 1001
UPDATE location SET facility_ID = 'BC3' WHERE location_code = 1002
UPDATE location SET facility_ID = 'BC4' WHERE location_code = 1003
UPDATE location SET facility_ID = 'BC5' WHERE location_code = 1004
UPDATE location SET facility_ID = 'TC1' WHERE location_code = 1005
UPDATE location SET facility_ID = 'TC2' WHERE location_code = 1006
UPDATE location SET facility_ID = 'TC3' WHERE location_code = 2000
UPDATE location SET facility_ID = 'TC4' WHERE location_code = 2001
UPDATE location SET facility_ID = 'BK1' WHERE location_code = 1007
UPDATE location SET facility_ID = 'BK2' WHERE location_code = 1008
UPDATE location SET facility_ID = 'BK3' WHERE location_code = 2002
UPDATE location SET facility_ID = 'BK4' WHERE location_code = 2003
UPDATE location SET facility_ID = 'FC1' WHERE location_code = 1009
UPDATE location SET facility_ID = 'FC2' WHERE location_code = 1010
UPDATE location SET facility_ID = 'FC3' WHERE location_code = 2004
UPDATE location SET facility_ID = 'FC4' WHERE location_code = 2005
UPDATE location SET facility_ID = 'VC1' WHERE location_code = 1011
UPDATE location SET facility_ID = 'VC2' WHERE location_code = 1012
UPDATE location SET facility_ID = 'VC3' WHERE location_code = 2006
UPDATE location SET facility_ID = 'VC4' WHERE location_code = 2007


INSERT INTO AMENITY_LOCATION VALUES ('A1', 1000)
INSERT INTO AMENITY_LOCATION VALUES ('A10', 2004)
INSERT INTO AMENITY_LOCATION VALUES ('A2', 1001)
INSERT INTO AMENITY_LOCATION VALUES ('A3', 1003)
INSERT INTO AMENITY_LOCATION VALUES ('A4', 1004)
INSERT INTO AMENITY_LOCATION VALUES ('A5', 1005)
INSERT INTO AMENITY_LOCATION VALUES ('A6', 2000)
INSERT INTO AMENITY_LOCATION VALUES ('A7', 2001)
INSERT INTO AMENITY_LOCATION VALUES ('A8', 2002)
INSERT INTO AMENITY_LOCATION VALUES ('A9', 2003)

SELECT * FROM RATE

INSERT INTO RATE VALUES ('R1', 'BC1', 10.00, 12.00)
INSERT INTO RATE VALUES ('R2', 'BC2', 10.00, 12.00)
INSERT INTO RATE VALUES ('R3', 'BC3', 10.00, 12.00)
INSERT INTO RATE VALUES ('R4', 'BC4', 10.00, 12.00)
INSERT INTO RATE VALUES ('R5', 'BC5', 10.00, 12.00)
INSERT INTO RATE VALUES ('R6', 'TC1', 14.00, 16.00)
INSERT INTO RATE VALUES ('R7', 'TC2', 14.00, 16.00)
INSERT INTO RATE VALUES ('R8', 'TC3', 13.00, 15.00)
INSERT INTO RATE VALUES ('R9', 'TC4', 13.00, 15.00)
INSERT INTO RATE VALUES ('R10', 'BK1', 16.00, 18.00)
INSERT INTO RATE VALUES ('R11', 'BK2', 16.00, 18.00)
INSERT INTO RATE VALUES ('R12', 'BK3', 15.00, 17.00)
INSERT INTO RATE VALUES ('R13', 'BK4', 15.00, 17.00)
INSERT INTO RATE VALUES ('R14', 'FC1', 18.00, 20.00)
INSERT INTO RATE VALUES ('R15', 'FC2', 18.00, 20.00)
INSERT INTO RATE VALUES ('R16', 'FC3', 17.00, 19.00)
INSERT INTO RATE VALUES ('R17', 'FC4', 17.00, 19.00)
INSERT INTO RATE VALUES ('R18', 'VC1', 16.00, 18.00)
INSERT INTO RATE VALUES ('R19', 'VC2', 16.00, 18.00)
INSERT INTO RATE VALUES ('R20', 'VC3', 15.00, 17.00)
INSERT INTO RATE VALUES ('R21', 'VC4', 15.00, 17.00)



INSERT INTO BOOKING VALUES (12110, 01, 'BC1', '2023-06-03', '2 HOURS', '08:00PM - 10:00PM')
INSERT INTO BOOKING VALUES (12111, 02, 'FC3', '2023-06-05', '3 HOURS', '05:00PM - 08:00PM')
INSERT INTO BOOKING VALUES (12112, 03, 'BK2', '2023-06-25', '1 HOURS', '01:00PM - 02:00PM')
INSERT INTO BOOKING VALUES (12113, 04, 'TC4', '2023-06-03', '2 HOURS', '05:00PM - 07:00PM')
INSERT INTO BOOKING VALUES (12114, 05, 'VC1', '2023-07-01', '2 HOURS', '09:00PM - 11:00PM')
INSERT INTO BOOKING VALUES (12115, 06, 'BC2', '2023-05-30', '1 HOURS', '02:00PM - 03:00PM')


INSERT INTO PAYMENT VALUES ('PY1', 12110, 24.00, 'Online Banking', '2023-06-03')
INSERT INTO PAYMENT VALUES ('PY2', 12111, 51.00, 'QR Pay', '2023-06-06')
INSERT INTO PAYMENT VALUES ('PY3', 12112, 18.00, 'Grab Pay', '2023-06-25')
INSERT INTO PAYMENT VALUES ('PY4', 12113, 30.00, 'Online Banking', '2023-06-03')
INSERT INTO PAYMENT VALUES ('PY5', 12114, 36.00, 'TNG Wallet', '2023-07-01')
INSERT INTO PAYMENT VALUES ('PY6', 12115, 10.00, 'Shopee Pay', '2023-05-30')
