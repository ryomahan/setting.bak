# Path to your oh-my-zsh installation.
export ZSH="/Users/ryoma/.oh-my-zsh"

# theme
ZSH_THEME="custom"

# oh my zsh plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

HIST_STAMPS="yyyy-mm-dd"

# Custom configuration

# Change Proxy By Alias
alias proxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unproxy="unset ALL_PROXY"

# ssh shortcut
alias huawei="ssh huawei"
alias ipms="ssh root@39.96.26.34"
alias isms-basic="ssh isms-basic"
alias isms-master="ssh isms-master"
alias isms="ssh root@47.93.204.176"

# alias ali="ssh root@47.240.28.83"
#alias isms-master="ssh -p 7521 root@114.215.127.193"
#alias isms-basic="ssh -p 7521 root@47.104.219.192"

# list my computers ip
alias ip="cat ~/.ip_list"

# cd shortcut
alias wiki="cd ~/Documents/write/wiki"

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
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# node
export PATH=/Users/ryoma/.nvm/versions/node/v12.14.1/bin:$PATH

# mysql
export PATH=/usr/local/Cellar/mysql@5.7/5.7.28/bin:$PATH

# openssl
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# ssh agent
# eval $(ssh-agent) >> ~/.ssh/agent.pid

export LC_ALL=en_US.UTF-8
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

source $ZSH/oh-my-zsh.sh
