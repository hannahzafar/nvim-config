return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      -- signs_staged_enable = true,
      -- signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      -- numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      -- linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      -- word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      -- watch_gitdir = {
      --   follow_files = true
      -- },
      -- auto_attach = true,
      -- attach_to_untracked = false,
      -- current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      -- current_line_blame_opts = {
      --   virt_text = true,
      --   virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      --   delay = 1000,
      --   ignore_whitespace = false,
      --   virt_text_priority = 100,
      --   use_focus = true,
      -- },
      -- current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      -- sign_priority = 6,
      -- update_debounce = 100,
      -- status_formatter = nil, -- Use default
      -- max_file_length = 40000, -- Disable if file is longer than this (in lines)
      -- preview_config = {
      --   -- Options passed to nvim_open_win
      --   style = 'minimal',
      --   relative = 'cursor',
      --   row = 0,
      --   col = 1
      -- },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [r]eset hunk' })
        -- normal mode
        map('n', '<leader>gs', gitsigns.stage_buffer, { desc = 'Git [s]tage buffer' })
        map('n', '<leader>gr', gitsigns.reset_buffer, { desc = 'Git [r]eset buffer' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git [b]lame line' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'Git [D]iff against last commit' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'Git hunk [s]tage' })
        map('n', '<leader>ghu', gitsigns.stage_hunk, { desc = 'Git hunk [u]ndo stage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'Git hunk [r]eset' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'Git hunk [p]review' })
        -- Toggles
        map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = 'Git toggle [b]lame line' })
        map('n', '<leader>gtd', gitsigns.preview_hunk_inline, { desc = 'Git toggle [d]eleted' })
      end,
    }
  },
}
