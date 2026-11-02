return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true, -- Automatically start autocomplete suggestions
      debounce = 75,
      keymap = {
        accept = "<C-y>",
        accept_word = false,
        accept_line = false,
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-d>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      ["."] = false,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}

