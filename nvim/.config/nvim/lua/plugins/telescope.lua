return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "全局文本搜索" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "查找已打开 Buffer" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "查找帮助文档" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "查找最近打开的文件" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "查找诊断信息" },
  },
  opts = {
    defaults = {
      path_display = { "smart" },
    },
  },
}
