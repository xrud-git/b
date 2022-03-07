
# Git info by Xrud

See also:
* [Github's Resources](https://try.github.io/) .
* [Github Documentation](https://docs.github.com/en) .
* [Microsoft Azure Documentation](https://docs.microsoft.com/en-us/azure/devops/learn/git/what-is-git) .
* Default location of installed Git documentation : `C:\Program Files\Git\mingw64\share\doc` [file:///](file:///C|//Program%20Files//Git//mingw64//share//doc) ;

* <details><summary>Not recommended</summary>
	Git Online Documentation -- https://git-scm.com/docs .
	</details>


### Names

"Checkout" a Branch -- set Branch as active/current .

Checkout a Commit -- reverts and/or applies Commits between the current, and the targeted, one .

[d]


# Assets

If you get an unsupported File System or Git name in the history, it may make so the only ways to fix a resulting issue would be:
* To "Undo Last Commit" all the later Commits .
* To copy the content and re-Commit it .

Max names:
* Branch -- close to ``1aA`!@#$%&()-_=+{]};'.,`` .
* File System -- ``1aA`~!@#$%^&()-_=+[{]};'. ,`` , Without ending folder names on `.` , that would break some interaction with the subject repository on Windows .


## Branches

Among other, they specify which Commits with the preceding ones, are not detached .

If you cancel Rebase while have not Committed changes, the 2nd will be lost .

They use the settable names, for separation from each other .

If you do "Undo Last Commit" on Rebase Commit . It may break your ability to Commit, in that case save the changes you had not Committed before the Rebase, then switch to the subject Branch, and try again .


## Management

If you have a sub-Repository, Committed without {separate Remote}/Submodules . And delete `.git` from it . You'll need to Commit a deletion of the folder, for it's content to be processed, and `.gitignore` at the time doesn't work for this .

!!! If you want to do "Undo Last Commit" on the Repository's 1st Commit:
1. Make Branch at the Commit, and select it .
2. Do the action and do not close the Git/program .
3. Make a Commit .

* Otherwise the Repository will break, with no way to restore the content .
