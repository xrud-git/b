
### Short

`` \<\> whitespace_or_Underscore__\_notWhitespace__ []\() []\[] []\: \` \~~ \|| \--- \* 1\. \$ ``

### Description

`` whitespace_or_Underscore__\_notWhitespace__ `` -- to fix/escape [ [whitespace or Underscore]`_`[notWhitespace] [anything] [notWhitespace]`_` ] .

`` []\[] `` -- highly suggessted to escape, even though its usually not converted without relevant `` [line_notOnlyWhitespace__]: line_notOnlyWhitespace__ `` .

`` \$ `` -- some processors use it as a Math text definition brackets .

`` \~~ \|| `` -- Discord Markdown 101 (each such sequense, even if it continues the previous . escaping each/{by 1} is exessive, as these characters have meanings) .

`` \<\> `` -- its easier to remember, but technicaly second `\` is not needed .

`` \`\` `` -- fist `\` is an escape, and second is to prevent breaking of ` `` ` .

`` \` []\() `` -- is other ones which escape too is required even not after start of line .

`` \--- `` -- global escaping includes tables .

`` \* ``

`` 1\. ``

`` [line_notOnlyWhitespace__]\: line_notOnlyWhitespace__ ``

`` \`\`\` `` -- first `\` is an escape, and the other is to allow `` ` `` and ` `` ` next to it (without separating characters) .
