return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
      -- keymap to open other than startup
      vim.keymap.set("n", "<leader>d", ":Alpha<CR>", { desc = "[d]ashboard" })
      vim.keymap.set("n", "<leader>D", ":vsplit | Alpha<CR>", { desc = "[D]ashboard split" })
    end,
  }
