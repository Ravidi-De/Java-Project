@echo off
echo === Railway Reservation Database Setup ===
echo.

REM Set MySQL path - update this if your MySQL is installed elsewhere
set MYSQL_PATH="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

REM Check if MySQL exists
if not exist %MYSQL_PATH% (
    echo ERROR: MySQL not found at %MYSQL_PATH%
    echo Please update MYSQL_PATH in this script or install MySQL
    pause
    exit /b 1
)

echo Found MySQL installation
echo.

echo Please enter your MySQL root password when prompted...
echo.

REM Execute the SQL setup script
%MYSQL_PATH% -u root -p < database-setup.sql

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✓ Database setup completed successfully!
    echo.
    echo Database 'Railway' created with:
    echo - Sample users (testuser/password123)
    echo - Sample admin (admin/admin123) 
    echo - Sample trains data
    echo - Empty reservations table
    echo.
    echo Next steps:
    echo 1. Run: java DatabaseConfigUpdater
    echo 2. Deploy to Tomcat
    echo 3. Access: http://localhost:8080/Railway/
) else (
    echo.
    echo ✗ Database setup failed!
    echo Please check:
    echo - MySQL root password is correct
    echo - MySQL service is running
    echo - No syntax errors in database-setup.sql
)

echo.
pause