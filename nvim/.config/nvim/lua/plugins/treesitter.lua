-- nvim-treesitter（main 分支，全新重写版）：负责安装解析器与查询文件，
-- 高亮由 Neovim 内置的 vim.treesitter 提供，需要在 FileType 时手动启动。
-- 依赖：tree-sitter CLI（>= 0.26.1，通过 Homebrew 安装，勿用 npm）、tar、curl、C 编译器。
local parsers = {
  -- 编程语言
  "python",
  "rust",
  "typescript",
  "tsx",
  "javascript",
  "lua",
  "bash",
  -- 配置 / 数据格式
  "json",
  "toml",
  "yaml",
  -- Neovim 自身
  "vim",
  "vimdoc",
  "query",
  -- render-markdown.nvim 所需
  "markdown",
  "markdown_inline",
  "html",
  "latex",
  -- snacks.nvim 所需（picker 正则高亮、image 等）
  "regex",
  "css",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- 该插件不支持懒加载
  build = ":TSUpdate",
  config = function()
    -- 已安装的解析器会被跳过；安装为异步进行
    require("nvim-treesitter").install(parsers)

    -- 为所有存在解析器的文件类型开启 treesitter 高亮
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_treesitter_start", { clear = true }),
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
