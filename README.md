# dotfiles

用来保存和同步配置文件的 dotfiles，适用于 GNU stow。

实现这份配置需要的软件包括：

zsh: `sudo apt install zsh`

tmux：`sudo apt install tmux`

Neovim：参考官网说明文档。

# 快速构建 Debian 系统

既然是配置文件，那么在文档里面也记录好如何快速构建一个可行的 Debian 系统。

下面是快速安装不同软件的方式，可以直接复制粘贴到 shell 中执行。

```shell
# 安装基本软件
sudo apt install git curl wget fuse tmux zsh
```

然后将该仓库克隆到 home 路径下面：

``` shell
git clone https://github.com/zht7063/dotfiles.git
```
#TODO：构建系统方法还没有写完。

# 同步方法

首先在 Linux 安装 stow：`sudo apt install stow`，然后将该仓库克隆到 home 目录下，然后执行下面的命令：

```shell
cd ~/dotfiles

stow tmux
stow zsh
stow nvim

```

然后就可以将其中的配置文件通过软链接的方式在 home 目录下创建快捷方式。
