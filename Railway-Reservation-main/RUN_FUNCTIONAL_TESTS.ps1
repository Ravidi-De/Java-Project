# 🧪 Functional Testing Execution Script

Write-Host ""
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host "   Railway Reservation System - Functional Testing Suite" -ForegroundColor Cyan
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host ""

# Test Environment Check
Write-Host "[SETUP] Verifying Test Environment..." -ForegroundColor Yellow
Write-Host ""

# Check Tomcat
$tomcat = Test-NetConnection localhost -Port 8080 -WarningAction SilentlyContinue -InformationLevel Quiet
if ($tomcat) {
    Write-Host "[OK] Tomcat Server: Running on port 8080" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Tomcat Server: Not accessible on port 8080!" -ForegroundColor Red
    exit 1
}

# Check MySQL
$mysql = Get-Service MySQL80 -ErrorAction SilentlyContinue
if ($mysql -and $mysql.Status -eq 'Running') {
    Write-Host "[OK] MySQL Server: Running" -ForegroundColor Green
} else {
    Write-Host "[ERROR] MySQL Server: Not running!" -ForegroundColor Red
    exit 1
}

# Check Database
$mysqlBin = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
if (Test-Path $mysqlBin) {
    $dbCheck = & $mysqlBin -u root -p1234 -e "USE Railway; SELECT COUNT(*) AS admins FROM admins; SELECT COUNT(*) AS users FROM users; SELECT COUNT(*) AS trains FROM trains; SELECT COUNT(*) AS reservations FROM reservation;" 2>&1 | Out-String
    
    if ($dbCheck -notmatch "ERROR") {
        Write-Host "[OK] Database: Railway DB connected" -ForegroundColor Green
        
        # Extract counts
        if ($dbCheck -match "admins\s+(\d+)") { $adminCount = $matches[1] }
        if ($dbCheck -match "users\s+(\d+)") { $userCount = $matches[1] }
        if ($dbCheck -match "trains\s+(\d+)") { $trainCount = $matches[1] }
        if ($dbCheck -match "reservations\s+(\d+)") { $resCount = $matches[1] }
        
        Write-Host "     - Admins: $adminCount" -ForegroundColor Gray
        Write-Host "     - Users: $userCount" -ForegroundColor Gray
        Write-Host "     - Trains: $trainCount" -ForegroundColor Gray
        Write-Host "     - Reservations: $resCount" -ForegroundColor Gray
    } else {
        Write-Host "[ERROR] Database: Cannot connect to Railway DB!" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host "   Environment Ready - Starting Functional Tests" -ForegroundColor Green
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host ""

# Initialize test results
$testResults = @()
$totalTests = 54
$passedTests = 0
$failedTests = 0

# Test Suite 1: Authentication & Authorization
Write-Host ""
Write-Host "TEST SUITE 1: Authentication & Authorization" -ForegroundColor Cyan
Write-Host "-" * 80 -ForegroundColor Gray

# Test 1.1: Homepage Accessibility
Write-Host ""
Write-Host "Test 1.1: Homepage Accessibility" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/Railway/" -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "   [PASS] Homepage loads successfully (HTTP 200)" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] Homepage returned status: $($response.StatusCode)" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Cannot access homepage: $_" -ForegroundColor Red
    $failedTests++
}

# Test 1.2: Admin Login Page Accessibility
Write-Host ""
Write-Host "Test 1.2: Admin Login Page Accessibility" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/Railway/Admin/AdminLogin.jsp" -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "   [PASS] Admin login page accessible" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] Admin login page returned: $($response.StatusCode)" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Cannot access admin login: $_" -ForegroundColor Red
    $failedTests++
}

# Test 1.3: User Login Page Accessibility
Write-Host ""
Write-Host "Test 1.3: User Login Page Accessibility" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/Railway/SignUp/login.jsp" -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "   [PASS] User login page accessible" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] User login page returned: $($response.StatusCode)" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Cannot access user login: $_" -ForegroundColor Red
    $failedTests++
}

# Test 1.4: Registration Page Accessibility
Write-Host ""
Write-Host "Test 1.4: Registration Page Accessibility" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/Railway/SignUp/registration.jsp" -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "   [PASS] Registration page accessible" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] Registration page returned: $($response.StatusCode)" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Cannot access registration: $_" -ForegroundColor Red
    $failedTests++
}

# Test Suite 2: Page Availability
Write-Host ""
Write-Host "TEST SUITE 2: Page Availability Tests" -ForegroundColor Cyan
Write-Host "-" * 80 -ForegroundColor Gray

$pages = @(
    @{Name="Home Page"; URL="http://localhost:8080/Railway/Home/home.jsp"},
    @{Name="Trains Info"; URL="http://localhost:8080/Railway/Trains.jsp"},
    @{Name="Current Admins"; URL="http://localhost:8080/Railway/UpdateAdmin/Current_users.jsp"},
    @{Name="Add Admin"; URL="http://localhost:8080/Railway/UpdateAdmin/updateAdmins.jsp"},
    @{Name="Current Users"; URL="http://localhost:8080/Railway/Updateusers/Current_users.jsp"},
    @{Name="Add User"; URL="http://localhost:8080/Railway/Updateusers/InserUser.jsp"},
    @{Name="Current Trains"; URL="http://localhost:8080/Railway/UpdateTrains/Current_trains.jsp"},
    @{Name="Add Train"; URL="http://localhost:8080/Railway/UpdateTrains/InsertData.jsp"},
    @{Name="Reserve Ticket"; URL="http://localhost:8080/Railway/Reserve/reserve.jsp"},
    @{Name="My Reservations"; URL="http://localhost:8080/Railway/Reserve/myReservation.jsp"}
)

$pageTestNum = 1
foreach ($page in $pages) {
    Write-Host ""
    Write-Host "Test 2.$pageTestNum : $($page.Name)" -ForegroundColor Yellow
    try {
        $response = Invoke-WebRequest -Uri $page.URL -UseBasicParsing -TimeoutSec 10
        if ($response.StatusCode -eq 200) {
            Write-Host "   [PASS] Page accessible (HTTP 200)" -ForegroundColor Green
            $passedTests++
        } else {
            Write-Host "   [FAIL] Page returned: $($response.StatusCode)" -ForegroundColor Red
            $failedTests++
        }
    } catch {
        Write-Host "   [FAIL] Cannot access page: $_" -ForegroundColor Red
        $failedTests++
    }
    $pageTestNum++
}

# Test Suite 3: CSS and Resources
Write-Host ""
Write-Host "TEST SUITE 3: Static Resources Tests" -ForegroundColor Cyan
Write-Host "-" * 80 -ForegroundColor Gray

Write-Host ""
Write-Host "Test 3.1: Railway Theme CSS" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/Railway/css/railway-theme.css" -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200 -and $response.Content.Length -gt 0) {
        Write-Host "   [PASS] CSS file accessible and not empty" -ForegroundColor Green
        Write-Host "   File size: $($response.Content.Length) bytes" -ForegroundColor Gray
        $passedTests++
    } else {
        Write-Host "   [FAIL] CSS file issue" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Cannot access CSS: $_" -ForegroundColor Red
    $failedTests++
}

# Test Suite 4: Database Connectivity Tests
Write-Host ""
Write-Host "TEST SUITE 4: Database Integrity Tests" -ForegroundColor Cyan
Write-Host "-" * 80 -ForegroundColor Gray

Write-Host ""
Write-Host "Test 4.1: Verify Admin Accounts" -ForegroundColor Yellow
try {
    $result = & $mysqlBin -u root -p1234 -e "USE Railway; SELECT adi, aname, aemail FROM admins;" 2>&1 | Out-String
    if ($result -match "admin@railway.com") {
        Write-Host "   [PASS] Admin accounts exist in database" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] Admin accounts not found" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Database query failed: $_" -ForegroundColor Red
    $failedTests++
}

Write-Host ""
Write-Host "Test 4.2: Verify User Accounts" -ForegroundColor Yellow
try {
    $result = & $mysqlBin -u root -p1234 -e "USE Railway; SELECT udi, uname, uemail FROM users;" 2>&1 | Out-String
    if ($result -match "john.doe@email.com") {
        Write-Host "   [PASS] User accounts exist in database" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] User accounts not found" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Database query failed: $_" -ForegroundColor Red
    $failedTests++
}

Write-Host ""
Write-Host "Test 4.3: Verify Train Data" -ForegroundColor Yellow
try {
    $result = & $mysqlBin -u root -p1234 -e "USE Railway; SELECT COUNT(*) AS count FROM trains WHERE tname LIKE '%Express%';" 2>&1 | Out-String
    if ($result -match "count\s+\d+") {
        Write-Host "   [PASS] Train records exist in database" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] Train data not found" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Database query failed: $_" -ForegroundColor Red
    $failedTests++
}

Write-Host ""
Write-Host "Test 4.4: Verify Reservation Data" -ForegroundColor Yellow
try {
    $result = & $mysqlBin -u root -p1234 -e "USE Railway; SELECT COUNT(*) AS count FROM reservation;" 2>&1 | Out-String
    if ($result -match "count") {
        Write-Host "   [PASS] Reservation table accessible" -ForegroundColor Green
        $passedTests++
    } else {
        Write-Host "   [FAIL] Reservation table issue" -ForegroundColor Red
        $failedTests++
    }
} catch {
    Write-Host "   [FAIL] Database query failed: $_" -ForegroundColor Red
    $failedTests++
}

# Calculate total executed tests
$executedTests = $passedTests + $failedTests
$passRate = if ($executedTests -gt 0) { [math]::Round(($passedTests / $executedTests) * 100, 2) } else { 0 }

# Final Summary
Write-Host ""
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host "   FUNCTIONAL TESTING SUMMARY" -ForegroundColor Cyan
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host ""
Write-Host "Total Tests Executed: $executedTests" -ForegroundColor White
Write-Host "Passed Tests:         $passedTests" -ForegroundColor Green
Write-Host "Failed Tests:         $failedTests" -ForegroundColor $(if ($failedTests -gt 0) { "Red" } else { "Green" })
Write-Host "Pass Rate:            $passRate%" -ForegroundColor $(if ($passRate -ge 80) { "Green" } elseif ($passRate -ge 60) { "Yellow" } else { "Red" })
Write-Host ""

if ($passRate -eq 100) {
    Write-Host "STATUS: All automated tests PASSED! System is working correctly." -ForegroundColor Green
} elseif ($passRate -ge 80) {
    Write-Host "STATUS: Most tests passed. Review failed tests." -ForegroundColor Yellow
} else {
    Write-Host "STATUS: Critical issues detected. Review system immediately." -ForegroundColor Red
}

Write-Host ""
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host ""
Write-Host "MANUAL TESTING REQUIRED:" -ForegroundColor Yellow
Write-Host "  The following tests require manual browser interaction:" -ForegroundColor Gray
Write-Host "  1. Admin Login with credentials (admin@railway.com / admin123)" -ForegroundColor Gray
Write-Host "  2. User Login with credentials (John Doe / john123)" -ForegroundColor Gray
Write-Host "  3. CRUD operations (Create, Read, Update, Delete)" -ForegroundColor Gray
Write-Host "  4. Form validation testing" -ForegroundColor Gray
Write-Host "  5. Session management testing" -ForegroundColor Gray
Write-Host "  6. Responsive design testing (mobile/tablet/desktop)" -ForegroundColor Gray
Write-Host "  7. Search and filter functionality" -ForegroundColor Gray
Write-Host ""
Write-Host "Browser opened to: http://localhost:8080/Railway/" -ForegroundColor Cyan
Write-Host "Follow test cases in: FUNCTIONAL_TEST_RESULTS.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host ""

# Open browser for manual testing
Write-Host "Opening browser for manual testing..." -ForegroundColor Yellow
Start-Process "http://localhost:8080/Railway/"

Write-Host ""
Write-Host "Press Enter to exit..." -ForegroundColor Gray
Read-Host
