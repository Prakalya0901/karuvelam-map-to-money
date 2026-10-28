@echo off
echo ========================================================
echo Starting Karuvelam Map-to-Money Frontend (Vite)...
echo ========================================================
cd /d "%~dp0frontend"
npm run dev -- --host 0.0.0.0 --port 5180
pause
