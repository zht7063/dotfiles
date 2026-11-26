return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    -- 建议统一由 blink.cmp（blink-copilot 来源）在补全菜单中展示，
    -- 关闭 copilot.lua 自带的幽灵文本与面板，避免两套界面同时出现
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
}
