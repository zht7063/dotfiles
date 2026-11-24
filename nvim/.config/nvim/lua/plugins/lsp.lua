return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- 如需自动安装指定 LSP，可取消注释并添加，例如：
      -- ensure_installed = { "lua_ls" },
    },
  },
}
