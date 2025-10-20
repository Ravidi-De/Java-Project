@echo off
echo ================================
echo Railway Reservation System Setup
echo ================================
echo.

echo Step 1: Checking Java Installation...
java -version 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Java is not installed or not in PATH
    echo Please install JDK 8+ and add to PATH
    echo Download from: https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
) else (
    echo [OK] Java is installed
)

echo.
echo Step 2: Checking MySQL Installation...
mysql --version 2>nul
if %errorlevel% neq 0 (
    echo [WARNING] MySQL command not found in PATH
    echo Please install MySQL Server and MySQL Command Line Client
    echo Download from: https://dev.mysql.com/downloads/mysql/
    echo After installation, add MySQL bin directory to PATH
) else (
    echo [OK] MySQL is available
)

echo.
echo Step 3: Project Directory Structure
if exist "Railway-Reservation-main\Railway" (
    echo [OK] Project structure found
    cd Railway-Reservation-main\Railway
) else (
    echo [ERROR] Railway project directory not found
    echo Please ensure you're running this from the correct directory
    pause
    exit /b 1
)

echo.
echo Step 4: Checking for required directories
if not exist "build" mkdir build
if not exist "build\classes" mkdir build\classes
echo [OK] Build directories created

echo.
echo ================================
echo Setup Instructions:
echo ================================
echo.
echo 1. Install Java JDK 8+ if not already installed
echo 2. Install MySQL Server and set root password
echo 3. Install Apache Tomcat 9.0
echo 4. Run the database-setup.sql script in MySQL:
echo    mysql -u root -p < database-setup.sql
echo 5. Update database credentials in DbConnection.java files
echo 6. Compile and deploy to Tomcat
echo.
echo For detailed instructions, see setup-instructions.md
echo.
pause