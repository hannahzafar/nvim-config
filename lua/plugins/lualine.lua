return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup{
      --    options = {
        --      theme = 'dracula'
        --    }
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
