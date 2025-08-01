return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false
    },
    spec = {
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>gB', group = 'Git [B]uffer', mode = { 'n', 'v' } },
      { '<leader>gt', group = 'Git [T]oggle', mode = { 'n', 'v' } },
      { '<leader>a', group = 'AI' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>l', group = 'lsp' },
      { '<leader>t', group = '[T]erminal' },
      { '<leader>p', group = '[P]aste special'},
      { '<leader>sb', group = 'Search[b]ox'}
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
