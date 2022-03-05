@if "%~1" equ "" (
@echo off


rem # cmd_en ver 0.3
rem # a Library for Microsoft Windows {cmd.exe / cmd / Batch}
rem # mostly written for independent processing by cmd
rem 
rem #init . to load it, before commands that require it, insert in {.cmd / .bat} that init the cmd instance/query (without: "rem" after newline, and "```") --
rem ```
rem @setLocal enableDelayedExpansion enableExtensions
rem @call "%~dp0\assets\en.cmd"		&rem <<if needed, change the path to be to the file>>
rem ```
rem 
rem execute the script's commands as ``call !en! <<name>> <<| `"`<<value>>`"` ..>>`` .
rem 	 passing [!br!] in `call` 's Parameter doesn't work .
rem 	 so use temporal files for setting text (multiline) as subject .
rem 	 and, with `call "<<pathToFile>>"`, or an function's "if" name, for script/code .
rem the max var size is 8191 chars, so such is per line for files processing, that means all value/data interacting functions .
rem use "cmd_temp<<number>>.txt" and "cmd_temp<<number>>.cmd" file names for temporal files . such names will be used as Parameter -s' **Default values** .
rem 	 but won't ever be changed by this system, without being related/mentioned in description of the used input .
rem 
rem tested on :
rem * Windows 10, 
rem * [d Windows PE, ]
rem * [d [Windows Server 2016 Essentials](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2016-essentials), ]
rem * [d Windows 7, ]
rem * [d Windows XP SP2] ;


rem ### br :
rem setLocal enableDelayedExpansion		&rem (required . present in cmd_en #init)
set br=^


rem ### ;
rem [i]
rem use !br! for newLine character .
rem to insert into variable, it needs
rem 	 `set "_name_=<<..>>!br!<<..>>"` (the quotes is required only for this and as a short for some escaping)
rem 	 or `set "_name_=%_name_:<<..>>=!br!%"`
rem 	, or `%%<<letter_name>>` from `for` command .


rem cd /d %~dp0

set "en="%~f0""

echo(cmd_en loaded!br!

goto :eof
)


if "%~1" equ "filePath" (

	rem // supports `..\` .
	rem // %2 = file path tha can be processed .
	rem // !v_f! = result .
	rem #path

	for %%x in ("%~2") do set v_f=%%~fx

	goto :eof
)
if "%~1" equ "forEachLine" (

	rem // %2 = escaped variable name or escaped array/text (`^!br^!`) . %3 = script/code for the 1st item . %4 = script/code for the other items .
	rem // !nu_f! = lineNumber .
	rem #group #array #count_lines #lines

	set "nu_f=0"
	for /f tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
		set /a "nu_f=!nu_f! + 1"
		%~3
		goto :f_forEachLine
	)
	:f_forEachLine
	for /f skip^=1^ tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
		set /a "nu_f=!nu_f! + 1"
		%~4
	)

	goto :eof
)
if "%~1" equ "forEachLine_file" (

	rem %2 = pathToFile ;
	rem %3 = script/code for the 1st item :
	rem 	%~f2 = pathToFile . !nu_f! = lineNumber . %%x = line text ;
	rem %4 = script/code for the other items :
	rem 	%~f2 = pathToFile . !nu_f! = lineNumber . %%x = line text ;
	rem !nu_f! = last lineNumber / amount of lines .
	rem #group #array #count_lines #lines #file #file_read #fileRead #read #readFile

	set "nu_f=0"
	for /f tokens^=*^ delims^=^ eol^= %%x in (%~2) do (
		set /a "nu_f=!nu_f! + 1"
		%~3
		goto :forEachLine_file
	)
	:forEachLine_file
	for /f skip^=1^ tokens^=*^ delims^=^ eol^= %%x in (%~2) do (
		set /a "nu_f=!nu_f! + 1"
		echo(%~4, !v_f!, %%x
		%~4
	)

	goto :eof
)
if "%~1" equ "selectAfter_line" (

	rem // (kind of: compare string, show difference)
	rem // including -- everything before .
	rem // %2 = text . %3 = string/line to check/search for .
	rem // !v_f! = result .
	rem #remove #fromStart #removeFromStart #begin #fromBegin #removeFromBegin

	set "v_f=%~2"
	set "v_f=!v_f:*%~3=!"

	goto :eof
)
if "%~1" equ "selectAfter" (

	rem // %2 = text . %3 = number .
	rem // !v_f! = result .
	rem #remove #fromStart

	set "v_f=%~2"
	set "v_f=!v_f:~0,%~3!"

	goto :eof
)
if "%~1" equ "repeat" (

	rem // %2 = number_1, start the coordinate line with/from the nu + 1, !nu_f! .
	rem // %3 = number, if its < than number_1 then do not do/repeat, !nu1_f! .
	rem // %4 = script/code .
	rem // !nu_f! . !nu1_f!
	rem #loop

	set "nu_f=%~2"
	set "nu1_f=%~3"
	:f
	if not !nu_f! leq !nu1_f! (
		set /a "nu1_f=!nu1_f!+1"
		%~4
		goto f
	)

	goto :eof
)
if "%~1" equ "separateToArray" (

	rem // limited to max var size
	rem // %2 = pathToFile . %3 = string/line to check/search for, and remove .
	rem // !v_f! = result . previous newlines is replaced with "<<__ br>>" without spaces .
	rem #split

	call !en! escapeNewlines "%~2" "cmd_temp_separateToArray.txt"

	set "v_f=%v_f:%~3=!br!%"

	goto :eof
)
if "%~1" equ "escapeNewlines" (

	rem // %2 = pathToFile . %3 = optional, pathToFile for new file, can be %2 one (to overwrite) .
	rem // !v_f! = result . newlines is replaced with "<<__ br>>" without spaces .
	rem #newlines

	call !en! forEachLine_file "%~2" "call :f_escapeNewlines" ""
	:f_escapeNewlines
		echo(%%x>cmd_temp_escapeNewlines.txt
	goto :eof

	for /f tokens^=*^ delims^=^ eol^= %%x in (%~2) do (
		echo(%%x>cmd_temp_escapeNewlines.txt
		goto :f_escapeNewlines
	)
	:f_escapeNewlines
	for /f skip^=1^ tokens^=*^ delims^=^ eol^= %%x in (%~2) do (
		echo(^<^<__br^>^>%%x>>cmd_temp_escapeNewlines.txt
	)

	call !en! file_cmd "%~3" "0"
	if "!v_f!" equ "" (
		set /p "v_f="<cmd_temp_escapeNewlines.txt
		
		del /f /q cmd_temp_escapeNewlines.txt
	) else (
		set /p "v_f="<cmd_temp_escapeNewlines.txt

		move cmd_temp_escapeNewlines.txt !v_f!
	)

	goto :eof
)
if "%~1" equ "file_cmd" (

	rem // %2 = optional . pathToFile ;
	rem // %3 = optional . "sc" to add .cmd extension .
	rem 	 "0" -- to not return default if %2 is not set, and if %2 is set -- unfold it as default .
	rem 	 or anything else -- to add to filename's (without extension) the end . (doesn't support with extensions) ;
	rem // %4 = optional . if %3 == "sc", then to add to result filename's (without extension) the end ;
	rem // !v_f! = result .
	rem 

	set "v_f="
	if "%~2" equ "" (
		if not "%~3" equ "0" (
			if "%~3" equ "" (
				set "v_f=cmd_temp.txt"
			) else if "%~3" equ "sc" (
				set "v_f=cmd_temp%~4.cmd"
			) else (
				set "v_f=cmd_temp%~3.cmd"
			)
		)
	) else (
		if "%~3" equ "sc" (
			set "v_f=%~2%~4.cmd"
		) else if "%~3" equ "" (
			set "v_f=%~2"
		) else (
			if "%~x2" equ "" (
				set "v_f=%~2%~3.txt"
			) else if "%~x2" equ ".txt" (
				rem [s]
				
				set "v_f=%~2"
			) else (
				set "v_f=%~2"
			)
		)
	)

	goto :eof
)
if "%~1" equ "pr_text_toFile" (

	rem (replace/remove if using as preset)
	rem // %2 = optional, pathToFile, or is a Default .cmd .
	rem 
	rem // (preset)

	rem echo on		&rem doesn't change results

	rem //# pr_text_toFile
	call !en! file_cmd "%~2" "sc"
	(
		echo(	^rem echo(3^^^!br^^^!//# Parameters:^^^!br^^^!%%~f0^^^!br^^^!%%~1^^^!br^^^!%%~2^^^!br^^^!%%~3^^^!br^^^!%%~4^^^!br^^^!%%~5^^^!br^^^!%%~5^^^!br^^^!%%~7^^^!br^^^!//# ;^^^!br^^^!
		echo(	if "" equ "" (
		echo(		echo(2
		echo(	^)
		echo(^rem ^& ^> %%~2 ^^^!v_f^^^! %%%%x ^)		&rem require the "^" for ")", even with "echo "
	)>!v_f!

	call "!v_f!"

	goto :eof
)
if "%~1" equ "pr_del_1stLine_file" (

	rem (replace/remove if using as preset)
	rem %2 = pathToFile .
	rem %3 = optional, pathToFile for new file, or is a Default "1" .txt, can be %2 one (to overwrite) .
	rem 
	rem (preset)

	rem //# pr_del_1stLine_file #pr_text_toFile
	call !en! file_cmd "" "sc"
	(
		echo(	^rem echo(3^^^!br^^^!//# Parameters:^^^!br^^^!%%~f0^^^!br^^^!%%~1^^^!br^^^!%%~2^^^!br^^^!%%~3^^^!br^^^!%%~4^^^!br^^^!%%~5^^^!br^^^!%%~5^^^!br^^^!%%~7^^^!br^^^!//# ;^^^!br^^^!
		echo(	if "%%~1" equ "1" (
		echo(		call ^^^!en^^^! file_cmd "" "" ""
		echo(	^) else (
		echo(		echo(^^^!v_f^^^!
		echo(		echo(%%%%x^>^^^!v_f^^^!
		echo(	^)
	)>!v_f!
	set "v1_f=!v_f!"
	call !en! file_cmd "%~3" "1"
	echo(1 !v_f!
	call !en! forEachLine_file "%~2" "call "!v1_f!" "1"" "call "!v1_f!" "2""
	rem del /f !v1_f!

	goto :eof
)
if "%~1" equ "pr_forEachInPath_noRequirements" (

	rem (preset)
	rem ### pr_forEachInPath_noRequirements
		rem // !v_f! = result . previous newlines is replaced with "<<__ br>>" without spaces .

	set "v1_f="%~2""

		rem //# separateToArray
		set "v_f="
		for /f tokens^=*^ delims^=^ eol^= %%x in (!v1_f!) do (
			set "v_f=!v_f!^^^<^^^<__br^^^>^^^>%%x"
		)
		set "v_f=!v_f:*^<^<__br^>^>=!"
	echo(!v_f!
		set "v_f=%v_f:\=!br!%"		&rem custom
	echo(!v_f!

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
	echo !nu1_f! !nu_f! %%x
	%~3

		)

	rem //# selectAfter_line
	rem set "v_f=!v_f:*\=!"		&rem short for if using #forEachLine to merge the path levels

	rem ### end ;

	goto :eof
)

if "%~1" equ "show" (

	rem // %2 = optional, target (output) file, or is a Default .txt . %<<3--7>> other Parameters .
	rem // !v_f! = result .
	rem 

	echo(//# Parameters:!br!%~f0!br!%~1!br!%~2!br!%~3!br!%~4!br!%~5!br!%~5!br!%~7!br!//# ;!br!

	call !en! file_cmd "%~2"

	echo(//# Parameters:!br!%~f0!br!%~1!br!%~2!br!%~3!br!%~4!br!%~5!br!%~5!br!%~7!br!//# ;!br!>!v_f!

	set "v_f=//# Parameters:!br!%~f0!br!%~1!br!%~2!br!%~3!br!%~4!br!%~5!br!%~5!br!%~7!br!//# ;!br!"

	goto :eof
)
if "%~1" equ "t" (

	rem // 
	rem // 
	rem #en_t #t #test

	echo(#en_t //# Parameters:!br!%~f0!br!%~1!br!%~2!br!%~3!br!%~4!br!%~5!br!%~5!br!%~7!br!//# ;!br!

	goto :eof
)