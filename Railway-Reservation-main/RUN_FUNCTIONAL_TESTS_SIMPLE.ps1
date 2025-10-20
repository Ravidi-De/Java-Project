# Railway Reservation System - Functional Testing (Simplified)

Write-Host ""
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host "   Railway Reservation System - Functional Testing Suite" -ForegroundColor Cyan
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host ""

# Test counters
$passed = 0
$failed = 0

# Environment Checks
Write-Host "[SETUP] Verifying Test Environment..." -ForegroundColor Yellow
Write-Host ""

# Check Tomcat
$tomcat = Test-NetConnection localhost -Port 8080 -WarningAction SilentlyContinue -InformationLevel Quiet
if ($tomcat) {
    Write-Host "[OK] Tomcat Server: Running on port 8080" -ForegroundColor Green
    $passed++
} else {
    Write-Host "[ERROR] Tomcat Server: Not accessible!" -ForegroundColor Red
    $failed++
    exit 1
}

# Check MySQL
$mysql = Get-Service MySQL80 -ErrorAction SilentlyContinue
if ($mysql -and $mysql.Status -eq 'Running') {
    Write-Host "[OK] MySQL Server: Running" -ForegroundColor Green
    $passed++
} else {
    Write-Host "[ERROR] MySQL Server: Not running!" -ForegroundColor Red
    $failed++
}

Write-Host ""
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host "   Starting Functional Tests" -ForegroundColor Green
Write-Host ("=" * 80) -ForegroundColor Cyan

# TEST SUITE 1: Page Accessibility
Write-Host ""
Write-Host "TEST SUITE 1: Page Accessibility" -ForegroundColor Cyan
Write-Host ("-" * 80) -ForegroundColor Gray

$testPages = @(
    @{Name="Homepage"; URL="http://localhost:8080/Railway/"},
    @{Name="Admin Login"; URL="http://localhost:8080/Railway/Admin/AdminLogin.jsp"},
    @{Name="User Login"; URL="http://localhost:8080/Railway/SignUp/login.jsp"},
    @{Name="Registration"; URL="http://localhost:8080/Railway/SignUp/registration.jsp"},
    @{Name="Home Page"; URL="http://localhost:8080/Railway/Home/home.jsp"},
    @{Name="Trains Info"; URL="http://localhost:8080/Railway/Trains.jsp"},
    @{Name="Admin Dashboard"; URL="http://localhost:8080/Railway/Admin/admin.jsp"},
    @{Name="Current Admins"; URL="http://localhost:8080/Railway/UpdateAdmin/Current_users.jsp"},
    @{Name="Add Admin"; URL="http://localhost:8080/Railway/UpdateAdmin/updateAdmins.jsp"},
    @{Name="Current Users"; URL="http://localhost:8080/Railway/Updateusers/Current_users.jsp"},
    @{Name="Add User"; URL="http://localhost:8080/Railway/Updateusers/InserUser.jsp"},
    @{Name="Current Trains"; URL="http://localhost:8080/Railway/UpdateTrains/Current_trains.jsp"},
    @{Name="Add Train"; URL="http://localhost:8080/Railway/UpdateTrains/InsertData.jsp"},
    @{Name="Reserve Ticket"; URL="http://localhost:8080/Railway/Reserve/reserve.jsp"},
    @{Name="My Reservations"; URL="http://localhost:8080/Railway/Reserve/myReservation.jsp"}
)

$testNum = 1
foreach ($page in $testPages) {
    Write-Host ""
    Write-Host "Test 1.$testNum : $($page.Name)" -ForegroundColor Yellow
    try {
        $response = Invoke-WebRequest -Uri $page.URL -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            Write-Host "   [PASS] HTTP 200 - Page accessible" -ForegroundColor Green
            $passed++
        } else {
            Write-Host "   [FAIL] HTTP $($response.StatusCode)" -ForegroundColor Red
            $failed++
        }
    } catch {
        Write-Host "   [FAIL] Cannot access page" -ForegroundColor Red
        $failed++
    }
    $testNum++
}

# TEST SUITE 2: Static Resources
Write-Host ""
Write-Host "TEST SUITE 2: Static Resources" -ForegroundColor Cyan
Write-Host ("-" * 80) -ForegroundColor Gray

Write-Host ""
Write-Host "Test 2.1: Railway Theme CSS" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/Railway/css/railway-theme.css" -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
    if ($response.StatusCode -eq 200 -and $response.Content.Length -gt 1000) {
        Write-Host "   [PASS] CSS loaded ($($response.Content.Length) bytes)" -ForegroundColor Green
        $passed++
    } else {
        Write-Host "   [FAIL] CSS file too small or missing" -ForegroundColor Red
        $failed++
    }
} catch {
    Write-Host "   [FAIL] Cannot load CSS" -ForegroundColor Red
    $failed++
}

# TEST SUITE 3: Database Tests
Write-Host ""
Write-Host "TEST SUITE 3: Database Integrity" -ForegroundColor Cyan
Write-Host ("-" * 80) -ForegroundColor Gray

$mysqlPath = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

Write-Host ""
Write-Host "Test 3.1: Admin Accounts in Database" -ForegroundColor Yellow
try {
    $result = & $mysqlPath -u root -p1234 --skip-column-names -e "USE Railway; SELECT COUNT(*) FROM admins;" 2>$null
    if ($result -ge 4) {
        Write-Host "   [PASS] Found $result admin accounts" -ForegroundColor Green
        $passed++
    } else {
        Write-Host "   [FAIL] Expected 4 admins, found $result" -ForegroundColor Red
        $failed++
    }
} catch {
    Write-Host "   [WARN] Cannot query database directly" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Test 3.2: User Accounts in Database" -ForegroundColor Yellow
try {
    $result = & $mysqlPath -u root -p1234 --skip-column-names -e "USE Railway; SELECT COUNT(*) FROM users;" 2>$null
    if ($result -ge 5) {
        Write-Host "   [PASS] Found $result user accounts" -ForegroundColor Green
        $passed++
    } else {
        Write-Host "   [FAIL] Expected 5 users, found $result" -ForegroundColor Red
        $failed++
    }
} catch {
    Write-Host "   [WARN] Cannot query database directly" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Test 3.3: Train Records in Database" -ForegroundColor Yellow
try {
    $result = & $mysqlPath -u root -p1234 --skip-column-names -e "USE Railway; SELECT COUNT(*) FROM trains;" 2>$null
    if ($result -ge 20) {
        Write-Host "   [PASS] Found $result train records" -ForegroundColor Green
        $passed++
    } else {
        Write-Host "   [FAIL] Expected 20 trains, found $result" -ForegroundColor Red
        $failed++
    }
} catch {
    Write-Host "   [WARN] Cannot query database directly" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Test 3.4: Reservation Table Exists" -ForegroundColor Yellow
try {
    $result = & $mysqlPath -u root -p1234 --skip-column-names -e "USE Railway; SHOW TABLES LIKE 'reservation';" 2>$null
    if ($result -match "reservation") {
        Write-Host "   [PASS] Reservation table exists" -ForegroundColor Green
        $passed++
    } else {
        Write-Host "   [FAIL] Reservation table not found" -ForegroundColor Red
        $failed++
    }
} catch {
    Write-Host "   [WARN] Cannot query database directly" -ForegroundColor Yellow
}

# Calculate results
$total = $passed + $failed
$passRate = if ($total -gt 0) { [math]::Round(($passed / $total) * 100, 2) } else { 0 }

# Summary
Write-Host ""
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host "   AUTOMATED TEST RESULTS" -ForegroundColor Cyan
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host ""
Write-Host "Total Tests:    $total" -ForegroundColor White
Write-Host "Passed:         $passed" -ForegroundColor Green
Write-Host "Failed:         $failed" -ForegroundColor $(if ($failed -gt 0) { "Red" } else { "Green" })
Write-Host "Pass Rate:      $passRate%" -ForegroundColor $(if ($passRate -ge 90) { "Green" } elseif ($passRate -ge 70) { "Yellow" } else { "Red" })
Write-Host ""

if ($passRate -eq 100) {
    Write-Host "STATUS: ALL AUTOMATED TESTS PASSED!" -ForegroundColor Green
    Write-Host ""
} elseif ($passRate -ge 80) {
    Write-Host "STATUS: Most tests passed. Review failures above." -ForegroundColor Yellow
    Write-Host ""
} else {
    Write-Host "STATUS: Critical issues detected!" -ForegroundColor Red
    Write-Host ""
}

Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host "   MANUAL TESTING REQUIRED" -ForegroundColor Yellow
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host ""
Write-Host "The following tests require manual browser interaction:" -ForegroundColor White
Write-Host ""
Write-Host "1. Admin Login Test:" -ForegroundColor Cyan
Write-Host "   - URL: http://localhost:8080/Railway/Admin/AdminLogin.jsp" -ForegroundColor Gray
Write-Host "   - Email: admin@railway.com" -ForegroundColor Gray
Write-Host "   - Password: admin123" -ForegroundColor Gray
Write-Host ""
Write-Host "2. User Login Test:" -ForegroundColor Cyan
Write-Host "   - URL: http://localhost:8080/Railway/SignUp/login.jsp" -ForegroundColor Gray
Write-Host "   - Username: John Doe" -ForegroundColor Gray
Write-Host "   - Password: john123" -ForegroundColor Gray
Write-Host ""
Write-Host "3. CRUD Operations:" -ForegroundColor Cyan
Write-Host "   - Test adding/editing/deleting admins" -ForegroundColor Gray
Write-Host "   - Test adding/editing/deleting users" -ForegroundColor Gray
Write-Host "   - Test adding/editing/deleting trains" -ForegroundColor Gray
Write-Host "   - Test making/viewing/canceling reservations" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Form Validation:" -ForegroundColor Cyan
Write-Host "   - Test email validation" -ForegroundColor Gray
Write-Host "   - Test password matching" -ForegroundColor Gray
Write-Host "   - Test required fields" -ForegroundColor Gray
Write-Host "   - Test phone number formatting" -ForegroundColor Gray
Write-Host ""
Write-Host "5. Search & Filter:" -ForegroundColor Cyan
Write-Host "   - Test real-time search in admin list" -ForegroundColor Gray
Write-Host "   - Test real-time search in user list" -ForegroundColor Gray
Write-Host "   - Test real-time search in train list" -ForegroundColor Gray
Write-Host ""
Write-Host "6. Responsive Design:" -ForegroundColor Cyan
Write-Host "   - Test mobile view (375px)" -ForegroundColor Gray
Write-Host "   - Test tablet view (768px)" -ForegroundColor Gray
Write-Host "   - Test desktop view (1920px)" -ForegroundColor Gray
Write-Host ""
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host ""
Write-Host "Opening browser for manual testing..." -ForegroundColor Yellow
Start-Process "http://localhost:8080/Railway/"
Write-Host ""
Write-Host "Follow detailed test cases in: FUNCTIONAL_TEST_RESULTS.md" -ForegroundColor Cyan
Write-Host ""
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Enter to exit..." -ForegroundColor Gray
Read-Host
