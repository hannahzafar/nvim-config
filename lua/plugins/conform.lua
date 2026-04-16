return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
    {
      "<leader>tf",
      function()
        vim.b.autoformat_enabled = not vim.b.autoformat_enabled
        local status = vim.b.autoformat_enabled and "enabled" or "disabled"
        vim.notify("Auto-format on save " .. status .. " for this buffer", vim.log.levels.INFO)
      end,
      mode = "",
      desc = "[T]oggle [f]ormat on save",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      bash = { "shfmt" , "shellcheck"},
      sh = { "shfmt" , "shellcheck"},
      python = { "ruff_format", "ruff_organize_imports" },
      yaml = { "prettier", "yamlfmt" },
    },
    format_on_save = function(bufnr)
    -- Only enable autoformat on save for python filetype
      if vim.bo[bufnr].filetype ~= "python" then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    -- Customize formatters
    formatters = {
      shfmt = {
        append_args = { "-ln=bash", "-s", "-i", "2" },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    
    -- Set up format-on-save using autocmd for better control
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        -- Only format if explicitly enabled for this buffer
        if vim.b[args.buf].autoformat_enabled then
          require("conform").format({ 
            bufnr = args.buf,
            timeout_ms = 500,
            lsp_format = "fallback"
          })
        end
      end,
    })
  end,
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
