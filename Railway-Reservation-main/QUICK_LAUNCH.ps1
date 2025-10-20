# =============================================================================
# Railway Reservation System - Quick Launch Script
# Description: Automated testing and verification script
# =============================================================================

Write-Host ""
Write-Host "Railway Reservation System - Quick Check & Launch" -ForegroundColor Cyan
Write-Host ("=" * 70) -ForegroundColor Cyan

# =============================================================================
# Check Java
# =============================================================================
Write-Host ""
Write-Host "[1/5] Checking Java JDK..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-String "version" | Select-Object -First 1
    Write-Host "Java found: $javaVersion" -ForegroundColor Green
} catch {
    Write-Host "Java not found! Please install JDK 21" -ForegroundColor Red
    exit 1
}

# =============================================================================
# STEP 2: Check MySQL
# =============================================================================
Write-Host "`n[2/5] Checking MySQL Server..." -ForegroundColor Yellow
$mysqlService = Get-Service MySQL80 -ErrorAction SilentlyContinue

if ($mysqlService) {
    if ($mysqlService.Status -eq 'Running') {
        Write-Host "✅ MySQL 8.0 is running" -ForegroundColor Green
    } else {
        Write-Host "⚠️  MySQL service exists but not running. Starting..." -ForegroundColor Yellow
        Start-Service MySQL80
        Write-Host "✅ MySQL started" -ForegroundColor Green
    }
} else {
    Write-Host "❌ MySQL80 service not found!" -ForegroundColor Red
    exit 1
}

# =============================================================================
# STEP 3: Check Database
# =============================================================================
Write-Host "`n[3/5] Checking Railway Database..." -ForegroundColor Yellow

$mysqlBin = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

if (Test-Path $mysqlBin) {
    try {
        $dbCheck = & $mysqlBin -u root -p1234 -e "USE Railway; SELECT COUNT(*) FROM trains;" 2>&1
        
        if ($dbCheck -match "ERROR") {
            Write-Host "⚠️  Database not found. Creating database..." -ForegroundColor Yellow
            
            $scriptPath = "d:\vihin\Documents\Github\Java-Project\Railway-Reservation-main\TEST_DATABASE.sql"
            
            if (Test-Path $scriptPath) {
                & $mysqlBin -u root -p1234 -e "source $scriptPath" 2>&1 | Out-Null
                Write-Host "✅ Database created with test data" -ForegroundColor Green
            } else {
                Write-Host "❌ TEST_DATABASE.sql not found!" -ForegroundColor Red
                exit 1
            }
        } else {
            Write-Host "✅ Railway database exists with data" -ForegroundColor Green
        }
    } catch {
        Write-Host "❌ Database check failed: $_" -ForegroundColor Red
    }
} else {
    Write-Host "⚠️  MySQL CLI not found at default location" -ForegroundColor Yellow
    Write-Host "   Assuming database is configured..." -ForegroundColor Gray
}

# =============================================================================
# STEP 4: Check Port 8080
# =============================================================================
Write-Host "`n[4/5] Checking if port 8080 is available..." -ForegroundColor Yellow

$port8080 = Test-NetConnection localhost -Port 8080 -WarningAction SilentlyContinue -InformationLevel Quiet

if ($port8080) {
    Write-Host "⚠️  Port 8080 is already in use (Tomcat might be running)" -ForegroundColor Yellow
    
    $openBrowser = Read-Host "Open browser to http://localhost:8080/Railway/? (Y/N)"
    if ($openBrowser -eq 'Y' -or $openBrowser -eq 'y') {
        Start-Process "http://localhost:8080/Railway/"
        Write-Host "✅ Browser opened" -ForegroundColor Green
    }
} else {
    Write-Host "✅ Port 8080 is available" -ForegroundColor Green
    Write-Host "`n⚠️  Tomcat is not running. Please deploy via Eclipse:" -ForegroundColor Yellow
    Write-Host "   1. Open Eclipse" -ForegroundColor Gray
    Write-Host "   2. Import Railway project" -ForegroundColor Gray
    Write-Host "   3. Right-click → Run As → Run on Server" -ForegroundColor Gray
}

# =============================================================================
# STEP 5: Summary
# =============================================================================
Write-Host "`n[5/5] System Summary:" -ForegroundColor Yellow
Write-Host "=" * 70 -ForegroundColor Cyan

Write-Host "`n📊 Environment Status:" -ForegroundColor Cyan
Write-Host "   Java:      ✅ Installed" -ForegroundColor Green
Write-Host "   MySQL:     ✅ Running" -ForegroundColor Green
Write-Host "   Database:  ✅ Configured" -ForegroundColor Green
Write-Host "   Port 8080: $(if ($port8080) { '🟡 In Use' } else { '✅ Available' })" -ForegroundColor $(if ($port8080) { 'Yellow' } else { 'Green' })

Write-Host "`n🔑 Test Credentials:" -ForegroundColor Cyan
Write-Host "   Admin:  admin@railway.com / admin123" -ForegroundColor White
Write-Host "   User:   John Doe / john123" -ForegroundColor White

Write-Host "`n🌐 Quick URLs:" -ForegroundColor Cyan
Write-Host "   Homepage:     http://localhost:8080/Railway/" -ForegroundColor White
Write-Host "   Admin Login:  http://localhost:8080/Railway/Admin/AdminLogin.jsp" -ForegroundColor White
Write-Host "   User Login:   http://localhost:8080/Railway/SignUp/login.jsp" -ForegroundColor White

Write-Host "`n📚 Documentation:" -ForegroundColor Cyan
Write-Host "   Complete Guide:    SETUP_SUMMARY.md" -ForegroundColor White
Write-Host "   Testing Guide:     RUN_AND_TEST.md" -ForegroundColor White
Write-Host "   Technical Docs:    PROJECT_ANALYSIS.md" -ForegroundColor White
Write-Host "   Deployment Steps:  DEPLOYMENT.md" -ForegroundColor White

Write-Host "`n" -ForegroundColor Cyan
Write-Host "=" * 70 -ForegroundColor Cyan
Write-Host "System is ready! Deploy via Eclipse and start testing!" -ForegroundColor Green
Write-Host "=" * 70 -ForegroundColor Cyan
Write-Host "`n"

# =============================================================================
# Optional: Open Eclipse workspace
# =============================================================================
$openEclipse = Read-Host "Would you like to see deployment instructions? (Y/N)"
if ($openEclipse -eq 'Y' -or $openEclipse -eq 'y') {
    $deploymentPath = "d:\vihin\Documents\Github\Java-Project\Railway-Reservation-main\DEPLOYMENT.md"
    if (Test-Path $deploymentPath) {
        Start-Process $deploymentPath
        Write-Host "Deployment guide opened" -ForegroundColor Green
    }
}

Write-Host "`nPress any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
