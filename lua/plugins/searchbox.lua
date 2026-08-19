return {
  "VonHeikemen/searchbox.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  keys = {
    -- match all search
    { "<leader>bss",function () require("searchbox").match_all() end, desc = "Searchbox [S]earch" },
    { "<leader>bsc",function () require("searchbox").match_all({default_value = vim.fn.expand("<cword>")}) end, desc = "Searchbox [c]urrent word" },

    -- replace
    { "<leader>bsr", mode = {"n"}, function () require("searchbox").replace({confirm = 'menu'}) end, desc = "Searchbox [r]eplace" }, -- confirm replace in normal mode
    { "<leader>bsR", mode = {"n"}, function () require("searchbox").replace({confirm = 'menu',default_value = vim.fn.expand("<cword>")}) end, desc = "Searchbox [R]eplace current word" },
    -- { "<leader>sbr", mode = {"x"}, function () require("searchbox").replace({visual_mode = true, default_value = vim.fn.getreg('v')}) end, desc = "[S]earch[b]ox [R]eplace current selection" }, -- replace current selection # Can't get this working
    { "<leader>bsa", mode = {"x"}, function () require("searchbox").replace({visual_mode = true}) end, desc = "Searchbox replace [A]ll selected" }, -- replace all in visual mode
  },
}

