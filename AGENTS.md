# AGENTS.md

本仓库使用 GNU Stow 管理个人 dotfiles。在协助用户配置、初始化或修改本仓库时，请遵循以下规则：

## 1. 配置前检查各目录的 `readme.md`
- 每次使用本仓库部署、初始化或排查某个模块的配置时，**必须先检查对应包目录（如 `nvim/`、`zsh/`、`ghostty/`、`starship/`、`fastfetch/`）下是否存在 `readme.md` / `README.md`**。
- 仔细阅读其中的外部依赖说明（如 CLI 工具、字体、运行时等），检查当前环境是否已安装这些依赖，并在需要时提示或协助用户安装。

## 2. 新增依赖时同步更新文档
- 为任意模块新增插件或配置时，如果引入了新的外部工具或系统依赖（例如 Telescope 依赖 `ripgrep` / `fd`，Snacks 的 `<leader>gg` 依赖 `lazygit`），应同步更新对应目录下的 `readme.md`。

## 3. GNU Stow 管理约定
- 根目录通过 [install.sh](./install.sh) 使用 `stow` 将各包目录软链到 `$HOME`。
- 各包目录下的 `readme.md` 仅用于文档说明，不应软链到 `$HOME`（`install.sh` 已配置忽略规则）。
