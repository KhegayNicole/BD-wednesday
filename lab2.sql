CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the Airline_info table
CREATE TABLE Airline_info (
    airline_id SERIAL PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    info VARCHAR(50)
);

-- Create trigger for Airline_info
CREATE TRIGGER update_airline_info_timestamp
BEFORE UPDATE ON Airline_info
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Airport table
CREATE TABLE Airport (
    airport_id SERIAL PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger for Airport
CREATE TRIGGER update_airport_timestamp
BEFORE UPDATE ON Airport
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Baggage_check table
CREATE TABLE Baggage_check (
    baggage_check_id SERIAL PRIMARY KEY,
    check_result VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    booking_id INT NOT NULL,
    passenger_id INT NOT NULL
);

-- Create trigger for Baggage_check
CREATE TRIGGER update_baggage_check_timestamp
BEFORE UPDATE ON Baggage_check
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Baggage table
CREATE TABLE Baggage (
    baggage_id SERIAL PRIMARY KEY,
    weight_in_kg DECIMAL(4,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    booking_id INT NOT NULL
);

-- Create trigger for Baggage
CREATE TRIGGER update_baggage_timestamp
BEFORE UPDATE ON Baggage
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Boarding_pass table
CREATE TABLE Boarding_pass (
    boarding_pass_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    seat VARCHAR(50),
    boarding_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger for Boarding_pass
CREATE TRIGGER update_boarding_pass_timestamp
BEFORE UPDATE ON Boarding_pass
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Booking_flight table
CREATE TABLE Booking_flight (
    booking_flight_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger for Booking_flight
CREATE TRIGGER update_booking_flight_timestamp
BEFORE UPDATE ON Booking_flight
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Booking table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    booking_platform VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create trigger for Booking
CREATE TRIGGER update_booking_timestamp
BEFORE UPDATE ON Booking
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Flight table
CREATE TABLE Flight (
    flight_id SERIAL PRIMARY KEY,
    departure_report_time TIMESTAMP,
    arrival_report_time TIMESTAMP,
    arriving_gate VARCHAR(50),
    airline_id INT,
    act_departure_time TIMESTAMP,
    act_arrival_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger for Flight
CREATE TRIGGER update_flight_timestamp
BEFORE UPDATE ON Flight
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Passengers table
CREATE TABLE Passengers (
    passenger_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(50),
    country_of_citizenship VARCHAR(50),
    country_of_residence VARCHAR(50),
    passport_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger for Passengers
CREATE TRIGGER update_passengers_timestamp
BEFORE UPDATE ON Passengers
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Create the Security_check table
CREATE TABLE Security_check (
    security_check_id SERIAL PRIMARY KEY,
    check_result VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    passenger_id INT NOT NULL
);

-- Create trigger for Security_check
CREATE TRIGGER update_security_check_timestamp
BEFORE UPDATE ON Security_check
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();
ALTER  TABLE airline_info
DROP COLUMN airline_code;






ALTER TABLE Security_check
ADD CONSTRAINT fk_security_check_passenger
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id);

ALTER TABLE Booking
ADD CONSTRAINT fk_booking_passenger
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id);

ALTER TABLE Baggage_check
ADD CONSTRAINT fk_baggage_check_passenger
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id);

ALTER TABLE Baggage_check
ADD CONSTRAINT fk_baggage_check_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Baggage
ADD CONSTRAINT fk_baggage_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Boarding_pass
ADD CONSTRAINT fk_boarding_pass_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Booking_flight
ADD CONSTRAINT fk_booking_flight_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);


ALTER TABLE Booking_flight
ADD CONSTRAINT fk_booking_flight_flight
FOREIGN KEY (flight_id) REFERENCES Flight(flight_id);

ALTER TABLE Flight
ADD COLUMN departing_airport_id INT,
ADD COLUMN arriving_airport_id INT;

ALTER TABLE Flight
ADD CONSTRAINT fk_flight_departing_airport
FOREIGN KEY (departing_airport_id) REFERENCES Airport(airport_id);

ALTER TABLE Flight
ADD CONSTRAINT fk_flight_arriving_airport
FOREIGN KEY (arriving_airport_id) REFERENCES Airport(airport_id);


ALTER TABLE Flight
ADD CONSTRAINT fk_flight_airline
FOREIGN KEY (airline_id) REFERENCES Airline_info(airline_id);




