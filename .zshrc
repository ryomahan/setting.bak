# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# theme
ZSH_THEME="custom_ys"

# oh my zsh plugins
plugins=(
    git
    # zsh-proxy
    zsh-autosuggestions
    zsh-syntax-highlighting
)

HIST_STAMPS="yyyy-mm-dd"

# Custom configuration
export LC_ALL=en_US.UTF-8

## add PATH

### Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if which pyenv-activate > /dev/null;
  then eval "$(pyenv init -)";
fi
if which pyenv-virtualenv-init > /dev/null;
  then eval "$(pyenv virtualenv-init -)";
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

### n
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"


source $ZSH/oh-my-zsh.sh
