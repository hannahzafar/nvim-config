return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    idependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {
      file_types =  {"markdown", "codecompanion"}
    },
  }
}
