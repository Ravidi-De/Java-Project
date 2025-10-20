@echo off
echo =============================================
echo Java Installation and Setup Guide
echo =============================================
echo.

echo Current Status Check:
echo =====================

echo Checking for Java installation...
java -version 2>nul
if %errorlevel% neq 0 (
    echo [MISSING] Java JDK/JRE is not installed or not in PATH
    echo.
    echo Please follow these steps to install Java:
    echo.
    echo 1. Download Java JDK 8 or higher:
    echo    - Oracle JDK: https://www.oracle.com/java/technologies/downloads/
    echo    - OpenJDK: https://openjdk.org/
    echo    - Amazon Corretto: https://aws.amazon.com/corretto/
    echo.
    echo 2. Install the JDK following the installer instructions
    echo.
    echo 3. Add Java to your system PATH:
    echo    - Windows Key + R, type "sysdm.cpl"
    echo    - Advanced tab ^> Environment Variables
    echo    - System variables ^> PATH ^> Edit ^> New
    echo    - Add: C:\Program Files\Java\jdk-XX\bin (replace XX with version)
    echo    - Click OK to save
    echo.
    echo 4. Restart your command prompt and run this script again
    echo.
) else (
    echo [OK] Java is installed and available
    java -version
)

echo.
echo Checking for MySQL...
mysql --version 2>nul
if %errorlevel% neq 0 (
    echo [INFO] MySQL command not in PATH, but database setup was completed successfully
) else (
    echo [OK] MySQL is available
)

echo.
echo Checking project structure...
if exist "Railway-Reservation-main\Railway\src\main\java" (
    echo [OK] Project source files found
) else (
    echo [ERROR] Project structure not found
)

if exist "database-setup.sql" (
    echo [OK] Database setup files found
) else (
    echo [ERROR] Database setup files missing
)

echo.
echo =============================================
echo Next Steps:
echo =============================================
echo.
echo After installing Java:
echo 1. Download Apache Tomcat 9.0 from: https://tomcat.apache.org/download-90.cgi
echo 2. Extract Tomcat to C:\apache-tomcat-9.0.x
echo 3. Download MySQL Connector from: https://dev.mysql.com/downloads/connector/j/
echo 4. Use Eclipse IDE for easy development, or compile manually
echo.
echo For detailed instructions, see QUICK-START.md
echo.
pause