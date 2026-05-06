-- Highlight todo, notes, etc in comments
return {
  "folke/todo-comments.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys  = {
    { "<leader>oq", ":TodoQuickFix<CR>", desc = "Todo quickfix list", silent = true},
    { "<leader>ol", ":TodoLocList<CR>", desc =  "Todo location list", silent = true},
    { "<leader>st", ":TodoTelescope<CR>", desc = "Search todo list" }
  }
}
