@echo off
setlocal enabledelayedexpansion

echo Installing Sandboxie-Plus (unlocked version)...

REM Check for required files
if not exist "KmdUtil.exe" (
    echo KmdUtil.exe not found in current directory.
    exit /b 1
)

if not exist "SbieDrv.sys" (
    echo SbieDrv.sys not found.
    exit /b 1
)

if not exist "SbieSvc.exe" (
    echo SbieSvc.exe not found.
    exit /b 1
)

if not exist "SbieMsg.dll" (
    echo SbieMsg.dll not found.
    exit /b 1
)

echo Installing driver...
KmdUtil.exe install SbieDrv "SbieDrv.sys" type=kernel start=demand msgfile="SbieMsg.dll" altitude=86900

echo Installing service...
KmdUtil.exe install SbieSvc "SbieSvc.exe" type=own start=auto msgfile="SbieMsg.dll" display="Sandboxie Service" group=UIGroup

echo Starting service...
KmdUtil.exe start SbieSvc

echo.
echo Installation complete. You can now run SandMan.exe.
echo If the driver fails to start, you may need to disable driver signature enforcement (Windows 10/11).
echo.
pause