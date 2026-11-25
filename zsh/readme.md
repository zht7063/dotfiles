# Zsh 配置说明

本目录为 Zsh 配置（通过 GNU Stow 软链至 `$HOME`），基于 [Oh My Zsh](https://ohmyz.sh/) 管理插件，Prompt 由 [Starship](https://starship.rs/) 接管。

## 常用 Git 快捷命令

当前 `.zshrc` 启用了 Oh My Zsh 的 `git` 插件（`plugins=(git)`），提供以下常用 Git 别名（完整定义位于 `~/.oh-my-zsh/plugins/git/git.plugin.zsh`，也可在终端执行 `alias | grep '^g'` 查看）：

### 状态与差异查看

| 快捷命令 | 对应 Git 命令 | 说明 |
| :--- | :--- | :--- |
| `gst` | `git status` | 查看工作区状态 |
| `gss` | `git status --short` | 精简格式查看状态 |
| `gsb` | `git status --short --branch` | 精简格式并显示分支信息 |
| `gd` | `git diff` | 查看未暂存的修改 |
| `gds` / `gdca` | `git diff --staged` / `git diff --cached` | 查看已暂存的修改 |

### 暂存与提交

| 快捷命令 | 对应 Git 命令 | 说明 |
| :--- | :--- | :--- |
| `ga` | `git add` | 添加指定文件到暂存区 |
| `gaa` | `git add --all` | 添加所有修改（含未跟踪文件） |
| `gapa` | `git add --patch` | 交互式逐块暂存 |
| `gc` | `git commit --verbose` | 提交并打开编辑器（附带 diff） |
| `gca` | `git commit --verbose --all` | 暂存所有已跟踪修改并提交 |
| `gcmsg` | `git commit --message` | 直接带提交信息提交（如 `gcmsg "msg"`） |
| `gcam` | `git commit --all --message` | 暂存所有已跟踪修改并直接提交 |
| `gc!` | `git commit --verbose --amend` | 修改最近一次提交 |
| `gcan!` | `git commit --verbose --all --no-edit --amend` | 将修改追加到最近一次提交且不改 commit 信息 |

### 分支与切换

| 快捷命令 | 对应 Git 命令 | 说明 |
| :--- | :--- | :--- |
| `gb` | `git branch` | 列出本地分支 |
| `gba` | `git branch --all` | 列出本地及远程分支 |
| `gbd` / `gbD` | `git branch --delete` / `--force` | 删除本地分支（安全/强制） |
| `gco` | `git checkout` | 切换分支或检出文件 |
| `gcb` | `git checkout -b` | 创建并切换到新分支 |
| `gcm` / `gcd` | `git checkout $(git_main_branch)` / `$(git_develop_branch)` | 切回主分支（main/master）或开发分支 |
| `gsw` | `git switch` | 切换分支 |
| `gswc` | `git switch --create` | 创建并切换分支 |
| `gswm` / `gswd` | `git switch $(git_main_branch)` / `$(git_develop_branch)` | 切回主分支或开发分支 |

### 拉取、推送与同步

| 快捷命令 | 对应 Git 命令 | 说明 |
| :--- | :--- | :--- |
| `gf` / `gfa` | `git fetch` / `git fetch --all --tags --prune` | 拉取远程更新（`gfa` 会清理已失效远程分支） |
| `gl` | `git pull` | 拉取并合并 |
| `gpr` / `gpra` | `git pull --rebase` / `--autostash` | 以 rebase 方式拉取（`gpra` 会自动 stash 本地改动） |
| `gp` | `git push` | 推送当前分支 |
| `gpsup` | `git push --set-upstream origin $(git_current_branch)` | 首次推送新分支并绑定上游 |
| `gpf` | `git push --force-with-lease`（Git ≥ 2.30 含 `--force-if-includes`） | 安全的强制推送 |
| `gpf!` | `git push --force` | 无条件强制推送 |

### 日志、合并、变基与回退

| 快捷命令 | 对应 Git 命令 | 说明 |
| :--- | :--- | :--- |
| `glo` | `git log --oneline --decorate` | 单行简洁日志 |
| `glog` / `gloga` | `git log --oneline --decorate --graph`（`gloga` 含 `--all`） | 图形化单行日志 |
| `glol` / `glola` | 带作者、相对时间与分支图的彩色日志 | 常用详细图形日志 |
| `gm` / `gma` / `gmc` | `git merge` / `--abort` / `--continue` | 合并分支 / 中止 / 继续 |
| `grb` / `grbi` | `git rebase` / `git rebase --interactive` | 变基 / 交互式变基 |
| `grba` / `grbc` | `git rebase --abort` / `--continue` | 中止 / 继续变基 |
| `grs` / `grst` | `git restore` / `git restore --staged` | 丢弃工作区修改 / 取消暂存 |
| `grh` / `grhh` | `git reset` / `git reset --hard` | 重置 HEAD（`grhh` 会清空工作区改动） |
| `gcp` | `git cherry-pick` | 拣选提交 |

### Stash 与实用小工具

| 快捷命令 | 对应 Git 命令 | 说明 |
| :--- | :--- | :--- |
| `gsta` / `gstu` | `git stash push` / `gsta --include-untracked` | 暂存当前改动（`gstu` 包含未跟踪文件） |
| `gstp` / `gstaa` | `git stash pop` / `git stash apply` | 恢复暂存（`pop` 会移除 stash 记录） |
| `gstl` / `gsts` | `git stash list` / `git stash show --patch` | 查看 stash 列表 / 改动详情 |
| `grt` | `cd "$(git rev-parse --show-toplevel \|\| echo .)"` | 快速跳转到当前 Git 仓库根目录 |
| `gwip` / `gunwip` | 创建 `--wip--` 临时提交 / 撤销最近一次 `--wip--` 提交 | 临时保存工作进度 |
