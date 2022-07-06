-- CREATE DATABASE car_service;

-- drop table and type in reverse order
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS rider;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS users;

DROP TYPE IF EXISTS PaymentType;
DROP TYPE IF EXISTS Rating;
DROP TYPE IF EXISTS TripStatus;
DROP TYPE IF EXISTS Color;
DROP TYPE IF EXISTS Document;
DROP TYPE IF EXISTS Category;
DROP TYPE IF EXISTS Location;
DROP TYPE IF EXISTS Address;


CREATE TYPE Address AS (
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(10),
    country VARCHAR(60)
);

CREATE TYPE Category AS ENUM ('citizenship', 'license', 'passport', 'other');

CREATE TYPE Document AS (
    category Category,
    document_no VARCHAR(255),
    issued_on DATE,
    expires_on DATE
);

CREATE TYPE Location AS (
    latitude double precision,
    longitude double precision
);


CREATE TYPE Color AS ENUM ('red', 'green', 'blue', 'yellow', 'black', 'white', 'grey', 'purple', 'brown', 'orange', 'pink', 'silver', 'gold');

CREATE TYPE TripStatus AS ENUM ('requested', 'accepted', 'inprogress', 'cancelled', 'completed');

CREATE TYPE Rating AS ENUM ('1', '2', '3', '4', '5');

CREATE TYPE PaymentType AS ENUM ('online', 'cash', 'card');


-- base user table
CREATE TABLE users(
    name VARCHAR(100) NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(254) NOT NULL,
    address Address[] NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- inherit rider from user table
CREATE TABLE rider (
    id serial PRIMARY KEY,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    document Document[] NOT NULL
) INHERITS (users);

-- insert data into rider table
INSERT INTO rider(name, email, phone_number, password, address, created_at, updated_at, is_verified, document)
VALUES
('Lucilia Sowray', 'lsowray0@bandcamp.com', '+86 559 706 3485', 'ZWYVIDd3W0', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), false, ARRAY[('license', '7579376806', '2022/04/23', '2022/06/19'), ('passport', '6288049301', '2020/11/25', '2021/10/03')]::Document[]),
('Alvis Higford', 'ahigford1@behance.net', '+46 909 414 2567', 'qD0kt8W1sTI', ARRAY[('968 Bay Avenue', 'Barru', '99876', 'Indonesia'), ('03824 Truax Lane', 'Tongxing', null, 'China')]::Address[], NOW(), NOW(), true, ARRAY[('license', '8863596603', '2020/03/27', '2021/10/21')]::Document[]),
('Gaby D''Arrigo', 'gdarrigo2@bbb.org', '+852 697 441 5096', 'gkpjLICCNq', ARRAY[('50144 Prairieview Way', 'Antsirabe', '09876', 'Madagascar')]::Address[], NOW(), NOW(), false, ARRAY[('license', '3795739934', '2019/08/08', '2021/08/07')]::Document[]),
('Rheta Trewman', 'rtrewman3@yellowpages.com', '+47 144 578 1425', 'DYLSyGHE3', ARRAY[('8 Bartelt Crossing', 'Les Abymes', '97182', 'Guadeloupe')]::Address[], NOW(), NOW(), false, ARRAY[('license', '0636288730', '2019/12/25', '2022/05/10')]::Document[]),
('Hort Cadwallader', 'hcadwallader4@ibm.com', '+254 495 295 7406', 'YWJ2k8', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany')]::Address[], NOW(), NOW(), false, ARRAY[('license', '1610164601', '2021/07/27', '2021/09/15')]::Document[]),
('Juliet Itzhak', 'jitzhak5@tumblr.com', '+86 866 469 9224', 'I13wS8oCIBN', ARRAY[('805 Gulseth Circle', 'Karanggeneng', '45329', 'Indonesia')]::Address[], NOW(), NOW(), true, ARRAY[('license', '9721186619', '2020/10/07', '2021/09/02')]::Document[]),
('Gerardo Garnar', 'ggarnar6@google.it', '+62 272 486 2375', 'mjjeQy', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany')]::Address[], NOW(), NOW(), false, ARRAY[('license', '4443595244', '2021/07/14', '2022/04/18')]::Document[]),
('Mabel Rawdales', 'mrawdales7@imageshack.us', '+47 874 108 7793', 'B6lbfZv5nPEg', ARRAY[('089 Cherokee Way', 'Stírion', '47541', 'Greece')]::Address[], NOW(), NOW(), true, ARRAY[('license', '8343329236', '2021/10/01', '2022/01/10')]::Document[]),
('Simmonds Reding', 'sreding8@comcast.net', '+34 644 253 1371', 'eJBV8iAs', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany'), ('22 Messerschmidt Park', 'Huimin', null, 'China')]::Address[], NOW(), NOW(), true, ARRAY[('license', '4184470335', '2021/09/17', '2022/01/09')]::Document[]),
('Kennie Grimmett', 'kgrimmett9@bing.com', '+86 517 853 5063', '3qZgWw6YMBpk', ARRAY[('19 Northport Drive', 'Graz', '8042', 'Austria')]::Address[], NOW(), NOW(), false, ARRAY[('license', '2105942407', '2022/03/10', '2022/03/02')]::Document[]),
('Jo-ann Mollen', 'jmollena@canalblog.com', '+86 631 879 5309', 'e3pgI0s07Ycv', ARRAY[('6462 Declaration Circle', 'Pagsañgahan', '4324', 'Philippines')]::Address[], NOW(), NOW(), true, ARRAY[('license', '4877070796', '2021/07/28', '2022/03/04')]::Document[]),
('Carolee Deaconson', 'cdeaconsonb@upenn.edu', '+48 445 314 8675', 'K1Lb6YYcxJJx', ARRAY[('2208 Dawn Terrace', 'Arauca', '810009', 'Colombia'), ('8574 Del Mar Junction', 'Bandar ‘Abbās', null, 'Iran')]::Address[], NOW(), NOW(), true, ARRAY[('license', '8179719464', '2020/10/28', '2021/11/23')]::Document[]),
('Sallee Benbrick', 'sbenbrickc@blinklist.com', '+48 459 631 7325', 'bvvjNN', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany')]::Address[], NOW(), NOW(), false, ARRAY[('license', '3976402834', '2020/05/19', '2021/11/27')]::Document[]),
('Raquel Djuricic', 'rdjuricicd@wikia.com', '+86 319 745 1936', 'p76GgV9jTb', ARRAY[('55 Bartillon Circle', 'Cantuk Kidul', '8897', 'Indonesia'), ('70581 Waywood Trail', 'Seririt', null, 'Indonesia')]::Address[], NOW(), NOW(), false, ARRAY[('license', '1084700883', '2020/05/15', '2021/12/21')]::Document[]),
('Crysta Poundford', 'cpoundforde@reverbnation.com', '+63 393 178 7179', 'HxorEFb', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), true, ARRAY[('license', '5503086066', '2021/10/14', '2022/06/07')]::Document[]);


-- inherit customer from user table
CREATE TABLE customer (
    id serial PRIMARY KEY,
    account_balance money DEFAULT 0
) INHERITS (users);

-- insert data into customer table
INSERT INTO customer(name, email, phone_number, password, address, created_at, updated_at, account_balance)
VALUES
('Loraine Giddings', 'lorainegiddings@gmail.com', '+1 (865) 581-9071', 'ZWYVIDd3W0', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), '100.60'),
('Rudolpho Giddings', 'eudolphogiddings@hotmail.com', '+1 (865) 581-9071', 'ZWYVIDd3W0', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), '1.60'),
('Marga Rendle', 'mrendle0@paginegialle.it', '+966 946 311 4053', 'IZSr8I8p', ARRAY[('181 Bobwhite Drive', 'Al Ulá', '9876', 'Saudi Arabia')]::Address[], NOW(), NOW(), '178.60'),
('Lonny Caile', 'lcaile1@ezinearticles.com', '+234 550 828 7192', 'xfZlUGbb', ARRAY[('081 Burrows Avenue', 'Aku', '4567', 'Nigeria')]::Address[], NOW(), NOW(), '908.13'),
('Lorry Dagleas', 'ldagleas2@4shared.com', '+66 324 700 9721', 'mslNVfCt6', ARRAY[('31 Raven Parkway', 'Ban Na Muang', '71150', 'Thailand')]::Address[], NOW(), NOW(), '6098.08'),
('Gabriel Barracks', 'gbarracks3@mapquest.com', '+51 395 978 9343', 's3usWSJ', ARRAY[('84 Hanson Trail', 'Olmos', '7459', 'Peru')]::Address[], NOW(), NOW(), '7980.92'),
('Meredith Maunsell', 'mmaunsell4@parallels.com', '+51 693 919 4241', 'ld7ZxaDu', ARRAY[('8 Anthes Center', 'Lahuaytambo', '4587', 'Peru')]::Address[], NOW(), NOW(), '89865.22'),
('Bartholomew Kirkby', 'bkirkby5@wiley.com', '+46 494 109 2829', '8FS8LKqx', ARRAY[('7458 Arapahoe Park', 'Mariefred', '64781', 'Sweden')]::Address[], NOW(), NOW(), '80.87'),
('Angelia Wimp', 'awimp6@miibeian.gov.cn', '+1 652 369 4726', 'uYgy3uZm', ARRAY[('7582 Schlimgen Street', 'Camlachie', '1487', 'Canada')]::Address[], NOW(), NOW(), '5.81'),
('Hilary Ockleshaw', 'hockleshaw7@imgur.com', '+370 172 699 4050', 'WzFlCO', ARRAY[('17 Hollow Ridge Pass', 'Vilkaviskis', '70073', 'Lithuania')]::Address[], NOW(), NOW(), '40.48'),
('Consolata Dowall', 'cdowall8@slashdot.org', '+63 550 381 4086', '2kCK82o9ixS', ARRAY[('21 Stephen Park', 'Angono', '1930', 'Philippines')]::Address[], NOW(), NOW(), '30.60'),
('Davey Danielian', 'ddanielian9@hibu.com', '+86 641 341 3703', 'ogKZOVGN', ARRAY[('5 Judy Trail', 'Botou', '7467', 'China')]::Address[], NOW(), NOW(), '578.38'),
('Beale Sharphurst', 'bsharphursta@timesonline.co.uk', '+234 129 451 4515', '6bkGbY7B', ARRAY[('6126 Mosinee Point', 'Bokani', '7123', 'Nigeria')]::Address[], NOW(), NOW(), '8678.01'),
('Jenine Shildrick', 'jshildrickb@mashable.com', '+966 858 808 4522', '6Qw7OpNr', ARRAY[('4262 Pawling Junction', 'Najrān', '98978', 'Saudi Arabia')]::Address[], NOW(), NOW(), '45678.51'),
('Constancia Wynne', 'cwynnec@timesonline.co.uk', '+86 673 843 6922', 'MBr4O64c', ARRAY[('502 Claremont Avenue', 'Xingfu', '76350', 'China')]::Address[], NOW(), NOW(), '64567.88');

-- create table for car

CREATE TABLE car(
    id serial PRIMARY KEY,
    rider_id INT,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    license_plate_no VARCHAR(10) NOT NULL,
    color Color NOT NULL,
    base_rate money NOT NULL,

    CONSTRAINT fk_rider
        FOREIGN KEY(rider_id) 
	        REFERENCES rider(id)
            ON DELETE CASCADE
);

-- insert into car table

INSERT INTO car(rider_id, make, model, year, license_plate_no, color, base_rate)
VALUES
(1, 'Jeep', 'Liberty', 2012, 'AAA 7836', ('yellow'), '67.96'),
(2, 'Lincoln', 'Continental', 1998, 'BB 1824', ('gold'), '30.72'),
(3, 'Kia', 'Optima', 2010, 'CC 0719', ('silver'), '25.36'),
(4, 'Volkswagen', 'Jetta', 2000, 'DD 6604', ('red'), '25.95'),
(5, 'Buick', 'Roadmaster', 1995, 'EE 6512', ('gold'), '62.39'),
(6, 'Mazda', 'Miata MX-5', 1999, 'EF 1001', ('silver'), '98.46'),
(7, 'Acura', 'RDX', 2007, 'AL 4792', ('purple'), '45.21'),
(8, 'Pontiac', 'Trans Sport', 1990, 'DA 5490', ('silver'), '63.20'),
(9, 'Chevrolet', 'Corvette', 1973, 'CF 5571', ('white'), '13.11'),
(10, 'Cadillac', 'DeVille', 1998, 'GF 5051', ('blue'), '87.28'),
(11, 'GMC', 'Sierra 3500', 2011, 'AV 8593', ('black'), '92.73'),
(12, 'Maybach', 'Landaulet', 2012, 'AK 9998', ('yellow'), '97.24'),
(13, 'Honda', 'Accord', 1998, 'GK 5249', ('silver'), '27.17'),
(14, 'Hyundai', 'Santa Fe', 2009, 'AC 8531', ('black'), '87.08'),
(15, 'Saturn', 'S-Series', 1999, 'AC 0701', ('yellow'), '78.91');


-- create table for trip

CREATE TABLE trip(
    id serial PRIMARY KEY,
    rider_id INT,
    customer_id INT,
    requested_on TIMESTAMP NOT NULL,
    pickup_location Location NOT NULL,
    destination_location Location,
    start_on TIMESTAMP,
    end_on TIMESTAMP,
    status TripStatus,
    customer_rating Rating,
    rider_rating Rating,
    
    CONSTRAINT fk_rider
        FOREIGN KEY(rider_id)
            REFERENCES rider(id)
            ON DELETE CASCADE,

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
            REFERENCES customer(id)
            ON DELETE CASCADE
);

--insert into trip table
INSERT INTO trip(rider_id, customer_id, requested_on, pickup_location, destination_location, status)
VALUES
(6, 10, '2021-11-04 14:31:52', (32.983101, 107.766613), (32.983101, 107.766613), 'requested'),
(14, 11, '2022-03-15 07:45:19', (19.27898, -99.1653351), (19.27898, -99.1653351), 'requested'),
(7, 7, '2021-12-24 12:43:38', (49.2803655, -0.2062549), (49.2803655, -0.2062549), 'requested'),
(11, 14, '2022-03-23 00:28:43', (49.9890993, 18.5699721), (49.9890993, 18.5699721), 'requested'),
(9, 12, '2021-09-01 07:52:13', (-17.8599943, -41.5091004), (-17.8599943, -41.5091004), 'requested'),
(14, 5, '2021-12-06 09:31:23', (30.8936954, 50.0932428), (30.8936954, 50.0932428), 'requested'),
(8, 13, '2021-08-23 10:16:19', (32.31876, 118.930364), (32.31876, 118.930364), 'requested'),
(8, 11, '2022-06-02 08:10:21', (9.9578348, 124.1789637), (9.9578348, 124.1789637), 'requested'),
(3, 7, '2021-11-16 21:13:41', (-20.7314751, -42.0299263), (-20.7314751, -42.0299263), 'requested'),
(3, 10, '2022-02-22 07:24:51', (59.4048322, 17.9494929), (59.4048322, 17.9494929), 'requested'),
(2, 12, '2022-03-29 18:20:30', (40.8536972, 111.6568972), (40.8536972, 111.6568972), 'requested'),
(11, 1, '2022-06-16 07:56:11', (48.7320309, 16.905384), (48.7320309, 16.905384), 'requested'),
(14, 10, '2022-04-04 10:45:33', (13.8086742, -89.1801225), (13.8086742, -89.1801225), 'requested'),
(2, 5, '2021-08-19 10:52:40', (47.3168226, 47.3786779), (47.3168226, 47.3786779), 'requested'),
(14, 1, '2021-09-06 09:20:02', (44.0527811, 6.1717148), (44.0527811, 6.1717148), 'requested'),
(14, 3, '2021-08-01 21:12:29', (32.318255, 109.715304),  (32.318255, 109.715304), 'requested'),
(2, 5, '2022-06-27 04:12:05', (-7.5201771, 109.2638245), (-7.5201771, 109.2638245), 'requested'),
(13, 6, '2022-04-23 09:56:39', (45.8697083, 43.3478599), (45.8697083, 43.3478599), 'requested'),
(3, 12, '2021-12-27 17:46:18', (9.5403936, 125.5240221), (9.5403936, 125.5240221), 'requested'),
(12, 15, '2022-03-28 08:12:01', (25.6829687, 100.1325059), (25.6829687, 100.1325059), 'requested'),
(10, 4, '2022-01-24 11:09:54', (59.7222934, 17.7824686), (59.7222934, 17.7824686), 'requested'),
(14, 9, '2021-12-03 12:06:16', (12.0554892, 99.855247), (12.0554892, 99.855247), 'requested'),
(11, 2, '2021-11-02 12:16:47', (63.6182729, 22.7568858), (63.6182729, 22.7568858), 'requested'),
(12, 2, '2022-05-01 09:23:54', (59.6626986, 30.0764476), (59.6626986, 30.0764476), 'requested'),
(9, 3, '2022-04-02 19:55:16', (29.657856, 116.30275), (29.657856, 116.30275), 'requested'),
(4, 2, '2021-07-16 08:13:40', (25.0617484, 68.6593883),  (25.0617484, 68.6593883), 'requested'),
(4, 1, '2022-05-17 23:05:41', (29.201587, 111.755127), (29.201587, 111.755127), 'requested'),
(7, 12, '2021-12-18 22:57:12', (39.3240601, -77.3485436), (39.3240601, -77.3485436), 'requested'),
(4, 13, '2022-06-18 19:43:33', (59.3544768, 18.0283975), (59.3544768, 18.0283975), 'requested'),
(1, 8, '2022-03-23 17:53:47', (44.8568897, 38.6720778), (44.8568897, 38.6720778), 'requested'),
(9, 10, '2022-02-23 14:28:04', (49.7266083, 19.8365034), (49.7266083, 19.8365034), 'requested'),
(12, 13, '2021-07-08 13:10:13', (37.892744, 116.745762), (37.892744, 116.745762), 'requested'),
(9, 15, '2021-09-12 10:00:44', (28.188157, 121.030159), (28.188157, 121.030159), 'requested'),
(4, 11, '2021-07-22 19:43:03', (-0.9676533, -80.7089101),  (-0.9676533, -80.7089101), 'requested'),
(13, 14, '2022-04-25 17:33:47', (12.2711071, 12.5807242), (12.2711071, 12.5807242), 'requested'),
(7, 6, '2022-02-11 13:21:02', (15.85, 44.775), (15.85, 44.775), 'requested'),
(1, 2, '2021-07-06 18:14:33', (-35.229035, 173.94869), (-35.229035, 173.94869), 'requested'),
(12, 11, '2021-11-13 19:16:43', (29.306756, 120.07514),  (29.306756, 120.07514), 'requested'),
(10, 7, '2022-02-09 17:39:32', (18.4320055, 98.9024603), (18.4320055, 98.9024603), 'requested'),
(6, 10, '2021-09-29 17:28:26', (-6.7273278, 111.2695981), (-6.7273278, 111.2695981), 'requested'),
(2, 6, '2021-09-17 06:33:15', (39.577106, 117.120033), (39.577106, 117.120033), 'requested'),
(1, 13, '2022-01-10 15:09:05', (13.2881184, -87.0336925), (13.2881184, -87.0336925), 'requested'),
(5, 12, '2021-12-11 00:28:02', (48.1120825, 25.7664345), (48.1120825, 25.7664345), 'requested'),
(7, 2, '2021-09-27 02:42:11', (28.555787, 121.244605), (28.555787, 121.244605), 'requested'),
(11, 10, '2021-07-10 03:33:47', (13.2979317, 123.7802005), (13.2979317, 123.7802005), 'requested'),
(12, 1, '2021-11-19 14:24:55', (28.3285373, 109.6029048), (28.3285373, 109.6029048), 'requested'),
(11, 7, '2022-07-04 09:58:41', (34.915946, 98.209206), (34.915946, 98.209206), 'requested'),
(6, 7, '2021-10-01 21:26:30', (45.26678, -73.61588), (45.26678, -73.61588), 'requested'),
(9, 9, '2021-08-13 15:22:29', (45.6429121, 29.3753657), (45.6429121, 29.3753657), 'requested'),
(2, 6, '2022-01-20 01:17:44', (53.175543, 21.296838), (53.175543, 21.296838), 'requested');


-- rider accepts or cancels the trip request
UPDATE trip SET status='accepted' WHERE id=1;
UPDATE trip SET status='accepted' WHERE id=2;
UPDATE trip SET status='accepted' WHERE id=3;
UPDATE trip SET status='accepted' WHERE id=4;
UPDATE trip SET status='accepted' WHERE id=5;
UPDATE trip SET status='accepted' WHERE id=6;
UPDATE trip SET status='accepted' WHERE id=7;
UPDATE trip SET status='cancelled' WHERE id=8;
UPDATE trip SET status='accepted' WHERE id=9;
UPDATE trip SET status='accepted' WHERE id=10;
UPDATE trip SET status='accepted' WHERE id=11;
UPDATE trip SET status='accepted' WHERE id=12;
UPDATE trip SET status='accepted' WHERE id=13;
UPDATE trip SET status='cancelled' WHERE id=14;
UPDATE trip SET status='accepted' WHERE id=15;
UPDATE trip SET status='accepted' WHERE id=16;
UPDATE trip SET status='accepted' WHERE id=17;
UPDATE trip SET status='accepted' WHERE id=18;
UPDATE trip SET status='accepted' WHERE id=19;
UPDATE trip SET status='accepted' WHERE id=20;
UPDATE trip SET status='accepted' WHERE id=21;
UPDATE trip SET status='cancelled' WHERE id=22;
UPDATE trip SET status='accepted' WHERE id=23;
UPDATE trip SET status='accepted' WHERE id=24;
UPDATE trip SET status='accepted' WHERE id=25;
UPDATE trip SET status='cancelled' WHERE id=26;
UPDATE trip SET status='accepted' WHERE id=27;
UPDATE trip SET status='accepted' WHERE id=28;
UPDATE trip SET status='accepted' WHERE id=29;
UPDATE trip SET status='accepted' WHERE id=30;
UPDATE trip SET status='accepted' WHERE id=31;
UPDATE trip SET status='accepted' WHERE id=32;
UPDATE trip SET status='accepted' WHERE id=33;
UPDATE trip SET status='accepted' WHERE id=34;
UPDATE trip SET status='accepted' WHERE id=35;
UPDATE trip SET status='cancelled' WHERE id=36;
UPDATE trip SET status='accepted' WHERE id=37;
UPDATE trip SET status='accepted' WHERE id=38;
UPDATE trip SET status='accepted' WHERE id=39;
UPDATE trip SET status='accepted' WHERE id=40;
UPDATE trip SET status='accepted' WHERE id=41;
UPDATE trip SET status='accepted' WHERE id=42;
UPDATE trip SET status='accepted' WHERE id=43;
UPDATE trip SET status='accepted' WHERE id=44;
UPDATE trip SET status='accepted' WHERE id=45;
UPDATE trip SET status='accepted' WHERE id=46;
UPDATE trip SET status='accepted' WHERE id=47;
UPDATE trip SET status='cancelled' WHERE id=48;
UPDATE trip SET status='accepted' WHERE id=49;
UPDATE trip SET status='accepted' WHERE id=50;


-- after the trip is accepted, the rider meets the customer at pickup location and update the status to inprogress and set the start time
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=1;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=2;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=3;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=4;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=5;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=6;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=7;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=9;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=10;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=11;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=12;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=13;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=15;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=16;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=17;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=18;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=19;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=20;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=21;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=23;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=24;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=25;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=27;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=28;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=29;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=30;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=31;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=32;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=33;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=34;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=35;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=37;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=38;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=39;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=40;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=41;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=42;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=43;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=44;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=45;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=46;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=47;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=49;
UPDATE trip SET start_on=NOW(), status='inprogress' WHERE id=50;

-- after the they reach destination, drive updates the status to completed and set the end time
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=1;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=2;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=3;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=4;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=5;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=6;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=7;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=9;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=10;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=11;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=12;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=13;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=15;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=16;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=17;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=18;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=19;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=20;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=21;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=23;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=24;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=25;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=27;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=28;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=29;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=30;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=31;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=32;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=33;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=34;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=35;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=37;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=38;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=39;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=40;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=41;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=42;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=43;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=44;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=45;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=46;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=47;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=49;
UPDATE trip SET end_on=NOW(), status='completed' WHERE id=50;

-- customer rates the rider
UPDATE trip SET rider_rating='5' WHERE id=1;
UPDATE trip SET rider_rating='4' WHERE id=2;
UPDATE trip SET rider_rating='1' WHERE id=3;
UPDATE trip SET rider_rating='2' WHERE id=4;
UPDATE trip SET rider_rating='3' WHERE id=5;
UPDATE trip SET rider_rating='4' WHERE id=6;
UPDATE trip SET rider_rating='5' WHERE id=7;
UPDATE trip SET rider_rating='1' WHERE id=9;
UPDATE trip SET rider_rating='2' WHERE id=10;
UPDATE trip SET rider_rating='3' WHERE id=11;
UPDATE trip SET rider_rating='4' WHERE id=12;
UPDATE trip SET rider_rating='5' WHERE id=13;
UPDATE trip SET rider_rating='1' WHERE id=15;
UPDATE trip SET rider_rating='2' WHERE id=16;
UPDATE trip SET rider_rating='3' WHERE id=17;
UPDATE trip SET rider_rating='4' WHERE id=18;
UPDATE trip SET rider_rating='5' WHERE id=19;
UPDATE trip SET rider_rating='1' WHERE id=20;
UPDATE trip SET rider_rating='2' WHERE id=21;
UPDATE trip SET rider_rating='3' WHERE id=23;
UPDATE trip SET rider_rating='4' WHERE id=24;
UPDATE trip SET rider_rating='5' WHERE id=25;
UPDATE trip SET rider_rating='1' WHERE id=27;
UPDATE trip SET rider_rating='2' WHERE id=28;
UPDATE trip SET rider_rating='3' WHERE id=29;
UPDATE trip SET rider_rating='4' WHERE id=30;
UPDATE trip SET rider_rating='5' WHERE id=31;
UPDATE trip SET rider_rating='1' WHERE id=32;
UPDATE trip SET rider_rating='2' WHERE id=33;
UPDATE trip SET rider_rating='3' WHERE id=34;
UPDATE trip SET rider_rating='4' WHERE id=35;
UPDATE trip SET rider_rating='5' WHERE id=37;
UPDATE trip SET rider_rating='1' WHERE id=38;
UPDATE trip SET rider_rating='3' WHERE id=39;
UPDATE trip SET rider_rating='4' WHERE id=40;
UPDATE trip SET rider_rating='5' WHERE id=41;
UPDATE trip SET rider_rating='1' WHERE id=42;
UPDATE trip SET rider_rating='1' WHERE id=43;
UPDATE trip SET rider_rating='2' WHERE id=44;
UPDATE trip SET rider_rating='3' WHERE id=45;
UPDATE trip SET rider_rating='4' WHERE id=46;
UPDATE trip SET rider_rating='5' WHERE id=47;
UPDATE trip SET rider_rating='1' WHERE id=49;
UPDATE trip SET rider_rating='5' WHERE id=50;

-- rider rates the customer
UPDATE trip SET customer_rating='1' WHERE id=1;
UPDATE trip SET customer_rating='2' WHERE id=2;
UPDATE trip SET customer_rating='3' WHERE id=3;
UPDATE trip SET customer_rating='4' WHERE id=4;
UPDATE trip SET customer_rating='5' WHERE id=5;
UPDATE trip SET customer_rating='1' WHERE id=6;
UPDATE trip SET customer_rating='2' WHERE id=7;
UPDATE trip SET customer_rating='5' WHERE id=9;
UPDATE trip SET customer_rating='5' WHERE id=10;
UPDATE trip SET customer_rating='2' WHERE id=11;
UPDATE trip SET customer_rating='4' WHERE id=12;
UPDATE trip SET customer_rating='4' WHERE id=13;
UPDATE trip SET customer_rating='5' WHERE id=15;
UPDATE trip SET customer_rating='5' WHERE id=16;
UPDATE trip SET customer_rating='1' WHERE id=17;
UPDATE trip SET customer_rating='1' WHERE id=18;
UPDATE trip SET customer_rating='5' WHERE id=19;
UPDATE trip SET customer_rating='1' WHERE id=20;
UPDATE trip SET customer_rating='2' WHERE id=21;
UPDATE trip SET customer_rating='3' WHERE id=23;
UPDATE trip SET customer_rating='4' WHERE id=24;
UPDATE trip SET customer_rating='5' WHERE id=25;
UPDATE trip SET customer_rating='1' WHERE id=27;
UPDATE trip SET customer_rating='2' WHERE id=28;
UPDATE trip SET customer_rating='3' WHERE id=29;
UPDATE trip SET customer_rating='4' WHERE id=30;
UPDATE trip SET customer_rating='5' WHERE id=31;
UPDATE trip SET customer_rating='1' WHERE id=32;
UPDATE trip SET customer_rating='2' WHERE id=33;
UPDATE trip SET customer_rating='3' WHERE id=34;
UPDATE trip SET customer_rating='4' WHERE id=35;
UPDATE trip SET customer_rating='5' WHERE id=37;
UPDATE trip SET customer_rating='1' WHERE id=38;
UPDATE trip SET customer_rating='2' WHERE id=39;
UPDATE trip SET customer_rating='1' WHERE id=40;
UPDATE trip SET customer_rating='5' WHERE id=41;
UPDATE trip SET customer_rating='4' WHERE id=42;
UPDATE trip SET customer_rating='3' WHERE id=43;
UPDATE trip SET customer_rating='2' WHERE id=44;
UPDATE trip SET customer_rating='4' WHERE id=45;
UPDATE trip SET customer_rating='3' WHERE id=46;
UPDATE trip SET customer_rating='1' WHERE id=47;
UPDATE trip SET customer_rating='5' WHERE id=49;
UPDATE trip SET customer_rating='1' WHERE id=50;


-- create table for payment

CREATE TABLE payment (
    id serial PRIMARY KEY,
    trip_id INT,
    payment_date TIMESTAMP NOT NULL,
    type PaymentType NOT NULL,
    base_rate money NOT NULL,
    surge_rate money NOT NULL,
    tip_amount money NOT NULL,
    total money NOT NULL,

    CONSTRAINT fk_trip
        FOREIGN KEY(trip_id)
            REFERENCES trip(id)
            ON DELETE CASCADE
);


-- insert into payment table





