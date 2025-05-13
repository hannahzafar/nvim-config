-- Set <space> as the leader key. See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("config.lazy")

