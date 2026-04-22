return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { '<leader>i', function() Snacks.notifier.show_history() end, desc = 'Notifications history' },
  },
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
      wo = {
        wrap = true,
        linebreak = true,
        breakindent = true,
      },
    },
    input = {
      enabled = true,
    },
  },
}
