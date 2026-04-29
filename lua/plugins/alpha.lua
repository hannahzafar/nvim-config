return {
    "goolord/alpha-nvim",
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
      vim.keymap.set("n", "<leader>dS", ":split | Alpha<CR>", { desc = "Dashboard open hsplit" , silent = true })
      vim.keymap.set("n", "<leader>ds", ":vsplit | Alpha<CR>", { desc = "Dashboard open vsplit" , silent = true })
    end,
  }
