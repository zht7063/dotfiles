# Neovim 配置说明

本目录为 Neovim 配置（通过 GNU Stow 软链至 `~/.config/nvim`），使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 管理插件。

## 外部依赖

### 必需 / 强烈推荐

| 依赖 | 命令 | 用途 / 对应插件 |
| :--- | :--- | :--- |
| **Neovim** | `nvim` | 编辑器本体（建议 `>= 0.10`） |
| **Git** | `git` | `lazy.nvim` 下载与更新插件 |
| **ripgrep** | `rg` | `telescope.nvim` 全局文本搜索（`live_grep`、`grep_string`） |
| **fd** | `fd` | `telescope.nvim` 高速文件查找（`find_files`） |
| **Nerd Font** | - | `nvim-web-devicons`、`bufferline.nvim`、`snacks.nvim`、`render-markdown.nvim` 图标正常显示 |

### 可选依赖

| 依赖 | 命令 | 用途 / 对应插件 |
| :--- | :--- | :--- |
| **lazygit** | `lazygit` | `snacks.nvim` 快捷键 `<leader>gg` 打开 Lazygit |
| **构建与解压工具** | `curl` / `unzip` / `tar` / C 编译器 | `mason.nvim` 自动下载与安装各类 LSP 服务器 |

## 安装依赖（macOS / Homebrew）

```bash
# 基础与推荐依赖
brew install neovim git ripgrep fd

# 可选依赖
brew install lazygit
```

## 应用配置与同步插件

```bash
# 在仓库根目录软链 nvim 配置
stow -v -t "$HOME" --ignore='(?i)^readme\.md$' nvim

# 同步安装 lazy.nvim 插件
nvim --headless "+Lazy! sync" +qa
```
