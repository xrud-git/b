@setLocal enableDelayedExpansion enableExtensions
@call en

echo(!br!Its possible to do all cases of Cloning, from GitHub Desktop, using `File \ Clone repository .. \ URL` tab .
echo(!br!You can drag the target folder onto this file .

set "v=%~dp0"

set "v1="
if "%~1" equ "" (
	
	echo(!br!Def = %v%

	set /p "v=Repository location, or Enter for def: "||set "v=%~dp0"

	set "v=!v:~0,-1!"
	call !en! separateVar "v" "\"
	set "v=!v_f!"

	call !en! removeItemsFromEndInVar "v" "1" "\"

	cd /d "!v_f!"

	set v_s=%v_f%
	echo(!br!Def = %v_s%
	set /p "v1=Target location or Enter for def: "||set "v1=%v_s%"
	
) else (
	set v1=%~1
)

echo(!br!"%v%"!br!"%v1%"!br!

rem mkdir %v1%

rem [d]

rem echo(
rem pause
