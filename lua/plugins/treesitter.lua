return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    -- ensure_installed ={"lua","gitignore", "markdown", "markdown_inline", "python", "vim", "yaml"},
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
