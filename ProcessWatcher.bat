@echo off
setlocal

REM Abre Chrome con la URL especificada
start chrome "https://www.tu-enlace.com"

REM Espera un momento para asegurarse de que Chrome se haya iniciado
timeout /t 5 /nobreak >nul

REM Obtener el ID del proceso de Chrome
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq chrome.exe" /fi "status eq running" /fo csv /nh') do (
    set ChromePID=%%i
    goto :found
)
:found

REM Script PowerShell embebido en el archivo batch
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"while ((Get-Process -Id %ChromePID% -ErrorAction SilentlyContinue)) { Start-Sleep -Seconds 1 }; ^
Add-Type -AssemblyName PresentationFramework; ^
[System.Windows.MessageBox]::Show('Recuerda hacer x cosa', 'Recordatorio', 'OK', 'Information')"

endlocal
exit /b
