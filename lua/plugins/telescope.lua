return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      local actions = require('telescope.actions')
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = {
              ['<C-d>'] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,     -- "dd" in normal mode
              ["S"] = actions.select_horizontal,
              ["s"] = actions.select_vertical,
            },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      -- local telescope_icon = {icon ="󰭎", color = "azure"} #TODO: Have to move all keymaps to keys = {} to insert custom icon per mapping
      -- Git telescope keymaps
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current word/selection' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })


      vim.keymap.set('n', '<leader>gA', builtin.git_status, { desc = 'Git status (Telescope)' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits (Telescope)' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git files (Telescope)' })

      -- Fuzzy finder with custom display
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Fuzzily search in current buffer' })

      -- Show the current working directory in the title of the Telescope prompt
      vim.keymap.set('n', '<leader>sg', function()
        -- Get the current working directory
        local current_dir = vim.fn.getcwd()
        -- Shorten it for cleaner display (optional)
        local function format_telescope_cwd(path, keep_count)
          local short = vim.fn.fnamemodify(path, ":~")
          local parts = vim.split(short, "/", { trimempty = true })

          -- If the path is short already, leave it alone
          if #parts <= keep_count + 1 then return short end

          -- Shrink everything except the last N components
          for i = 1, (#parts - keep_count) do
            -- Don't shrink the '~' if it's the first element
            if parts[i] ~= "~" then
              parts[i] = string.sub(parts[i], 1, 1)
            end
          end

          -- Reconstruct the path (add leading slash back if it was an absolute root path)
          local prefix = string.sub(short, 1, 1) == "/" and "/" or ""
          return prefix .. table.concat(parts, "/")
        end

        require('telescope.builtin').live_grep({
          prompt_title = "Live Grep in " .. format_telescope_cwd(current_dir, 4),
        })
      end, { desc = "Live Grep in CWD" })

      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files {prompt_title = "Neovim Config Files", cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files' })

    -- Add grep Neovim files
      vim.keymap.set('n', '<leader>sN', function()
        builtin.live_grep { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files with Grep' })
    end,

  },
}
