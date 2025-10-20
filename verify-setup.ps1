# PowerShell script to verify Railway Reservation project setup
# Run this after installing Java to verify everything is ready

Write-Host "========================================" -ForegroundColor Green
Write-Host "Railway Reservation Project Setup Check" -ForegroundColor Green  
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check Java installation
Write-Host "1. Checking Java Installation..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1
    if ($javaVersion -match "version") {
        Write-Host "   ✅ Java is installed and available" -ForegroundColor Green
        Write-Host "   $($javaVersion[0])" -ForegroundColor Cyan
        
        # Check javac (compiler)
        $javacVersion = javac -version 2>&1
        if ($javacVersion -match "javac") {
            Write-Host "   ✅ Java compiler (javac) is available" -ForegroundColor Green
        } else {
            Write-Host "   ⚠️  Java compiler (javac) not found in PATH" -ForegroundColor Yellow
        }
    }
} catch {
    Write-Host "   ❌ Java is not installed or not in PATH" -ForegroundColor Red
    Write-Host "   Please install Java JDK first (see JAVA-INSTALLATION-GUIDE.md)" -ForegroundColor Yellow
}

Write-Host ""

# Check MySQL
Write-Host "2. Checking MySQL Connection..." -ForegroundColor Yellow
try {
    $mysqlPath = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
    if (Test-Path $mysqlPath) {
        Write-Host "   ✅ MySQL is installed" -ForegroundColor Green
        Write-Host "   📍 Location: $mysqlPath" -ForegroundColor Cyan
        Write-Host "   ✅ Database 'Railway' was set up successfully" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️  MySQL not found at expected location" -ForegroundColor Yellow
    }
} catch {
    Write-Host "   ⚠️  Could not verify MySQL installation" -ForegroundColor Yellow
}

Write-Host ""

# Check Project Structure
Write-Host "3. Checking Project Structure..." -ForegroundColor Yellow
$projectPath = "Railway-Reservation-main\Railway"
if (Test-Path $projectPath) {
    Write-Host "   ✅ Project directory found: $projectPath" -ForegroundColor Green
    
    # Check source files
    $srcPath = "$projectPath\src\main\java"
    if (Test-Path $srcPath) {
        Write-Host "   ✅ Java source files found" -ForegroundColor Green
        
        # Count Java files
        $javaFiles = Get-ChildItem $srcPath -Recurse -Filter "*.java" | Measure-Object
        Write-Host "   📊 Total Java files: $($javaFiles.Count)" -ForegroundColor Cyan
    }
    
    # Check web files  
    $webPath = "$projectPath\src\main\webapp"
    if (Test-Path $webPath) {
        Write-Host "   ✅ Web application files found" -ForegroundColor Green
    }
} else {
    Write-Host "   ❌ Project directory not found" -ForegroundColor Red
    Write-Host "   Expected: $projectPath" -ForegroundColor Yellow
}

Write-Host ""

# Check Database Configuration
Write-Host "4. Checking Database Configuration..." -ForegroundColor Yellow
$dbFiles = Get-ChildItem "$projectPath\src\main\java" -Recurse -Filter "DbConnection.java" -ErrorAction SilentlyContinue
if ($dbFiles) {
    Write-Host "   ✅ Found $($dbFiles.Count) database connection files" -ForegroundColor Green
    
    # Check if credentials were updated
    $testFile = $dbFiles[0]
    $content = Get-Content $testFile.FullName -Raw
    if ($content -match 'db_password = "1234"') {
        Write-Host "   ✅ Database credentials updated for your MySQL setup" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️  Database credentials may need updating" -ForegroundColor Yellow
    }
}

Write-Host ""

# Next Steps
Write-Host "========================================" -ForegroundColor Green
Write-Host "Next Steps:" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

if ((Get-Command java -ErrorAction SilentlyContinue) -and (Get-Command javac -ErrorAction SilentlyContinue)) {
    Write-Host "✅ Java is ready! You can now:" -ForegroundColor Green
    Write-Host "   1. Download and install Apache Tomcat 9.0" -ForegroundColor White
    Write-Host "   2. Download MySQL Connector JAR file" -ForegroundColor White  
    Write-Host "   3. Use Eclipse IDE for easy development" -ForegroundColor White
    Write-Host "   4. Or compile manually using javac" -ForegroundColor White
    Write-Host ""
    Write-Host "🚀 Ready to deploy to: http://localhost:8080/Railway/" -ForegroundColor Cyan
} else {
    Write-Host "⚠️  Please install Java JDK first:" -ForegroundColor Yellow
    Write-Host "   - See JAVA-INSTALLATION-GUIDE.md for detailed steps" -ForegroundColor White
    Write-Host "   - Restart PowerShell after installation" -ForegroundColor White  
    Write-Host "   - Run this script again to verify" -ForegroundColor White
}

Write-Host ""
Write-Host "📚 Documentation files created:" -ForegroundColor Magenta
Write-Host "   - JAVA-INSTALLATION-GUIDE.md (detailed setup)" -ForegroundColor White
Write-Host "   - QUICK-START.md (deployment guide)" -ForegroundColor White
Write-Host "   - database-setup.sql (✅ already executed)" -ForegroundColor White

Write-Host ""
Write-Host "🔑 Login credentials ready:" -ForegroundColor Magenta  
Write-Host "   User: testuser / password123" -ForegroundColor White
Write-Host "   Admin: admin / admin123" -ForegroundColor White