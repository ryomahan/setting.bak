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
alias ali="ssh root@47.240.28.83"
alias iot="ssh root@47.93.204.176"
alias huawei="ssh -p 7521 root@119.3.254.127"
alias blanc="ssh -p 5279 root@47.107.111.185"
alias beng="ssh root@39.96.26.34"

# redis
alias redis="redis-server /usr/local/etc/redis.conf"

# aria2c
alias aria2="aria2c --conf-path="/Users/ryoma/.aria2/aria2.conf" -D"

# kafka
alias kafka-start="kafka-server-start /usr/local/etc/kafka/server.properties"

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

# erlang
export PATH="/usr/local/erlang/bin:$PATH"

# mongodb
export PATH="/usr/local/mongodb/bin:$PATH"

source $ZSH/oh-my-zsh.sh
