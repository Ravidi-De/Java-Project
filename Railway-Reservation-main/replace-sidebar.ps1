# Replace Sidebar Script
# This script will backup the old sidebar and activate the new one

Write-Host "================================" -ForegroundColor Cyan
Write-Host "🎨 SIDEBAR REPLACEMENT SCRIPT" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

$sharedPath = "Railway\src\main\webapp\shared"
$oldSidebar = Join-Path $sharedPath "sidebar.jsp"
$newSidebar = Join-Path $sharedPath "sidebar-new.jsp"
$backupSidebar = Join-Path $sharedPath "sidebar-old.jsp"

# Check if files exist
if (-not (Test-Path $oldSidebar)) {
    Write-Host "❌ Error: sidebar.jsp not found!" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $newSidebar)) {
    Write-Host "❌ Error: sidebar-new.jsp not found!" -ForegroundColor Red
    exit 1
}

Write-Host "📁 Current Files:" -ForegroundColor Yellow
Get-ChildItem $sharedPath -Filter "sidebar*.jsp" | Select-Object Name, Length | Format-Table -AutoSize

Write-Host ""
Write-Host "🔄 Starting replacement process..." -ForegroundColor Yellow
Write-Host ""

# Step 1: Backup old sidebar
Write-Host "[1/3] Backing up old sidebar..." -ForegroundColor Green
if (Test-Path $backupSidebar) {
    Write-Host "      ⚠️  Backup already exists, removing..." -ForegroundColor DarkYellow
    Remove-Item $backupSidebar -Force
}
Rename-Item $oldSidebar -NewName "sidebar-old.jsp"
Write-Host "      ✅ Backed up: sidebar.jsp → sidebar-old.jsp" -ForegroundColor Green

# Step 2: Activate new sidebar
Write-Host "[2/3] Activating new sidebar..." -ForegroundColor Green
Rename-Item $newSidebar -NewName "sidebar.jsp"
Write-Host "      ✅ Activated: sidebar-new.jsp → sidebar.jsp" -ForegroundColor Green

# Step 3: Verify
Write-Host "[3/3] Verifying files..." -ForegroundColor Green
Write-Host ""
Write-Host "📁 Updated Files:" -ForegroundColor Yellow
Get-ChildItem $sharedPath -Filter "sidebar*.jsp" | Select-Object Name, Length | Format-Table -AutoSize

Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "✅ REPLACEMENT COMPLETE!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next Steps:" -ForegroundColor Cyan
Write-Host "   1. Rebuild Railway project in Eclipse" -ForegroundColor White
Write-Host "   2. Restart Tomcat server" -ForegroundColor White
Write-Host "   3. Clear browser cache (Ctrl+Shift+Delete)" -ForegroundColor White
Write-Host "   4. Test the new sidebar!" -ForegroundColor White
Write-Host ""
Write-Host "💡 Tip: To rollback, run: .\rollback-sidebar.ps1" -ForegroundColor DarkGray
Write-Host ""
