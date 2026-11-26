return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = { preset = "super-tab" }, -- <Tab> 接受补全 / 片段跳转；<S-Tab> 片段回跳
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
