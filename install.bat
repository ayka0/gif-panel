@echo off
echo Installing GIF Panel for After Effects...
set "SRC=%~dp0"
set "DEST=%APPDATA%\Adobe\CEP\extensions\GifPanel"
if exist "%DEST%" rmdir /s /q "%DEST%"
mkdir "%DEST%"
xcopy "%SRC%*" "%DEST%\" /E /I /Y /Q
del "%DEST%\install.bat"
reg add "HKCU\Software\Adobe\CSXS.9" /v PlayerDebugMode /t REG_SZ /d 1 /f
reg add "HKCU\Software\Adobe\CSXS.10" /v PlayerDebugMode /t REG_SZ /d 1 /f
reg add "HKCU\Software\Adobe\CSXS.11" /v PlayerDebugMode /t REG_SZ /d 1 /f
reg add "HKCU\Software\Adobe\CSXS.12" /v PlayerDebugMode /t REG_SZ /d 1 /f
echo.
echo Done. Restart After Effects and open: Window - Extensions - GIF Panel
pause
