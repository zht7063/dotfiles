return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    -- 将 Copilot 建议作为补全来源合并进 blink.cmp 菜单
    "fang2hou/blink-copilot",
  },
  opts = {
    keymap = { preset = "super-tab" }, -- <Tab> 接受补全 / 片段跳转；<S-Tab> 片段回跳
    sources = {
      default = { "copilot", "lsp", "path", "snippets", "buffer" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
