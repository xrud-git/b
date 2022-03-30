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
	
	rem //# isEmpty
	set "st=1"
	for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in (`dir /b "!v1!"`) do (
		set "st=0"
	)
	
	call !en! removeTextFromStartInLine "v1" "!v!\"
	
	rem //# required by Github . [dev Git converts `//` to `/`]
	set "v1=!v_f!"
	set "v_s=!v_f:\=//!"

	echo(Sub-repository location = !v_s!
	echo(

	set /p "v=Main/remote location of the target repository, or Enter for def = "||set "v=!v!"
	echo(

	rem //# if no file/folder, or Repository is, at target path
	git submodule add -f --depth 1 "!v!" "!v_s!"
	
	if "!errorLevel!" neq "0" (
		
		if "!st!" equ "1" (
			rem //# empty
			echo(
			echo(Clone the Repository, then run setSubmodule
		) else (
			call !en! checkFile "!v1!\.git"
			if "!v_f!" equ "" (
				echo(
				echo(Clone the Repository, then run setSubmodule
			) else (
				git submodule set-url "!v_s!" "!v!"
			)
		)

	)

	echo(
)


pause
