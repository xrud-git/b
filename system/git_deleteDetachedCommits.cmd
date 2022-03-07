@setLocal enableDelayedExpansion enableExtensions
@call en

rem 
rem #looseCommits "#danglingCommits"
rem 


rem [dev_s] set /p "v=To delete of all Branches, write "y": "


set "v=%~dp0"
set "v=!v:~0,-1!"
call !en! separateVar "v" "\"
set "v=!v_f!"

call !en! removeItemsFromEndInVar "v" "1" "\"

echo(Def = !v_f!!br!
	
set /p "v=Repository location, or Enter for def = "||set "v=!v_f!"

cd /d "!v!"

rem Can be recovered with `git log --all --reflog --alternate-refs --boundary --full-history --show-pulls --do-walk --format=oneline` .

rem //# delete some "References"
rem // 
git reflog expire --all --expire=all --rewrite --updateref
rem // 
rem // [dev_info `--expire-unreachable=all` is a part of `--expire=all`]
rem // 
rem // [dev_s] `--single-worktree` , `git reflog delete` , `--verbose`, `--stale-fix` .

rem Can be recovered with `git fsck --dangling` and/or `git fsck --unreachable` .

rem //# doesn't work always . "delete Unreachable"
rem // 
rem git prune -v
rem git prune -v --expire=now

rem //# delete Unreachable
rem // 
git gc --prune=now
rem // 
rem // [dev_s] `--quiet` .


pause
