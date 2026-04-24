return {
  "VonHeikemen/searchbox.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  keys = {
    -- match all search
    { "<leader>sbs",function () require("searchbox").match_all() end, desc = "[S]earch[b]ox [S]earch" },
    { "<leader>sbS",function () require("searchbox").match_all({default_value = vim.fn.expand("<cword>")}) end, desc = "[S]earch[b]ox search [c]urrent word" },

    -- replace
    { "<leader>sbr", mode = {"n"}, function () require("searchbox").replace({confirm = 'menu'}) end, desc = "[S]earch[b]ox [R]eplace" }, -- confirm replace in normal mode
    { "<leader>sbR", mode = {"n"}, function () require("searchbox").replace({confirm = 'menu',default_value = vim.fn.expand("<cword>")}) end, desc = "[S]earch[b]ox replace [C]urrent word" },
    -- { "<leader>sbr", mode = {"x"}, function () require("searchbox").replace({visual_mode = true, default_value = vim.fn.getreg('v')}) end, desc = "[S]earch[b]ox [R]eplace current selection" }, -- replace current selection # Can't get this working
    { "<leader>sba", mode = {"x"}, function () require("searchbox").replace({visual_mode = true}) end, desc = "[S]earch[b]ox Replace [A]ll Selected" }, -- replace all in visual mode
  },
}

