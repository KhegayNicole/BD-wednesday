CREATE DATABASE LAB1;
CREATE TABLE Airline_info (
    airline_id SERIAL PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    info VARCHAR(50)
);

CREATE TABLE Airport (
    airport_id SERIAL PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Baggage_check (
    baggage_check_id SERIAL PRIMARY KEY,
    check_result VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    booking_id INT NOT NULL,
    passenger_id INT NOT NULL
);

CREATE TABLE Baggage (
    baggage_id SERIAL PRIMARY KEY,
    weight_in_kg DECIMAL(4,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    booking_id INT NOT NULL
);

CREATE TABLE Boarding_pass (
    boarding_pass_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    seat VARCHAR(50),
    boarding_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Booking_flight (
    booking_flight_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Booking
(
    booking_id       SERIAL PRIMARY KEY,
    flight_id        INT NOT NULL,
    passenger_id     INT NOT NULL,
    booking_platform VARCHAR(50),
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)











CREATE TABLE Airline_info (
    airline_id INT PRIMARY KEY, -- Primary Key
    airline_code VARCHAR(30) NOT NULL, -- NOT NULL Constraint
    airline_name VARCHAR(50) NOT NULL, -- NOT NULL Constraint
    airline_country VARCHAR(50) NOT NULL, -- NOT NULL Constraint
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- NULL by default
    info VARCHAR(50) -- NULL by default
);

CREATE TABLE Airport (
    airport_id INT PRIMARY KEY, -- Primary Key
    airport_name VARCHAR(50) NOT NULL, -- NOT NULL Constraint
    country VARCHAR(50) NOT NULL, -- NOT NULL Constraint
    state VARCHAR(50), -- NULL by default
    city VARCHAR(50), -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- NULL by default
);

CREATE TABLE Baggage_check (
    baggage_check_id INT PRIMARY KEY, -- Primary Key
    check_result VARCHAR(50), -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- NULL by default
    booking_id INT NOT NULL, -- NOT NULL Constraint
    passenger_id INT NOT NULL -- NOT NULL Constraint
);

CREATE TABLE Baggage (
    baggage_id INT PRIMARY KEY, -- Primary Key
    weight_in_kg DECIMAL(4,2), -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- NULL by default
    booking_id INT NOT NULL -- NOT NULL Constraint
);

CREATE TABLE Boarding_pass (
    boarding_pass_id INT PRIMARY KEY, -- Primary Key
    booking_id INT NOT NULL, -- NOT NULL Constraint
    seat VARCHAR(50), -- NULL by default
    boarding_time TIMESTAMP, -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- NULL by default
);

CREATE TABLE Booking_flight (
    booking_flight_id INT PRIMARY KEY, -- Primary Key
    booking_id INT NOT NULL, -- NOT NULL Constraint
    flight_id INT NOT NULL, -- NOT NULL Constraint
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- NULL by default
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY, -- Primary Key
    flight_id INT NOT NULL, -- NOT NULL Constraint
    passenger_id INT NOT NULL, -- NOT NULL Constraint
    booking_platform VARCHAR(50), -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- NULL by default
    status VARCHAR(50), -- NULL by default
    price DECIMAL(10,2) -- NULL by default
);

CREATE TABLE Flight (
    flight_id INT PRIMARY KEY, -- Primary Key
    departure_report_time TIMESTAMP, -- NULL by default
    arrival_report_time TIMESTAMP, -- NULL by default
    arriving_gate VARCHAR(50), -- NULL by default
    airline_id INT, -- NULL by default
    act_departure_time TIMESTAMP, -- NULL by default
    act_arrival_time TIMESTAMP, -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- NULL by default
);

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY, -- Primary Key
    first_name VARCHAR(50) NOT NULL, -- NOT NULL Constraint
    last_name VARCHAR(50) NOT NULL, -- NOT NULL Constraint
    date_of_birth DATE, -- NULL by default
    gender VARCHAR(50), -- NULL by default
    country_of_citizenship VARCHAR(50), -- NULL by default
    country_of_residence VARCHAR(50), -- NULL by default
    passport_number VARCHAR(20), -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- NULL by default
);

CREATE TABLE Security_check (
    security_check_id INT PRIMARY KEY, -- Primary Key
    check_result VARCHAR(20), -- NULL by default
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- NULL by default
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- NULL by default
    passenger_id INT NOT NULL -- NOT NULL Constraint
);
