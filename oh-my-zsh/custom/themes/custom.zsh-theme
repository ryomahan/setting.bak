#PROMPT='\
#${pyenv_virtualenv_info}\
#%{$fg[red]%}%(!.#.»)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} x %{$fg[reset_color]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} o %{$reset_color%}"

local virtualenv_info='$(virtualenv_prompt_info)'
virtualenv_prompt_info() {
  if [ -n "$VIRTUAL_ENV" ]; then
    VIRTUAL_ENV_NAME=`basename $VIRTUAL_ENV`
    echo -n "($VIRTUAL_ENV_NAME) "
  fi
}

PROMPT="\
%{$fg[green]%}${virtualenv_info}\
%{$fg[red]%}%(!.#.»)%{$reset_color%}"
