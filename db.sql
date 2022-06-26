DROP DATABASE IF EXISTS adt;
CREATE DATABASE adt;

CREATE TYPE AddressType AS (
    street VARCHAR(50),
    municipality VARCHAR(100)
);

CREATE TABLE users (
	id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
    address AddressType
);


INSERT INTO users VALUES ('pawan', ('ktm', 'ktm_mun'));