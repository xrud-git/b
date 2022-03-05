@setLocal enableDelayedExpansion enableExtensions
@call "%~dp0\assets\en.cmd"

echo(!br!Its possible to do all cases of Cloning, from GitHub Desktop, using `File \ Clone repository .. \ URL` tab .
echo(!br!You can drag the target folder onto this file .

set "v=%~dp0"

set "v1="
if "%~1" equ "" (
	echo(!br!Def = %v%

	set /p v=Repository location or Enter for def .: ||set "v=%~dp0"

	rem // ### pr_forEachInPath_noRequirements
		rem // !v_f! = result . previous newlines is replaced with "<<__ br>>" without spaces .

		set "v1_f="%~dp0""

			rem //# separateToArray
			set "v_f="
			for /f tokens^=*^ delims^=^ eol^= %%x in (!v1_f!) do (
				set "v_f=!v_f!^^^<^^^<__br^^^>^^^>%%x"
			)
			set "v_f=!v_f:*^<^<__br^>^>=!"
		echo(1!br!!v_f!
			set "v_f=%v_f:^\=!br!%"		&rem custom

		echo(1 !v_f!

			rem //# count_lines
			set "nu_f=0"
			for /f tokens^=*^ delims^=^ eol^= %%x in ("!v_f!") do (
				set /a "nu_f=!nu_f!+1"
			)

			set /a "nu1_f=!nu_f!"
			set "v1_f=!v_f!"
			set "v_f="

			rem //# forEachLine
			set "nu_f=0"
			for /f tokens^=*^ delims^=^ eol^= %%x in ("!v1_f!") do (
				set /a "nu_f=!nu_f!+1"
				
		rem ### custom . #sc . !v_f! is: not used / free . !nu1_f! = amount of the all path levels . %%x = current item . !nu_f! = current level counting number .

		echo(!v_f! !nu1_f! !nu_f!

		set /a "nu1_f=!nu1_f! - 1"
		if !nu_f! leq !nu1_f! (
			set "v_f=!v_f!\%%x"
		)

			)

		rem //# selectAfter_line
		set "v_f=!v_f:*\=!"		&rem short for if using #forEachLine to merge the path levels

	rem ### end ;

	set v_s=%v_f%
	echo(!br!Def = %v_s%
	set /p v1=Target location or Enter for def = ||set v1=%v_s%
) else (
	set v1=%~1
)

echo(!br!"%v%"!br!"%v1%"!br!

rem mkdir %v1%

rem [d]

rem echo(
rem pause