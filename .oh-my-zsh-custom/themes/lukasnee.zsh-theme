PROMPT="%{$fg[yellow]%}%c%{$reset_color%}"
PROMPT+='$(git_prompt_info)%{$fg[white]%}%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})\$%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[blue]%}%{$fg[blue]%}%1{*%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
