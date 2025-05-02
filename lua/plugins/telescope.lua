return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope [F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope [F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope [F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags , { desc = 'Telescope [F]ind [H]elp tags' })
      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Telescope [F]ind [N]eovim files' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}


