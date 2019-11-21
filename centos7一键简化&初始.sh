# 设置vi打开自动为set nu
cp ~/.vimrc ~/.vimrc.bak
echo set nu > ~/.vimrc
#alias rm='rm -i'
#alias cp='cp'
#alias mv='mv'
#alias ll='ls -l -h --time-style=long-iso'
#alias df='df -h'
#优化列出详细信息时的时间显示格式，大小带单位 alias ll='ls -l -h --time-style=long-iso' 
#如果不想用alias别名，可以在命令前加 \ 执行或者使用绝对路径 如：\cp 
cp ~/.bashrc ~/.bashrc.bak
echo -e "# .bashrc\n# User specific aliases and functions\nalias rm='rm -i'\nalias cp='cp'\nalias mv='mv'\nalias ll='ls -l -h --time-style=long-iso'\nalias df='df -h'\n# Source global definitions\nif [ -f /etc/bashrc ]; then\n  . /etc/bashrc\nfi" >~/.bashrc && source ~/.bashrc