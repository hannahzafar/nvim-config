return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup{
      options = {
        -- Set theme to dracula with minor change
        theme = function()
          local dracula = require('lualine.themes.dracula')
          -- Set terminal mode to have the same appearance as insert mode
          dracula.terminal = vim.deepcopy(dracula.insert)
          return dracula
        end,
      },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {
            {
              'lsp_status',
              -- List of LSP names to ignore (e.g., `null-ls`):
              --ignore_lsp = {'null-ls'},
            },
            'encoding', 'fileformat', 'filetype'
          }
        }
      }
  end
}
