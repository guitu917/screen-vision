# Windows setup script for screen-vision skill
# Run in PowerShell as Administrator

Write-Host "=== Screen-Vision Windows Setup ===" -ForegroundColor Cyan
Write-Host ""

# Check Python
Write-Host "[1/3] Checking Python..." -ForegroundColor Yellow
$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) {
    $python = Get-Command python3 -ErrorAction SilentlyContinue
}
if (-not $python) {
    Write-Host "ERROR: Python not found. Install from https://python.org" -ForegroundColor Red
    exit 1
}
Write-Host "  Found: $($python.Source)" -ForegroundColor Green

# Install Python dependencies
Write-Host "[2/3] Installing Python dependencies..." -ForegroundColor Yellow
pip install --quiet pyautogui Pillow numpy 2>$null
if ($LASTEXITCODE -ne 0) {
    pip3 install --quiet pyautogui Pillow numpy
}
Write-Host "  ✅ pyautogui, Pillow, numpy" -ForegroundColor Green

# Verify
Write-Host "[3/3] Verifying..." -ForegroundColor Yellow
python -c "import pyautogui; print('  ✅ pyautogui')" 2>$null
python -c "from PIL import Image; print('  ✅ Pillow')" 2>$null

Write-Host ""
Write-Host "=== Setup Complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "No special permissions needed on Windows." -ForegroundColor Yellow
