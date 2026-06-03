return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { '<leader>i', function() Snacks.notifier.show_history() end, desc = 'Notifications history' },
    {"/", function() Snacks.picker.lines({ layout = { preset = "ivy"} }) end,  desc = "Buffer Snacks Search" },-- Substitute native forward search with Snacks lines picker
    { "<leader>d", function() vim.cmd("vsplit"); Snacks.dashboard() end, desc = "Open Dashboard vsplit" },
    { "<leader>D", function() vim.cmd("split"); Snacks.dashboard() end, desc = "Open Dashboard in hsplit" },
    {'<leader>gb', function() Snacks.git.blame_line() end,  desc = 'Git [b]lame line' },
    {'<leader>gl', function() Snacks.picker.git_log_file() end,  desc = 'Git [l]og file' },
    {'<leader>z', function() Snacks.zen() end,  desc = 'Zen mode' },
  },
  opts = {
    -- Git blame line
    git = { enabled = true},

    -- Replace alpha
    dashboard = {
        sections = {
        { section = "header" },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        },
      },
    -- Replace nvim-notify
    notifier = {
      enabled = true,
      timeout = 3000,
      wo = {
        wrap = true,
        linebreak = true,
        breakindent = true,
      },
    },
    -- Picker for search
    picker = {
      enabled = true,
      win = {
        input = { wo = {winbar = ""} },
        list = { wo = {winbar = ""} },
        preview = { wo = {winbar = ""} },
      },
    },
    -- UI popups
    input = {
      enabled = true,
    },
    zen = {
      enabled = true,
    }
  },
}
