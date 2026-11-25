return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "切换到上一个 Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "切换到下一个 Buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "固定/取消固定当前 Buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "关闭其他 Buffer" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      separator_style = "thin",
    },
  },
}
