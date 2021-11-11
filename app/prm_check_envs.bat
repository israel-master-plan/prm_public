@ECHO OFF

IF "%TCF%" NEQ "" GOTO :prm_check_env
CLS
ECHO.
ECHO  Environment variable "TCF" pointing to TransCAD Full 8 installation folder is not set!
ECHO  Please, run "install.bat" and choose "Yes" to set it.
EXIT /B 1

REM ==============================
:prm_check_env
IF "%PRM%" NEQ "" GOTO :prm_quit
CLS
ECHO.
ECHO  Environment variable "PRM" pointing to Park ^& Ride Model installation folder is not set!
ECHO  Please, run "install.bat" to set it.
EXIT /B 1

REM ==============================
:prm_quit
EXIT /B 0