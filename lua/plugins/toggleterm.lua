return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    { "<C-\\>",    "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    { "<leader>,a", "<cmd>ToggleTermToggleAll<CR>",    desc = "Toggle [a]ll terminals" },
    { "<leader>,h", "<cmd>TermNew<CR>",    desc = "Open new [h]split terminal" },
    { "<leader>,s", "<cmd>TermSelect<CR>",    desc = "Open terminal [s]election window" },
  },
  opts = {
    -- Configurable terminal naming
    terminal_name_format = "Term#%d (%s)", -- number, shell type
  },
  config = function(_, opts)
    local toggleterm = require("toggleterm")

    toggleterm.setup(vim.tbl_deep_extend("force", {
      size = 20,

      -- Custom terminal naming
      on_create = function(term)
        -- Determine shell type
        local shell = term.shell or vim.o.shell
        local shell_type = shell:match("[^/]+$") or 'shell'

        -- Use the terminal's native number
        local name_format = opts.terminal_name_format or "Term#%d (%s)"
        local name = string.format(name_format, term.id, shell_type)

        vim.api.nvim_buf_set_name(term.bufnr, name)
      end
    }, opts or {}))
  end
}
