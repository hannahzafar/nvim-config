return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false
    },
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>c', group = '[C]odeCompanion' },
      { '<leader>t', group = '[T]erminal' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
