@setLocal enableDelayedExpansion enableExtensions
@call en


set "v=%~dp0"
set "v=!v:~0,-1!"
call !en! separateVar "v" "\"
set "v=!v_f!"

call !en! removeItemsFromEndInVar "v" "1" "\"

echo(Def = !v_f!
echo(
set /p v=Repository location or Enter for def = ||set "v=!v_f!"

if "%~1" equ "" (
	echo(
	echo(( ^\^|^/ you could drag a folder onto this file ^)
	echo(
	set /p v1=Target location = 
) else (
	echo(
	echo(Dragged = %~1
	echo(
	set /p v1=Target location, or Enter for dragged = ||set "v1=%~1"
)

:sc
echo(
set /p v2=Remote ID or Enter for "origin" = ||set "v2=origin"

echo(!br!"%v%"!br!"%v1%"!br!"%v2%"

pause
echo(

mkdir %v1%

cd /d %v1%
git init

rem mkdir %v1%\.git
rem cd /d %v1%\.git
rem git init --bare

cd /d %v%
git remote remove %v2%
git remote add %v2% %v1%

echo(!br!Push -- start

git push --set-upstream %v2% main


echo(
pause
