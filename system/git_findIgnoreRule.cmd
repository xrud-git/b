@setLocal enableDelayedExpansion enableExtensions
@call en


if "%~1" equ "" (
	echo Drag the file or folder onto this file.
	echo(
) else (
	
	set "v=%~dp0"
	set "v=!v:~0,-1!"
	call !en! separateVar "v" "\"
	set "v=!v_f!"

	call !en! removeItemsFromEndInVar "v" "1" "\"

	cd /d "!v_f!"

	git check-ignore -v "%~1"
	if "!errorlevel!" neq "0" (
		echo(It is not Ignored.
	)
	echo(

)


pause
