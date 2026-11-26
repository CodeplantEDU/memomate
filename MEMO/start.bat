@echo off
rem memomate local web server. Close this window to stop.
title memomate server - close this window to stop
cd /d "%~dp0"

rem If the server is already running, only open the browser.
netstat -ano | findstr /r /c:"127\.0\.0\.1:5000 .*LISTENING" >nul
if not errorlevel 1 (
  start "" http://localhost:5000/memomate.html
  exit /b
)

start "" http://localhost:5000/memomate.html
python -m http.server 5000 --bind 127.0.0.1
pause
