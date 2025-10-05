@echo off
echo ====================================
echo    DEPLOY PERSONAL WEBSITE
echo ====================================

echo.
echo [1/5] Cleaning and building project...
call mvn clean package -DskipTests

if %ERRORLEVEL% neq 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo [2/5] Build successful! WAR file created.

echo.
echo [3/5] Adding changes to git...
git add .

echo.
echo [4/5] Committing changes...
set /p commit_msg="Enter commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Update website with database integration

git commit -m "%commit_msg%"

echo.
echo [5/5] Pushing to GitHub...
git push origin main

if %ERRORLEVEL% neq 0 (
    echo ERROR: Git push failed!
    echo Please check your git configuration and try again.
    pause
    exit /b 1
)

echo.
echo ====================================
echo    DEPLOYMENT COMPLETED! 
echo ====================================
echo.
echo Next steps:
echo 1. Go to Render Dashboard
echo 2. Your app will auto-deploy from GitHub
echo 3. Set environment variables for database
echo.
pause