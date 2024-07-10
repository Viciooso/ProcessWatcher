@echo off
setlocal

set URL=https://www.tu-enlace.com

:startChrome
REM Abre Chrome con la URL especificada
start chrome "%URL%"

REM Espera un momento para asegurarse de que Chrome se haya iniciado
timeout /t 5 /nobreak >nul

REM Obtener el ID del proceso de Chrome
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq chrome.exe" /fo csv /nh') do (
    set ChromePID=%%i
    goto :monitor
)

REM Si no se encuentra el proceso de Chrome, termina el script
echo No se pudo encontrar el proceso de Chrome.
goto :eof

:monitor
REM Script PowerShell embebido en el archivo batch
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"while ((Get-Process -Id %ChromePID% -ErrorAction SilentlyContinue)) { Start-Sleep -Seconds 1 }; ^
Add-Type -AssemblyName PresentationFramework; ^
$Result = [System.Windows.MessageBox]::Show('Recuerda hacer x cosa. ¿Quieres continuar?', 'Recordatorio', 'YesNo', 'Question'); ^
if ($Result -eq 'No') { start-process chrome '%URL%' }"

REM Si el usuario selecciona "No", vuelve a iniciar el proceso de monitoreo
if %ErrorLevel% == 0 goto :eof
goto :startChrome

endlocal
exit /b
