@echo off
title Third Wave Coffee - Balewadi AI Web App
echo ===============================================================
echo   Third Wave Coffee Balewadi - AI Web Application
echo ===============================================================
echo.
echo Launching application in your web browser...

:: Check for Chrome
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    echo Opening in Google Chrome...
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto :done
)

:: Check for Edge
if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" (
    echo Opening in Microsoft Edge...
    start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "%~dp0index.html"
    goto :done
)

:: Fallback to Windows default registered browser
echo Opening in default browser...
start "" "%~dp0index.html"

:done
echo.
echo Application launched! If it did not open, navigate to:
echo %~dp0index.html
echo.
timeout /t 3 >nul
exit /b 0
