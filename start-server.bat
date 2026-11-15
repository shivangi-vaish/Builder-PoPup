@echo off
title Third Wave Coffee Server (Port 8080)
cd /d "%~dp0"
echo ===============================================================
echo   Third Wave Coffee Balewadi - Local Web Server
echo   Running at: http://localhost:8080/
echo ===============================================================
echo.

:: Launch browser after 1 second
start "" "http://localhost:8080/"

:: Run PowerShell lightweight web server
powershell -ExecutionPolicy Bypass -Command "$port = 8080; $url = 'http://localhost:' + $port + '/'; $root = (Get-Item -Path '.').FullName; $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add($url); $listener.Start(); Write-Host 'Server live on ' $url -ForegroundColor Green; Write-Host 'Press Ctrl+C to stop the server.' -ForegroundColor Yellow; while ($listener.IsListening) { $ctx = $listener.GetContext(); $req = $ctx.Request; $res = $ctx.Response; $rel = $req.Url.LocalPath.TrimStart('/'); if ([string]::IsNullOrWhiteSpace($rel)) { $rel = 'index.html' }; $f = Join-Path $root $rel; if (Test-Path $f -PathType Leaf) { $b = [System.IO.File]::ReadAllBytes($f); $ext = [System.IO.Path]::GetExtension($f).ToLower(); $m = switch ($ext) { '.html' {'text/html; charset=utf-8'} '.css' {'text/css; charset=utf-8'} '.js' {'application/javascript; charset=utf-8'} '.json' {'application/json'} '.png' {'image/png'} '.jpg' {'image/jpeg'} '.svg' {'image/svg+xml'} Default {'application/octet-stream'} }; $res.ContentType = $m; $res.ContentLength64 = $b.Length; $res.OutputStream.Write($b, 0, $b.Length) } else { $res.StatusCode = 404 }; $res.Close() }"

pause
