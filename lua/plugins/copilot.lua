return {
  "github/copilot.vim",
  keys = {
    { "<leader>Al", ":Copilot<CR>", desc = "Load Copilot Inline" },
    {'<leader>At', function()
      local status = vim.fn['copilot#Enabled']()
      if status == 1 then
        vim.cmd('Copilot disable')
        vim.notify('Inline Copilot Disabled')
      else
        vim.cmd('Copilot enable')
        vim.notify('Inline Copilot Enabled')
      end
    end, desc = "Toggle GitHub Inline Copilot" },
  },
}


