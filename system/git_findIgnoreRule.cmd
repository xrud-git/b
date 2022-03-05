@setLocal enableDelayedExpansion enableExtensions
@call en



set "v=%~dp0"
set "v=!v:~0,-1!"
call !en! separateVar "v" "\"
set "v=!v_f!"

@REM echo(!v!
call !en! removeItemsFromEndInVar "v" "1" "\"
echo(!v_f!


@REM cd /d ""


@REM if "%~1" equ "" (
@REM 	echo Drag the file or folder onto this file.
@REM 	echo(
@REM ) else (
@REM 	git check-ignore -v "%~1"
@REM 	if "!errorlevel!" neq "0" (
@REM 		echo(It is not Ignored.
@REM 	)
@REM 	echo(
@REM )


@REM pause
