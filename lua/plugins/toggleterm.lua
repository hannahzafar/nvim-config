return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    { "<C-\\>",    "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    { "<leader>h", "<cmd>TermNew<CR>",    desc = "Open new [h]split terminal" },
  },
  config = function()
    require("toggleterm").setup({
      size = 20,
    })
  end,
}
