# 依赖安装
yum install git zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel -y

# git clone pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# add environmental variables
echo "export PATH=$PATH:/root/.pyenv/bin" >> /etc/profile
echo 'eval "$(pyenv init -)"' >> /etc/profile

# refresh
source /etc/profile
