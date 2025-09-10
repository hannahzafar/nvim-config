return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  config = function()
    local ufo = require("ufo")

    -- Setup UFO with Treesitter + indent fallback
    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Disable ufo for certain filetypes
        local ignore = { "neo-tree", "help", "gitcommit", "alpha" }
        for _, ft in ipairs(ignore) do
          if filetype == ft then
            return "" -- no provider, no folding
          end
        end

        -- Disable ufo for certain buffer types
        if buftype == "nofile" or buftype == "terminal" or buftype == "quickfix" then
          return ""
        end

        -- All other use treesitter, then fallback to indent
        return { "treesitter", "indent" }
      end,
    })

    -- Show two fold columns with special symbols
    vim.opt.foldcolumn = "2"
    vim.opt.fillchars = "fold:─,foldopen:▾,foldclose:▸"

    -- Start folds open by default
    vim.opt.foldlevel = 99
    vim.opt.foldenable = true
  end,
}

