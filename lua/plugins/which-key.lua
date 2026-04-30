return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false
    },
    spec = {
      { '<leader>a', group = 'AI' },
      { '<leader>d', group = '[D]ashboard' },
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      { '<leader>gB', group = 'Git [B]uffer', mode = { 'n', 'v' } },
      { '<leader>gt', group = 'Git [T]oggle', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]SP', mode = { 'n', 'v' } },
      { '<leader>m', group = '[M]arks & Bookmarks' },
      { '<leader>o', group = 'T[o]dos'},
      { '<leader>p', group = '[P]aste special'},
      { '<leader>s', group = '[S]earch' },
      { '<leader>sb', group = 'Search[b]ox'},
      { '<leader>t', group = '[T]oggle' },
      { 'g', group = '[G]oto'},
      { 'm', group = '[M]arks & Bookmarks' , mode = { 'n'}}, -- This won't appear unless I go back from <leader> (doesn't work as a sequence?)
      { 'z', group = 'Folding'},
    },
    sort = { "group"},
  },
  keys = {
    {
      "?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "All keymaps (which-key)",
    },
    {
      "<leader>!",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
