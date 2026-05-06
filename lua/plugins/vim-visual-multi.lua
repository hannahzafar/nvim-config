return {
  'mg979/vim-visual-multi',
  init = function()
    vim.g.VM_maps = {
      ['Add Cursor Down'] = '<S-Down>',
      ['Add Cursor Up']   = '<S-Up>'
    }
  end,
}
