## 重置步骤
0. 默认路由器科学上网
1. 登录 icloud 开启文件同步
3. 安装 homebrew
4. 通过 brew 安装命令行应用 tmux ffmpeg vim wget pyenv pyenv-virtualenv n nginx nmap htop openjdk tomcate 
5. 通过 brew 安装 GUI 应用 iterm2 google-chrome 1password karabiner-elements keka wechat qq eudic iina telegram xmind-zen wireshark jetbrains-toolbox neteasemusic baidunetdisk picgo thunder charles visual-studio-code mweb-pro istat-menus snipaste
6. 安装 oh-my-zsh
7. 安装其他应用：Adobe系列 Alfred4 Bartender4 Boom3D CleanMyMacX HazeOver HyperSwitch Magnet Moom NavicatPremium NetworkRadar  ParallelsDesktop Renamer SynologyDriveClient TotalFinder Xcode Jetbrains系列
8. 配置 ssh
9. 配置 git
 
## 软件管理

### 系统设置

#### 底层设置
0. 关闭 SIP
1. 删除系统自带输入法，仅保留搜狗输入法
2. 修改 SSH 端口和认证方式，只保留密钥认证

#### 常规设置
1. 总是显示 scroll bars
2. 默认浏览器设置为 GoogleChrome

#### 桌面和屏保
1. 桌面设置为随时间变换的小人跳舞
2. 触发角设置：左下启动台 | 右上消息中心 | 右下桌面

#### Dock 和 菜单
1. 将 Dock 固定在左侧
2. Dock 开启神奇缩放特效
3. Dock 开启选中缩放特效
4. Dock 开启最小化窗口到应用图标
5. Dock 开启跳动特效

#### 隐私和安全
1. 通过命令：`sudo spctl --master-disable`，开启任何来源

#### 鼠标
1. 鼠标滚轮方向取消滚动

#### 键盘
1. 撤销所有键盘快捷键
2. 将 Shift + <- 和 Shift + -> 设置为桌面切换 | Shift + ↑ 设置为 Mission Control 
3. 利用自动工具设置 control + f 为全局开启访达快捷键

#### 节能
1. 关闭自动息屏

### vim

修改 .zshrc 添加如下语句，代替系统自带 vim
export PATH=$HOME/bin:/usr/local/bin:$PATH

### iterm2
安装方式：`https://iterm2.com/downloads/stable/iTerm2-3_4_12.zip`

配置修改：
1. 关闭蜂鸣器
2. 更换个人配置
3. 关闭退出时提示

### google-chrome

配置修改：
1. 登录谷歌账号，开启账号同步

### keka

配置修改：
1. 解压后删除源文件
2. 在当前文件解压
3. 不立即打开解压文件
4. 作为默认压缩软件

### charles
配置修改：
1. 添加证书到系统信赖

软件激活：
Registered Name: 
macwk.com
License Key: 
7889D1B562B9AD34A7