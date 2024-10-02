CREATE TABLE Passengers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    birth_date DATE
);

INSERT INTO Passengers (id, first_name, last_name, gender, birth_date) VALUES
(1, 'John', 'John', 'Male', '1995-05-10'),
(2, 'Jane', 'Doe', 'Female', '1988-12-15'),
(3, 'Alex', 'Alex', 'Male', '1992-07-22'),
(4, 'Mary', 'Smith', 'Female', '2001-03-30'),
(5, 'Robert', 'Brown', 'Male', '1999-08-19');


CREATE TABLE Bookings (
    id INT PRIMARY KEY,
    passenger_id INT,
    booking_price DECIMAL(10, 2),
    booking_date DATE,
    platform VARCHAR(50),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id)
);

INSERT INTO Bookings (id, passenger_id, booking_price, booking_date, platform) VALUES
(1, 1, 100.00, '2010-10-01', 'Website A'),
(2, 2, 150.00, '2010-11-15', 'Website B'),
(3, 3, 80.00, '2010-11-20', 'Website A'),
(4, 4, 200.00, '2010-12-11', 'Website C'),
(5, 5, 90.00, '2010-12-10', 'Website B');

CREATE TABLE Flights (
    id INT PRIMARY KEY,
    destination VARCHAR(100),
    flight_number VARCHAR(10)
);

INSERT INTO Flights (id, destination, flight_number) VALUES
(1, 'China', 'CN123'),
(2, 'USA', 'US456'),
(3, 'China', 'CN789'),
(4, 'Germany', 'DE101');


CREATE TABLE Airlines (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO Airlines (id, name, country) VALUES
(1, 'Air Kazakhstan', 'Kazakhstan'),
(2, 'Air USA', 'USA'),
(3, 'Kazakh Airways', 'Kazakhstan');

CREATE TABLE Baggage (
    id INT PRIMARY KEY,
    passenger_id INT,
    weight DECIMAL(5, 2),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id)
);

INSERT INTO Baggage (id, passenger_id, weight) VALUES
(1, 1, 30.00),
(2, 2, 15.00),
(3, 3, 28.00),
(4, 4, 32.00),
(5, 5, 20.00);


-- 1 таск

SELECT * FROM Passengers WHERE first_name = last_name;

-- 2
SELECT DISTINCT last_name FROM Passengers;

-- 3
SELECT * FROM Passengers
WHERE gender = 'Male' AND birth_date BETWEEN '1990-01-01' AND '2000-12-31';

-- 4
SELECT MONTH(booking_date) AS month, SUM(booking_price) AS total_price
FROM Bookings
GROUP BY MONTH(booking_date)
ORDER BY month;

-- 5
SELECT * FROM Flights WHERE destination = 'China';

-- 6

SELECT name FROM Airlines WHERE country = 'Kazakhstan';

-- 7

UPDATE Bookings
SET booking_price = booking_price * 0.9
WHERE booking_date < '2010-12-12';

-- 8

SELECT * FROM Baggage WHERE weight > 25.00 ORDER BY weight DESC LIMIT 3;

-- 9
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Passengers
ORDER BY birth_date DESC
LIMIT 1;

-- 10

SELECT platform, MIN(booking_price) AS cheapest_price
FROM Bookings
GROUP BY platform;
