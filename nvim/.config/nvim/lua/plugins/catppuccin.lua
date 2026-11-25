return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    custom_highlights = function(colors)
      return {
        -- 适当提亮非当前行行号，同时保持低于当前行（lavender + bold）的视觉权重
        LineNr = { fg = colors.overlay1 },
        LineNrAbove = { fg = colors.overlay1 },
        LineNrBelow = { fg = colors.overlay1 },
        CursorLineNr = { fg = colors.lavender, bold = true },
      }
    end,
    integrations = {
      render_markdown = true,
      snacks = true,
      telescope = { enabled = true },
      harpoon = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
