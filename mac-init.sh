#!/bin/zsh
# version: 0.0.1
# author: ryomahan
# date: 2021-10-30 02:54:30
# main: ryomahan1996@gmail.com
# blog: https://blog.blanc.site
# desc: personal macOS init script

# 安装 homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安装 ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install tmux ffmpeg vim wget pyenv pyenv-virtualenv n nginx nmap htop openjdk tomcate 

brew install --cask google-chrome
brew install --cask 1password
brew install --cask karabiner-elements
brew install --cask keka
brew install --cask wechat
brew install --cask qq
brew install --cask eudic
brew install --cask iina
brew install --cask telegram
brew install --cask xmind-zen
brew install --cask wireshark
brew install --cask jetbrains-toolbox
brew install --cask neteasemusic
brew install --cask baidunetdisk
brew install --cask picgo
brew install --cask thunder
brew install --cask charles
brew install --cask visual-studio-code
brew install --cask mweb-pro
brew install --cask istat-menus
brew install --cask snipaste

npm install -g commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc