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
	set "v=!v_f!"

	echo(Def = !v!
	echo(

	set /p "v=Parent repository, or Enter for def = "||set "v=!v!"
	echo(

	cd /d "!v!"

	set "v1=%~1"
	call !en! removeTextFromStartInLine "v1" "!v!\"
	set "v1=!v_f!"

	echo(Sub-repository location = !v1!
	echo(

	set /p "v=Main/remote location of the target repository, or Enter for def = "||set "v=!v!"
	echo(

	git submodule add -f --depth 1 "!v!" "!v1!"

	if "!errorLevel!" neq "0" (
		git submodule set-url "!v1!" "!v!"
	)

	echo(
)


pause
