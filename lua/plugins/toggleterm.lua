return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    { "<leader>t", "<cmd>TermNew<CR>", desc = "Open new hsplit terminal" },
  },
  config = function()
    require("toggleterm").setup({
      size = 20,
    })
  end,
}

