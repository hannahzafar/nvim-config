local disable_plugins = {
  -- 'saghen/blink.cmp',
  -- "ariel-frischer/bmessages.nvim",
  -- "stevearc/conform.nvim",
  -- "Bekaboo/dropbar.nvim",
  -- 'lewis6991/gitsigns.nvim',
  -- "lukas-reineke/indent-blankline.nvim",
  -- "neovim/nvim-lspconfig",
  -- 'nvim-lualine/lualine.nvim',
  -- "lualine",
  -- "chentoast/marks.nvim",
  -- "nvim-neo-tree/neo-tree.nvim",
  -- "kylechui/nvim-surround",
  -- 'MeanderingProgrammer/render-markdown.nvim',
  -- 'wassimk/scalpel.nvim',
  -- "VonHeikemen/searchbox.nvim",
  -- "folke/snacks.nvim",
  -- 'abecodes/tabout.nvim',
  -- 'nvim-telescope/telescope.nvim',
  -- "folke/todo-comments.nvim",
  -- "akinsho/nvim-toggleterm.lua",
  -- "nvim-treesitter/nvim-treesitter",
  -- "kevinhwang91/nvim-ufo",
  -- "folke/which-key.nvim",
}

local function disable_my_plugins(plugin_list)
  local disabled_plugins = {}
  for _, plugin in ipairs(plugin_list) do
    table.insert(disabled_plugins, { plugin, enabled = false })
  end
  return disabled_plugins
end

return {
  disable_my_plugins(disable_plugins),
}
