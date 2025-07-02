@echo off
:: Fix Start Page on registry
echo Fix start page on registry...
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Start Page" /d "www.windowsminios.org" /f

:: Create splwow.bin
echo Create splwow.bin
if not exist "%windir%\splwow.bin" (
    echo marker > "%windir%\splwow.bin"
)

:: Delete HelpPane.exe 
echo Delete HelpPane.exe
if exist "%windir%\HelpPane.exe" (
    takeown /f "%windir%\HelpPane.exe" >nul
    icacls "%windir%\HelpPane.exe" /grant %username%:F >nul
    del /f /q "%windir%\HelpPane.exe"
)

pause
