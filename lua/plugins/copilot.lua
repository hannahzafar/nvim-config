return {
  "zbirenbaum/copilot.lua",
  -- requires = {
  --   "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  -- },
  cmd = "Copilot",
  keys = {
    { "<leader>c" , "<cmd>Copilot<cr>" , desc = "Copilot AI" },
    { "<leader>tc", "<cmd>Copilot suggestion toggle_auto_trigger<cr>", desc = "[T]oggle [C]opilot Suggestions" },
  },

  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
    })
  end,

}
