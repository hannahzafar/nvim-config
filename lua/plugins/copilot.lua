return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  cmd = "Copilot",
  keys = {
    { "<leader>c" , "<cmd>Copilot<cr>" , desc = "Copilot AI" },
    { "<leader>tc", "<cmd>Copilot suggestion toggle_auto_trigger<cr>", desc = "[T]oggle [C]opilot Suggestions" },
  },

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
