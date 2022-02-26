--This project has been created with fiddleSql

CREATE TABLE hotel ( 
  hotelNo VARCHAR(4), 
  hotelName VARCHAR(25), 
  city VARCHAR(25), 
  PRIMARY KEY (hotelNo) 
); 

INSERT INTO hotel VALUES ('H001', 'Hotel California', 'California'); 
INSERT INTO hotel VALUES ('H002', 'Sky Blue', 'Nevada'); 
INSERT INTO hotel VALUES ('H003', 'Dream Hotel', 'Las Vegas'); 
INSERT INTO hotel VALUES ('H004', 'Transilvania', 'Los Angeles'); 
INSERT INTO hotel VALUES ('H005', 'Beach spot', 'Hawai'); 
INSERT INTO hotel VALUES ('H006', 'Disney Hotel', 'Orlando'); 
INSERT INTO hotel VALUES ('H007', 'York Time', 'New York'); 
INSERT INTO hotel VALUES ('H008', 'Diamond', 'Brooklyn'); 
INSERT INTO hotel VALUES ('H009', 'Five Stars', 'Los Angeles'); 
INSERT INTO hotel VALUES ('H010', 'Hi Five', 'Washington'); 

CREATE TABLE room ( 
  roomNo NUMERIC(3,0), 
  hotelNo VARCHAR(4), 
  type VARCHAR(6),  
  price NUMERIC(3,0), 
  PRIMARY KEY (roomNo, hotelNo), 
  FOREIGN KEY (hotelNo) REFERENCES hotel, 
  CHECK (type IN('Single','Double','Family')), 
  CHECK (price > 9 AND price < 101), 
  CHECK (roomNo > 0 AND roomNo < 121) 
); 

INSERT INTO room VALUES (21, 'H005', 'Single', 100); 
INSERT INTO room VALUES (107, 'H003', 'Single', 80); 
INSERT INTO room VALUES (113, 'H002', 'Family', 50); 
INSERT INTO room VALUES (13, 'H004', 'Double', 90); 
INSERT INTO room VALUES (16, 'H001', 'Family', 75); 
INSERT INTO room VALUES (9, 'H007', 'Single', 83); 
INSERT INTO room VALUES (19, 'H006', 'Double', 70); 
INSERT INTO room VALUES (10, 'H010', 'Family', 95); 
INSERT INTO room VALUES (5, 'H007', 'Double', 69); 
INSERT INTO room VALUES (35, 'H008', 'Single', 50); 

CREATE TABLE guest( 
  guestNo NUMERIC(10,0), 
  guestName VARCHAR(20), 
  guestAddress VARCHAR(25), 
  PRIMARY KEY (guestNo) 
); 

INSERT INTO guest VALUES (517864, 'John Labrint', 'Calle 2-2d-1'); 
INSERT INTO guest VALUES (665326, 'James Low', 'Carrera 16-20'); 
INSERT INTO guest VALUES (132522, 'Rounda Rouss', 'Avenida 19-2d'); 
INSERT INTO guest VALUES (524451, 'Mikeyla Bliss', 'Carrera 2C-16'); 
INSERT INTO guest VALUES (585862, 'Daron Malakian', 'Avenida 15-2'); 
INSERT INTO guest VALUES (453215, 'Santiago Trochez', 'Carrera 7 xd bis'); 
INSERT INTO guest VALUES (321654, 'Keren Lopez', 'Avenida 25-25'); 
INSERT INTO guest VALUES (246546, 'Angelica Corrales', 'Carrera 58a #1B1'); 
INSERT INTO guest VALUES (324987, 'Laura Martinez', 'Carrera 25-65'); 
INSERT INTO guest VALUES (987342, 'Diana Olano', 'Calle 98-23'); 

CREATE TABLE booking ( 
  hotelNo VARCHAR(4), 
  guestNo NUMERIC(10,0), 
  dateFrom DATE, 
  dateTo DATE,
  roomNo NUMERIC(3,0), 
  PRIMARY KEY (hotelNo, guestNo, dateFrom), 
  FOREIGN KEY (roomNo, hotelNo) REFERENCES room(roomNo, hotelNo), 
  FOREIGN KEY (guestNo) REFERENCES guest(guestNo),
  CHECK (dateFrom > CURRENT_DATE),
  CHECK (dateTo > CURRENT_DATE)
);

INSERT INTO booking VALUES ('H005', 517864, '2022/02/26', '2022/03/20', 21);
INSERT INTO booking VALUES ('H003', 665326, '2022/03/20', '2022/03/21', 107);
INSERT INTO booking VALUES ('H002', 132522, '2022/03/21', '2022/03/22', 113);
INSERT INTO booking VALUES ('H004', 524451, '2022/03/23', '2022/03/23', 13);
INSERT INTO booking VALUES ('H001', 585862, '2022/04/01', '2022/04/03', 16);
INSERT INTO booking VALUES ('H007', 453215, '2022/04/01', '2022/04/05', 9);
INSERT INTO booking VALUES ('H006', 321654, '2022/04/01', '2022/04/05', 19);
INSERT INTO booking VALUES ('H010', 246546, '2022/04/01', '2022/04/05', 10);
INSERT INTO booking VALUES ('H007', 324987, '2022/04/01', '2022/04/05', 5);
INSERT INTO booking VALUES ('H008', 987342, '2022/04/01', '2022/04/05', 35);

SELECT * FROM hotel;
SELECT * FROM room;
SELECT * FROM guest;
SELECT * FROM booking;