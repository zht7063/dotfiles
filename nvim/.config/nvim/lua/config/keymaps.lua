vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    -- 跳转到定义
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- 查看悬停文档
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- 代码修复/重构建议
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    -- 全局重命名符号
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    -- 查看当前行报错信息
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  end,
})
