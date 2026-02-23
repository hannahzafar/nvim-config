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
      -- lua = { "stylua" }, -- stylua not working right now
      python = { "ruff_format", "ruff_organize_imports" },
    },
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Check if auto-format is enabled for this buffer
      -- Default to false (disabled) if not set
      if not vim.b[bufnr].autoformat_enabled then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    -- Customize formatters
    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
