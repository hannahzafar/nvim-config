return {
    "goolord/alpha-nvim",
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    dependencies = { 'nvim-mini/mini.icons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "mini"
      require("alpha").setup(
        startify.config
      )
      -- keymap to open other than startup
      vim.keymap.set("n", "<leader>aS", ":split | Alpha<CR>", { desc = "Open hsplit" , silent = true })
      vim.keymap.set("n", "<leader>as", ":vsplit | Alpha<CR>", { desc = "Open vsplit" , silent = true })
    end,
  }
