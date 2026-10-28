@echo off
echo ========================================================
echo Starting Karuvelam Map-to-Money Backend (FastAPI)...
echo ========================================================
cd /d "%~dp0"
call .venv\Scripts\activate.bat
uvicorn backend.main:app --host 0.0.0.0 --port 8010 --reload
pause
