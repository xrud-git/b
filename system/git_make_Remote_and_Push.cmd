@setLocal enableDelayedExpansion enableExtensions
@call "%~dp0\assets\en.cmd"

echo(!br!Def = %cd%!br!

set /p v=Repository location or Enter for def .: ||set v=%cd%
set /p v1=Target location = 
set /p v2=Remote ID or Enter for "origin" = ||set v2=origin
echo(!br!"%v%"!br!"%v1%"!br!"%v2%"!br!

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

echo(!br!Push -- start!br!

git push --set-upstream %v2% main

echo(
pause