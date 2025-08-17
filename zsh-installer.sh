#!/bin/bash

# 确保脚本在出错时退出
set -e

# 安装必要软件包
sudo apt-get update
sudo apt-get install -y zsh zsh-syntax-highlighting zsh-autosuggestions

# 修改默认shell为zsh
chsh -s /bin/zsh

# 自动处理 .zshrc 路径（兼容ZDOTDIR环境变量）
ZSHRC_FILE="${ZDOTDIR:-$HOME}/.zshrc"

# 添加插件配置（避免重复添加）
add_to_zshrc() {
    if ! grep -Fqs "$1" "$ZSHRC_FILE"; then
        echo "$1" >> "$ZSHRC_FILE"
    fi
}

add_to_zshrc "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
add_to_zshrc "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# 安装Powerlevel10k主题（如果目录不存在则克隆）
if [ ! -d "$HOME/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

add_to_zshrc "source ~/powerlevel10k/powerlevel10k.zsh-theme"

# 输出提示信息
echo -e "\n\033[32m安装完成！请执行以下操作：\033[0m"
echo "1. 完全退出当前终端"
echo "2. 重新登录后运行命令: exec zsh"
echo "3. 按提示配置Powerlevel10k主题"