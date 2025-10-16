return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
    })
    -- Set nvim-notify as the default Neovim notification function
    vim.notify = require("notify")
  end,
}
