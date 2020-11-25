root_path=$(
    cd "$(dirname "$0")" 
    pwd
)
script_path=$root_path"/script"

#fonts color
Green="\033[32m"
Red="\033[31m"
# Yellow="\033[33m"
GreenBG="\033[42;37m"
RedBG="\033[41;37m"
Font="\033[0m"

#notification information
# Info="${Green}[信息]${Font}"
OK="${Green}[OK]${Font}"
Error="${Red}[错误]${Font}"

# 判断操作系统
source '/etc/os-release' # 刷新系统标识
VERSION=$(echo "${VERSION}" | awk -F "[()]" '{print $2}')

check_system() {
    if [[ "${ID}" == "centos" && ${VERSION_ID} -ge 7 ]]; then
        echo -e "${OK} ${GreenBG} 当前系统为 Centos ${VERSION_ID} ${VERSION} ${Font}"
        INS="yum"
    elif [[ "${ID}" == "debian" && ${VERSION_ID} -ge 8 ]]; then
        echo -e "${OK} ${GreenBG} 当前系统为 Debian ${VERSION_ID} ${VERSION} ${Font}"
        INS="apt"
        $INS update
        ## 添加 Nginx apt源
    elif [[ "${ID}" == "ubuntu" && $(echo "${VERSION_ID}" | cut -d '.' -f1) -ge 16 ]]; then
        echo -e "${OK} ${GreenBG} 当前系统为 Ubuntu ${VERSION_ID} ${UBUNTU_CODENAME} ${Font}"
        INS="apt"
        $INS update
    else
        echo -e "${Error} ${RedBG} 当前系统为 ${ID} ${VERSION_ID} 不在支持的系统列表内，安装中断 ${Font}"
        exit 1
    fi
}

judge() {
    if [[ 0 -eq $? ]]; then
        echo -e "${OK} ${GreenBG} $1 完成 ${Font}"
        sleep 1
    else
        echo -e "${ERROR} ${RedBG} $1 失败 ${Font}"
        exit 1
    fi
}

init_install() {
    check_system
    # 安装前置软件
    $INS update -y
    $INS install -y wget git lsof zsh gcc
    judge "安装前置软件"

    if [[ "${ID}" == "centos" ]]; then
        $INS install -y epel-release openssl-devel mysql-devel bzip2-devel readline-devel sqlite-devel libffi-devel
        judge "centos 前置软件安装"
    fi

    # git 配置
    git config --global user.email "ryomahan1996@gmail.com"
    git config --global user.name "ryomahan"
    git config --global push.default simple
    judge "进行 git 默认配置"

    # 导入子模块
    git submodule init
    git submodule update

    # 安装 vim-plug
    cp ./.vimrc ~/.vimrc
    mkdir -p /root/.vim/autoload
    cd /root/.vim/autoload
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    judge "安装 vim-plug"

    # 切换到脚本目录
    cd $script_path

    # 安装 oh my zsh、nvm 和 pyenv
    sh ./ohmyzshinstall.sh
    sh ./nvminstall.sh
    judge "安装 oh my zsh 和 nvm"

    cd $root_path
    cp ./.zshrc-centos ~/.zshrc
    cp -r ./oh-my-zsh/custom/* ~/.oh-my-zsh/custom/

    if [ -x "$(command -v pyenv)" ]; then
        echo -e "${GreenBG} pyenv is readly. ${Font}"
        sleep 1
    else
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-vurtualenv
        source ~/.zshrc
        judge "安装 pyenv 和 pyenv-virtualenv"        
    fi

    # 安装 git cz
    nvm install --lts --latest-npm
    npm install -g commitizen cz-conventional-changelog
    echo '{"path": "cz-conventional-changelog"}' > ~/.czrc
    judge "安装 git cz"

    # 完成 tmux 配置
    if [ -x "$(command -V tmux)" ]; then
        cp .tmux.conf ~/.tmux.conf
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        bash ~/.tmux/plugins/tpm/bin/install_plugins
        judge "配置 tmux"
    else
        if [[ "${ID}" == "centos" ]]; then
            cd /root
            wget https://mirrors.aliyun.com/ius/ius-release-el7.rpm
            rpm -Uvh ius-release*rpm
            $INS install -y tmux2u
            judge "安装 tmux"
        fi
        cd $root_path
        cp .tmux.conf ~/.tmux.conf
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        bash ~/.tmux/plugins/tpm/bin/install_plugins
        judge "配置 tmux"
    fi
    cd $root_path
}

init_install
