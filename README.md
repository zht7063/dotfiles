# dotfiles

用来保存和同步配置文件的 dotfiles，适用于 GNU stow。

实现这份配置需要的软件包括：

zsh

tmux

Nrovim

# 同步方法

首先在 Linux 安装 stow：`sudo apt install stow`，然后将该仓库克隆到 home 目录下，然后执行下面的命令：

```shell
cd ~/dotfiles

stow tmux
stow zsh
stow nvim

```

然后就可以将其中的配置文件通过软链接的方式在 home 目录下创建快捷方式。
