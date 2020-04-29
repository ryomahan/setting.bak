virtualenv_prompt_info() {
  if [ -n $VIRTUAL_ENV ]; then
    VIRTUAL_ENV_NAME=`basename $VIRTUAL_ENV`
    echo -n "($VIRTUAL_ENV_NAME)"
  fi
}
local virtualenv_info='$(virtualenv_prompt_info)'

PROMPT="%{$fg[green]%}${virtualenv_info}"
PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
