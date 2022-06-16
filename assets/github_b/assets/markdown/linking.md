
Max file and folder names supported by: Windows, GitHub, [dev Linux] . --

`` 1aA`~!@#$%^&()-_=+[{]};'. , `` , `` 1aA`~!@#$%^&()-_=+[{]};',. .md `` .

What leaves `` *:"\|<>/? `` and `<<\n>>`, from often-used keyboard .

GitHub required URL Escaping:
* %23 = `` # `` .
* %25 = `` % `` .
* %5E = `` ^ `` .
* %20 = ` ` .

Max Branch name on GitHub is `%201aA%60%3D!@#%24%25%5E&%2A()-_=+%5B{]};%3A'"%5C|,<.>%2F%3F` , but in Git on Windows is close to -- ``1aA`!@#$%&()-_=+{]};'.,`` .

In-script/code shortening, only 1 definition per name in a file
```
[.md][_name_1_]

[_name_1_]: ..//..//..//..//assets//github_b//1aA`~!@%23$%25%5E&()-_=+[{]};'.%20,//1aA`~!@%23$%25%5E&()-_=+[{]};',%20.md
```
or, !!! highly suggested to use only with `#<<number>>`, `sho<<number>>` or `sho_<<number>>`
```
[#1]

[#1]: ..//..//..//..//assets//github_b//1aA`~!@%23$%25%5E&()-_=+[{]};'.%20,//1aA`~!@%23$%25%5E&()-_=+[{]};',%20.md
```

On GitHub, [Space] can be escaped by {[Numeric character reference](https://en.wikipedia.org/wiki/Numeric_character_reference)}/HTML/XML
```
[.md](..//..//..//..//assets//github_b//1aA`~!@%23$%25%5E&()-_=+[{]};'.&#x20;,//1aA`~!@%23$%25%5E&()-_=+[{]};',&#x20;.md)

[.md](..//..//..//..//assets//github_b//1aA`~!@%23$%25%5E&()-_=+[{]};'.&#32;,//1aA`~!@%23$%25%5E&()-_=+[{]};',&#32;.md)
```

Image Embed
```
![pi](..//..//..//..//assets//github_b//co_dw_256x256.png)

<img src="..\..\..\..\assets\github_b\co_dw_256x256.png" height="500">
```

Same page Anchor/Heading -- only --
```
[Heading](linking.md#h_sy_Heading)
```


## At the time, doesn't work on Github

Full Path on Windows: [.md](C://b//assets//github_b//1aA`~!@%23$%25%5E&()-_=+[{]};'.%20,//1aA`~!@%23$%25%5E&()-_=+[{]};',%20.md) .

[Folder](..\..\..\..\assets\github_b\1aA`~!@%23$%25%5E&()-_=+[{]};'.%20,) -- `\`

[Folder](..\\..\\..\\..\\assets\\github_b\\1aA`~!@%23$%25%5E&()-_=+[{]};'.%20,) -- `\\`

[.md](..//..//..//..//assets//github_b//1aA`~!@%23$%25%5E&()-_=+[{]};'.%20,/1aA`~!@%23$%25%5E&()-_=+[{]};',+.md) -- `+` = [Space] -- some: Seach Engines and other sites;

Search:
* not tested [ * ](https://docs.github.com/en/github/searching-for-information-on-github/searching-on-github/searching-code) : `` . , : ; / \ ` ' " = * ! ? $ & + ^ | ~ < > ( ) { } [ ] @ `` ;,
* in "Code" : `` # [] `` (require `"<<_>>"` for "Commits") ;,
<!-- * in "Commits" : `` `` ;, -->
* what leaves `` 1aA%-_ `` ;.


## [Percent-encoding](https://en.wikipedia.org/wiki/Percent-encoding)/URI/URL -- uses Unicode codes

```
Space	%20
"	%22
'	%27
`	%60
@	%40
#	%23   //MediaWiki: Wikipedia/Fandom; doesn't support in Article names
$	%24
%	%25
^	%5E
&	%26
*	%2A
-	%2D   //Epic Games Store uses to replace punctuation
/	%2F
:	%3A
;	%3B
<	%3C
=	%3D
>	%3E
?	%3F
[	%5B   //GitHub doesn't support in file/folder names
\	%5C
]	%5D   //GitHub doesn't support in file/folder names
_	%5F   //MediaWiki: Wikipedia/Fandom; converts to Space in Article names
{	%7B   //MediaWiki: Wikipedia/Fandom; doesn't support in Article names
|	%7C
}	%7D   //MediaWiki: Wikipedia/Fandom; doesn't support in Article names
~	%7E
Carriage Return	%0D
Line Feed		%0A
```

### h_sy_Heading
