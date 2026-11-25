return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", ft = "markdown", desc = "切换 Markdown 渲染" },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- 与已安装的 blink.cmp 集成，支持 callout、复选框等 Markdown 补全
    completions = {
      blink = { enabled = true },
    },
  },
}
