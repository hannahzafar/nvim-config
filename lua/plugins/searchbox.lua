return {
  "VonHeikemen/searchbox.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  keys = {
    { "<leader>sbs",function () require("searchbox").match_all() end, desc = "[S]earch[b]ox [S]earch" },
    { "<leader>sbc",function () require("searchbox").match_all({default_value = vim.fn.expand("<cword>")}) end,
      desc = "[S]earch[b]ox search [c]urrent word" },

    { "<leader>sbr",function () require("searchbox").replace({confirm = 'menu'}) end, desc = "[S]earch[b]ox [R]eplace" },
    { "<leader>sbC",function () require("searchbox").replace({confirm = 'menu',default_value = vim.fn.expand("<cword>")}) end,
      desc = "[S]earch[b]ox replace [C]urrent word" },
  },
}

