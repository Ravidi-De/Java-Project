-- ============================================================================
-- RAILWAY RESERVATION SYSTEM - DATABASE SETUP & TEST DATA
-- Created: October 20, 2025
-- Description: Complete database setup with test data for testing
-- ============================================================================

-- Drop database if exists (CAUTION: This will delete all existing data)
DROP DATABASE IF EXISTS Railway;

-- Create fresh database
CREATE DATABASE Railway;
USE Railway;

-- ============================================================================
-- TABLE CREATION
-- ============================================================================

-- 1. USERS TABLE
-- Stores registered user accounts
CREATE TABLE users (
    udi INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(100) NOT NULL,
    uemail VARCHAR(255) NOT NULL UNIQUE,
    upassword VARCHAR(100) NOT NULL,
    upnum VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. ADMINS TABLE
-- Stores administrator accounts
CREATE TABLE admins (
    adi INT PRIMARY KEY,
    aname VARCHAR(100) NOT NULL,
    apassword VARCHAR(100) NOT NULL,
    aemail VARCHAR(255) NOT NULL UNIQUE,
    apnum VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. TRAINS TABLE
-- Stores train information and routes
CREATE TABLE trains (
    tid INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(100) NOT NULL,
    t_from VARCHAR(100) NOT NULL,
    t_to VARCHAR(100) NOT NULL,
    price VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. RESERVATION TABLE
-- Stores booking/reservation data
CREATE TABLE reservation (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(10),
    n_of_pax VARCHAR(10),
    f_rom VARCHAR(100),
    t_o VARCHAR(100),
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'CONFIRMED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TEST DATA INSERTION
-- ============================================================================

-- INSERT ADMIN ACCOUNTS (For testing admin panel)
INSERT INTO admins (adi, aname, apassword, aemail, apnum) VALUES
(1, 'Super Admin', 'admin123', 'admin@railway.com', '0771234567'),
(2, 'System Admin', 'sysadmin', 'system@railway.com', '0772345678'),
(3, 'Manager Admin', 'manager123', 'manager@railway.com', '0773456789'),
(4, 'Support Admin', 'support123', 'support@railway.com', '0774567890');

-- INSERT TEST USERS (For testing user login and booking)
INSERT INTO users (uname, uemail, upassword, upnum) VALUES
('John Doe', 'john.doe@email.com', 'john123', '0771111111'),
('Jane Smith', 'jane.smith@email.com', 'jane123', '0772222222'),
('Mike Johnson', 'mike.j@email.com', 'mike123', '0773333333'),
('Sarah Williams', 'sarah.w@email.com', 'sarah123', '0774444444'),
('David Brown', 'david.b@email.com', 'david123', '0775555555');

-- INSERT TRAINS (Sample train routes)
INSERT INTO trains (tname, t_from, t_to, price) VALUES
-- Main Express Routes
('Colombo Express', 'Colombo Fort', 'Kandy', '500'),
('Kandy Intercity', 'Kandy', 'Colombo Fort', '500'),
('Galle Express', 'Colombo Fort', 'Galle', '350'),
('Jaffna Intercity', 'Colombo Fort', 'Jaffna', '1200'),
('Batticaloa Express', 'Colombo Fort', 'Batticaloa', '800'),

-- Local Trains
('Coastal Local', 'Colombo Fort', 'Galle', '150'),
('Matara Local', 'Galle', 'Matara', '100'),
('Badulla Local', 'Kandy', 'Badulla', '250'),
('Anuradhapura Local', 'Colombo Fort', 'Anuradhapura', '400'),
('Trincomalee Local', 'Colombo Fort', 'Trincomalee', '700'),

-- Special Services
('Rajarata Rajini', 'Colombo Fort', 'Anuradhapura', '600'),
('Udarata Menike', 'Colombo Fort', 'Badulla', '900'),
('Ruhunu Kumari', 'Colombo Fort', 'Matara', '450'),
('Yal Devi', 'Colombo Fort', 'Jaffna', '1500'),
('Udaya Devi', 'Colombo Fort', 'Badulla', '850'),

-- Night Mail
('Night Mail', 'Colombo Fort', 'Jaffna', '1100'),
('Southern Night Mail', 'Colombo Fort', 'Matara', '400'),

-- Luxury Trains
('First Class Express', 'Colombo Fort', 'Kandy', '800'),
('Premium Intercity', 'Kandy', 'Ella', '600'),
('Scenic Route Express', 'Nanu Oya', 'Ella', '300');

-- INSERT SAMPLE RESERVATIONS (For testing reservation management)
INSERT INTO reservation (name, email, phone, n_of_pax, f_rom, t_o, status) VALUES
('John Doe', 'john.doe@email.com', '0771111111', '2', 'Colombo Fort', 'Kandy', 'CONFIRMED'),
('Jane Smith', 'jane.smith@email.com', '0772222222', '1', 'Colombo Fort', 'Galle', 'CONFIRMED'),
('Mike Johnson', 'mike.j@email.com', '0773333333', '4', 'Kandy', 'Badulla', 'CONFIRMED'),
('Sarah Williams', 'sarah.w@email.com', '0774444444', '3', 'Colombo Fort', 'Jaffna', 'CONFIRMED'),
('David Brown', 'david.b@email.com', '0775555555', '2', 'Galle', 'Matara', 'CONFIRMED');

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Verify data insertion
SELECT '=== ADMINS ===' AS '';
SELECT adi, aname, aemail, apnum FROM admins;

SELECT '=== USERS ===' AS '';
SELECT udi, uname, uemail, upnum FROM users;

SELECT '=== TRAINS ===' AS '';
SELECT tid, tname, t_from, t_to, price FROM trains;

SELECT '=== RESERVATIONS ===' AS '';
SELECT res_id, name, email, f_rom, t_o, n_of_pax, status FROM reservation;

-- Count records
SELECT '=== SUMMARY ===' AS '';
SELECT 
    (SELECT COUNT(*) FROM admins) AS total_admins,
    (SELECT COUNT(*) FROM users) AS total_users,
    (SELECT COUNT(*) FROM trains) AS total_trains,
    (SELECT COUNT(*) FROM reservation) AS total_reservations;

-- ============================================================================
-- USEFUL QUERIES FOR TESTING
-- ============================================================================

-- Test admin login
-- SELECT * FROM admins WHERE aname='Super Admin' AND apassword='admin123';

-- Test user login
-- SELECT * FROM users WHERE uname='John Doe' AND upassword='john123';

-- Get available trains
-- SELECT * FROM trains ORDER BY tname;

-- Get user reservations
-- SELECT * FROM reservation WHERE name='John Doe';

-- Update train price
-- UPDATE trains SET price='550' WHERE tid=1;

-- Delete reservation
-- DELETE FROM reservation WHERE res_id=1;

COMMIT;

-- ============================================================================
-- TEST CREDENTIALS
-- ============================================================================
-- 
-- ADMIN LOGIN:
-- Email: admin@railway.com
-- Password: admin123
--
-- USER LOGIN:
-- Email: john.doe@email.com
-- Password: john123
--
-- ============================================================================
