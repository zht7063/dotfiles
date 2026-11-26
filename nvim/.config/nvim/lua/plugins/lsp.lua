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
      -- 启动时自动安装以下 LSP，安装后由 mason-lspconfig 自动启用（vim.lsp.enable）
      ensure_installed = {
        "pyright", -- Python
        "rust_analyzer", -- Rust
        "ts_ls", -- TypeScript / JavaScript
      },
    },
  },
}
