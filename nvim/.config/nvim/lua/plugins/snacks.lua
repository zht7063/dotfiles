return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "打开/关闭文件树" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "关闭当前 Buffer" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "打开 Lazygit" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "查看通知历史" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "清除所有通知" },
    { "<C-/>", function() Snacks.terminal() end, desc = "切换浮动终端" },
  },
}
