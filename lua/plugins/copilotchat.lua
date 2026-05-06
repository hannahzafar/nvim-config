return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    keys = {
      { "<leader>Ac", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
    }, opts = {
    },
  },
}
