@setLocal enableDelayedExpansion enableExtensions
@call en

echo(Its possible to do all cases of Cloning, from GitHub Desktop, using `File \ Clone repository .. \ URL` tab .!br!
echo(You can drag the target folder onto this file .!br!

set "v=%~dp0"
set "v=!v:~0,-1!"
call !en! separateVar "v" "\"
set "v=!v_f!"

call !en! removeItemsFromEndInVar "v" "1" "\"
set "v=!v_f!"

set "v1="
set "nu="
if "%~1" equ "" (
	
	set /p "nu=Number of the Commits to Clone, or Enter for all: "

	echo(!br!Def = !v!!br!
	set /p "v=Repository location, or Enter for def: "||set "v=!v!"

	echo(
	set /p "v1=Target location or Enter for def: "||set "v1=!v!"
	
	call !en! checkFile "!v1!"
	if "!v_f!" equ "1" (
		echo(!br!File exist at the target location .
		echo(
		pause
		goto :eof
	) else if "!v_f!" equ "" (
		mkdir !v1!
	)
	
) else (
	set "v1=%~1"
	call !en! checkFile "!v1!"
	if "!v_f!" equ "1" (
		echo(!br!The target is a file .
		echo(
		pause
		goto :eof
	)
)

echo(
if "!nu!" equ "" (
	git clone "!v!" "!v1!"
) else (
	git clone "!v!" "!v1!" --depth !nu! 
)
rem //# s
rem --no-hardlinks --recurse-submodules --shallow-submodules

echo(
pause
