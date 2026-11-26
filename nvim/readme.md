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
| **Node.js** | `node` | `copilot.lua` 运行 GitHub Copilot 语言服务（需 `>= 18`），建议经 `blink-copilot` 出现在补全菜单中 |
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

## 常用操作：打开文件与切换 Buffer

> 提示：当前配置未修改 `vim.g.mapleader`，因此 `<leader>` 默认为 `\`（反斜杠），例如 `<leader>ff` 即按 `\ff`。

### 打开新文件 / 查找文件

- **Telescope 模糊查找**
  - `<leader>ff`：查找当前目录下的文件（`Telescope find_files`）
  - `<leader>fr`：查找最近打开过的文件（`Telescope oldfiles`）
  - `<leader>fg`：全局文本搜索并跳转到对应文件（`Telescope live_grep`）
- **Snacks 文件树**
  - `<leader>e`：打开 / 关闭侧边文件树（`Snacks.explorer()`），回车打开文件，在文件树内按 `a` 可新建文件
- **Neovim 原生命令**
  - `:e <文件路径>`：打开指定文件（若文件不存在，保存 `:w` 时会创建）
  - `:enew`：新建空白 Buffer（之后用 `:w <文件名>` 保存）
  - `:vs <文件路径>` / `:sp <文件路径>`：在右侧或下方分屏打开文件

### 切换与管理 Buffer

- **Bufferline 标签栏**
  - `Shift + h` / `Shift + l`（`<S-h>` / `<S-l>`）：切换到上一个 / 下一个 Buffer
  - `<leader>bp`：固定 / 取消固定当前 Buffer
  - `<leader>bo`：关闭其他所有 Buffer
  - 支持鼠标直接点击顶部标签栏切换（已开启 `mouse = "a"`）
- **Telescope Buffer 列表**
  - `<leader>fb`：列出所有已打开的 Buffer 并模糊搜索跳转
- **Harpoon 高频文件直达**
  - `<leader>ha`：将当前文件加入 Harpoon 列表
  - `<leader>hh`：打开 Harpoon 快捷菜单
  - `<leader>1` ~ `<leader>4`：直接跳转到列表第 1~4 个文件
  - `<leader>hp` / `<leader>hn`：切换到列表上 / 下一个文件
- **关闭与原生跳转**
  - `<leader>bd`：关闭当前 Buffer 而不破坏分屏布局（`Snacks.bufdelete()`）
  - `Ctrl + ^`（或 `Ctrl + 6`）：在最近两个 Buffer 之间来回切换

## 代码补全（blink.cmp）

使用 `blink.cmp` 的 `super-tab` 预设，补全来源为 Copilot（`blink-copilot`）、LSP、路径、代码片段与当前 Buffer 单词。

### 快捷键（插入模式）

| 快捷键 | 功能 |
| :--- | :--- |
| `<Tab>` | 接受当前补全项（菜单未打开时：在代码片段中跳到下一个占位符，否则输入 Tab） |
| `<S-Tab>` | 代码片段中跳回上一个占位符 |
| `<C-n>` / `<C-p>`、`↓` / `↑` | 选择下一项 / 上一项 |
| `<C-e>` | 取消补全 |
| `<C-space>` | 打开菜单 / 显示或隐藏文档 |
| `<C-b>` / `<C-f>` | 向上 / 向下滚动文档 |
| `<C-k>` | 显示 / 隐藏函数签名 |

## AI 补全（GitHub Copilot）

使用 `copilot.lua` 作为 Copilot 后端，并通过 [blink-copilot](https://github.com/fang2hou/blink-copilot) 将建议合并进 `blink.cmp` 补全菜单（菜单中带 Copilot 图标的条目，默认排在前面）。`copilot.lua` 自带的幽灵文本与面板已关闭，避免与补全菜单同时出现。

### 使用方式（插入模式）

- 与普通补全项相同：`<C-n>` / `<C-p>` 选择，`<Tab>` 接受（见上方 blink.cmp 快捷键）。
- Copilot 建议可能为多行代码，可按 `<C-space>` 查看文档预览完整内容。

### 常用命令

- `:Copilot auth`：登录 / 授权 GitHub 账号
- `:Copilot status`：查看运行与认证状态
- `:Copilot disable` / `:Copilot enable`：临时关闭 / 重新开启 Copilot
- `:checkhealth copilot`：检查 Node.js、语言服务与登录健康状态
