@echo off
setlocal
set "CAS_URL=https://cas-ticket-system-production.up.railway.app/"
set "CAS_NAME=CAS IT Support Ticket"

rem Use Windows' known Desktop location, including OneDrive redirected desktops.
powershell.exe -NoProfile -NonInteractive -Command "$ErrorActionPreference='Stop'; $desktop=[Environment]::GetFolderPath('Desktop'); if (-not $desktop) { throw 'Desktop folder not found' }; $shortcut=Join-Path $desktop 'CAS IT Support Ticket.url'; $lines=@('[InternetShortcut]','URL=https://cas-ticket-system-production.up.railway.app/','IconFile=%SystemRoot%\System32\shell32.dll','IconIndex=23'); [System.IO.File]::WriteAllLines($shortcut,$lines,[System.Text.Encoding]::ASCII); Write-Host ('Shortcut created: ' + $shortcut)"
if errorlevel 1 (
  echo.
  echo Could not create the desktop shortcut. Contact CAS IT Support.
  pause
  exit /b 1
)
echo.
echo CAS IT Support Ticket shortcut installed successfully.
echo Double-click the new desktop shortcut to open the employee portal.
pause
exit /b 0
