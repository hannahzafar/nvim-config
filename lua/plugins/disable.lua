local disable_plugins = {
  -- "alpha-nvim",
  -- "autopairs",
  -- "blink-cmp" ,
  -- "bmessages",
  -- "catppuccin",
  -- "conform" ,
  -- "copilot",
  -- "copilotchat",
  -- "gitsigns",
  -- "indent_line" ,
  -- "lsp-config",
  -- "lualine",
  -- "neo-tree" ,
  -- "nvim-surround",
  -- "render-markdown",
  -- "searchbox",
  -- "snacks" ,
  -- "tabout",
  -- "telescope",
  -- "todo-comments" ,
  -- "toggleterm",
  -- "treesitter",
  -- "ufo",
  -- "which-key",
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


  -- { "rcarriga/nvim-notify", enabled = false },
