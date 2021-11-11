@ECHO OFF

SET root_folder=%~dp0
SET root_folder=%root_folder:~0,-1%
SET default_tcf=C:\Program Files\TCF8
SET default_tcf2=C:\Program Files\TransCAD 8.0

IF "%TCF%" NEQ "" (
    GOTO prm_check_tcw
) ELSE (
    GOTO prm_check_default_tcw
)

REM ==============================
:prm_check_tcw
IF EXIST "%TCF%\tcw.exe" (
    GOTO prm_check_success
) ELSE (
    GOTO prm_check_default_tcw
)

REM ==============================
:prm_check_default_tcw
IF EXIST "%default_tcf%\tcw.exe" (
    SETX TCF "%default_tcf%"
    GOTO prm_check_success
) ELSE (
    IF EXIST "%default_tcf2%\tcw.exe" (
        SETX TCF "%default_tcf2%"
        GOTO prm_check_success
    ) ELSE (
        CLS
        ECHO.
        ECHO  Installation failed!
        ECHO.
        ECHO  Environment variable "TCF" pointing to TransCAD Full 8 installation folder is not set.
        ECHO  Please, set TCF and re-run install.bat.
        ECHO.
        ECHO  Do you want to open Environment Variables window to set it (y/n^)?
        CHOICE /C YN /N
        IF ERRORLEVEL 2 GOTO prm_quit
        IF ERRORLEVEL 1 START %windir%\System32\rundll32.exe sysdm.cpl,EditEnvironmentVariables
        GOTO prm_quit
    )
)

REM ==============================
:prm_check_success
SETX PRM "%root_folder%"
DEL "%userprofile%\Desktop\P&R.lnk"
DEL "%userprofile%\Desktop\PRM.lnk"
COPY /B /Y "%root_folder%\app\PRM.lnk" "%userprofile%\Desktop"
CLS
ECHO.
ECHO  Park ^& Ride Model was successfully installed.
ECHO  You can launch the application by double clicking PRM shortcut on the Desktop.
GOTO prm_press_and_quit

REM ==============================
:prm_press_and_quit
ECHO.
ECHO  Press any key to exit . . .
PAUSE > nul
GOTO prm_quit

REM ==============================
:prm_quit
EXIT