@ECHO OFF

SET folder=%~dp0

REM ==============================
CALL "%folder%\prm_check_envs.bat" && goto :prm_start
ECHO.
ECHO  Press any key to exit . . .
PAUSE > nul
GOTO :prm_quit

REM ==============================
:prm_start
CMD /C start "" /MAX "%TCF%\tcw.exe" -q -a "%folder%\ui\prm_ui" -ai "prm_init" -n "PARK AND RIDE MODEL"
goto :prm_quit

REM ==============================
:prm_quit
EXIT