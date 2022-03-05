@setLocal enableDelayedExpansion enableExtensions
@call "%~dp0\en.cmd"

cd /d %~dp0


set "v=sa\asf!br!as!br!sagf"
echo(!v!>t.txt

call !en! pr_del_1stLine_file "t.txt"


rem call !en! pr_forEachInPath_noRequirements "sa\as" "echo(%nu_f%"

@REM call !en! escapeNewlines "t.txt" "cmd_temp.txt"
@REM set "v=!v_f!"

@REM call :sc1
@REM goto :eof

@REM :sc1
@REM set "v_f=sa\as"
@REM echo(!v_f!
@REM 	set "v_f=%v_f:\=!br!%"		&rem custom
@REM echo(!v_f!
@REM goto :eof


rem echo(!v_f!
rem pause