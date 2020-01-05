# Path to your oh-my-zsh installation.
export ZSH="/Users/ryoma/.oh-my-zsh"

# theme
ZSH_THEME="custom"

# oh my zsh plugins
plugins=(
    git
    zsh-syntax-highlighting
)

HIST_STAMPS="yyyy-mm-dd"

# User configuration

# Change Proxy By Alias
alias proxy="export ALL_PROXY=socks5://127.0.0.1:1086"
alias unproxy="unset ALL_PROXY"

# ssh shortcut
alias logname="ssh root@xxx.xxx.xxx.xxx"

# redis
alias redis="redis-server /usr/local/etc/redis.conf"

# turn to api
alias api="pyenv activate api"

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null;
  then eval "$(pyenv virtualenv-init -)";
fi

# nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LC_ALL=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
