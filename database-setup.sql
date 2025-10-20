-- Railway Reservation System Database Setup
-- Run this script in MySQL to create the required database and tables

-- Create database
CREATE DATABASE IF NOT EXISTS Railway;
USE Railway;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    uid INT AUTO_INCREMENT PRIMARY KEY,
    uname VARCHAR(50) NOT NULL UNIQUE,
    upassword VARCHAR(100) NOT NULL,
    uemail VARCHAR(100) NOT NULL UNIQUE,
    uPnum VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create admin table
CREATE TABLE IF NOT EXISTS admin (
    aid INT AUTO_INCREMENT PRIMARY KEY,
    anme VARCHAR(50) NOT NULL UNIQUE,
    apassword VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trains table
CREATE TABLE IF NOT EXISTS trains (
    tid INT AUTO_INCREMENT PRIMARY KEY,
    tname VARCHAR(100) NOT NULL,
    t_from VARCHAR(50) NOT NULL,
    t_to VARCHAR(50) NOT NULL,
    price VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create user_reservation table
CREATE TABLE IF NOT EXISTS user_reservation (
    rid INT AUTO_INCREMENT PRIMARY KEY,
    Rname VARCHAR(50) NOT NULL,
    Remail VARCHAR(100) NOT NULL,
    Rphone VARCHAR(15) NOT NULL,
    Rpax VARCHAR(10) NOT NULL,
    Rfrom VARCHAR(50) NOT NULL,
    Rto VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample admin user (password: admin123)
INSERT INTO admin (anme, apassword) VALUES ('admin', 'admin123')
ON DUPLICATE KEY UPDATE apassword = 'admin123';

-- Insert sample trains
INSERT INTO trains (tname, t_from, t_to, price) VALUES 
('Udarata Menike', 'Colombo Fort', 'Badulla', '1500'),
('Podi Menike', 'Colombo Fort', 'Badulla', '1200'),
('Intercity Express', 'Colombo Fort', 'Kandy', '800'),
('Ruhunu Kumari', 'Colombo Fort', 'Matara', '600'),
('Galu Kumari', 'Colombo Fort', 'Galle', '400'),
('Night Mail', 'Colombo Fort', 'Jaffna', '1800'),
('Rajarata Rajina', 'Colombo Fort', 'Anuradhapura', '1000'),
('Uttara Devi', 'Colombo Fort', 'Kankesanturai', '2000')
ON DUPLICATE KEY UPDATE tname = VALUES(tname);

-- Insert sample user (username: testuser, password: password123)
INSERT INTO users (uname, upassword, uemail, uPnum) VALUES 
('testuser', 'password123', 'test@email.com', '0771234567'),
('john_doe', 'john123', 'john@email.com', '0777654321'),
('jane_smith', 'jane123', 'jane@email.com', '0712345678')
ON DUPLICATE KEY UPDATE uname = VALUES(uname);

-- Insert sample reservations
INSERT INTO user_reservation (Rname, Remail, Rphone, Rpax, Rfrom, Rto) VALUES 
('Test User', 'test@email.com', '0771234567', '2', 'Colombo Fort', 'Kandy'),
('John Doe', 'john@email.com', '0777654321', '1', 'Colombo Fort', 'Galle')
ON DUPLICATE KEY UPDATE Rname = VALUES(Rname);

-- Show created tables
SHOW TABLES;

-- Display sample data
SELECT 'Users Table:' as Info;
SELECT * FROM users;

SELECT 'Admin Table:' as Info;
SELECT * FROM admin;

SELECT 'Trains Table:' as Info;
SELECT * FROM trains;

SELECT 'Reservations Table:' as Info;
SELECT * FROM user_reservation;