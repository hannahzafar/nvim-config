return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Toggle state: 0 = filename only, 1 = relative path (default)
    local filename_path_mode = 1
    local lualine_x = {'encoding', 'fileformat', 'filetype'}

    local function require_lualine_setup(PATH_MODE, LUALINE_X)
      require('lualine').setup{
        options = {
          { globalstatus = true },
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
              path = PATH_MODE,
            }
          },
          lualine_x = LUALINE_X,
        }
      }
    end

    -- Function to toggle between full and simple lualine
    local function toggle_short_lualine()
      if filename_path_mode == 1 then
        filename_path_mode = 0
      else
        filename_path_mode = 1
      end

      local mode
      if filename_path_mode == 0 then
        mode = "SHORT"
        lualine_x = {'filetype'}
      else
        mode = "DEFAULT"
        lualine_x = {'encoding', 'fileformat', 'filetype'}
      end

      -- Update lualine configuration and notify
      require_lualine_setup(filename_path_mode, lualine_x)
      vim.notify("Lualine " .. mode .. " mode", vim.log.levels.INFO)
    end

    -- Create a command and keybinding to toggle
    vim.api.nvim_create_user_command('ToggleLualine', toggle_short_lualine, {})
    vim.keymap.set('n', '<leader>tl', toggle_short_lualine, {
      desc = '[T]oggle [l]ualine style',
      noremap = true,
      silent = true,
    })


    require_lualine_setup(filename_path_mode)

  end
}
