# Dotfiles

用来保存和同步配置文件的 dotfiles，适用于 GNU stow。

实现这份配置需要的软件包括：

zsh: `sudo apt install zsh`

tmux：`sudo apt install tmux`

Neovim：参考官网说明文档。

# 快速构建 Debian 系统

既然是配置文件，那么在文档里面也记录好如何快速构建一个可行的 Debian 系统。

下面是快速安装不同软件的方式，可以直接复制粘贴到 shell 中执行。

---

1. 更新 apt 并安装必备软件

```shell
sudo apt update 
sudo apt upgrade -y 
sudo apt install -y \
    git curl wget fuse tmux zsh build-essential stow
```

2. 配置本地 Git

```shell
git config --global user.name "zht"
git config --global user.email "zht7063@163.com"
ssh-keygen -t ed25519 -C "zht7063@163.com"
```

配置好以后记得到 github 添加 ssh 公钥。配置好之后可以使用 `ssh -T git@github.com` 检查连接情况。

4. 安装 oh-my-zsh

```shell
sh -c \
"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

omz 安装好以后，会提示将默认 shell 切换到 zsh，如果没有切换，可以使用命令 `chsh -s $(which zsh)` 实现。

5. 安装 Neovim

```shell
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage # Install Neovim appimage
chmod u+x nvim-linux-x86_64.appimage # Make it executable

sudo mkdir -p /opt/nvim # Create directory for Neovim 
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim # Move Neovim to /opt/nvim

```

Neovim 的环境变量将会在本仓库的 zsh 配置文件中标记，所以可以忽略环境变量的步骤，如果有必要的话，向 `.bashrc` 或者 `.zshrc` 中追加内容 `export PATH="$PATH:/opt/nvim/"` 可以直接添加环境变量。

> 由于不可描述的原因，Neovim 的配置文件无法直接用 stow 创建软链接，于是决定采用单独仓库对其进行存储。设计好之后会在这里补充相关内容。

6. 应用本仓库的配置文件

克隆本仓库到 home 目录

```shell
git clone https://github.com/zht7063/dotfiles.git
```

或者使用 ssh 的方式克隆：

```shell
git clone git@github.com:zht7063/dotfiles.git
```

删除原始文件：

```shell
rm ~/.zshrc
rm ~/.tmux.conf

rm -rf ~/.config/nvim

```
然后同步本仓库中的文件：

```shell
cd ~/.dotfiles

stow tmux
stow zsh
stow nvim

```
然后就可以将其中的配置文件通过软链接的方式在 home 目录下创建快捷方式。

---

