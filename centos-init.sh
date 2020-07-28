# CentOS 7 init

## yum update
yum update -y

## base env install
yum install -y gcc-c++ wget expat-devel gdbm-devel libffi-devel libxml* zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

## docker

## java

## maven

## git init
if [ -x "$(command -v git)" ]; then
    echo "git is readly."
else
    yum install git -y

    ## git global config set
    git config --global user.email "ryomahan1996@gmail.com"
    git config --global user.name "ryomahan"
    git config --global push.default simple
fi

## pyenv init
if [ -x "$(command -v pyenv)" ]; then
    echo "pyenv is readly."
else
    # git clone pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    # add environmental variables
    echo "export PATH=$PATH:/root/.pyenv/bin" >> /etc/profile
    echo 'eval "$(pyenv init -)"' >> /etc/profile

    echo "# Pyenv" >> ~/.zshrc
    echo "export PATH=~/.pyenv/bin:$PATH"
    echo 'eval "$(pyenv init -)"' 

    # refresh
    source /etc/profile
    source ~/.zshrc

    # git clone pyenv virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    
    echo 'eval "$(pyenv virtualenv-init -)"' >> /etc/profile
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

    source /etc/profile
    source ~/.zshrc

    echo "pyenv is readly."
fi

## zsh
if [ -x "$(command -v zsh)" ]; then
    echo "zsh is readly."
else
    yum isntall -y zsh
fi
