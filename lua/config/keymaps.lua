-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ My Custom Keymaps]]
-- Open nvim terminal at bottom
vim.keymap.set('n', '<leader>tb',
  function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0,15)
  end,
  { desc = '[T]erminal [B]ottom' }
)

vim.keymap.set('n', '<leader>ts',
  function()
    -- Go to bottom terminal window
    vim.cmd.wincmd("J")
    -- Createrm vertical split
    vim.cmd.vnew()
    vim.cmd.term()
  end,
  { desc = '[T]erminal vertical [S]plit' }
)
-- LSP formatting
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = 'LSP [F]ormat buffer' })

-- Delete spaces at beginning
vim.keymap.set('v', '<leader>ds', ":normal! 0d^<CR>", { desc = "Delete spaces before first character" })

-- Paste character text below current line
vim.keymap.set("n", "<leader>pb", [[:set paste<CR>o<C-R>+<Esc>:set nopaste<CR>]],
  { desc = "[P]aste from clipboard [B]elow current line" })

-- Paste character text above current line
vim.keymap.set("n", "<leader>pa", [[:set paste<CR>O<C-R>+<Esc>:set nopaste<CR>]],
  { desc = "[P]aste from clipboard [A]bove current line" })
