# PowerShell script to set up Railway Reservation database
# Run this script to create database and tables

Write-Host "=== Railway Reservation Database Setup ===" -ForegroundColor Green
Write-Host ""

# MySQL executable path
$mysqlPath = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

# Check if MySQL is available
if (-not (Test-Path $mysqlPath)) {
    Write-Host "ERROR: MySQL not found at $mysqlPath" -ForegroundColor Red
    Write-Host "Please verify MySQL installation or update the path in this script." -ForegroundColor Yellow
    exit 1
}

Write-Host "Found MySQL at: $mysqlPath" -ForegroundColor Green

# Get MySQL password
Write-Host ""
$password = Read-Host "Enter MySQL root password" -AsSecureString
$plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

Write-Host ""
Write-Host "Setting up database..." -ForegroundColor Yellow

# Execute SQL file
try {
    Get-Content "database-setup.sql" | & $mysqlPath -u root -p$plainPassword
    Write-Host ""
    Write-Host "✓ Database setup completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Database 'Railway' has been created with sample data:" -ForegroundColor Cyan
    Write-Host "- Users table with test user (testuser/password123)" -ForegroundColor Cyan  
    Write-Host "- Admin table with admin user (admin/admin123)" -ForegroundColor Cyan
    Write-Host "- Trains table with sample train data" -ForegroundColor Cyan
    Write-Host "- Reservations table (empty, ready for bookings)" -ForegroundColor Cyan
} catch {
    Write-Host ""
    Write-Host "✗ Error setting up database:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting tips:" -ForegroundColor Yellow
    Write-Host "1. Verify MySQL root password is correct" -ForegroundColor Yellow
    Write-Host "2. Ensure MySQL service is running" -ForegroundColor Yellow
    Write-Host "3. Check if MySQL port 3306 is available" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Magenta
Write-Host "1. Update database credentials using: java DatabaseConfigUpdater" -ForegroundColor White
Write-Host "2. Compile and deploy the project to Tomcat" -ForegroundColor White
Write-Host "3. Access the application at: http://localhost:8080/Railway/" -ForegroundColor White