@echo off
echo =========================================
echo       wol's Blog Auto Push
echo =========================================
echo.

echo [1/3] Adding files...
git add .

echo.
echo [2/3] Committing...
git commit -m "Auto Update"

echo.
echo [3/3] Pushing to GitHub...
git push -f origin main

echo.
echo =========================================
echo Done!
echo =========================================
pause