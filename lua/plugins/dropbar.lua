return {
  'Bekaboo/dropbar.nvim',
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  event = { "BufReadPre", "BufNewFile" }, -- load dropbar when opening a file
  keys = {
    {'<Leader>;', function() require('dropbar.api').pick() end,  desc = 'Pick symbols in winbar' },
    {'[;', function() require('dropbar_api').goto_context_start() end,  desc = 'Go to start of current context' },
    {'];', function() require('dropbar_api').select_next_context() end,  desc = 'Select next context' },

    },
  opts = {
    bar = {
      enable = function(buf, win)
        -- Disable in toggleterm and standard terminals
        if vim.bo[buf].filetype == 'toggleterm' or vim.bo[buf].buftype == 'terminal' then
          return false
        end

        -- Keep default behavior for all other buffers
        return vim.api.nvim_win_get_config(win).zindex == nil
          and vim.bo[buf].buftype == ''
          and vim.api.nvim_buf_get_name(buf) ~= ''
          and not vim.wo[win].diff

      end
    },
  },
}
