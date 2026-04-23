return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Toggle state: 0 = filename only, 1 = relative path (default)
    local filename_path_mode = 1

    local function require_lualine_setup(PATH_MODE)
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
          lualine_x = {
            'fileformat', 'filetype'
          }
        }
      }
    end

    -- Function to toggle between filename only and relative path
    local function toggle_filename_path()
      if filename_path_mode == 1 then
        filename_path_mode = 0
      else
        filename_path_mode = 1
      end
      -- Update lualine configuration
      require_lualine_setup(filename_path_mode)


      -- Notify update
      local mode
      if filename_path_mode == 1 then
        mode = "ON"
      else
        mode = "OFF"
      end
      vim.notify("Toggle path " .. mode .. " in lualine" , vim.log.levels.INFO)
    end

    -- Create a command and keybinding to toggle
    vim.api.nvim_create_user_command('ToggleFilenamePath', toggle_filename_path, {})
    vim.keymap.set('n', '<leader>tp', toggle_filename_path, {
      desc = '[T]oggle [p]ath in lualine',
      noremap = true,
      silent = true,
    })


    require_lualine_setup(filename_path_mode)

  end
}
