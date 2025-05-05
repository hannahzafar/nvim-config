return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require('nvim-treesitter.configs')
    configs.setup({
      ensure_installed = { "markdown", "markdown_inline","c", "lua", "vim", "python", "bash" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
