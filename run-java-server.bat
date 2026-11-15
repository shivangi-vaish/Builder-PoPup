@echo off
set "JAVA_EXE=C:\Program Files\Java\jdk-24\bin\java.exe"
if exist "%JAVA_EXE%" (
    "%JAVA_EXE%" Server.java
) else (
    java Server.java
)
pause
