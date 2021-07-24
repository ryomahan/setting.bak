#!/bin/bash
# version: 0.3.2
# author: ryomahan
# date: 2019-09-03 02:54:30
# main: ryomahan1996@gmail.com
# blog: https://blog.blanc.site
# desc: personal os init script

# base variable
readonly CURRENT_USER=$(whoami)

if [[ ${CURRENT_USER} == "root" ]]; then
    readonly HOME_PATH="/root"
else
    readonly HOME_PATH="/home/"${CURRENT_USER}
fi

readonly SCRIPT_ROOT_PATH=$(
    cd $(dirname ${0})
    pwd
)

readonly SCRIPT_PATH=${SCRIPT_ROOT_PATH}"/script"

## fonts color
readonly RED="\033[31m"
readonly FONT="\033[0m"
readonly GREEN="\033[32m"
readonly YELLOW="\033[33m"
readonly RED_BG="\033[41;37m"
readonly GREEN_BG="\033[42;37m"

## notification information
INFO="${GREEN}[info]${FONT}"
OK="${GREEN}[success]${FONT}"
ERROR="${RED}[wrong]${FONT}"

# Judging the operating system
source '/etc/os-release' # refresh operating system identifier
VERSION=$(echo ${VERSION} | awk -F "[()]" '{print $2}')

check_system() {
    if [[ ${ID} == "centos" && ${VERSION_ID} -ge 7 ]]; then
        echo -e "${OK} ${GREEN_BG} Current system is Centos ${VERSION_ID} ${VERSION} ${FONT}"
        INS="yum"
    elif [[ ${ID} == "debian" && ${VERSION_ID} -ge 8 ]]; then
        echo -e "${OK} ${GREEN_BG} Current system is Debian ${VERSION_ID} ${VERSION} ${FONT}"
        INS="apt"
    elif [[ ${ID} == "ubuntu" && $(echo ${VERSION_ID} | cut -d '.' -f1) -ge 16 ]]; then
        echo -e "${OK} ${GREEN_BG} Current system is Ubuntu ${VERSION_ID} ${UBUNTU_CODENAME} ${FONT}"
        INS="apt"
    else
        echo -e "${ERROR} ${RED_BG} Current system is ${ID} ${VERSION_ID} 不在支持的系统列表内，安装中断 ${FONT}"
        exit 1
    fi
}

judge() {
    if [[ 0 -eq $? || $2 ]]; then
        echo -e "${OK} ${GREEN_BG} $1 success ${FONT}"
        sleep 1
    else
        echo -e "${ERROR} ${RED_BG} $1 error ${FONT}"
        exit 1
    fi
}

init_install() {
    check_system
    # 安装通用前置软件
    sudo $INS update -y
    sudo $INS upgrade -y
    judge "update and upgrade system"
    sudo $INS install -y curl wget git lsof zsh gcc make tar
    judge "install base packages"

    # 根据系统安装前置软件
    if [[ ${ID} == "centos" ]]; then
        sudo $INS install -y epel-release openssl-devel mysql-devel bzip2-devel readline-devel sqlite-devel libffi-devel
        judge "${ID} install centos's base packages"
    elif [[ ${ID} == "ubuntu" ]]; then
        sudo $INS install -y  build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
        judge "${ID} install ubuntu's base packages"
    fi

    # git 配置
    git config --global user.email "ryomahan1996@gmail.com"
    git config --global user.name "ryomahan"
    git config --global push.default simple
    git config --global --unset https.proxy 
    git config --global --unset http.proxy 
    judge "set git default config" 1

    # 安装 oh my zsh
    if [ -d ${ZSH} ]; then
        echo -e "${GREEN_BG} oh my zsh is readly. ${FONT}"
        sleep 1 
    else
        cd $SCRIPT_PATH
        sh ./ohmyzshinstall.sh
        judge "install oh my zsh"
    fi

    cd ${SCRIPT_ROOT_PATH}
    # 安装 nodejs 版本控制器 n
    if [ -x "$(command -v n)" ]; then
        echo -e "${GREEN_BG} Node.js version controller n is readly. ${FONT}"
        sleep 1
    else
        if [ -d ${HOME_PATH}"/n" ]; then
            echo -e "${GREEN_BG} Node.js version controller n is readly. ${FONT}"
        else
            curl -L https://git.io/n-install | bash
            judge "install Node.js version controller n"
        fi
    fi

    # 安装最新稳定版本 nodejs
    if [ -x "$(command -v node)" ]; then
        n latest
        sleep 1
    else
        echo -e "${GREEN_BG} latest nodejs is readly. ${FONT}"
    fi

    # 安装 python 版本控制器 pyenv
    if [ -x "$(command -v pyenv)" ]; then
        echo -e "${GREEN_BG} pyenv is readly. ${FONT}"
        sleep 1
    else
        if [ -d ${HOME_PATH}"/.pyenv" ]; then
            echo -e "${GREEN_BG} ${HOME_PATH}/.pyenv is readly. ${FONT}"
        else
            git config --global --unset https.proxy 
            git config --global --unset http.proxy 
            git clone https://github.com/pyenv/pyenv.git ${HOME_PATH}/.pyenv
            judge "install pyenv"
        fi
    fi

    # 安装 pyenv 插件 pyenv-virtualenv
    if [ -x "$(command -v pyenv virtualenvs)" ]; then
        echo -e "${GREEN_BG} pyenv-virtualenv is readly. ${FONT}"
        sleep 1
    else
        if [ -d "${HOME_PATH}/.pyenv/plugins/pyenv-vurtualenv" ]; then
            echo -e "${GREEN_BG} ${HOME_PATH}/.pyenv/plugins/pyenv-vurtualenv is readly. ${FONT}"
        else
            git config --global --unset https.proxy 
            git config --global --unset http.proxy 
            git clone https://github.com/pyenv/pyenv-virtualenv.git ${HOME_PATH}/.pyenv/plugins/pyenv-vurtualenv
            judge "install pyenv-virtualenv"
        fi

    fi

    # 安装 Python 3.8.9 作为默认版本
    # pyenv install 3.8.9
    # pyenv global 3.8.9
    # pyenv shell 3.8.9
    # pyenv local 3.8.9

    # 导入脚本子模块（oh my zsh 插件）
    git submodule init
    git config --global --unset https.proxy 
    git config --global --unset http.proxy 
    git submodule update
    judge "setting.bak submodule (oh my zsh plug) import"
    
    # 同步 oh my zsh 配置文件
    cd ${SCRIPT_ROOT_PATH}
    cp -r ./oh-my-zsh/custom/* ${HOME_PATH}/.oh-my-zsh/custom/
    cp ./.zshrc ${HOME_PATH}/.zshrc
    judge "oh my zsh 配置同步"

    # 安装 git cz
    npm install -g commitizen cz-conventional-changelog
    echo '{"path": "cz-conventional-changelog"}' > ${HOME_PATH}/.czrc
    judge "安装 git cz"

    # 安装 vim-plug
    cp ./.vimrc ${HOME_PATH}/.vimrc
    if [ -d "${HOME_PATH}/.vim/autoload" ]; then
        mkdir -p ${HOME_PATH}/.vim/autoload
    fi
    if [ -s "${HOME_PATH}/.vim/autoload/plug.vim" ]; then
        echo -e "${GREEN_BG} vim plug controller vim-plug is readly. ${FONT}"
    else
        cd ${HOME_PATH}/.vim/autoload
        wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        judge "install vim plug controller vim-plug"
    fi

    # 完成 tmux 配置
    if [ -x "$(command -v tmux)" ]; then
        cp .tmux.conf ${HOME_PATH}/.tmux.conf
        if [ -d "${HOME_PATH}/.tmux/plugins/tpm" ]; then
            echo -e "${GREEN_BG} tmux plug controller tpm is readly. ${FONT}"
        else
            git config --global --unset https.proxy 
            git config --global --unset http.proxy 
            git clone https://github.com/tmux-plugins/tpm ${HOME_PATH}/.tmux/plugins/tpm
            bash ${HOME_PATH}/.tmux/plugins/tpm/bin/install_plugins
            judge "install tmux plug controller tpm"
        fi
    else
        if [[ ${ID} == "centos" ]]; then
            cd ${HOME_PATH}
            wget https://mirrors.aliyun.com/ius/ius-release-el7.rpm
            rpm -Uvh ius-release*rpm
            sudo $INS install -y tmux2u
            judge "安装 tmux"
        elif [[ ${ID} == "ubuntu" ]]; then
            sudo $INS install -y tmux
        fi
        cd ${SCRIPT_ROOT_PATH}
        cp .tmux.conf ${HOME_PATH}/.tmux.conf
        if [ -d "${HOME_PATH}/.tmux/plugins/tpm" ]; then
            echo -e "${GREEN_BG} tmux plug controller tpm is readly. ${FONT}"
        else
            git config --global --unset https.proxy 
            git config --global --unset http.proxy 
            git clone https://github.com/tmux-plugins/tpm ${HOME_PATH}/.tmux/plugins/tpm
            bash ${HOME_PATH}/.tmux/plugins/tpm/bin/install_plugins
            judge "install tmux plug controller tpm"
        fi
    fi
    cd ${SCRIPT_ROOT_PATH}

    # 启用 zsh
    echo -e "${GREEN_BG} init script is executed successfully, zsh is being started... ${FONT}"
    sleep 3
    source ${HOME_PATH}/.zshrc
    if [[ ${SHELL} == "/bin/zsh" ]]; then
        sleep 1
    else
        sudo usermod -s /bin/zsh ${CURRENT_USER}
    fi
}

init_install
