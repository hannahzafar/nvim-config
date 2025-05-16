return {
 {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      vim.diagnostic.config({
        virtual_text = true, -- enable inline errors
        signs = true,        -- show signs in the gutter
        underline = true,    -- underline problem text
        update_in_insert = false, -- don't show diagnostics while typing
        severity_sort = true,     -- sort by severity
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}
