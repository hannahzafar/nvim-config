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
      vim.keymap.set("n", "<leader>n", ":Alpha<CR>", { desc = "[N]eovim dashboard" })
      vim.keymap.set("n", "<leader>N", ":vsplit | Alpha<CR>", { desc = "[N]eovim dashboard split" })
    end,
  }
