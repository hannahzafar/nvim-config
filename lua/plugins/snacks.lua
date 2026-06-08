return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {"/",
      function() 	Snacks.picker.lines({ 
        matcher = {fuzzy = false },
        layout = {
          title = "Buffer Lines",
          position = "bottom",     -- Anchors the popup near the bottom
          width = 0.6,             -- Takes up 60% of the screen width
          height = 10,             -- Only 10 lines tall maximum
          border = "rounded",
          box = "vertical",
        }
      })
      end,
      desc = "Buffer Exact Search" }, -- Substitute native forward search with Snacks lines picker
    { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Buffer delete' },
    { '<leader>i', function() Snacks.notifier.show_history() end, desc = 'Notifications history' },
    { "<leader>d", function() vim.cmd("vsplit")
Snacks.dashboard() end, desc = "Open Dashboard vsplit" },
    { "<leader>D", function() vim.cmd("split")
Snacks.dashboard() end, desc = "Open Dashboard in hsplit" },
    {'<leader>gb', function() Snacks.git.blame_line() end,  desc = 'Git [b]lame line' },
    {'<leader>gg', function() Snacks.lazygit() end,  desc = 'Lazygit' },
    -- { "<leader>gh", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    -- { "<leader>gi", function() Snacks.lazygit.log() end, desc = "Lazygit Log" },
    {'<leader>gl', function() Snacks.picker.git_log_file() end,  desc = 'Git [l]og file' },
    {'<leader>z', function() Snacks.zen() end,  desc = 'Zen mode' },
  },
  opts = {
    bigfile = { enabled = true },

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
          height = 4,
          padding = 1,
          ttl = 60,
          indent = 3,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        },
      },
    -- Git blame line
    git = { enabled = true},
    -- Replace indent
    indent = { enabled = true },
    -- UI popups
    input = {
      enabled = true,
    },
    lazygit = { enabled = true },
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
    quickfile = { enabled = true },
    zen = {
      enabled = true,
    }
  },
}
