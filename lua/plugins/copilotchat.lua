return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    keys = {
      { "<leader>ac", ":CopilotChatToggle<CR>", desc = "Toggle Copilot [C]hat" },
    }, opts = {
    },
  },
}
