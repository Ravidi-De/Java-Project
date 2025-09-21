# Railway Reservation System - Setup Instructions

## Prerequisites

### 1. Install Java Development Kit (JDK)
- Download JDK 19+ from Oracle or OpenJDK
- Install and set JAVA_HOME environment variable
- Add Java to system PATH

### 2. Install MySQL Database
- Download MySQL Community Server from: https://dev.mysql.com/downloads/mysql/
- Install MySQL Server with root password
- Install MySQL Workbench (optional but recommended)

### 3. Install Apache Tomcat
- Download Tomcat 9.0 from: https://tomcat.apache.org/download-90.cgi
- Extract to a folder (e.g., C:\apache-tomcat-9.0.x)
- Set CATALINA_HOME environment variable

## Database Setup

### Create Database and Tables

```sql
-- Create database
CREATE DATABASE Railway;
USE Railway;

-- Create users table
CREATE TABLE users (
    uid INT AUTO_INCREMENT PRIMARY KEY,
    uname VARCHAR(50) NOT NULL,
    upassword VARCHAR(100) NOT NULL,
    uemail VARCHAR(100) NOT NULL,
    uPnum VARCHAR(15) NOT NULL
);

-- Create admin table
CREATE TABLE admin (
    aid INT AUTO_INCREMENT PRIMARY KEY,
    anme VARCHAR(50) NOT NULL,
    apassword VARCHAR(100) NOT NULL
);

-- Create trains table
CREATE TABLE trains (
    tid INT AUTO_INCREMENT PRIMARY KEY,
    tname VARCHAR(100) NOT NULL,
    t_from VARCHAR(50) NOT NULL,
    t_to VARCHAR(50) NOT NULL,
    price VARCHAR(20) NOT NULL
);

-- Create user_reservation table
CREATE TABLE user_reservation (
    rid INT AUTO_INCREMENT PRIMARY KEY,
    Rname VARCHAR(50) NOT NULL,
    Remail VARCHAR(100) NOT NULL,
    Rphone VARCHAR(15) NOT NULL,
    Rpax VARCHAR(10) NOT NULL,
    Rfrom VARCHAR(50) NOT NULL,
    Rto VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample admin user
INSERT INTO admin (anme, apassword) VALUES ('admin', 'admin123');

-- Insert sample trains
INSERT INTO trains (tname, t_from, t_to, price) VALUES 
('Udarata Menike', 'Colombo Fort', 'Badulla', '1500'),
('Podi Menike', 'Colombo Fort', 'Badulla', '1200'),
('Intercity Express', 'Colombo Fort', 'Kandy', '800'),
('Ruhunu Kumari', 'Colombo Fort', 'Matara', '600'),
('Galu Kumari', 'Colombo Fort', 'Galle', '400');

-- Insert sample user
INSERT INTO users (uname, upassword, uemail, uPnum) VALUES 
('testuser', 'password123', 'test@email.com', '0771234567');
```

## Project Configuration

### Update Database Credentials
You need to update the database connection details in all DbConnection.java files to match your MySQL setup:

Current credentials in code:
- URL: jdbc:mysql://localhost:3306/Railway
- Username: root
- Password: Sachin-123

Update these to your MySQL credentials.

## Running the Project

### 1. Using Eclipse IDE
1. Import the project into Eclipse
2. Configure Tomcat server in Eclipse
3. Add project to server
4. Start server and run

### 2. Manual Deployment
1. Build the project (compile Java files)
2. Copy WAR file to Tomcat webapps directory
3. Start Tomcat server
4. Access http://localhost:8080/Railway

## Accessing the Application

- **Home Page**: http://localhost:8080/Railway
- **User Login**: Click "Reserva Now" from home page
- **Admin Login**: Use admin credentials from login page

### Default Credentials
- **User**: testuser / password123
- **Admin**: admin / admin123

## Troubleshooting

1. **Database Connection Issues**: Verify MySQL is running and credentials are correct
2. **Server Issues**: Check Tomcat logs for errors
3. **Compilation Issues**: Ensure all required JAR files are in classpath
4. **Port Conflicts**: Change Tomcat port if 8080 is in use