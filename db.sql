-- CREATE DATABASE car_service;

-- drop type and table in reverse order
DROP TYPE IF EXISTS AddressType;
DROP TYPE IF EXISTS LocationType;


DROP TABLE IF EXISTS rider;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS users;


CREATE TYPE AddressType AS (
    street VARCHAR(100),
    city VARCHAR(100),
    posta_code VARCHAR(10),
    country VARCHAR(60)
);


CREATE TYPE LocationType AS (
    latitude double precision,
    longitude double precision
);


CREATE TABLE users(
    name VARCHAR(100) NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(254) NOT NULL,
    address AddressType[],
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


INSERT INTO users(name, email, phone_number, password, address) 
VALUES ('John Doe', 'john@gmai.com', '123456789', '123456', '{}');


INSERT INTO users(name, email, phone_number, password, address) 
VALUES ('John Doe', 'john@gmai.com', '123456789', '123456', ARRAY[('street', 'city', 'posta_code', 'country')]::AddressType[]);


CREATE TABLE rider (
  is_verified BOOLEAN NOT NULL DEFAULT FALSE
) INHERITS (users);


-- 


CREATE TABLE customer (
  account_balance money DEFAULT 0
) INHERITS (users);

