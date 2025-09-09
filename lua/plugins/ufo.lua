return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  config = function()
    local ufo = require("ufo")

    -- Setup UFO with Treesitter + indent fallback
    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    })

    -- Optional: show a fold column
    vim.opt.foldcolumn = "2"
    vim.opt.fillchars = "fold:─,foldopen:▾,foldclose:▸"


    -- Start folds open by default
    vim.opt.foldlevel = 99
    vim.opt.foldenable = true  -- UFO handles fold collapsing
  end,
}

