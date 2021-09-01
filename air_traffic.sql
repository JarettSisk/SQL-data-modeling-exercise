-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;

CREATE TABLE airlines
(
    id SERIAL PRIMARY KEY,
    airline TEXT NOT NULL
);

CREATE TABLE cities
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL
);

CREATE TABLE countries
(
    id SERIAL PRIMARY KEY,
    country TEXT NOT NULL
);

CREATE TABLE flights
(
    id SERIAL PRIMARY KEY,
    airline_id INT REFERENCES airlines NOT NULL,
    departure_date DATE NOT NULL,
    arrival_date DATE NOT NULL,
    seat TEXT NOT NULL,
    departure_city_id INT REFERENCES cities NOT NULL,
    arrival_city_id INT REFERENCES cities NOT NULL,
    departure_country_id INT REFERENCES countries NOT NULL,
    arrival_country_id INT REFERENCES countries NOT NULL
);

CREATE TABLE tickets
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    flight_id INT REFERENCES flights NOT NULL
);

INSERT INTO airlines
  (airline)
  VALUES
  ('United'),
  ('Delta'),
  ('American Airlines'),
  ('British Airways');

INSERT INTO cities
(city)
VALUES
('Washington DC'),
('Seattle'),
('Tokyo'),
('Los Angeles'),
('New York');

INSERT INTO countries
(country)
VALUES
('US'),
('Japan'),
('London'),
('Mexico');

INSERT INTO flights
(airline_id, departure_date, arrival_date, seat, departure_city_id, arrival_city_id, departure_country_id, arrival_country_id)
VALUES
(1, '2021-05-10', '2021-05-11', '32b', 1, 2, 1, 1),
(1, '2021-06-15', '2021-06-15', '41c', 2, 3, 1, 2);

INSERT INTO tickets
(first_name, last_name, flight_id)
VALUES
('John', 'Smith', 1),
('Jenny', 'Finch', 2);