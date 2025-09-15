--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.sh", -- Apply to new files with .sh extension
  callback = function()
    -- Check if the buffer is empty before inserting the shebang
    if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
      vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#!/bin/bash" })
    end
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.py", -- Apply to new files with .py extension
  callback = function()
    if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
      vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#!/usr/bin/env python" })
    end
  end,
})

