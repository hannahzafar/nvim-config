return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false
    },
    spec = {
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      { '<leader>gB', group = 'Git [B]uffer', mode = { 'n', 'v' } },
      { '<leader>gt', group = 'Git [T]oggle', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>l', group = '[L]SP', mode = { 'n', 'v' } },
      { '<leader>a', group = 'AI' },
      { '<leader>d', group = '[D]ashboard' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>p', group = '[P]aste special'},
      { '<leader>sb', group = 'Search[b]ox'},
      { '<leader>o', group = 'T[o]dos'},
      { 'g', group = '[G]oto'},
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
