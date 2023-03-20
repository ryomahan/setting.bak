## Overview

Self-use system initialization script and software config file backup.

unix-init.sh: using on most unix system

mac-init.sh: using on macOS

## Feature

* auto install tmux;
* auto install git commit plug;
* auto install zsh and oh my zsh;
* provide zshrc, vimrc and tmux.config;
* auto install Node version management n and install lst node;
* auto install Python version management pyenv and pyenv-virtualenv;

## How to Use

```shell
git clone https://github.com/ryomahan/setting.bak.git
cd setting.bak
chmod +x ./unix-init.sh
./unix-init.sh
vim
:PlugInstall
# then exit and relogin
```

## To Do List:

- [x] vim config file

- [x] zsh config file

- [x] tmux config file

- [x] oh-my-zsh custom theme file

- [x] centos7 init
  
- [x] ubuntu init

- [ ] 快速启动项目脚手架
    - [ ] Django + DRF | RBAC Settings 
    - [ ] FastAPI | ORM RBAC Settings
    - [ ] Vue
    - [ ] Taro
    - [ ] React
    - [ ] Next.js

- [ ] 基础能力库
    - [ ] Wechat | service pay
    - [ ] axios everywhere