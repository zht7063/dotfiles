local opt = vim.opt

-- 1. 行号设置
opt.number = true              -- 显示绝对行号
opt.relativenumber = true      -- 显示相对行号（方便上下跳转）

-- 2. 缩进与 Tab 设置
opt.tabstop = 4                -- 一个 Tab 字符在视觉上占 4 个空格宽
opt.softtabstop = 4            -- 编辑时按 Tab 或 Backspace 视为 4 个空格
opt.shiftwidth = 4             -- 自动缩进（如 >>、<< 或回车缩进）使用 4 个空格
opt.expandtab = true           -- 将 Tab 转换为空格（若想保留真实 Tab 字符，请改为 false）
opt.smartindent = true         -- 换行时智能增加缩进

-- 3. 系统剪贴板互通
opt.clipboard = "unnamedplus"  -- 用 y/p 复制粘贴时直接同步系统剪贴板

-- 4. 搜索体验优化
opt.ignorecase = true          -- 搜索时默认忽略大小写
opt.smartcase = true           -- 如果搜索词里包含大写字母，则自动转为精确匹配大小写
opt.hlsearch = true            -- 高亮所有搜索匹配项
opt.incsearch = true           -- 输入搜索词时实时跳转预览

-- 5. 界面与滚动视觉优化
opt.cursorline = true          -- 高亮光标所在当前行，配合相对行号更容易定位
opt.scrolloff = 8              -- 上下滚动时，光标距离屏幕顶部/底部始终保留 8 行视野
opt.sidescrolloff = 8          -- 左右滚动时保留 8 列视野
opt.wrap = false               -- 关闭自动折行，长代码行横向滚动（需要折行时改为 true）
opt.signcolumn = "yes"         -- 始终显示左侧符号列（防止报错/Git 标记出现时画面左右抖动）
opt.termguicolors = true       -- 开启 24 位真彩色，确保现代主题与终端颜色还原准确

-- 6. 分屏与交互习惯
opt.splitright = true          -- 垂直分屏（:vsplit）时新窗口默认在右侧打开
opt.splitbelow = true          -- 水平分屏（:split）时新窗口默认在下方打开
opt.mouse = "a"                -- 允许所有模式下使用鼠标点击定位、滚轮滑动和调整分屏宽度
opt.updatetime = 250           -- 缩短空闲触发时间（默认 4000ms），悬停提示与状态更新更跟手

-- 7. 文件持久化与防干扰
opt.undofile = true            -- 开启持久化撤销（关闭文件再重新打开，依然可以按 u 撤销）
opt.swapfile = false           -- 关闭 .swp 交换文件，避免项目目录产生临时文件与冲突提示
opt.autoread = true            -- 文件在外部被修改（如 git 切换分支或 cargo fmt）时自动重载

-- 8. 实用快捷键
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "清除搜索高亮" })
