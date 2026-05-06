return {
  "folke/which-key.nvim",
  dependencies = {
    { 'nvim-mini/mini.nvim', version = '*' },
  },
  event = "VeryLazy",
  opts = {
    spec = {
      { '<leader>A', group = 'AI' },
      { '<leader>a', group = 'Alpha' , icon = {icon = '󰀫' , color= "orange"}},
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>gB', group = 'Git Buffer', mode = { 'n'} },
      { '<leader>gt', group = 'Git Toggle', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP', mode = { 'n', 'v' } },
      { '<leader>m', group = 'Marks & Bookmarks', icon = {icon = '󰸕' , color= "orange"}},
      { '<leader>n', group = 'NeoTree', icon = {icon = '󰙅' , color= "yellow"}},
      { '<leader>o', group = 'Todo', icon = {icon = '󰝖' , color= "purple"}},
      { '<leader>p', group = 'Paste special'},
      { '<leader>s', group = 'Search' , mode = { 'n', 'v' } },
      { '<leader>sb', group = 'Searchbox', mode = { 'n', 'v' } },
      { '<leader>t', group = 'Toggle' },
      { '<leader>,', group = 'Terminal' },
      { 'g', group = 'Go to'},
      { 'm', group = 'Marks & Bookmarks' , mode = { 'n'}}, -- This won't appear unless I go back from <leader> (doesn't work as a sequence?)
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
