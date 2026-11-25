# Yazi 配置说明

本目录为 [Yazi](https://yazi-rs.github.io/) 终端文件管理器配置（通过 GNU Stow 软链至 `~/.config/yazi`），使用 `ya pkg` 管理插件。

## 已启用插件

- [`git.yazi`](https://github.com/yazi-rs/plugins/tree/main/git.yazi)（`yazi-rs/plugins:git`）：在文件列表旁显示 Git 状态标记

## 外部依赖

| 依赖 | 命令 | 用途 / 对应插件 |
| :--- | :--- | :--- |
| **Yazi** | `yazi` / `ya` | 文件管理器本体与内置包管理器 |
| **Git** | `git` | `ya pkg` 安装更新插件，以及 `git.yazi` 获取仓库状态 |
| **Nerd Font** | - | 图标与 Git 状态符号正常显示 |

## 安装依赖（macOS / Homebrew）

```bash
brew install yazi git
```

## 应用配置与同步插件

```bash
# 在仓库根目录软链 yazi 配置
stow -v -t "$HOME" --ignore='(?i)^readme\.md$' yazi

# 根据 package.toml 安装插件
ya pkg install
```
