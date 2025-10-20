# Rollback Sidebar Script
# This script will restore the old sidebar if needed

Write-Host "================================" -ForegroundColor Cyan
Write-Host "🔙 SIDEBAR ROLLBACK SCRIPT" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

$sharedPath = "Railway\src\main\webapp\shared"
$currentSidebar = Join-Path $sharedPath "sidebar.jsp"
$oldSidebar = Join-Path $sharedPath "sidebar-old.jsp"
$newSidebar = Join-Path $sharedPath "sidebar-new.jsp"

# Check if backup exists
if (-not (Test-Path $oldSidebar)) {
    Write-Host "❌ Error: sidebar-old.jsp (backup) not found!" -ForegroundColor Red
    Write-Host "   Cannot rollback without backup file." -ForegroundColor Red
    exit 1
}

Write-Host "📁 Current Files:" -ForegroundColor Yellow
Get-ChildItem $sharedPath -Filter "sidebar*.jsp" | Select-Object Name, Length | Format-Table -AutoSize

Write-Host ""
Write-Host "🔄 Starting rollback process..." -ForegroundColor Yellow
Write-Host ""

# Step 1: Backup new sidebar
Write-Host "[1/3] Saving new sidebar..." -ForegroundColor Green
if (Test-Path $newSidebar) {
    Write-Host "      ⚠️  File already exists, removing..." -ForegroundColor DarkYellow
    Remove-Item $newSidebar -Force
}
Rename-Item $currentSidebar -NewName "sidebar-new.jsp"
Write-Host "      ✅ Saved: sidebar.jsp → sidebar-new.jsp" -ForegroundColor Green

# Step 2: Restore old sidebar
Write-Host "[2/3] Restoring old sidebar..." -ForegroundColor Green
Rename-Item $oldSidebar -NewName "sidebar.jsp"
Write-Host "      ✅ Restored: sidebar-old.jsp → sidebar.jsp" -ForegroundColor Green

# Step 3: Verify
Write-Host "[3/3] Verifying files..." -ForegroundColor Green
Write-Host ""
Write-Host "📁 Updated Files:" -ForegroundColor Yellow
Get-ChildItem $sharedPath -Filter "sidebar*.jsp" | Select-Object Name, Length | Format-Table -AutoSize

Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "✅ ROLLBACK COMPLETE!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next Steps:" -ForegroundColor Cyan
Write-Host "   1. Rebuild Railway project in Eclipse" -ForegroundColor White
Write-Host "   2. Restart Tomcat server" -ForegroundColor White
Write-Host "   3. Clear browser cache (Ctrl+Shift+Delete)" -ForegroundColor White
Write-Host "   4. Old sidebar is back!" -ForegroundColor White
Write-Host ""
Write-Host "💡 Tip: To use new sidebar again, run: .\replace-sidebar.ps1" -ForegroundColor DarkGray
Write-Host ""
