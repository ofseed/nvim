---@type LazyPluginSpec
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  enabled = false,
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatStop",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
  },
  opts = {},
}
